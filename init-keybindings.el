(global-set-key (kbd "C-x C-c") nil)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "<f9>") 'compile)
(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-x c") 'kill-compilation-buffer)
;(global-set-key (kbd "C-c C-r") 'sudo-edit-current-file)


(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
