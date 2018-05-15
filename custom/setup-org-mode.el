(setq org-cycle-separator-lines 1)

(add-hook 'org-mode-hook
          (lambda()
            (local-set-key "\C-n" 'outline-next-visible-heading)
            (local-set-key "\C-p" 'outline-previous-visible-heading)
            (local-set-key "\M-n" 'outline-forward-same-level)
            (local-set-key "\M-p" 'outline-backward-same-level)
            (local-set-key "\C-y" 'yank)))

(global-set-key (kbd "C-c l") 'org-store-link)

(provide 'setup-org-mode)
