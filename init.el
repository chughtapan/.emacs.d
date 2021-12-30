(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq comp-deferred-compilation t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")

(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-org-mode)
(require 'setup-latex)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-python)
(require 'setup-editing)
(require 'setup-window)
(require 'setup-irony)
(require 'setup-rtags)
(require 'setup-lsp)
(require 'setup-magit)
(require 'setup-multi-term)
(require 'local-settings)
(require 'local-secrets)

;; Works only over ssh
(define-key key-translation-map "\e[1;P9" (kbd "<caps>"))
(global-set-key (kbd "<caps> u") 'undo)
(global-set-key (kbd "<caps> f") 'mode-line-other-buffer)
(global-set-key (kbd "<caps> s") 'shell-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home (expand-file-name "~/miniconda3/"))
 '(custom-safe-themes
   '("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "6c9cbcdfd0e373dc30197c5059f79c25c07035ff5d0cc42aa045614d3919dab4" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" default))
 '(global-linum-mode t)
 '(org-inline-image-background "WhiteSmoke")
 '(org-journal-carryover-items
   "TODO=\"TODO\"|TODO=\"WAITING\"|TODO=\"DEFER\"|TODO=\"READING\"|TODO=\"MAYBE\"")
 '(org-preview-latex-default-process 'dvisvgm)
 '(org-preview-latex-process-alist
   '((dvipng :programs
             ("latex" "dvipng")
             :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
             (1.0 . 1.0)
             :latex-compiler
             ("latex -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvipng -D %D -T tight -o %O %f"))
     (dvisvgm :programs
              ("latex" "dvisvgm")
              :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
              (1.7 . 1.5)
              :latex-compiler
              ("latex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("dvisvgm %f -n -b min -c %S -o %O"))
     (imagemagick :programs
                  ("latex" "convert")
                  :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                  (1.0 . 1.0)
                  :latex-compiler
                  ("pdflatex -interaction nonstopmode -output-directory %o %f")
                  :image-converter
                  ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(package-selected-packages
   '(gscholar-bibtex ivy-bibtex org-ref-ivy org-roam-bibtex org-roam-ui org-roam fira-code-mode gist org-msg cmake-ide cmake-project cmake-mode latex python-isort latex-preview-pane orgit org-contrib org-plus-contrib org-download evil-mu4e mu4e-alert auth-source-xoauth2 oauth2 oauth2-request mu4e-maildirs-extension mu4e-overview elpy company-jedi jedi poly-org pylint python-black ein jupyter xbm-life git-gutter+ conda iedit calfw treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-magit lsp-treemacs treemacs xml-rpc org-ref bm gnuplot-mode auctex\.el auctex-latexmk company-auctex writeroom-mode writegood-mode sudo-ext protobuf-mode virtualenv cython-mode ivy-posframe flycheck-vale multiple-cursors @ org-journal org-super-agenda projectile markdown-mode+ csv-mode google-c-style ivy-xref company-lsp ccls company-tabnine tabnine exwm frecentf itail pyenv-mode pyvenv org-kanban flycheck-rtags company-rtags ivy-rtags rtags vterm sudo-edit org-noter w3m undo-tree org-bullets org-ascii-bullets multi-term cuda-mode zygospore yasnippet xcscope ws-butler volatile-highlights use-package sr-speedbar solaire-mode rainbow-delimiters ox-reveal magit ivy-prescient irony flx-isearch fish-mode eyebrowse exec-path-from-shell eterm-256color dtrt-indent doom-themes doom-modeline dired-sidebar counsel-projectile counsel-etags company-prescient company-c-headers company-anaconda comment-dwim-2 clean-aindent-mode clang-format anzu amx all-the-icons-ivy))
 '(preview-image-type 'tiff)
 '(preview-transparent-color "white")
 '(warning-suppress-log-types '((use-package) (use-package) (:warning)))
 '(warning-suppress-types '((use-package) (:warning))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-face ((t nil)))
 '(preview-reference-face ((t (:background "White")))))
