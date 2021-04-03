;;; packages.el --- emacs packages -*- lexical-binding: t -*-
;;
;; Author: Lewis Weinberger
;; URL: https://github.com/lewis-weinberger/dotemacs.git
;;
;;; Commentary:
;;
;; .....................................................................................
;; :'########:::::'###:::::'######::'##:::'##::::'###:::::'######:::'########::'######::
;; : ##.... ##:::'## ##:::'##... ##: ##::'##::::'## ##:::'##... ##:: ##.....::'##... ##:
;; : ##:::: ##::'##:. ##:: ##:::..:: ##:'##::::'##:. ##:: ##:::..::: ##::::::: ##:::..::
;; : ########::'##:::. ##: ##::::::: #####::::'##:::. ##: ##::'####: ######:::. ######::
;; : ##.....::: #########: ##::::::: ##. ##::: #########: ##::: ##:: ##...:::::..... ##:
;; : ##:::::::: ##.... ##: ##::: ##: ##:. ##:: ##.... ##: ##::: ##:: ##:::::::'##::: ##:
;; : ##:::::::: ##:::: ##:. ######:: ##::. ##: ##:::: ##:. ######::: ########:. ######::
;; :..:::::::::..:::::..:::......:::..::::..::..:::::..:::......::::........:::......:::
;;
;;; Code:

(require 'package)

(setq package-enable-at-startup nil
      package-native-compile t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(use-package god-mode
  :ensure t
  :bind ("<escape>" . god-local-mode))

(use-package multiple-cursors
  :ensure t
  :bind ("C-c m l" . mc/edit-lines))

(use-package ido
  :config
  (setq ido-enable-flex-matching t
        ido-everywhere t)
  (ido-mode 1))

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(use-package which-key
  :ensure t
  :config (which-key-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package sly
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package sly-quicklisp
  :ensure t)

;;; packages.el ends here
