(use-package xcscope
  :config
  (setq cscope-index-recursively 't))

(add-hook 'c-mode-common-hook 'cscope-minor-mode)

(provide 'setup-cscope)
