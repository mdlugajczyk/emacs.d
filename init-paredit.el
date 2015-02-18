(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'scheme-mode-hook
	       'clojure-mode-hook
	       'racket-mode-hook
               ))
  (add-hook hook '(lambda () (paredit-mode 1))))
