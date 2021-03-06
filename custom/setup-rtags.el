(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

;; only run this if rtags is installed
(when (require 'rtags nil :noerror)
  ;; make sure you have company-mode installed
  ;; (require 'company)
  ;; install standard rtags keybindings. Do M-. on the symbol below to
  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)
  ;; comment this out if you don't have or don't use ivy
  (setq rtags-use-ivy t)
  ;; company completion setup
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  ;; (setq rtags-completions-enabled t)
  ;; (push 'company-rtags company-backends)
  ;; (global-company-mode)
  ;; (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  ;; use rtags flycheck mode -- clang warnings shown inline
  ;; (require 'flycheck-rtags)
  ;; c-mode-common-hook is also called by c++-mode
  ;; (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)
  (setq rtags-tramp-enabled t))

(provide 'setup-rtags)
