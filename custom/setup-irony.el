(use-package irony)

(global-set-key (kbd "C-c f") 'flycheck-mode)

;; Enable Irony mode if irony-server is installed
(if (ignore-errors (irony--find-server-executable))
    ((add-hook 'c++-mode-hook 'irony-mode)
     (add-hook 'c-mode-hook 'irony-mode)
     (add-hook 'objc-mode-hook 'irony-mode)

     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (eval-after-load 'flycheck
       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
     (eval-after-load 'flycheck
       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

(provide 'setup-irony)
