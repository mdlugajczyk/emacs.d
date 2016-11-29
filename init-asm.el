(require 'asm-mode)
(setq asm-comment-char ?\#)
(define-key asm-mode-map (kbd "<RET>") 'newline)
(add-hook 'asm-mode-hook (lambda ()
			  (local-set-key "#" 'self-insert-command)))


