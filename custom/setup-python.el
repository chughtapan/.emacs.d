
(use-package anaconda-mode)
(use-package company-anaconda
  :init
  (add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(provide 'setup-python)

;;; prelude-python.el ends here
