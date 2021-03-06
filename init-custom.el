(when (featurep 'scroll-bar)
  (scroll-bar-mode -1))

(when (featurep 'menu-bar)
  (menu-bar-mode -1))

(when (featurep 'tool-bar)
  (tool-bar-mode -1))

(when (eq window-system 'x)
  (tool-bar-mode -1))

(transient-mark-mode -1)

(global-font-lock-mode t)


(setq x-select-enable-clipboard t)

(if (eq system-type 'darwin)
    (setq default-directory "~/"))

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(if (fonix-box-p)
    (set-default-font
     "-bitstream-Courier 10 Pitch-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
  (set-default-font
     "-*-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
(set-face-attribute 'default nil :height 160)
(column-number-mode 1)
(line-number-mode 1)
(setq scroll-step 1)
(setq display-time-24hr-format t) 
(fset 'yes-or-no-p 'y-or-n-p)
(iswitchb-mode)

; spell checking
(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")
(setq ispell-extra-args '("--lang=en_GB"))
(setq ispell-dictionary "en_GB")


; UTF-8 
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; Fix C-a in eshell.
(add-hook 'eshell-mode-hook '(lambda ()
			       (local-set-key (kbd "C-a")
					      'eshell-bol)))

(show-paren-mode 1)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(setq show-paren-style 'expression
      show-paren-delay 0)

;(setq browse-url-browser-function 'browse-url-default-macosx-browser)
;; (setq browse-url-browser-function (quote browse-url-generic))
;; (setq browse-url-generic-program "x-www-browser")


(defun kill-compilation-buffer ()
  "Kill the `*compilation*' buffer."
  (interactive)
  (kill-buffer "*compilation*"))


(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:"
			 (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:"
				 buffer-file-name))))
 
(defun sudo-edit-current-file ()
  (interactive)
  (find-alternate-file (concat "/sudo:root@localhost:"
			       (buffer-file-name (current-buffer)))))

(defun topo-coder-header ()
  (interactive)
  (with-current-buffer (current-buffer)
    (insert (format
	     "#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <string>

using namespace std;

int main(void) {


  return 0;
};
"))))

(defun restart-server ()
  (interactive)
  (server-force-delete)
  (server-start))

(defun fonix-box-p ()
  (file-exists-p "/home/fds/"))

(maybe-install-package 'ace-window)

(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(maybe-install-package 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(maybe-install-package 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
