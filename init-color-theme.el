(when window-system
  (maybe-install-package 'color-theme)
  (maybe-install-package 'zenburn)

  (require 'color-theme)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

  (require 'zenburn)
  (zenburn))
