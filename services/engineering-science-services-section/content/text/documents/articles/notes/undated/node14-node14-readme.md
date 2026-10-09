---
author: Feng Shu
title: Pop a posframe (just a frame) at point
description: Posframe can pop up a frame at point, this posframe is a child-frame connected to its root window's buffer.
---

<a href="http://elpa.gnu.org/packages/posframe.html"><img alt="GNU ELPA" src="https://elpa.gnu.org/packages/posframe.svg"/></a>
<a href="http://elpa.gnu.org/devel/posframe.html"><img alt="GNU-devel ELPA" src="https://elpa.gnu.org/devel/posframe.svg"/></a>
<a href="https://melpa.org/#/posframe"><img alt="MELPA" src="https://melpa.org/packages/posframe-badge.svg"/></a>

# What is posframe?

Posframe can pop up a frame at point, this **posframe** is a child-frame connected to its root window's buffer.

The main advantages are:

1.  It is fast enough for daily usage :-)
2.  It works well with CJK languages.

NOTE:

1.  For MacOS users, posframe needs Emacs version \>= 26.0.91

2.  GNOME users with GTK3 builds need Emacs 27 or later. See variable \`posframe-gtk-resize-child-frames' which auto-detects this configuration.

    More details:

    1.  [Fix some problems with moving and resizing child frames](https://git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-27&id=c49d379f17bcb0ce82604def2eaa04bda00bd5ec)
    2.  [Emacs's set-frame-size can not work well with gnome-shell?](https://lists.gnu.org/archive/html/emacs-devel/2020-01/msg00343.html)

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/typescript/references/tsconfig-bases/node14/snapshots/posframe-1.png)

# Installation

``` example
(require 'posframe)
```

# Usage

## Create a posframe

### Simple way

``` example
(when (posframe-workable-p)
  (posframe-show " *my-posframe-buffer*"
                 :string "This is a test"
                 :position (point)))
```

### Advanced way

``` example
(defvar my-posframe-buffer " *my-posframe-buffer*")

(with-current-buffer (get-buffer-create my-posframe-buffer)
  (erase-buffer)
  (insert "Hello world"))

(when (posframe-workable-p)
  (posframe-show my-posframe-buffer
                 :position (point)))
```

### Arguments

``` example
C-h f posframe-show
```

## Hide a posframe

``` example
(posframe-hide " *my-posframe-buffer*")
```

## Hide all posframes

``` example
M-x posframe-hide-all
```

## Delete a posframe

1.  Delete posframe and its buffer

    ``` example
    (posframe-delete " *my-posframe-buffer*")
    ```

2.  Only delete the frame

    ``` example
    (posframe-delete-frame " *my-posframe-buffer*")
    ```

## Delete all posframes

``` example
M-x posframe-delete-all
```

Note: this command will delete all posframe buffers. You probably shouldn't use it if you are sharing a buffer between posframe and other packages.

## posframe-arghandler

posframe-arghandler feature has been removed from posframe-1.1, user can use advice feature instead.

## Mouse banish

Default setting will work well in most case, but for EXWM user, suggest use the below config.

``` {.commonlisp org-language="emacs-lisp"}
(setq posframe-mouse-banish-function #'posframe-mouse-banish-simple)
```
