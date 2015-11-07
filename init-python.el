(maybe-install-package 'elpy)


(setenv "WORKON_HOME" (concat (getenv "HOME") "/elpy-env"))
(setq pyvenv-workon "elpy-env")
(elpy-enable)
(add-hook 'python-mode-hook
	  (lambda ()
	    (elpy-mode)
	    (pyvenv-workon ".")
	    (unless (eq buffer-file-name nil) (flymake-mode 1))))

;; (unless (fonix-box-p)
;;   (setq
;;    python-shell-interpreter "ipython"
;;    python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
;;    python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;    python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;    python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;    python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;    python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

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
