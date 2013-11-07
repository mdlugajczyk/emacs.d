;;; Haskell configuration
(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indent-mode)



