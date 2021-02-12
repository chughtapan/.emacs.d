(use-package anaconda-mode)
(use-package company-anaconda
  :init
  (add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

;; (use-package conda)
;; (conda-env-initialize-interactive-shells)
;; (conda-env-initialize-eshell)
;; (conda-env-autoactivate-mode)

(provide 'setup-python)

;;; prelude-python.el ends here
