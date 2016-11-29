(add-to-list 'load-path "/home/user/mdlugajczyk/.emacs.d/fds/")
(load "deps-mode.el")
(load "fds-useful.el")

(maybe-install-package 'p4)
(require 'p4)
(require 'deps-mode)
(add-to-list 'auto-mode-alist '("\\.\\(DEPS\\|deps\\)\\'" . deps-mode))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(defun source-rakefds (path)
  (let ((debug-path (expand-file-name path)))
    (update-env "PATH" debug-path)
        (update-env "LD_PATH" debug-path)
        (update-env "LD_LIBRARY_PATH" debug-path)))

(defun update-env (variable path)
  (setenv variable
          (concat path
                  ":"
                  (getenv variable))))

(defun source-debug ()
  (interactive)
  (source-rakefds "X86_64_DEBUG/el6"))

(defun source-release ()
  (interactive)
  (source-rakefds "X86_64/el6"))

(setq compile-command "rakefds build")

(setq-default ediff-highlight-all-diffs nil)


(defun parent-directory (dir)
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))


(defun in-include-p (path)
  (string-match "include/\\'" path))

(defun in-src-p (path)
  (string-match "src/\\'" path))

(defun project-uses-pub-p ()
  "Check if the project uses the pub build system
by checking if we're in `src' or `include' directory"
  (let ((parent-dir (parent-directory (buffer-file-name)))
	(extension (file-name-extension (buffer-file-name))))
    (or  (in-include-p parent-dir) (in-src-p parent-dir))))

(defun guess-extension (in-src-directory switch-to-dir current-extension)
  "Guess the extension of the file we want to switch to."
  (if in-src-directory
      "h"
    (if (equal nil (file-expand-wildcards (concat switch-to-dir "/*.cc")))
	"cxx"
      "cc")))

(defun switch-pub-source-file ()
  (let* ((extension (file-name-extension (buffer-file-name)))
	 (parent-dir (parent-directory (buffer-file-name)))
	 (root-dir (parent-directory parent-dir))
	 (switch-to-dir (concat root-dir (if (in-include-p parent-dir) "/src/" "/include/"))))
    (switch-source-file-helper extension
			       (guess-extension (in-src-p parent-dir) switch-to-dir extension)
			       switch-to-dir)))
(defun mdlugajczyk-switch-source-file ()
  (interactive)
  (if (project-uses-pub-p)
      (switch-pub-source-file)
    (switch-source-file)))

(define-key c-mode-map (kbd "C-x z") 'mdlugajczyk-switch-source-file)
(define-key c++-mode-map (kbd "C-x z") 'mdlugajczyk-switch-source-file)

(defun compile-nebula ()
  (interactive)
  (compile "cd ~/nebula/nebula && perl /home/dev/build/pub/bin/pub --build --parallel=24:24 --debug --warn=err --std=C++11"))
