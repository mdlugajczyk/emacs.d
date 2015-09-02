(require 'cc-mode)

(maybe-install-package 'ggtags)

(setq c-default-style "linux"
      c-basic-offset 2)
(c-set-offset 'substatement-open 0)
(c-set-offset 'brace-list-open 0)

(defun setup-c++-buffer ()
  (c-set-style "linux")
  (setq c-default-style "linux"
	c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'brace-list-open 0)
  (require 'ggtags)
  (ggtags-mode 1)
  (define-key ggtags-mode-map (kbd "M-*") 'ggtags-navigation-mode-done)
  (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (setq company-backends (delete 'company-clang company-backends)))

(add-hook 'c-mode-hook
	  (lambda ()
	    (setup-c++-buffer)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setup-c++-buffer)))

(unless (fonix-box-p)
  (maybe-install-package 'semantic)
  (require 'semantic)
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (semantic-mode 1)
  (maybe-install-package 'function-args)
  (require 'function-args)
  (fa-config-default)
  (define-key c-mode-map  [(control tab)] 'moo-complete)
  (define-key c++-mode-map  [(control tab)] 'moo-complete)
  (define-key c-mode-map (kbd "M-o")  'fa-show)
  (define-key c++-mode-map (kbd "M-o")  'fa-show))

(add-hook 'gud-gdb-mode-hook
	  (lambda ()
	    (company-mode -1)))
