;;; emacs.el --- Emacs configuration file
;;
;; Author: Elliot Penson
;;
;;; Code:

;; Interface ---------------------------------------------------------

;; Themes
(cond ((>= emacs-major-version 24)
       (add-to-list 'custom-theme-load-path
                    "~/.emacs.d/themes")
       (load-theme (if (display-graphic-p)
                       'base16-railscasts
                     'base16-default)
                   t))
      (t ;; (< emacs-major-version 24)
       (load-file "~/.emacs.d/themes/base16-railscasts-theme.el")))

;; Line Numbers
(global-linum-mode t)
(setq linum-format "%d ")

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font "Fixedsys")
  (set-frame-font "Fixedsys" nil t)
  (setq default-directory "C:/Users/epenson/Documents/"))

(cond ((eq system-type 'darwin)
       (setq mac-command-modifier 'meta)
       (setq mac-option-modifier 'super))
      (t (setq w32-lwindow-modifier 'meta)))

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 88))

(setq fill-column 80)

(push (cons "\\.cl$" 'lisp-mode)
      auto-mode-alist)

;; Misc Settings -----------------------------------------------------

(setq user-full-name "Elliot Penson"
      user-mail-address "elliotpenson@gmail.com")

(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(setq visible-bell nil)

(define-coding-system-alias 'UTF-8 'utf-8)

(global-set-key (kbd "C-x g") 'webjump)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Other Configuration Files -----------------------------------------

(load "~/.emacs.d/packages.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emacs.el ends here
