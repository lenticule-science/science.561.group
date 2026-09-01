(setq inhibit-startup-messaget)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)

(setq ring-bell function 'ignore)
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq echo-keystrokes 0.1)
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))

(setq line-number-mode t)
(setq column-number-mode t)
(setq sentence-end-double-space nil)

(use-package poet-theme
  :ensure t
  :config
  (load-theme 'poet-monochrome))

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib
  :config
  (progn
    (setq org-hide-emphasis-markers t)
    (setq org-ellipsis "→")
    (setq org-image-actual-width nil)
    (add-hook 'org-mode-hook 'variable-pitch-mode)))

(variable-pitch-mode)
