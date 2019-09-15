(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

(use-package prescient
  :init
  (prescient-persist-mode 1))

(use-package company-prescient
  :init
  (company-prescient-mode 1))

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-file-exists-remote-cache-expire nil))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

(use-package eyebrowse
  :config
  (eyebrowse-mode 't))

(use-package sr-speedbar
  :bind
  (("C-c C-d" . sr-speedbar-toggle)))

(use-package counsel-etags
  :bind
  (("C-c g f" . counsel-etags-find-tag-at-point)))

(use-package rainbow-delimiters)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; Dired settings
;; Add more things here
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)

(use-package treemacs
  :bind (("C-x C-n" . treemacs)))
(use-package treemacs-projectile)
(use-package treemacs-icons-dired)

(use-package solaire-mode
  :init
  (solaire-global-mode))

(use-package all-the-icons)

(use-package doom-themes
  :init
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode))

(use-package w3m)

(if (string-equal system-type "darwin")
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier 'none))

(if (string-equal system-type "darwin")
    (use-package exec-path-from-shell
      :init
      (exec-path-from-shell-initialize)))

(provide 'setup-general)
