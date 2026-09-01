(use-package pretty-mode
  :ensure pretty-mode
  :config
  (progn
    (global-pretty-mode t)
    (global-prettify-symbols-mode 1)
    (pretty-activate-groups
     '(:greek :logic-nary :sets-operations-nary :sub-and-super-scripts))
    (add-hook 'emacs-lisp-mode-hook
              (lambda ()
                (let ((replacements
                       '((">=" . ?≥)
                         ("<=" . ?≤))))
                  (dolist (alpha replacements)
                    (push alpha prettify-symbols-alist)))))))
