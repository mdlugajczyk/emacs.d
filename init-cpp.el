(require 'cc-mode)

(setq c-default-style "linux"
      c-basic-offset 2)
(c-set-offset 'substatement-open 0)
(c-set-offset 'brace-list-open 0)

(defvar company-clang-executable "/home/dev/build/llvm/bin/clang")

(maybe-install-package 'rtags)
(maybe-install-package 'flycheck)

(defun setup-c++-buffer ()
  (c-set-style "linux")
  (setq c-default-style "linux"
	c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'brace-list-open 0))

(define-key c++-mode-map (kbd "C-M-a") 'c-beginning-of-defun)


(add-hook 'c-mode-hook
	  (lambda ()
	    (setup-c++-buffer)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setup-c++-buffer)))

(unless (fonix-box-p)
  (add-hook 'before-save-hook
	    (lambda ()
	      (when (eq major-mode 'c++-mode)
		(clang-format-buffer)))))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(add-hook 'gud-gdb-mode-hook
	  (lambda ()
	    (company-mode -1)))

(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode t)
  (setq-local flycheck-check-syntax-automatically t))

(when (require 'rtags nil :noerror)
  (rtags-enable-standard-keybindings)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  (require 'flycheck-rtags)
  (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)
  (define-key c-mode-base-map (kbd "M-.") (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,") (function rtags-find-references-at-point))
  (define-key c-mode-base-map (kbd "M-;") (function rtags-find-file))
  (define-key c-mode-base-map (kbd "C-.") (function rtags-find-symbol))
  (define-key c-mode-base-map (kbd "C-,") (function rtags-find-references))
  (define-key c-mode-base-map (kbd "M-;") (function comment-dwim)))
