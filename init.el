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

(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-org-mode)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-python)
(require 'setup-editing)
(require 'setup-window)
(require 'setup-irony)
(require 'setup-rtags)
(require 'setup-lsp)
(require 'setup-magit)
(require 'setup-multi-term)
(require 'local-settings)
(require 'local-secrets)

;; Works only over ssh
(define-key key-translation-map "\e[1;P9" (kbd "<caps>"))
(global-set-key (kbd "<caps> u") 'undo)
(global-set-key (kbd "<caps> f") 'mode-line-other-buffer)
(global-set-key (kbd "<caps> s") 'shell-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home (expand-file-name "~/miniconda3/"))
 '(global-linum-mode t)
 '(org-agenda-files
   '("/Users/tapanc/Dropbox/notebooks/agenda/calendar.org" "/Users/tapanc/Dropbox/notebooks/agenda/meetings.org" "/Users/tapanc/Dropbox/notebooks/agenda/todo.org" "/Users/tapanc/Dropbox/notebooks/agenda/journal/20210101"))
 '(package-selected-packages
   '(jupyter xbm-life git-gutter+ conda iedit calfw lsp-python-ms treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-magit lsp-treemacs treemacs xml-rpc dashboard-project-status dashboard org-dashboard org-ref bm gnuplot-mode auctex\.el auctex-latexmk company-auctex writeroom-mode writegood-mode sudo-ext protobuf-mode virtualenv cython-mode ivy-posframe flycheck-vale multiple-cursors @ org-journal org-super-agenda projectile markdown-mode+ csv-mode google-c-style ivy-xref company-lsp ccls company-tabnine tabnine exwm frecentf auctex itail pyenv-mode pyvenv org-kanban flycheck-rtags company-rtags ivy-rtags rtags vterm sudo-edit org-noter interleave w3m undo-tree org-bullets org-ascii-bullets multi-term cuda-mode zygospore yasnippet xcscope ws-butler volatile-highlights use-package sr-speedbar solaire-mode rainbow-delimiters ox-reveal magit ivy-prescient irony flx-isearch fish-mode eyebrowse exec-path-from-shell eterm-256color dtrt-indent doom-themes doom-modeline dired-sidebar counsel-projectile counsel-etags company-prescient company-c-headers company-anaconda comment-dwim-2 clean-aindent-mode clang-format anzu amx all-the-icons-ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit default :foreground "snow" :strike-through nil :underline nil :slant normal :weight normal)))))
