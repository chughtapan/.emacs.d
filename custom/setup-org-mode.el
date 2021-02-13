(setq org-cycle-separator-lines 1)

(add-hook 'org-mode-hook
          (lambda()
            ;; (local-set-key "\C-n" 'outline-next-visible-heading)
            ;; (local-set-key "\C-p" 'outline-previous-visible-heading)
            ;; (local-set-key "\M-n" 'outline-forward-same-level)
            ;; (local-set-key "\M-p" 'outline-backward-same-level)
            (local-set-key "\C-y" 'yank)
            (local-set-key "\M-h" 'backward-kill-word)))


(global-set-key (kbd "C-c l") 'org-store-link)

(use-package 'jupyter)
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key (kbd  "C-c C-k") 'jupyter-org-kill-block-and-results)))

;; Setup org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (jupyter . t)))

;;; execute block evaluation without confirmation
(setq org-confirm-babel-evaluate nil)

;;; display/update images in the buffer after evaluation
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("jj" . "src jupyter-python"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))



(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "DEFER(D)" "WAITING(w!)" "READING(r)" "MAYBE(m)" "|" "DONE(d!)" "INACTIVE(i@)" "SOMEDAY(s)")))

(use-package ox-reveal)

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-gcal)
(add-hook 'org-agenda-mode-hook (lambda() (org-gcal-sync)))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync)))

(use-package pdf-tools
  :init
  (pdf-tools-install))

(use-package org-ref)
(setq org-ref-completion-library 'org-ref-ivy-cite-completion)
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))
(use-package interleave)
(use-package org-noter)

(use-package org-kanban
  :bind
  (("M-F" . org-kanban/next)
   ("M-B" . org-kanban/prev)))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-refile)

(use-package flycheck-vale
  :init
  (flycheck-vale-setup))

(load-file  "~/.emacs.d/lisp/ox-ipynb/ox-ipynb.el")


(provide 'setup-org-mode)
