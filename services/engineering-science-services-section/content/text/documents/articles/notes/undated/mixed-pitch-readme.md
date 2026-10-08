---
author: J. Alexander Branham
lang: en
title: Mixed Pitch
description: Mixed pitch is a minor mode that enables mixing fixed-pitch (also known as fixed-width or monospace) and variable-pitch (AKA "proportional") fonts.
---

Mixed pitch is a minor mode that enables mixing fixed-pitch (also known as fixed-width or monospace) and variable-pitch (AKA "proportional") fonts. It tries to be smart about which fonts get which face. Fonts that look like code, org-tables, and such remain fixed-pitch and everything else becomes variable-pitch. The variable `mixed-pitch-fixed-pitch-faces` is a list of faces that will remain fixed-pitch in mixed-pitch-mode:

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/mixed-pitch/screenshots/screenshot_20170712_202445.png)

# Installation

`mixed-pitch` is on MELPA. Set up MELPA and then you can simply do `M-x package-install mixed-pitch`.

# Configuration

If you use `use-package`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(use-package mixed-pitch
  :hook
  ;; If you want it in all text modes:
  (text-mode . mixed-pitch-mode))
```

# How it works

When activated, the minor mode

- changes the family and height of the default face to the family and height of the `variable-pitch` face;
- changes the family and height of every face in `mixed-pitch-fixed-pitch-faces` to the family and height of the `default` face; and
- sets the cursor type to `mixed-pitched-variable-pitch-cursor` if it is non-nil.

# Known issues

## org SRC blocks shown in variable pitch

`mixed-pitch.el` relies on a face introduced in org version 9.0 to make SRC blocks fixed-pitch. Without this, some things in source blocks may appear variable-pitch. The solution is to update your version of org. As a workaround, consider adding org-block to `~mixed-pitch-fixed-pitch-faces`. See also the discussion in issue \#2.

## Interaction with company

If you use company for autocompletion, results in the popup window may appear to zig-zag. A workaround is to install and use [company-box](https://github.com/sebastiencs/company-box) or [company-posframe](https://github.com/tumashu/company-posframe). As a bonus, this is currently much faster than company's built-in mechanism.
