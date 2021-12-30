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

(use-package jupyter)
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
(add-to-list 'org-structure-template-alist '("jj" . "src jupyter-python :results none"))
(add-to-list 'org-structure-template-alist '("qq" . ":results none"))
(add-to-list 'org-structure-template-alist '("py" . "src python :results none"))
(add-to-list 'org-structure-template-alist '("pyo" . "src python"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))



(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAITING(w!)" "TODAY(T!)" "READING(r)" "MAYBE(m)" "|" "DONE(d!)" "DEFER(D!)" "INACTIVE(i@)" "SOMEDAY(s)")))

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

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

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

;; From https://emacs.stackexchange.com/questions/20574/default-inline-image-background-in-org-mode
(defcustom org-inline-image-background nil
  "The color used as the default background for inline images.
When nil, use the default face background."
  :group 'org
  :type '(choice color (const nil)))

(defun create-image-with-background-color (args)
  "Specify background color of Org-mode inline image through modify `ARGS'."
  (let* ((file (car args))
         (type (cadr args))
         (data-p (caddr args))
         (props (cdddr args)))
    ;; Get this return result style from `create-image'.
    (append (list file type data-p)
            (list :background (or org-inline-image-background (face-background 'default)))
            props)))

(advice-add 'create-image :filter-args
            #'create-image-with-background-color)

;; Org-download: drag-and-drop images into org-files
(use-package org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(use-package org-contrib)
(with-eval-after-load 'org-contrib (require 'ol-git-link))

(use-package org-ref)
(setq org-ref-completion-library 'org-ref-ivy-cite-completion)

(setq bibtex-completion-additional-search-fields '(keywords)
	  bibtex-completion-display-formats
	  '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	    (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	    (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	    (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	    (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	  bibtex-completion-pdf-open-function
	  (lambda (fpath)
	    (call-process "open" nil 0 nil fpath)))

(require 'bibtex)
(setq bibtex-autokey-year-length 4
	  bibtex-autokey-name-year-separator "-"
	  bibtex-autokey-year-title-separator "-"
	  bibtex-autokey-titleword-separator "-"
	  bibtex-autokey-titlewords 2
	  bibtex-autokey-titlewords-stretch 1
	  bibtex-autokey-titleword-length 5
	  org-ref-bibtex-hydra-key-binding (kbd "C-M-o"))

(define-key bibtex-mode-map (kbd "C-M-o") 'org-ref-bibtex-hydra/body)



(use-package org-roam)
(setq org-roam-v2-ack t)

(use-package org-roam-bibtex
  :after org-roam
  :init
  (org-roam-bibtex-mode))

(use-package ivy-bibtex
  :init
  (require 'org-ref-ivy)
  (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
        org-ref-insert-cite-function 'org-ref-cite-insert-ivy
        org-ref-insert-label-function 'org-ref-insert-label-link
        org-ref-insert-ref-function 'org-ref-insert-ref-link
        org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body))))

(define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
(define-key bibtex-mode-map (kbd "C-c [") 'org-mark-ring-goto)
(define-key org-mode-map (kbd "C-c [") 'org-mark-ring-goto)

(use-package gscholar-bibtex)

(provide 'setup-org-mode)
