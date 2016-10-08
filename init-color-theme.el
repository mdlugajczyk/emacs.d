(when window-system
  (maybe-install-package 'color-theme)
  ;(maybe-install-package 'zenburn)

  ;; ;; (require 'color-theme)
  ;; ;; (require 'zenburn)
  ;;  (zenburn)
  (maybe-install-package 'gruvbox-theme)
  (load-theme 'gruvbox t))
