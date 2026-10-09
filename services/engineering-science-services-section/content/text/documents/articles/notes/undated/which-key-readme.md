---
title: which-key
description: which-key is now included in the master branch of Emacs and will likely be released with Emacs v30.
---
# which-key

[![](https://elpa.gnu.org/packages/which-key.svg)](https://elpa.gnu.org/packages/which-key.html) [![](http://melpa.org/packages/which-key-badge.svg)](http://melpa.org/#/which-key) [![](http://stable.melpa.org/packages/which-key-badge.svg)](http://stable.melpa.org/#/which-key)

## ARCHIVE NOTICE

which-key is now included in the master branch of Emacs and will likely be released with Emacs v30. Bug reports and contributions to which-key will now be considered through standard Emacs channels, and this repository is being archived.

## Introduction

`which-key`{.verbatim} is a minor mode for Emacs that displays the key bindings following your currently entered incomplete command (a prefix) in a popup. For example, after enabling the minor mode if you enter `C-x`{.verbatim} and wait for the default of 1 second the minibuffer will expand with all of the available key bindings that follow `C-x`{.verbatim} (or as many as space allows given your settings). This includes prefixes like `C-x 8`{.verbatim} which are shown in a different face. Screenshots of what the popup will look like are included below. `which-key`{.verbatim} started as a rewrite of [guide-key-mode](https://github.com/kai2nenobu/guide-key), but the feature sets have diverged to a certain extent.

## Table of Contents <span class="tag" tag-name="TOC_3"><span class="smallcaps">TOC_3</span></span> {#table-of-contents}

- [which-key](#which-key)
  - [ARCHIVE NOTICE](#archive-notice)
  - [Introduction](#introduction)
  - [Install](#install)
    - [MELPA](#melpa)
    - [Manually](#manually)
  - [Initial Setup](#initial-setup)
    - [Side Window Bottom Option](#side-window-bottom-option)
    - [Side Window Right Option](#side-window-right-option)
    - [Side Window Right then Bottom](#side-window-right-then-bottom)
    - [Minibuffer Option](#minibuffer-option)
  - [Manual Activation](#manual-activation)
  - [Additional Commands](#additional-commands)
  - [Special Features and Configuration Options](#special-features-and-configuration-options)
    - [Popup Type Options](#popup-type-options)
    - [Custom String Replacement Options](#custom-string-replacement-options)
    - [Sorting Options](#sorting-options)
    - [Paging Options](#paging-options)
    - [Face Customization Options](#face-customization-options)
    - [Other Options](#other-options)
  - [Support for Third-Party Libraries](#support-for-third-party-libraries)
    - [Key-chord](#key-chord)
    - [Evil operators](#evil-operators)
    - [God-mode](#god-mode)
  - [More Examples](#more-examples)
    - [Nice Display with Split Frame](#nice-display-with-split-frame)
  - [Known Issues](#known-issues)
  - [Thanks](#thanks)

## Install

### MELPA

After setting up [MELPA](http://melpa.org) as a repository, use `M-x package-install which-key`{.verbatim} or your preferred method. You will need to call `which-key-mode`{.verbatim} to enable the minor mode of course.

### Manually

Add which-key.el to your `load-path`{.verbatim} and require. Something like

``` {.commonlisp org-language="emacs-lisp"}
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)
```

## Initial Setup

No further setup is required if you are happy with the default setup. To try other options, there are 3 choices of default configs that are preconfigured (then customize to your liking). The main choice is where you want the which-key buffer to display. Screenshots of the default options are shown in the next sections.

In each case, we show as many key bindings as we can fit in the buffer within the constraints. The constraints are determined by several factors, including your Emacs settings, the size of the current Emacs frame, and the which-key settings, most of which are described below.

There are many substitution abilities included, which are quite flexible (ability to use regexp for example). This makes which-key very customizable.

### Side Window Bottom Option

Popup side window on bottom. This is the current default. To restore this setup use

``` {.commonlisp org-language="emacs-lisp"}
(which-key-setup-side-window-bottom)
```

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/which-key/img/which-key-bottom.png)

### Side Window Right Option

Popup side window on right. For defaults use

``` {.commonlisp org-language="emacs-lisp"}
(which-key-setup-side-window-right)
```

Note the defaults are fairly conservative and will tend to not display on narrower frames. If you get a message saying which-key can't display the keys, try making your frame wider or adjusting the defaults related to the maximum width (see `M-x customize-group which-key`{.verbatim}).

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/which-key/img/which-key-right.png)

### Side Window Right then Bottom

This is a combination of the previous two choices. It will try to use the right side, but if there is no room it will switch to using the bottom, which is usually easier to fit keys into. This setting can be helpful if the size of the Emacs frame changes frequently, which might be the case if you are using a dynamic/tiling window manager.

``` {.commonlisp org-language="emacs-lisp"}
(which-key-setup-side-window-right-bottom)
```

### Minibuffer Option

Take over the minibuffer. For the recommended configuration use

``` {.commonlisp org-language="emacs-lisp"}
(which-key-setup-minibuffer)
```

![](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/which-key/img/which-key-minibuffer.png)

Note the maximum height of the minibuffer is controlled through the built-in variable `max-mini-window-height`{.verbatim}. Also, the paging commands do not work reliably with the minibuffer option. Use the side window on the bottom option if you need paging.

## Manual Activation

If you only want the `which-key`{.verbatim} popup when you need it, you can try a setup along the following lines

``` {.commonlisp org-language="emacs-lisp"}
;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)
```

This will prevent which-key from showing automatically, and allow you to use `C-h`{.verbatim} in the middle of a key sequence to show the `which-key`{.verbatim} buffer and keep it open for the remainder of the key sequence.

## Additional Commands

- `which-key-show-top-level`{.verbatim} will show most key bindings without a prefix. It is most and not all, because many are probably not interesting to most users.
- `which-key-show-major-mode`{.verbatim} will show the currently active major-mode bindings. It's similar to `C-h m`{.verbatim} but in a which-key format. It is also aware of evil commands defined using `evil-define-key`{.verbatim}.
- `which-key-show-next-page-cycle`{.verbatim} / `which-key-show-previous-page-cycle`{.verbatim} will flip pages in a circle.
- `which-key-show-next-page-no-cycle`{.verbatim} / `which-key-show-previous-page-no-cycle`{.verbatim} will flip pages and stop at first/last page.
- `which-key-undo`{.verbatim} can be used to undo the last keypress when in the middle of a key sequence.

## Special Features and Configuration Options

There are more options than the ones described here. All of the configurable variables are available through `M-x customize-group which-key`{.verbatim}.

### Popup Type Options

There are three different popup types that which-key can use by default to display the available keys. The variable `which-key-popup-type`{.verbatim} decides which one is used.

1.  minibuffer

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-popup-type 'minibuffer)
    ```

    Show keys in the minibuffer.

2.  side window

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-popup-type 'side-window)
    ```

    Show keys in a side window. This popup type has further options:

    ``` {.commonlisp org-language="emacs-lisp"}
    ;; location of which-key window. valid values: top, bottom, left, right,
    ;; or a list of any of the two. If it's a list, which-key will always try
    ;; the first location first. It will go to the second location if there is
    ;; not enough room to display any keys in the first location
    (setq which-key-side-window-location 'bottom)

    ;; max width of which-key window, when displayed at left or right.
    ;; valid values: number of columns (integer), or percentage out of current
    ;; frame's width (float larger than 0 and smaller than 1)
    (setq which-key-side-window-max-width 0.33)

    ;; max height of which-key window, when displayed at top or bottom.
    ;; valid values: number of lines (integer), or percentage out of current
    ;; frame's height (float larger than 0 and smaller than 1)
    (setq which-key-side-window-max-height 0.25)
    ```

3.  frame

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-popup-type 'frame)
    ```

    Show keys in a popup frame. This popup won't work very well in a terminal, where only one frame can be shown at any given moment. This popup type has further options:

    ``` {.commonlisp org-language="emacs-lisp"}
    ;; max width of which-key frame: number of columns (an integer)
    (setq which-key-frame-max-width 60)

    ;; max height of which-key frame: number of lines (an integer)
    (setq which-key-frame-max-height 20)
    ```

4.  custom

    Write your own display functions! This requires you to write three functions, `which-key-custom-popup-max-dimensions-function`{.verbatim}, `which-key-custom-show-popup-function`{.verbatim}, and `which-key-custom-hide-popup-function`{.verbatim}. Refer to the documentation for those variables for more information, but here is a working example (this is the current implementation of side-window bottom).

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-popup-type 'custom)
    (defun which-key-custom-popup-max-dimensions-function (ignore)
      (cons
       (which-key-height-or-percentage-to-height
        which-key-side-window-max-height)
       (frame-width)))
    (defun fit-horizonatally ()
      (let ((fit-window-to-buffer-horizontally t))
        (fit-window-to-buffer)))
    (defun which-key-custom-show-popup-function (act-popup-dim)
      (let* ((alist '((window-width . fit-horizontally)
                      (window-height . fit-window-to-buffer))))
        (if (get-buffer-window which-key--buffer)
            (display-buffer-reuse-window which-key--buffer alist)
          (display-buffer-in-major-side-window which-key--buffer
                                               'bottom 0 alist))))
    (defun which-key-custom-hide-popup-function ()
      (when (buffer-live-p which-key--buffer)
        (quit-windows-on which-key--buffer)))
    ```

### Custom String Replacement Options

You can customize the way the keys show in the buffer using three different replacement methods. The first, keymap-based replacement, is preferred and will take precedence over the others. The remaining methods are still available, because they pre-date the first and are more flexible in what they can accomplish.

1.  Keymap-based replacement

    Using this method, which-key can display a custom string for a key definition in some keymap. There are two ways to define a keymap-based replacement. The preferred way is to use `define-key`{.verbatim} (or a command that uses `define-key`{.verbatim} internally) with a cons cell as the definition. For example,

    ``` {.commonlisp org-language="emacs-lisp"}
    (define-key some-map "f" '("foo" . command-foo))
    (define-key some-map "b" '("bar-prefix" . (keymap)))
    (setq my-map (make-sparse-keymap))
    (define-key some-map "b" (cons "bar-prefix" my-map))
    ```

    binds `command-foo`{.verbatim} to `f`{.verbatim} in `some-map`{.verbatim}, but also stores the string "foo" which which-key will extract to use to describe this command. The second example binds an empty keymap to `b`{.verbatim} in `some-map`{.verbatim} and uses "bar-prefix" to describe it. The last two lines replicate the functionality of the second line, while assigning the new keymap to the symbol `my-map`{.verbatim} (note the use of `cons`{.verbatim} to ensure that `my-map`{.verbatim} is evaluated for `define-key`{.verbatim}). These bindings are accepted by `define-key`{.verbatim} natively (i.e., with or without which-key being loaded). Since many key-binding utilities use `define-key`{.verbatim} internally, this functionality should be available with your favorite method of defining keys as well.

    The second method is to use `which-key-add-keymap-based-replacements`{.verbatim}. The statement

    ``` {.commonlisp org-language="emacs-lisp"}
    (define-key some-map "f" 'long-command-name-foo)
    (define-key some-map "b" some-prefix-map)
    (which-key-add-keymap-based-replacements some-map
      "f" '("foo" . long-command-name-foo)
      "b" '("bar-prefix" . (keymap)))
    ```

    uses `define-key`{.verbatim} to add two bindings and tells which-key to use the string "foo" in place of "command-foo" and the string "bar-prefix" for an empty prefix map. `which-key-add-keymap-based-replacements`{.verbatim} just uses `define-key`{.verbatim} to bind (or rebind) the command.

    There are other methods of telling which-key to replace command names, which are described next. The keymap-based replacements should be the most performant since they use built-in functionality of emacs. However, the alternatives can be more flexible in telling which-key how and when to replace text. They can be used simultaneously, but which-key will give precedence to the keymap-based replacement when it exists.

2.  Key-Based replacement

    Using this method, the description of a key is replaced using a string that you provide. Here's an example

    ``` {.commonlisp org-language="emacs-lisp"}
    (which-key-add-key-based-replacements
      "C-x C-f" "find files")
    ```

    where the first string is the key combination whose description you want to replace, in a form suitable for `kbd`{.verbatim}. For that key combination, which-key overwrites the description with the second string, "find files". In the second type of entry you can restrict the replacements to a major-mode. For example,

    ``` {.commonlisp org-language="emacs-lisp"}
    (which-key-add-major-mode-key-based-replacements 'org-mode
      "C-c C-c" "Org C-c C-c"
      "C-c C-a" "Org Attach")
    ```

    Here the first entry is the major-mode followed by a list of the first type of entries. In case the same key combination is listed under a major-mode and by itself, the major-mode version takes precedence.

3.  Key and Description replacement

    The second and third methods target the text used for the keys and the descriptions directly. The relevant variable is `which-key-replacement-alist`{.verbatim}. Here's an example of one of the default key replacements

    ``` {.commonlisp org-language="emacs-lisp"}
    (push '(("<\\([[:alnum:]-]+\\)>" . nil) . ("\\1" . nil))
          which-key-replacement-alist)
    ```

    Each element of the outer cons cell is a cons cell of the form `(KEY
         . BINDING)`{.verbatim}. The `car`{.verbatim} of the outer cons determines how to match key bindings while the `cdr`{.verbatim} determines how those matches are replaced. See the docstring of `which-key-replacement-alist`{.verbatim} for more information.

    The next example shows how to replace the description.

    ``` {.commonlisp org-language="emacs-lisp"}
    (push '((nil . "left") . (nil . "lft")) which-key-replacement-alist)
    ```

    Here is an example of using key replacement to include Unicode characters in the results. Unfortunately, using Unicode characters may upset the alignment of the which-key buffer, because Unicode characters can have different widths even in a monospace font and alignment is based on character width.

    ``` {.commonlisp org-language="emacs-lisp"}
    (add-to-list 'which-key-replacement-alist '(("TAB" . nil) . ("↹" . nil)))
    (add-to-list 'which-key-replacement-alist '(("RET" . nil) . ("⏎" . nil)))
    (add-to-list 'which-key-replacement-alist '(("DEL" . nil) . ("⇤" . nil)))
    (add-to-list 'which-key-replacement-alist '(("SPC" . nil) . ("␣" . nil)))
    ```

    The `cdr`{.verbatim} may also be a function that receives a `cons`{.verbatim} of the form `(KEY
         . BINDING)`{.verbatim} and produces a `cons`{.verbatim} of the same form. This allows for interesting ideas like this one suggested by [@pdcawley](https://github.com/pdcawley) in [PR \#147](https://github.com/justbur/emacs-which-key/pull/147).

    ``` {.commonlisp org-language="emacs-lisp"}
    (push (cons '(nil . "paredit-mode")
                (lambda (kb)
                  (cons (car kb)
                        (if paredit-mode
                            "[x] paredit-mode"
                          "[ ] paredit-mode"))))
          which-key-replacement-alist)
    ```

    The box will be checked if `paredit-mode`{.verbatim} is currently active.

### Sorting Options

By default the output is sorted by the key in a custom order. The default order is to sort lexicographically within each "class" of key, where the classes and their order are

`Special (SPC, TAB, ...) < Single Character (ASCII) (a, ...) < Modifier (C-, M-, ...) < Other`{.verbatim}

You can control the order by setting this variable. This also shows the other available options.

``` {.commonlisp org-language="emacs-lisp"}
;; default
(setq which-key-sort-order 'which-key-key-order)
;; same as default, except single characters are sorted alphabetically
;; (setq which-key-sort-order 'which-key-key-order-alpha)
;; same as default, except all prefix keys are grouped together at the end
;; (setq which-key-sort-order 'which-key-prefix-then-key-order)
;; same as default, except all keys from local maps shown first
;; (setq which-key-sort-order 'which-key-local-then-key-order)
;; sort based on the key description ignoring case
;; (setq which-key-sort-order 'which-key-description-order)
```

### Paging Options

There are at least several prefixes that have many keys bound to them, like `C-x`{.verbatim}. which-key displays as many keys as it can given your settings, but for these prefixes this may not be enough. The paging feature gives you the ability to bind a key to the function `which-key-C-h-dispatch`{.verbatim} which will allow you to cycle through the pages without changing the key sequence you were in the middle of typing. There are two slightly different ways of doing this.

1.  Method 1 (default): Using C-h (or `help-char`{.verbatim})

    This is the easiest way, and is turned on by default. Use

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-use-C-h-commands nil)
    ```

    to disable the behavior (this will only take effect after toggling which-key-mode if it is already enabled). `C-h`{.verbatim} can be used with any prefix to switch pages when there are multiple pages of keys. This changes the default behavior of Emacs which is to show a list of key bindings that apply to a prefix. For example, if you were to type `C-x C-h`{.verbatim} you would get a list of commands that follow `C-x`{.verbatim}. This uses which-key instead to show those keys, and unlike the Emacs default saves the incomplete prefix that you just entered so that the next keystroke can complete the command.

    The commands are:

    - Cycle through the pages forward with `n`{.verbatim} (or `C-n`{.verbatim})
    - Cycle backwards with `p`{.verbatim} (or `C-p`{.verbatim})
    - Undo the last entered key (!) with `u`{.verbatim} (or `C-u`{.verbatim})
    - Call the default command bound to `C-h`{.verbatim}, usually `describe-prefix-bindings`{.verbatim}, with `h`{.verbatim} (or `C-h`{.verbatim})

    This is especially useful for those who like `helm-descbinds`{.verbatim} but also want to use `C-h`{.verbatim} as their which-key paging key.

    Note `C-h`{.verbatim} is by default equivalent to `?`{.verbatim} in this context.

    Note also that using `C-h`{.verbatim} will not work with the `C-h`{.verbatim} prefix, unless you make further adjustments. See Issues [\#93](https://github.com/justbur/emacs-which-key/issues/93) and [\#175](https://github.com/justbur/emacs-which-key/issues/175) for example.

2.  Method 2: Bind your own keys

    Essentially, all you need to do for a prefix like `C-x`{.verbatim} is the following which will bind `<f5>`{.verbatim} to the relevant command.

    ``` {.commonlisp org-language="emacs-lisp"}
    (define-key which-key-mode-map (kbd "C-x <f5>") 'which-key-C-h-dispatch)
    ```

    This is completely equivalent to

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq which-key-paging-prefixes '("C-x"))
    (setq which-key-paging-key "<f5>")
    ```

    where the latter are provided for convenience if you have a lot of prefixes.

### Face Customization Options

The faces that which-key uses are

| Face                                              | Applied To                    | Default Definition                                                     |
|---------------------------------------------------|-------------------------------|------------------------------------------------------------------------|
| `which-key-key-face`{.verbatim}                   | Every key sequence            | `:inherit font-lock-constant-face`{.verbatim}                          |
| `which-key-separator-face`{.verbatim}             | The separator (→)             | `:inherit font-lock-comment-face`{.verbatim}                           |
| `which-key-note-face`{.verbatim}                  | Hints and notes               | `:inherit which-key-separator-face`{.verbatim}                         |
| `which-key-special-key-face`{.verbatim}           | User-defined special keys     | `:inherit which-key-key-face :inverse-video t :weight bold`{.verbatim} |
| `which-key-group-description-face`{.verbatim}     | Command groups (i.e, keymaps) | `:inherit font-lock-keyword-face`{.verbatim}                           |
| `which-key-command-description-face`{.verbatim}   | Commands not in local-map     | `:inherit font-lock-function-name-face`{.verbatim}                     |
| `which-key-local-map-description-face`{.verbatim} | Commands in local-map         | `:inherit which-key-command-description-face`{.verbatim}               |

The last two deserve some explanation. A command lives in one of many possible keymaps. You can distinguish between local maps, which depend on the buffer you are in, which modes are active, etc., and the global map which applies everywhere. It might be useful for you to distinguish between the two. One way to do this is to remove the default face from `which-key-command-description-face`{.verbatim} like this

``` {.commonlisp org-language="emacs-lisp"}
(set-face-attribute 'which-key-command-description-face nil :inherit nil)
```

another is to make the local map keys appear in bold

``` {.commonlisp org-language="emacs-lisp"}
(set-face-attribute 'which-key-local-map-description-face nil :weight 'bold)
```

You can also use `M-x customize-face`{.verbatim} to customize any of the above faces to your liking.

### Other Options

The options below are also available through customize. Their defaults are shown.

``` {.commonlisp org-language="emacs-lisp"}
;; Set the time delay (in seconds) for the which-key popup to appear. A value of
;; zero might cause issues so a non-zero value is recommended.
(setq which-key-idle-delay 1.0)

;; Set the maximum length (in characters) for key descriptions (commands or
;; prefixes). Descriptions that are longer are truncated and have ".." added.
;; This can also be a float (fraction of available width) or a function.
(setq which-key-max-description-length 27)

;; Use additional padding between columns of keys. This variable specifies the
;; number of spaces to add to the left of each column.
(setq which-key-add-column-padding 0)

;; The maximum number of columns to display in the which-key buffer. nil means
;; don't impose a maximum.
(setq which-key-max-display-columns nil)

;; Set the separator used between keys and descriptions. Change this setting to
;; an ASCII character if your font does not show the default arrow. The second
;; setting here allows for extra padding for Unicode characters. which-key uses
;; characters as a means of width measurement, so wide Unicode characters can
;; throw off the calculation.
(setq which-key-separator " → " )
(setq which-key-unicode-correction 3)

;; Set the prefix string that will be inserted in front of prefix commands
;; (i.e., commands that represent a sub-map).
(setq which-key-prefix-prefix "+" )

;; Set the special keys. These are automatically truncated to one character and
;; have which-key-special-key-face applied. Disabled by default. An example
;; setting is
;; (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))
(setq which-key-special-keys nil)

;; Show the key prefix on the left, top, or bottom (nil means hide the prefix).
;; The prefix consists of the keys you have typed so far. which-key also shows
;; the page information along with the prefix.
(setq which-key-show-prefix 'left)

;; Set to t to show the count of keys shown vs. total keys in the mode line.
(setq which-key-show-remaining-keys nil)
```

## Support for Third-Party Libraries

Some support is provided for third-party libraries which don't use standard methods of looking up commands. Some of these need to be enabled explicitly. This code includes some hacks, so please report any problems.

### Key-chord

Enabled by default.

### Evil operators

Evil motions and text objects following an operator like `d`{.verbatim} are not all looked up in a standard way. Support is controlled through `which-key-allow-evil-operators`{.verbatim} which should be non-nil if evil is loaded before which-key and through `which-key-show-operator-state-maps`{.verbatim} which needs to be enabled explicitly because it is more of a hack. The former allows for the inner and outer text object maps to show, while the latter shows motions as well.

### God-mode

Call `(which-key-enable-god-mode-support)`{.verbatim} after loading god-mode to enable support for god-mode key sequences. This is new and experimental, so please report any issues.

## More Examples

### Nice Display with Split Frame

Unlike guide-key, which-key looks good even if the frame is split into several windows.

<figure>
<img src="./img/which-key-right-split.png" />
<figcaption>which-key in a frame with 3 horizontal splits</figcaption>
</figure>

<figure>
<img src="./img/which-key-bottom-split.png" />
<figcaption>which-key in a frame with 2 vertical splits</figcaption>
</figure>

## Known Issues

- A few users have reported crashes related to which-key popups when quitting a key sequence with `C-g`{.verbatim}. A possible fix is discussed in [this issue](https://github.com/justbur/emacs-which-key/issues/130).

## Thanks

Special thanks to

- [@bmag](https://github.com/bmag) for helping with the initial development and finding many bugs.
- [@iqbalansari](https://github/iqbalansari) who among other things adapted the code to make `which-key-show-top-level`{.verbatim} possible.
