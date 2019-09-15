(use-package ivy
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)))

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))

(use-package amx
  :bind
  (("M-x" . amx)))

(use-package ivy-prescient
  :init
  (ivy-prescient-mode 1))

(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

(use-package all-the-icons-ivy
  :init
  (all-the-icons-ivy-setup))

(provide 'setup-ivy-counsel)
