(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)


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
(require 'setup-python)
(require 'setup-editing)
;; (require 'setup-ggtags)
(require 'setup-window)
(require 'setup-cscope)
(require 'setup-irony)
(require 'setup-magit)
(require 'setup-multi-term)

(global-set-key (kbd "C-?") 'help-command)

;; (require 'tramp)
;; (add-to-list 'tramp-default-proxies-alist
;;              '("astra" nil "/ssh:core@52.168.107.28#10022:"))

(setq projectile-file-exists-remote-cache-expire nil)


(require 'tomorrow-night-paradise-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "d3a7eea7ebc9a82b42c47e49517f7a1454116487f6907cf2f5c2df4b09b50fc1" default)))
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#100e23" "#906cff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#100e23" "#95ffa4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#100e23" "#565575"))
 '(package-selected-packages
   (quote
    (multi-term doom doom-modeline fingers boon lsp-python lsp-mode material-theme spacegray-theme spaceline-all-the-icons company-anaconda spaceline anaconda-mode google-this ox-reveal org rtags nimbus-theme jazz-theme doom-themes smyx-theme abyss-theme zygospore yasnippet xcscope ws-butler volatile-highlights use-package sr-speedbar rainbow-delimiters magit irony iedit ibuffer-sidebar flx-isearch eyebrowse dtrt-indent dired-sidebar counsel-projectile counsel-etags company-c-headers comment-dwim-2 clean-aindent-mode anzu)))
 '(select-enable-clipboard t)
 '(vc-annotate-background "#1b182c")
 '(vc-annotate-color-map
   (list
    (cons 20 "#95ffa4")
    (cons 40 "#b8f7a6")
    (cons 60 "#dbf0a8")
    (cons 80 "#ffe9aa")
    (cons 100 "#ffd799")
    (cons 120 "#ffc488")
    (cons 140 "#ffb378")
    (cons 160 "#eda79b")
    (cons 180 "#db9cbd")
    (cons 200 "#c991e1")
    (cons 220 "#db8bc0")
    (cons 240 "#ed85a0")
    (cons 260 "#ff8080")
    (cons 280 "#d4757d")
    (cons 300 "#aa6a7a")
    (cons 320 "#805f77")
    (cons 340 "#858FA5")
    (cons 360 "#858FA5")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
