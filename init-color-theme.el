(unless (package-installed-p 'color-theme)
  (package-install 'color-theme))
(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky t)

