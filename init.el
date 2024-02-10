;;; init.el --- emacs config -*- lexical-binding: t -*-

;; Copyright (C) 2024 Lewis Weinberger

;; Author: Lewis Weinberger
;; URL: https://github.com/lewis-weinberger/dotemacs

;;; Commentary:
;; My Emacs configuration
;; This file is auto-generated!

;;; Code:

;; General configuration -------------------------------------------------------

(setq-default inhibit-startup-screen t ;; don't display startup
              mouse-autoselect-window t ;; window focus follows mouse
              frame-resize-pixelwise t ;; window manager size hints
              frame-inhibit-implied-resize t ;; prevent unneeded resizing
              require-final-newline t ;; newline before EOF
              sentence-end-double-space nil ;; only one space after period
              indent-tabs-mode nil ;; use spaces for indentation
              tab-width 8 ;; display width of tab character
              delete-selection-mode t ;; overwrite selected text
              confirm-kill-processes nil ;; don't check to exit emacs
              use-short-answers t ;; don't require full "yes/no"
              dired-kill-when-opening-new-dired-buffer t ;; one dired buffer
              ring-bell-function 'ignore ;; no bells please
              ido-everywhere t ;; use ido for file and buffer opening
              ido-enable-flex-matching t ;; fuzzy matching in ido
              cursor-type 'bar ;; show cursor tick as a bar not a box
              package-native-compile t ;; ahead-of-time package compilation
              use-package-always-ensure t ;; auto-install packages
              custom-file "~/.emacs.d/custom.el") ;; separate customisations

(menu-bar-mode -1) ;; no menu bar
(tool-bar-mode -1) ;; no tool bar
(scroll-bar-mode -1) ;; no scroll bar

(ido-mode 1) ;; interactive do
(fido-mode 1) ;; fake ido

(defun lw/whitespace ()
  "Keep track of whitespace: trailing, empty lines and tabs."
  (setq show-trailing-whitespace t
        indicate-empty-lines t
        whitespace-style '(tabs tab-mark))
  (whitespace-mode 1))

(defun lw/prog-mode ()
  "Settings for comfortable programming."
  (lw/whitespace) ;; show whitespace
  (column-number-mode 1) ;; column in modeline
  (subword-mode 1) ;; CamelCase word splitting
  (flymake-mode 1) ;; syntax checking
  (hl-line-mode 1) ;; highlight current line
  (display-line-numbers-mode 1)) ;; line numbers

(add-hook 'prog-mode-hook #'lw/prog-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-to-list 'default-frame-alist
             '(font . "unifont:pixelsize=16:antialias=true"))

;; Third-party package configuration -------------------------------------------

;; Add Melpa as package source
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

;; Sacrifice comma for a modifier-free editing experience
(use-package devil
  :demand t
  :bind ("C-," . global-devil-mode)
  :config (global-devil-mode))

;; Add ability to use more than one cursor
(use-package multiple-cursors
  :bind
  ("C-c e" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-next-like-this)
  ("C-c C-<" . mc/mark-all-like-this)
  ("C-c v" . set-rectangular-region-anchor))

;; Matching rainbow parantheses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Pulse highlighted line after commands
(use-package pulsar
  :custom
  (pulsar-pulse-functions '(scroll-up-command
                            scroll-down-command
                            recenter-top-bottom
                            other-window))
  :config (pulsar-global-mode 1))

;; Display key bindings to help remember key sequences
(use-package which-key
  :config
  (which-key-mode 1)
  (which-key-setup-minibuffer))

;; Better terminal emulator implemented in elisp
(use-package eat
  :hook
  (eshell-load . eat-eshell-mode)
  (eshell-load . eat-eshell-visual-command-mode))

;; Increase padding of windows and frames
(use-package spacious-padding
  :custom (spacious-padding-subtle-mode-line t)
  :hook (ef-themes-post-load . spacious-padding-mode))

;; εὖ themes
(use-package ef-themes
  :config (ef-themes-select 'ef-night))

;; Major mode for zig-lang
(use-package zig-mode
  :mode ("\\.zig?\\'" . zig-mode))

;; Major mode for crystal-lang
(use-package crystal-mode
  :mode ("\\.cr?\\'" . crystal-mode))

;; Linting for rust-lang
(use-package flymake-clippy
  :hook (rust-ts-mode . flymake-clippy-setup-backend))

;; Linting for more languages
(use-package flymake-collection
  :hook (after-init . flymake-collection-hook-setup))

;; Automatically install tree-sitter parsers and major modes
(use-package treesit-auto
  :defines zig-treesit-config
  :custom
  (treesit-auto-install t)
  :config
  (setq zig-treesit-config
        (make-treesit-auto-recipe
         :lang 'zig
         :ts-mode 'zig-ts-mode
         :remap 'zig-mode
         :url "https://github.com/maxxnino/tree-sitter-zig"
         :ext "\\.zig\\'"))
  (add-to-list 'treesit-auto-recipe-list zig-treesit-config)
  (add-to-list 'treesit-auto-langs 'zig)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (treesit-auto-install-all)
  (global-treesit-auto-mode))

;;; init.el ends here
