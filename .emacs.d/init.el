;;
; init
;;
(package-initialize)
(require 'package)

;;
; package repositories
;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; Theme settings
(load-theme 'seti t)

;; evil mode :)
(require 'evil)
(evil-mode t)

;; File type overrides
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;;
; GUI settings
;;
(setq ring-bell-function 'ignore)
(setq package-enable-at-startup nil)
(setq
  inhibit-splash-screen t
  inhibit-startup-message t
  inhibit-startup-echo-area-message t
)

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)

(use-package all-the-icons
  :ensure t
)

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
)

;; Line numbers rendering that works for long files
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (setq nlinum-relative-redisplay-delay 0)
  (add-hook 'prog-mode-hook #'nlinum-relative-mode)
)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (powerline-center-evil-theme)
  )

(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode)

(use-package css-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook
    (lambda () (rainbow-mode))
  )
)

(use-package scss-mode
  :ensure t
  :config
  (setq scss-compile-at-save nil)
  (add-hook 'scss-mode-hook
	(lambda ()
	  (add-to-list 'ac-modes 'scss-mode)
	  (add-to-list 'ac-sources 'ac-source-css-property)
	)
  )
)
