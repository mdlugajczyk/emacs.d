(add-to-list 'load-path "/home/fonix/prd_progs/tools/conf/emacs/")
(load "fds-common.el")
(load "p4.el")

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
