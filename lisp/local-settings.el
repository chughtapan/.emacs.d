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
(setq org-agenda-files '("~/Dropbox/notebooks/agenda" "~/Dropbox/notebooks/agenda/journal/20210101" "~/Dropbox/notebooks/agenda/journal/20220101"))

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
(setq bibtex-completion-bibliography '("~/Dropbox/notebooks/roam/references.bib"))

(setq bibtex-completion-notes-path "~/Dropbox/notebooks/ref/notes/"
	  bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"
      bibtex-completion-library-path "~/Dropbox/notebooks/ref/pdfs")


(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance '("crypt"))
(setq org-crypt-key nil)
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.

(use-package org-journal
  :custom
  (org-journal-dir "~/Dropbox/notebooks/agenda/journal/")
  (org-journal-file-type 'yearly)
  (org-journal-date-format "%A, %d %B %Y"))

(setq org-journal-enable-agenda-integration t
      ;; org-journal-enable-encryption t
      ;; org-journal-encrypt-journal t
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
(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlPath=~/.ssh/sockets/%%r@%%h:%%p "
       "-o ControlMaster=auto -o ControlPersist=yes"))

(setq remote-file-name-inhibit-cache nil)
(setq tramp-completion-reread-directory-timeout nil)
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-prefer-flymake t)
  (setq lsp-log-io t)
  (setq lsp-pyright-use-library-code-for-types t)
  (setq lsp-pyright-diagnostic-mode "workspace")
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "ccls")
                    :major-modes '(c-mode c++-mode)
                    :remote? t
                    :server-id 'ccls))
  ;; (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
  ;;                  :major-modes '(c-mode c++-mode)
  ;;                  :remote? t
                   ;; :server-id 'clangd-abel))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection (lambda ()
                                            (cons "pyright-langserver"
                                                  lsp-pyright-langserver-command-args)))
    :major-modes '(python-mode)
    :remote? t
    :server-id 'pyright-remote
    :multi-root t
    :priority 3
    :initialization-options (lambda () (ht-merge (lsp-configuration-section "pyright")
                                                 (lsp-configuration-section "python")))
    :initialized-fn (lambda (workspace)
                      (with-lsp-workspace workspace
                        (lsp--set-configuration
                         (ht-merge (lsp-configuration-section "pyright")
                                   (lsp-configuration-section "python")))))
    :download-server-fn (lambda (_client callback error-callback _update?)
                          (lsp-package-ensure 'pyright callback error-callback))
    :notification-handlers (lsp-ht ("pyright/beginProgress" 'lsp-pyright--begin-progress-callback)
                                   ("pyright/reportProgress" 'lsp-pyright--report-progress-callback)
                                   ("pyright/endProgress" 'lsp-pyright--end-progress-callback))))
  )

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
  (setq dashboard-set-heading-icons nil))
(dashboard-setup-startup-hook)


(setq alert-default-style 'osx-notifier)
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\datasets\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\scratch\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\runs\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\synthetic_runs\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\testbed_runs\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\synthetic_panel_experiments\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\synthetic_panel_experiments_locality\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\synthetic_panel_experiments.bak\\'"))

(setq ein:polymode t)

(setq org-roam-directory "~/Dropbox/notebooks/roam/")
(org-roam-db-autosync-mode)

;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine))
(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
        :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                           "#+title: ${title}\n")
        :unnarrowed t)
        ;; bibliography note template
        ("r" "bibliography reference" plain "%?"
         :target
         (file+head "references/${citekey}.org" "#+title: ${title}\n")
         :unnarrowed t)))

(provide 'local-settings)
