(setq python-shell-interpreter "/usr/bin/python")

(custom-set-variables
 '(conda-anaconda-home (expand-file-name "~/miniconda3/")))
(setq conda-env-home-directory (expand-file-name "~/miniconda3"))

(setq clang-format-binary "clang-format")
;; (setq clang-format-binary "/usr/bin/clang-format-5.0")

(setq org-gcal-up-days 1)
(setq org-gcal-down-days 30)
(setq org-gcal-recurring-events-mode 'nested)
(setq org-gcal-auto-archive nil)
(setq org-agenda-files '("~/Dropbox/notebooks/agenda" "~/Dropbox/notebooks/agenda/journal"))
(setq org-gcal-default-calendar "tapanc@cs.washington.edu")
(setq org-gcal-file-alist `((,org-gcal-default-calendar . "~/Dropbox/notebooks/agenda/calendar.org")))

;; Setup org-capture
(setq org-capture-templates
      '(;; ("a" "Appointment" entry (file  "~/Dropbox/notebooks/agenda/UW_calendar.org")
        ;;  "* %?\n\t:PROPERTIES:\n\t:calendar-id: %(symbol-value 'org-gcal-default-calendar)\n\t:END:\n:org-gcal:\n%^T\n:END:\n\n")
        ("t" "Task" entry (file+headline "~/Dropbox/notebooks/agenda/todo.org" "ToDo")
         "* NEXT %? %i \n\n")
        ("e" "Errand" entry (file+headline "~/Dropbox/notebooks/agenda/todo.org" "Errands")
         "* NEXT %? %i \n\n")
        ("r" "Reading" entry (file+headline "~/Dropbox/notebooks/agenda/todo.org" "Readings")
         "* READING %?\n\tDEADLINE:%^t\n")
        ("m" "Email" entry (file+headline "~/Dropbox/notebooks/agenda/todo.org"
                                          "Emails")
         "* TODO %? %i \n\n")))

(defun add-to-calendar ()
  (interactive)
  (org-set-property "calendar-id" org-gcal-default-calendar)
  (org-gcal-post-at-point))

;; Setup org-ref
(setq reftex-default-bibliography '("~/Dropbox/notebooks/ref/master.bib"))

(setq org-ref-bibliography-notes "~/Dropbox/notebooks/ref/master_notes.org"
      org-ref-default-bibliography '("~/Dropbox/notebooks/ref/master.bib")
      org-ref-pdf-directory "~/Dropbox/notebooks/ref/pdfs")

(use-package org-journal
  :custom
  (org-journal-dir "~/Dropbox/notebooks/agenda/journal/")
  (org-journal-file-type 'yearly)
  (org-journal-date-format "%A, %d %B %Y"))

(setq org-journal-enable-agenda-integration t
      org-icalendar-store-UID t
      org-icalendar-include-todo "all"
      org-icalendar-combined-agenda-file "~/Dropbox/notebooks/agenda/org-journal.ics")

(defun org-journal-save-entry-and-exit()
  "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))
;; (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)

(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq tramp-ssh-controlmaster-options "")

(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-prefer-flymake t)
  (lsp-register-client
   ;; (make-lsp-client :new-connection (lsp-tramp-connection "ccls")
   ;;                  :major-modes '(c-mode c++-mode)
   ;;                  :remote? t
   ;;                  :server-id 'ccls-overlord)))
  (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                   :major-modes '(c-mode c++-mode)
                   :remote? t
                   :server-id 'clangd-abel)))

(setq tramp-auto-save-directory "~/emacs/tramp-autosave")
(use-package rtags)
(use-package company-rtags)
(use-package flycheck-rtags)
(use-package ivy-rtags)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents . 5)
                          (projects . 6)
                          (agenda . 5)))
  (dashboard-setup-startup-hook))


(setq alert-default-style 'osx-notifier)

(provide 'local-settings)
