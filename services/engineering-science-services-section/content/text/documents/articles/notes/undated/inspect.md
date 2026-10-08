---
title: Test
---
# Test

``` {.commonlisp org-language="emacs-lisp"}
(setq citeproc-test-blt-current "thesis")
```

# Expected

``` {.commonlisp org-language="emacs-lisp" results="value code"}
(let* ((file (concat "./" citeproc-test-blt-current ".txt"))
  (csl-entries (cdr
            (citeproc-test-blt--parse file))))
  (citeproc-test-blt--normalize-csl-entries
    csl-entries))
```

# Output

``` {.commonlisp org-language="emacs-lisp" results="value code"}
(let* ((file (concat "./" citeproc-test-blt-current ".txt"))
  (blt (car
        (citeproc-test-blt--parse file))))
  (citeproc-test-blt--output blt))
```
