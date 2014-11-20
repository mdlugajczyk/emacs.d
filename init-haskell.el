(setq haskell-process-path-cabal "~/Library/Haskell/bin/cabal")
(setenv "PATH" (concat "~/Library/Haskell/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/Library/Haskell/bin")

(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indent-mode)

(unless (package-installed-p 'ghc)
  (package-install 'ghc))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(setq haskell-process-path-cabal "~/Library/Haskell/bin/cabal")
