(when window-system
  (maybe-install-package 'color-theme)
  (maybe-install-package 'zenburn)

  (require 'color-theme)
  (require 'zenburn)
  (zenburn))
