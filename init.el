(setq gc-cons-threshold 100000000)

;; Hide splash screen.
(setq inhibit-splash-screen t)

(defun fonix-box-p ()
  (file-exists-p "/home/fds/"))

(defun maybe-install-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun load-config (config)
  (load (concat "~/.emacs.d/init-" config)))

(let ((file-name-handler-alist nil)) 
  (load-config "package-manager.el")
  (unless (fonix-box-p)
    (load-config "color-theme.el"))
  (load-config "custom.el")
  (load-config "paredit.el")
  (load-config "complete.el")
  (load-config "cpp.el")
  (load-config "keybindings.el")
  (load-config "git.el")
  (load-config "org.el")
  (load-config "python")
  (load-config "asm")

  (unless (fonix-box-p)
    
    (load-config "clojure.el")
    (load-config "haskell.el")
    (load-config "ruby.el")
    (load-config "projectile.el")
    (load-config "web.el")
    (load-config "tex")
    (maybe-install-package 'exec-path-from-shell)
    (exec-path-from-shell-initialize)
    (server-start))

  (when (fonix-box-p)
    (load-config "fds.el"))


  (load-config "customize-group"))
