(require 'flymake-jslint)
(setq flymake-jslint-command "/usr/local/bin/jslint")
(add-hook 'js2-mode-hook 'flymake-jslint-load)


