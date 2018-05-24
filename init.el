(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load "cuda-mode")

(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-org-mode)
(require 'setup-c)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-ggtags)
(require 'setup-window)
(require 'setup-cscope)
(require 'setup-irony)
(require 'setup-magit)
(require 'setup-multi-term)

(global-set-key (kbd "C-?") 'help-command)

(require 'tomorrow-night-paradise-theme)
