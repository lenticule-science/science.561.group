---
title: GnoponEmacs Configuration
description: (setq straight-repository-branch "develop")
---

# Package Management

``` {#pkg-bootstrap .commonlisp org-language="emacs-lisp"}
(defvar straight-install-script-path
  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

(setq straight-repository-branch "develop")

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
```

# User Configuration

``` {#user-config .commonlisp org-language="emacs-lisp"}
(setq user-mail-address "emsenn@emsenn.net")
(setq ring-bell-function 'ignore)
```

# User Experience

``` {#user-ui .commonlisp org-language="emacs-lisp"}
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; LANDBACK")
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

(use-package mixed-pitch
  :straight t
  :hook (text-mode . mixed-pitch-mode))

(use-package modus-themes
  :straight t
  :config (load-theme 'modus-vivendi t))

(use-package olivetti
  :straight t
  :hook (text-mode . olivetti-mode))

(require 'ucs-normalize)
```

# Beancount Support

``` {#user-beancount .commonlisp org-language="emacs-lisp"}
(straight-use-package
 '(beancount :type git :host github
             :repo "beancount/beancount-mode"))
```

# Emacs Behaviors

``` {#user-behaviors .commonlisp org-language="emacs-lisp"}
(setq make-backup-files nil)
```

# HTMLize

``` {#user-htmlize .commonlisp org-language="emacs-lisp"}
(use-package htmlize :straight t)
```

# Magit

``` {#user-magit .commonlisp org-language="emacs-lisp"}
(use-package magit :straight t)
```

# YASnippet

``` {#user-yasnippet .commonlisp org-language="emacs-lisp"}
(use-package yasnippet
  :straight t
  :hook ((text-mode
          prog-mode
          conf-mode
          snippet-mode) . yas-minor-mode-on)
  :custom (yas-snippet-dirs '("~/ems/org/met/yas-snippets")))
```

# Org-mode

``` {#user-org .commonlisp org-language="emacs-lisp"}
(use-package org
  :straight t
  :custom
  (org-directory "~/ems/org")
  (org-startup-folded 'fold)
  (org-hide-block-startup 'hideblocks)
  (org-catch-invisible-edits 'show-and-error)
  (org-agenda-custom-commands
   '(("A" "Agenda and TODO"
      ((agenda "") (alltodo "")))))
  (org-agenda-todo-ignore-scheduled 'all)
  (org-agenda-files (list "~/ems/org"))
  (org-export-with-section-numbers nil)
  (org-export-with-smart-quotes nil)
  (org-export-with-toc nil)
  (org-html-htmlize-output-type 'nil)
  (org-html-validation-link nil)
  (org-log-done 'time)
  (org-log-into-drawer 'LOGBOOK)
  (org-image-actual-width '(400))
  (org-cite-global-bibliography '("~/ems/bibliography.bib"))
  (org-export-global-macros '(("nl" . "(eval \"\\n\")")))
  (org-publish-project-alist
   `(("emsenn-net" :components ("emsenn-net-all"))
     ("emsenn-net-all"
      :base-extension "org"
      :publishing-function org-html-publish-to-html
      :html-doctype "html5"
      :html-html5-fancy t
      :html-container "section"
      :headline-levels 6
      :recursive t
      :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
      :html-head-include-scripts nil
      :html-head-include-default-style nil
      :html-head ,gpe/emsenn-net-head
      :html-format-drawer-function gpe/org-html-format-drawer
      :exclude "\\`per/\\|README.org\\|DRAFT\\|PRIVATE"
      :with-footnotes t
      :with-date nil
      :with-timestamps nil
      :with-author nil
      :base-directory "~/ems/org"
      :publishing-directory "~/ems/pub/emsenn-net"
      :makeindex t
      :html-preamble ,gpe/emsenn-net-preamble)))
  :bind (
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c t" . org-toggle-link-display)
         ("C-c C-q" . counsel-org-tag))
  :defines gpe/emsenn-net-head
  :config
  (defun gpe/org-publish-format-sitemap (title sitemap)
    (let ((posts (cdr sitemap)))
      (concat
       (format "#+title: %s\n" title)
       "#+options: timestamp:nil date:nil\n"
       (format "#+date: %s\n" (format-time-string "[%Y-%m-%d %a %H:%M:%S]" (current-time)))
       (org-list-to-org (cons (car sitemap) posts)))))
  (setq gpe/emsenn-net-head
        (with-temp-buffer
          (insert "<style>\n")
          (insert-file-contents "~/ems/org/src/emsenn-net/main.css")
          (goto-char (point-max))
          (insert "\n</style>")
          (buffer-string)))
  (setq gpe/emsenn-net-preamble
        (with-temp-buffer
          (insert-file-contents "~/ems/org/src/emsenn-net/preamble.html")
          (buffer-string)))
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((shell . t))))
```

# Org-roam

``` {#user-org-roam .commonlisp org-language="emacs-lisp"}
(use-package org-roam
  :straight t
  :config
  (defun gpe/org-roam-open-random-node ()
    "Open a random Org-roam node from the database."
    (interactive)
    (let* ((nodes (org-roam-node-list))
           (count (length nodes)))
      (if (zerop count)
          (message "No Org-roam nodes found.")
        (let* ((random-index (random count))
               (node (nth random-index nodes)))
          (org-roam-node-visit node)))))
  :custom
  (org-roam-directory (file-truename "~/ems/org"))
  (org-roam-dailies-directory ".")
  (org-roam-db-extra-links-exclude-keys '((node-property "ROAM_REFS")))
  (org-roam-capture-templates
   (let ((files (directory-files "~/ems/org/src/gpe/org-roam-capture-templates/" t "\\.el$")))
     (mapcar (lambda (file)
               (with-temp-buffer
                 (insert-file-contents file)
                 (read (buffer-string))))
             files)))
  :bind (
         ("C-c n i" . org-roam-node-insert)
         ("C-c n f" . org-roam-node-find)
         ("C-c n c" . org-roam-node-capture)
         ("C-c n d" . org-roam-dailies-capture-today)
         ("C-c n D" . org-roam-dailies-capture-yesterday)))
```

# Org-roam UI

``` {#user-org-roam-ui .commonlisp org-language="emacs-lisp"}
(use-package org-roam-ui
  :straight t)
```

# Org-drill

``` {#user-org-drill .commonlisp org-language="emacs-lisp"}
(use-package org-drill
  :straight t
  :custom
  (org-drill-scope 'agenda))
```

# Org-transclusion

``` {#user-org-transclusion .commonlisp org-language="emacs-lisp"}
(use-package org-transclusion
  :straight t
  :custom
  (org-transclusion-exclude-elements '(keyword property-drawer))
  :bind (
         ("C-c n t" . org-transclusion-mode)
         ("C-c n T" . org-transclusion-add)))
```

# Appendix: Full Configuration

``` {.commonlisp org-language="emacs-lisp" tangle="init.el"}
<<pkg-bootstrap>>
<<user-config>>
<<user-ui>>
<<user-beancount>>
<<user-behaviors>>
<<user-htmlize>>
<<user-magit>>
<<user-yasnippet>>
<<user-org>>
<<user-org-roam>>
<<user-org-roam-ui>>
<<user-org-drill>>
<<user-org-transclusion>>
```
