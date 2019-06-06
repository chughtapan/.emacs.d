;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(use-package hideshow
  :init
  (global-set-key (kbd "C-c +") 'hs-toggle-hiding))

(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "stroustrup") ;; set style to "linux"

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;

(use-package cc-mode
  :init
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))

(use-package clang-format
  :init
  (global-set-key (kbd "C-c i") 'clang-format-region)
  (global-set-key (kbd "<caps> i") 'clang-format-buffer))

(setq clang-format-binary "clang-format-5.0")
(setq clang-format-binary "/usr/bin/clang-format-5.0")
(setq clang-format-style-option "google")

(defun clang-format-buffer-with-style (style)
  "Run clang-format-buffer with the style argument."
  (let ((orig-style clang-format-style-option))
    (progn
      (setq clang-format-style-option style)
      (clang-format-buffer)
      (setq clang-format-style-option orig-style))))

(defun clang-format-buffer-with-project-style ()
  "Use project .clang-format if available, else fallback"
  (interactive)
  (if (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
      (clang-format-buffer-with-style "file")
    (clang-format-buffer)))

(global-set-key (kbd "C-c i") 'clang-format-buffer-with-project-style)

(defun clang-format-buffer-with-project-style-on-save ()
  "Add auto-save hook for clang-format-buffer-with-project-style"
  (add-hook 'before-save-hook 'clang-format-buffer-with-project-style nil t))

(add-hook 'c-mode-common-hook 'clang-format-buffer-with-project-style-on-save)

(provide 'setup-c)
