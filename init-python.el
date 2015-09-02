(maybe-install-package 'nose)
(maybe-install-package 'jedi)
(maybe-install-package 'ein)

(add-hook 'python-mode-hook
	  (lambda ()
	    (require 'nose)
	    (add-to-list 'nose-project-root-files "lib")
	    (jedi:setup)
	    (local-set-key "\C-ca" 'nosetests-all)
	    (local-set-key "\C-cm" 'nosetests-module)
	    (local-set-key "\C-cpa" 'nosetests-pdb-all)
	    (local-set-key "\C-cpm" 'nosetests-pdb-module)
	    (local-set-key "\C-cp." 'nosetests-pdb-one)

	    (local-set-key "\M-?" 'flymake-popup-current-error-menu)
	    (local-set-key "\M-n" 'flymake-goto-next-error)
	    (local-set-key "\M-p" 'flymake-goto-prev-error)
	    (unless (eq buffer-file-name nil) (flymake-mode 1))))

(unless (fonix-box-p)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(setq ein:complete-on-dot 1)
(setq ein:use-auto-complete 1)

(setq jedi:complete-on-dot t)

(when (load "flymake" t)
	      (defun flymake-pyflakes-init ()
		(let* ((temp-file (flymake-init-create-temp-buffer-copy
				   'flymake-create-temp-inplace))
		       (local-file (file-relative-name
				    temp-file
				    (file-name-directory buffer-file-name))))
		  (list "pyflakes" (list local-file))))
	      (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.py\\'" flymake-pyflakes-init)))
