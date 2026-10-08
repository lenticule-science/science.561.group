---
title: cfrs.el – Child Frame Read String {#cfrs.el-child-frame-read-string}
description: cfrs.el is a simple alternative to read-string that allows reading input via a small child-frame spawned at the position of the cursor.
---
# cfrs.el – Child Frame Read String {#cfrs.el-child-frame-read-string}

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/cfrs/cfrs.png)

cfrs.el is a simple alternative to `read-string` that allows reading input via a small child-frame spawned at the position of the cursor. Its goal is to make the string input interface closer to those used in modern GUI programs and to help the user with having to switch focus from whatever they are doing currently to look at the minibuffer.

There is just one single entry point, `cfrs-read`, and its interface simple enough to not require further explanation:

``` {.commonlisp org-language="emacs-lisp"}
(defun cfrs-read (prompt &optional initial-input) ... )
```

The text in the resulting child-frame can be edited freely, with the caveat that it is meant to fit on a single line - cfrs.el is meant for *simple* inputs. The input can be confirmed via either `C-c C-c` or `RET`.

A runnable example:

``` {.commonlisp org-language="emacs-lisp"}
(let ((input (cfrs-read "Text: " "Initial Input")))
  (message "Hello %s!" input))
```

In a terminal environment cfrs will fall back to the default `read-string`.
