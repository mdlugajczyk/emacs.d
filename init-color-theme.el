(when window-system
  (maybe-install-package 'color-theme)
  (maybe-install-package 'gruvbox-theme)
  (load-theme 'gruvbox t))
