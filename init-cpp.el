;; (require 'setup-ggtags)
;; (require 'setup-helm-gtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)
              (helm-gtags-mode 1)
              (define-key ggtags-mode-map (kbd "M-*") 'ggtags-navigation-mode-done)
              (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
              (setq company-backends (delete 'company-clang company-backends))
              ;(define-key gtags-mode-map (kbd "M-,") 'pop-tag-mark)
              (company-mode-on))))



(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(require 'function-args)
(fa-config-default)
(define-key c-mode-map (kbd "M-,") 'pop-tag-mark)
(define-key c++-mode-map (kbd "M-,") 'pop-tag-mark)
;; (define-key c-mode-map  [(control tab)] 'moo-complete)
;; (define-key c++-mode-map  [(control tab)] 'moo-complete)
;; (define-key c-mode-map (kbd "M-o")  'fa-show)
;; (define-key c++-mode-map (kbd "M-o")  'fa-show)

(add-hook 'gud-gdb-mode-hook
	  (lambda ()
	    (company-mode -1)))
