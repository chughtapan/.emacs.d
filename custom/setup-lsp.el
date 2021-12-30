;; Done again in local-settings
;; (use-package lsp-mode
;;   :commands lsp
;;   :ensure t)

(use-package company-lsp
  :defer t
  :ensure lsp-mode
  :commands company-lsp
  :config
  (add-to-list 'company-backends #'company-lsp))
(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package ccls
  :config
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight))
;; (add-hook 'c-mode-common-hook 'lsp)

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp)))
;;   :init
;;   (setq lsp-python-ms-executable (executable-find "python-language-server")))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (unless (file-remote-p default-directory)
                           (lsp)))))  ; or lsp-deferred

(provide 'setup-lsp)
