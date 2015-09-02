;;  (require 'auto-complete-config)
;;  (add-to-list 'ac-dictionary-directories
;;      "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
;;  (ac-config-default)
;;  (setq ac-ignore-case t)
;;  (add-to-list 'ac-modes 'enh-ruby-mode)
;;  (add-to-list 'ac-modes 'web-mode)

;; (setq ac-delay 0.1)
;; (setq ac-quick-help-delay 0)

(maybe-install-package 'company)
(require 'company)
(global-company-mode 1)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(setq company-tooltip-limit 20
      company-minimum-prefix-length 3
      company-idle-delay .3
      company-echo-delay 0
      company-begin-commands '(self-insert-command))
