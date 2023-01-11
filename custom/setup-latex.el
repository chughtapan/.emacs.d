(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(use-package latex
  :defer t
  :ensure auctex
  :bind
  (("C-c [" . reftex-citation)
   ("C-c i" . reftex-toc)))

(provide 'setup-latex)
