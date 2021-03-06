;; Setup default shell

(use-package eterm-256color
  :ensure t)


;; Setup default shell
(use-package multi-term)

(defun term-mode-toggle ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(add-hook 'term-mode-hook #'eterm-256color-mode)

(add-hook 'term-mode-hook
          (lambda()
            (setq term-buffer-maximum-size 10000)))

(add-hook 'term-mode-hook
          (lambda()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("M-o" . ace-window))))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (define-key term-raw-map (kbd "C-c C-k") 'term-mode-toggle)
            (define-key term-raw-map (kbd "M-o") 'ace-window)))

(use-package multi-vterm
	:config
	(define-key vterm-mode-map [return]          'vterm-send-return)
	(define-key vterm-mode-map (kbd "M-]")       'multi-vterm-next)
	(define-key vterm-mode-map (kbd "M-[")       'multi-vterm-prev)
    (define-key vterm-mode-map (kbd "C-c C-k")       'vterm-copy-mode)
	(define-key vterm-copy-mode-map (kbd "M-]")       'multi-vterm-next)
	(define-key vterm-copy-mode-map (kbd "M-[")       'multi-vterm-prev)
    (define-key vterm-copy-mode-map (kbd "C-c C-k")       'vterm-copy-mode))


(setq ansi-term-color-vector [term term-color-black term-color-red term-color-green term-color-yellow term-color-blue term-color-magenta term-color-cyan term-color-white])
(setq term-default-bg-color nil)
(global-set-key (kbd "C-c t") 'multi-vterm)

(provide 'setup-multi-term)
