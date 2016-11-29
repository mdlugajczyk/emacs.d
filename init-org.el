(setq org-directory "~/Dropbox/org")
(setq org-files-list '("test.org"))
(add-hook 'org-mode-hook '(lambda ()
			    (flyspell-mode)))
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")


(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/notes.org")
