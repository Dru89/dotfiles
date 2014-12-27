;;; emacs --- A grouping of all of my dotfiles whatnots

;;; Commentary:
;; 

;;; Code:
(when (>= emacs-major-version 24)
 (require 'package)
 (package-initialize)
 (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "b71d5d49d0b9611c0afce5c6237aacab4f1775b74e513d8ba36ab67dfab35e5a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro for Powerline" :foundry "adobe" :slant normal :weight normal :height 100 :width normal)))))

;; Setting up a nice mode-line
(setq sml/theme 'dark)
(sml/setup)

;; Turning on flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'scss-mode-hook 'flycheck-mode)
(add-hook 'coffee-mode-hook (lambda ()
                              (setq flycheck-coffeelintrc "~/.coffeelint.json")))

;; ======
;; TABS (which apparently emacs really doesn't want me to change for some reason) and WHITESPACE
;; ======
;; always always ALWAYS use spaces
(setq-default indent-tabs-mode nil)
;; in "c-like" files, this apparently sets the indentation level to 4
;; (I'm not really sure what classifies as "c-like"
(setq-default c-basic-offset 4)
(setq-default c-basic-indent 4)
;; Tab stops occurr every 4 columns, from 4 to 120
(setq-default tab-stop-list (number-sequence 4 120 4))
;; Turn on magic indentations
(electric-indent-mode 1)
;; CoffeeScript apparently has a mind of its own, so make damn sure that it's set to 4

;; Always put a newline at the end of the file
(setq-default require-final-newline t)
;; Set a scrolloff buffer of 5
(setq scroll-margin 5)


;; Backup files should go to ~/.saves, because I have the <file>~ and #<file># things
(setq backup-directory-alist `(("." . "~/.saves")))

;; Also load a nice theme
(load-theme 'monokai)

;; Ruby stufffffff
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; Handle some of the dotfiles (that aren't preceded with dots in my ~/dotfiles
;; directory
(add-to-list 'auto-mode-alist '("zshrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))

;; Don't compile sass when I save it
(setq scss-compile-at-save nil)

;; Enable projectile (Like CtrlP, uses C-c p f)
(projectile-global-mode)

;; Always follow symlinks
(setq vc-follow-symlinks t)

;; Turn on line numbers (and put a space between the columns)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(setq column-number-mode t)

(provide 'emacs)

;;; emacs ends here
