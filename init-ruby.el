(unless (package-installed-p 'ruby-electric)
  (package-install 'ruby-electric))

(unless (package-installed-p 'rinari)
  (package-install 'rinari))

(unless (package-installed-p 'rspec-mode)
  (package-install 'rspec-mode))

(unless (package-installed-p 'flymake-ruby)
  (package-install 'flymake-ruby))

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
	(require 'rspec-mode)
	(defadvice rspec-compile (around rspec-compile-around)
	  "Use BASH shell for running the specs because of ZSH issues."
	  (let ((shell-file-name "/bin/bash"))
	    ad-do-it))
        (ruby-electric-mode t)
	(flymake-ruby-load)
	(ad-activate 'rspec-compile)
	(setq rspec-use-rvm t)))




