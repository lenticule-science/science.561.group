---
title: 0.15.0 {#section-1}
description: In case your hydra conflicts with el:hydra-base-map, you can now override it.
---
# 0.15.0 {#section-1}

## New Features

### defhydra

1.  New :base-map option in body plist

    In case your hydra conflicts with el:hydra-base-map, you can now override it.

    Example:

    ``` elisp
    (defhydra hydra-numbers (:base-map (make-sparse-keymap))
      "test"
      ("0" (message "zero"))
      ("1" (message "one")))
    ```

    See [\#285](https://github.com/abo-abo/hydra/issues/285).

2.  Make no docstring equivalent to :hint nil

    Example:

    ``` elisp
    (defhydra hydra-clock (:color blue)
      ("q" nil "quit" :column "Clock")
      ("c" org-clock-cancel "cancel" :color pink :column "Do")
      ("d" org-clock-display "display")
      ("e" org-clock-modify-effort-estimate "effort")
      ("i" org-clock-in "in")
      ("j" org-clock-goto "jump")
      ("o" org-clock-out "out")
      ("r" org-clock-report "report"))
    ```

    See [\#291](https://github.com/abo-abo/hydra/issues/291).

3.  Declare /params and /docstring

    See [\#185](https://github.com/abo-abo/hydra/issues/185).

4.  Sexp hints are now supported for :columns

    Example

    ``` elisp
    (defhydra hydra-test ()
      "Test"
      ("j" next-line (format-time-string "%H:%M:%S" (current-time)) :column "One")
      ("k" previous-line (format-time-string "%H:%M:%S" (current-time)))
      ("l" backward-char "back" :column "Two"))
    ```

    See [\#311](https://github.com/abo-abo/hydra/issues/311).

### defhydra+

New macro. Allows to add heads to an existing hydra.

Example:

``` elisp
(defhydra hydra-extendable ()
  "extendable"
  ("j" next-line "down"))

(defhydra+ hydra-extendable ()
  ("k" previous-line "up"))
```

See [\#185](https://github.com/abo-abo/hydra/issues/185).

### el:hydra-hint-display-type

Customize what to use to display the hint:

- el:message
- el:lv-message
- posframe

el:hydra-lv is now obsolete. See [\#317](https://github.com/abo-abo/hydra/issues/317).
