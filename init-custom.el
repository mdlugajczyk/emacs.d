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

(setq default-directory "~/")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(set-default-font
 "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-2")
(set-face-attribute 'default nil :height 130)
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

