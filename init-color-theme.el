(when window-system
  (unless (package-installed-p 'color-theme)
    (package-install 'color-theme))

  (require 'color-theme)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

  (require 'zenburn)
  (load-theme 'zenburn t))
