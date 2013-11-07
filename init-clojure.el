;;; Clojure configuration

(add-hook 'clojure-mode-hook 'paredit-mode)
 
;; Configure nrepl.el
;(setq nrepl-hide-special-buffers t)
;(setq nrepl-popup-stacktraces-in-repl t)
;(setq nrepl-history-file "~/.emacs.d/nrepl-history")
 
(add-hook 'nrepl-connected-hook
	  (defun pnh-clojure-mode-eldoc-hook ()
	    (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
	    (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
	    (nrepl-enable-on-existing-clojure-buffers)))
 
;; Repl mode hook
(add-hook 'nrepl-mode-hook 'subword-mode)
 
;; Auto completion for NREPL
(unless (package-installed-p 'ac-nrepl)
  (package-install 'ac-nrepl))
(require 'ac-nrepl)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(require 'auto-complete)
(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)
(unless (package-installed-p 'cider)
  (package-install 'cider))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))


(eval-after-load 'paredit-mode
  '(define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete))
(global-auto-complete-mode)
