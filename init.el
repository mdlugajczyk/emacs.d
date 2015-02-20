;; Hide splash screen.
(setq inhibit-splash-screen t)

;; Start the emacs server, so that emacsclient can connect to it.
(server-start)

(defun load-config (config)
  (load (concat "~/.emacs.d/init-" config)))

(load-config "package-manager.el")
(load-config "custom.el")
(load-config "paredit.el")
(load-config "color-theme.el")
;(load-config "clojure.el")
;(load-config "haskell.el")
(load-config "keybindings.el")
(load-config "git.el")
(load-config "org.el")
(load-config "complete.el")
(load-config "ruby.el")
(load-config "projectile.el")
(load-config "web.el")
(load-config "python")
(load-config "tex")
(load-config "fds.el")

(unless (package-installed-p 'exec-path-from-shell)
  (install-package  'exec-path-from-shell))

(exec-path-from-shell-initialize)
