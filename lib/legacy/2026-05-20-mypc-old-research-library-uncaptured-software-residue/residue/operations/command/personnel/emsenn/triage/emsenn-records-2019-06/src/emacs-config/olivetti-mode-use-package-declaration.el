(use-package olivetti
  :ensure olivetti
  :after org
  :config
  (progn
    (olivetti-set-width 85)
    (add-hook 'org-mode-hook 'olivetti-mode)))
