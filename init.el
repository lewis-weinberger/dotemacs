;;; init.el --- emacs configuration -*- lexical-binding: t -*-
;;
;; Author: Lewis Weinberger
;; URL: https://github.com/lewis-weinberger/dotemacs.git
;;
;;; Commentary:
;;
;; .................................
;; :'####:'##::: ##:'####:'########:
;; :. ##:: ###:: ##:. ##::... ##..::
;; :: ##:: ####: ##:: ##::::: ##::::
;; :: ##:: ## ## ##:: ##::::: ##::::
;; :: ##:: ##. ####:: ##::::: ##::::
;; :: ##:: ##:. ###:: ##::::: ##::::
;; :'####: ##::. ##:'####:::: ##::::
;; :....::..::::..::....:::::..:::::
;;
;;; Code:

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-to-list 'load-path "~/.emacs.d/config/")
(load-library "packages")
(load-library "style")

(add-hook 'emacs-startup-hook
	  (lambda () (setq gc-cons-threshold 800000
			   gc-cons-percentage 0.1)))

;;; init.el ends here
