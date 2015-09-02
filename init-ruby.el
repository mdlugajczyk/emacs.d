(maybe-install-package 'rvm)
(maybe-install-package 'ruby-electric)
(maybe-install-package 'rinari)
(maybe-install-package 'rspec-mode)
(maybe-install-package 'flymake-ruby)

(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(add-hook 'ruby-mode-hook
      (lambda ()
	(require 'ruby-electric)
	(require 'rinari)
	(require 'rvm)
	(require 'rspec-mode)
	(defadvice rspec-compile (around rspec-compile-around)
	  "Use BASH shell for running the specs because of ZSH issues."
	  (let ((shell-file-name "/bin/bash"))
	    ad-do-it))
	(ruby-electric-mode t)
	(flymake-ruby-load)
	(ad-activate 'rspec-compile)
	(setq rspec-use-rvm t)))
