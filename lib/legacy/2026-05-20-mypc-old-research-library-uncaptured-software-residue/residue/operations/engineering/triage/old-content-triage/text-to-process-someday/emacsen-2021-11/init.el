(if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
(defvar straight-install-script-path
  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
    (url-retrieve-synchronously straight-install-script-path
     'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq make-backup-files nil)
(add-to-list 'exec-path "~/bin")
(setq inhibit-startup-message t)
(setq visible-bell 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; LANDBACK\n")
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default truncate-lines t)
(setq-default line-spacing 1)
(setq sentence-end-double-space nil)
(global-visual-line-mode t)
(setq echo-keystrokes 0.1)
(setq fill-column 68)
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
(straight-use-package '(nano-theme :type git :host github
				   :repo "rougier/nano-theme"
				   :config (load-theme 'nano t)))
(setq user-mail-address "emsenn@emsenn.net")
(setq user-full-name "emsenn")

(use-package org :straight t
  :config
  (setq org-directory "~/org")
  (setq org-startup-folded 'fold)
  (setq org-hide-block-startup 'hideblocks)
  (setq org-catch-invisible-edits 'show-and-error)
  (setq org-agenda-files (list "~/org"))
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-smart-quotes nil)
  (setq org-export-with-toc nil)
  (setq org-html-htmlize-output-type 'nil)
  (setq org-html-validation-link nil)
  (setq org-html-html5-fancy t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer 'LOGBOOK)
  (setq org-image-actual-width '(400))
  (org-babel-do-load-languages 'org-babel-load-languages
  			     '((shell . t)))
  (setq org-tags-column 3)
  (require 'ox-org)
  (setq org-capture-templates
	`(
	  ("l" "Log entry")
	  ("lj" "Journal entry" entry
	   (file+olp+datetree "~/.emacs.d/main.org" "Log" "Journal")
	   "* %U\n\n%?\n"
	   :clock-in t :clock-resume t :tree-type week)
<<<<<<< HEAD
=======
          ("L" "Library Entry")
          ("Lb" "New book")
          ("LbS" "Special book entry")
          ("LbSP" "PM Press Haul entry" entry
           (file+headline "~/.emacs.d/main.org" "Library")
           "* AVAIL %^{Short-title?}   :book:lend:\n:PROPERTIES:\n:lib-item-title: %^{Title?}\n:lib-item-author: %^{Author?}\n:lib-item-isbn13: %^{ISBN13?}\n:lib-item-brief: %^{Brief?}\n:lib-item-topics: %^{Topics?}\n:lib-item-publish-date: %^{Published?}\n:lib-item-acquisition-date: [2021-12-06 Mon]\n:END:\n{{{lib-item-table}}}\n")
>>>>>>> 74ea87cfcc8a97445375cb006052ce2ff5e17532
	  ))

  :bind (
	 ("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c t" . org-toggle-link-display)
	 ("C-c C-q" . counsel-org-tag)
	 ("<f8>" . emacsen-org-capture-capture-at-point)
	 ))

(straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))
(straight-use-package '(org-wc :type git :host github :repo "tesujimath/org-wc"))
(use-package htmlize :straight t)
