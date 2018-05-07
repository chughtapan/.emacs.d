(load "multi-term")
;; Setup default shell

(setq multi-term-program "/bin/bash")

(defun term-mode-toggle ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(add-hook 'term-mode-hook
          (lambda()
            (setq term-buffer-maximum-size 10000)))

(add-hook 'term-mode-hook
          (lambda()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (define-key term-raw-map (kbd "C-c C-k") 'term-mode-toggle)))

(setq ansi-term-color-vector [term term-color-black term-color-red term-color-green term-color-yellow term-color-blue term-color-magenta term-color-cyan term-color-white])

(global-set-key (kbd "C-c t") 'multi-term)

(provide 'setup-multi-term)
