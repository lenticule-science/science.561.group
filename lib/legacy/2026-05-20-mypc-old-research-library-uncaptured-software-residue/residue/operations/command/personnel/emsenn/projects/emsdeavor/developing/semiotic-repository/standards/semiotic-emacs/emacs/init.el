;;; init.el --- semiotic-emacs -*- lexical-binding: t; -*-

;; This directory is intended to be used as `user-emacs-directory`.
;; It consolidates prior configs from `emacs-config` and `emacsen`.

(when (and (boundp 'libgnutls-version) (version< emacs-version "26.3") (>= libgnutls-version 30600))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(setq make-backup-files nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(setq sentence-end-double-space nil)
(setq echo-keystrokes 0.1)
(setq-default truncate-lines t)
(setq-default line-spacing 1)
(setq-default fill-column 68)
(global-visual-line-mode t)
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(add-to-list 'exec-path (expand-file-name "~/bin"))

;; Package management: straight.el + use-package
(defvar semiotic/straight-install-script-url
  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously semiotic/straight-install-script-url 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Theme + writing comfort
(straight-use-package
 '(nano-theme :type git :host github :repo "rougier/nano-theme"
              :config (load-theme 'nano t)))

(use-package olivetti
  :config
  (olivetti-mode 1))

(use-package centered-cursor-mode
  :config
  (centered-cursor-mode 1))

;; Org basics (minimal; repository-specific capture templates should live elsewhere)
(use-package org
  :config
  (setq org-directory (expand-file-name "~/org"))
  (setq org-agenda-files (list org-directory))
  (setq org-startup-folded 'fold)
  (setq org-hide-block-startup 'hideblocks)
  (setq org-catch-invisible-edits 'show-and-error)
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-smart-quotes nil)
  (setq org-export-with-toc nil)
  (setq org-html-validation-link nil)
  (setq org-log-done 'time)
  (setq org-log-into-drawer 'LOGBOOK)
  (setq org-image-actual-width '(400))
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t)))
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)))

(provide 'init)
;;; init.el ends here
