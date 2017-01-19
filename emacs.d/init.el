;; --- Initialization ----------------------------------

; There is a "chicken and egg" problem with use-package, which is capable of
;; automatically downloading and installing packages, but otherwise needs to
;; be downloaded and installed manually. I include the following code in my
;; emacs initialization file so that this process is automatic.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; Change some Emacs UI settings to make it prettier and easier to work with
;; Set default font
(set-face-attribute 'default nil
                     :family "Source Code Pro"
                     :height 150
                     :weight 'normal
                     :width 'normal)

;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Disable the bell from constantly ringing at us
(setq ring-bell-function 'ignore)

;; Disable the scroll bar and tab bar
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Do not display the splash screen
(setq inhibit-splash-screen t)

;; Set the window size
(set-frame-size (selected-frame) 130 40)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Map escape to cancel (like C-g)...
(define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
(define-key isearch-mode-map "\e" 'isearch-abort)       ;; \e seems to work better for terminals
(global-set-key [escape] 'keyboard-escape-quit)         ;; everywhere else

(use-package base16-theme
  :ensure t
  :init
  (setq custom-safe-themes t)
  :config
  (load-theme 'base16-ocean t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode t))

(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)                      ;; setup for evil
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0)          ;; delay
  (setq nlinum-relative-current-symbol "")          ;; or "" for display current line number
  (setq nlinum-relative-offset 0))                  ;; 1 if you want 0, 2, 3...

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))

(use-package magit
  :ensure t)

(use-package clojure-mode
  :ensure t)
