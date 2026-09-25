---
title: Example file
description: This is an example file for use by the Org mode tests.
---

This is an example file for use by the Org mode tests.

# top

## code block {#code-block-section header-args=":tangle yes"}

Here are a couple of code blocks.

``` {.commonlisp org-language="emacs-lisp" tangle="no"}
;; 94839181-184f-4ff4-a72f-94214df6f5ba
(message "I am code")
```

# accumulating properties in drawers {#75282ba2-f77a-4309-a970-e87c149fe125 header-args+=":var bar=2" header-args=":var foo=1"}

``` {.commonlisp org-language="emacs-lisp" results="silent"}
(list bar foo)
```
