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
(require 'setup-editing)
(require 'setup-c)
(require 'setup-cedet)
(require 'setup-python)
(require 'setup-ggtags)
(require 'setup-window)
(require 'setup-cscope)
(require 'setup-irony)
(require 'setup-rtags)
(require 'setup-magit)
(require 'setup-multi-term)

(global-set-key (kbd "C-?") 'help-command)


(define-key key-translation-map "\e[1;P9" (kbd "<caps>"))

(global-set-key (kbd "<caps> u") 'undo)
(global-set-key (kbd "<caps> f") 'mode-line-other-buffer)
(global-set-key (kbd "<caps> s") 'shell-command)

(require 'spaceline-config)
(spaceline-emacs-theme)

(require 'cquery)
(setq cquery-executable "/mnt/t-tachug/cquery/build/release/bin/cquery")

(require 'tomorrow-night-paradise-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-git-gutter-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(line-number-mode nil)
 '(modern-c++-font-lock-global-mode t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (dmenu ivy-prescient company-prescient prescient amx yasnippet-snippets subatomic256-theme moe-theme eterm-256color lsp-python itail google-c-style afternoon-theme spacegray-theme all-the-icons-ivy company-anaconda anaconda-mode w3m browse-url-dwim ob-browser google-this google company-emoji emojify ivy-hydra modern-cpp-font-lock org ox-reveal avy-zap multiple-cursors resize-window hydra kaolin-themes smyx-theme abyss-theme nimbus-theme jazz-theme bm git-gutter spaceline smart-mode-line birds-of-paradise-plus-theme darkburn-theme gruvbox-theme cquery lsp-mode undo-tree ivy-rtags company-rtags flycheck-rtags rtags doom-themes ample-theme spotlight clang-format powerline magit irony xcscope ace-window ggtags flx-isearch iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode yasnippet volatile-highlights company-c-headers counsel-projectile rainbow-delimiters counsel-etags dired-sidebar sr-speedbar eyebrowse zygospore projectile company use-package)))
 '(spaceline-info-mode t)
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c9bc6c")
    (cons 60 "#e4c979")
    (cons 80 "#f0c674")
    (cons 100 "#f1bc79")
    (cons 120 "#e4a16c")
    (cons 140 "#de935f")
    (cons 160 "#d79487")
    (cons 180 "#d7a1af")
    (cons 200 "#c9b4cf")
    (cons 220 "#d794af")
    (cons 240 "#d77987")
    (cons 260 "#cc6666")
    (cons 280 "#b75d5d")
    (cons 300 "#975b5b")
    (cons 320 "#775959")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#212121" :foreground "#eeffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "nil" :family "Iosevka"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant normal))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant normal :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370"))))
 '(mode-line ((t (:background "#191919" :box nil))))
 '(mode-line-inactive ((t (:background "#282828" :foreground "#5B6268" :box nil))))
 '(term ((t (:foreground "#fafafa")))))
