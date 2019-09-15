(setq multi-term-program "/usr/local/bin/fish")
(setq python-shell-interpreter "/usr/bin/python")

(setq clang-format-binary "clang-format-5.0")
(setq clang-format-binary "/usr/bin/clang-format-5.0")

(setq org-agenda-files '("~/Dropbox/notebooks/agenda"))
(setq org-gcal-default-calendar "tapanc@cs.washington.edu")
(setq org-gcal-file-alist `((,org-gcal-default-calendar . "~/Dropbox/notebooks/agenda/UW_calendar.org")))

;; Setup org-capture
(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/notebooks/agenda/UW_calendar.org")
         "* %?\n\t:PROPERTIES:\n\t:calendar-id: %(symbol-value 'uw-calendar)\n\t:END:\n:org-gcal:\n%^T\n:END:\n\n")))

(provide 'local-settings)
