;;; style.el --- emacs styling -*- lexical-binding: t -*-
;;
;; Author: Lewis Weinberger
;; URL: https://github.com/lewis-weinberger/dotemacs.git
;;
;;; Commentary:
;;
;; ...................................................
;; ::'######::'########:'##:::'##:'##:::::::'########:
;; :'##... ##:... ##..::. ##:'##:: ##::::::: ##.....::
;; : ##:::..::::: ##:::::. ####::: ##::::::: ##:::::::
;; :. ######::::: ##::::::. ##:::: ##::::::: ######:::
;; ::..... ##:::: ##::::::: ##:::: ##::::::: ##...::::
;; :'##::: ##:::: ##::::::: ##:::: ##::::::: ##:::::::
;; :. ######::::: ##::::::: ##:::: ########: ########:
;; ::......::::::..::::::::..:::::........::........::
;;
;;; Code:

(setq inhibit-startup-screen t
      mouse-autoselect-window t
      frame-resize-pixelwise t
      frame-inhibit-implied-resize t)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(column-number-mode)

(load-theme 'modus-vivendi t)

(set-face-attribute 'default nil
		    :font "-gnu-unifont-medium-r-normal-sans-16-*-*-*-*-*-*-*")

(mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))

;;; style.el ends here
