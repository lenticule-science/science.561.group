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
(setq org-tags-column 3)

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
  (setq org-agenda-todo-ignore-deadlines (quote all))
  (setq org-agenda-todo-ignore-scheduled (quote all))
  (setq org-deadline-warning-days 14)
  (setq org-agenda-span (quote day))
  (setq org-agenda-start-on-weekday 0)
  (setq org-agenda-files
	(quote
	 ("/data/data/com.termux/files/home/emacsen/cal.org"
	  "/data/data/com.termux/files/home/emacsen/fut.org"
	  "/data/data/com.termux/files/home/emacsen/rou.org")))

  (setq org-agenda-window-setup (quote current-window))
  (setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))
  (setq org-agenda-span (quote fortnight))
  (org-babel-do-load-languages 'org-babel-load-languages
  			     '((shell . t)))
  
  (setq org-capture-templates
	`(
	  ("l" "Log")
	  ("lj" "Create journal entry" entry
	   (file+olp "~/dev/c/log.org" "Journal")
	   "* %U\n\n%?\n"
	   :clock-in t :clock-resume t :tree-type week)
	  ("lr" "Add a rambling" entry
	   (file+olp "~/dev/c/log.org" "Ramblings")
	   "* %U %^{Location?}\n\n%?\n"
	   :clock-in t :clock-resume t :tree-type week)
	  ("o" "Operations")
	  ("or" "Routine operations")
	  ("orw" "Weekly routines")
	  ("orwr" "Recordkeeping routines")
	  ("orwrl" "Prepare last week's records" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Prepare last week's records")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwrn" "Prepare next week's records" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Prepare next week's records")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwri" "Inventory")
	  ("orwrip" "Inventory purchases" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Sweep upstairs, first")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwt" "Weekly tidying")
	  ("orwtu" "Upstairs tidying")
	  ("orwtus" "Upstairs sweepings")
	  ("orwtusf" "Sweep upstairs, first" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Sweep upstairs, first")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwtuss" "Sweep upstairs, second" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Sweep upstairs, second")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwtud" "Dust upstairs" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Dust upstairs")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwtd" "Tidy downstairs")
	  ("orwtdd" "Dust downstairs" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Dust downstairs")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwe" "Weekly errands")
	  ("orweg" "Groceries" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Go to grocery")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ("orwet" "Thrifting" plain
	   (file+olp "~/dev/c/ops.org" "Routine" "Weekly"
		     "Go thrifting")
	   "\n%?\n"
	   :clock-in t :clock-resume t)
	  ))

  :bind (
	 ("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c t" . org-toggle-link-display)
	 ("C-c C-q" . counsel-org-tag)
	 ("<f8>" . emacsen-org-capture-capture-at-point)
	 ))

(use-package olivetti :straight t)
(straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))
(straight-use-package '(org-wc :type git :host github :repo "tesujimath/org-wc"))
(use-package htmlize :straight t)
