---
title: Frequently Asked Questions
description: "For doom-modeline users you may use this:"
---

# *How can I hide modeline in dashboard?*

You can add this to your config:

``` {.commonlisp org-language="emacs-lisp"}
(add-hook 'dashboard-mode-hook (lambda () (setq-local mode-line-format nil)))
```

You can also use [hide-mode-line](https://github.com/hlissner/emacs-hide-mode-line):

``` elisp
(add-hook 'dashboard-mode-hook #'hide-mode-line-mode)
;; Or for use-package
(use-package hide-mode-line
  :hook (dashboard-mode . hide-mode-line-mode)
  ...)
```

For doom-modeline users you may use this:

``` elisp
(add-to-list 'doom-modeline-mode-alist '(dashboard-mode))
```

# *Icons doesn't display in Windows GUI, How can I fix it?*

Emacs Windows port doesn't handle well icons.

For **nerd-icons** you can use **patched nerd fonts** found in their official website <https://www.nerdfonts.com/font-downloads>.

Otherwise you can use **UTF-8** coding system, putting this line into your `early-init.el`{.verbatim}

``` {.commonlisp org-language="emacs-lisp"}
(if (eq system-type 'windows-nt)
    (prefer-coding-system 'utf-8))
```

# *How can I use [solaire-mode](https://github.com/hlissner/emacs-solaire-mode) with dashboard?*

Add this to your config:

``` {.commonlisp org-language="emacs-lisp"}
(add-hook 'dashboard-before-initialize-hook #'solaire-mode)
;; Or if you prefer use-package
(use-package solaire-mode
  :hook (dashboard-before-initialize . solaire-mode)
  ...)
```

# *How can I add my custom widget?*

To add your own custom widget is pretty easy, define your widget's callback function and add it to \`dashboard-items\` as such:

``` elisp
(defun dashboard-insert-custom (list-size)
  (insert "Custom text"))
(add-to-list 'dashboard-item-generators  '(custom . dashboard-insert-custom))
(add-to-list 'dashboard-items '(custom) t)
```

If you want to add an icon to a custom widget, insert it with \`dashboard-insert-heading\` in your custom function:

``` elisp
;; In this example, there is an icon but no shortcut
;; see `dashboard-insert-heading' for more details.
(defun dashboard-insert-custom (list-size)
  (dashboard-insert-heading "News:"
                            nil
                            (all-the-icons-faicon "newspaper-o"
                                                  :height 1.2
                                                  :v-adjust 0.0
                                                  :face 'dashboard-heading))
  (insert "\n")
  (insert "    Custom text"))
```

# *Items length is too high, How can I change it?*

You can change dashboard-items-default-length amount:

``` elisp
(setq dashboard-items-default-length 20)
```

# *How can I change dashboard buffer name?*

You can change it with `dashboard-buffer-name`

``` {.commonlisp org-language="emacs-lisp"}
(setq dashboard-buffer-name "*my dashboard*")
```

# *I don't like banner, init info or even items, How can I delete them from dashboard?*

You can delete them from `dashboard-startupify-list`.

``` {.commonlisp org-language="emacs-lisp"}
(setq dashboard-startupify-list '(dashboard-insert-banner-title
                                  dashboard-insert-navigator
                                  ,(dashboard-insert-newline 2)
                                  dashboard-insert-footer))
```

# *How can I change my init message?*

You can customize it like this:

``` elisp
(setq dashboard-init-info "This is an init message!")
```

# *How can I change footer messages?*

You can customize it like this:

``` elisp
(setq dashboard-footer-messages '("Dashboard is pretty cool!"))
```

If you want to change its icon you may use this:

``` elisp
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
Also it can be a string list for display random footer icons.
```
