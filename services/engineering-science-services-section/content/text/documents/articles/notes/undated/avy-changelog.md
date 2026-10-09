---
title: 0.3.0 {#section-1}
description: When at a tab, visualize it using tab-width{.verbatim} spaces.
---
# 0.3.0 {#section-1}

## Fixes

### Candidate window reversal

See [\#27](https://github.com/abo-abo/avy/issues/27).

### Jumping to newlines with `at-full`{.verbatim} style

See [\#5](https://github.com/abo-abo/avy/issues/5).

### Stop `at-full`{.verbatim} style from shifting text sometimes

See [\#5](https://github.com/abo-abo/avy/issues/5).

### Fix `at-full`{.verbatim} interaction with tabs

When at a tab, visualize it using `tab-width`{.verbatim} spaces.

See [\#43](https://github.com/abo-abo/avy/issues/43).

### Fix overlay issue when the same buffer is in two windows

See [\#47](https://github.com/abo-abo/avy/issues/47) and <http://debbugs.gnu.org/cgi/bugreport.cgi?bug=20607>.

### Quote punctuation chars

See [\#63](https://github.com/abo-abo/avy/issues/63).

### Update screenshot for `avy-goto-char`{.verbatim} in README.md {#update-screenshot-for-avy-goto-char-in-readme.md}

Use `C-:` as the new suggested binding instead of the pi char.

See [\#64](https://github.com/abo-abo/avy/issues/64).

## New Features

### `avy-goto-line`{.verbatim} can now break into `goto-line`{.verbatim}

Just enter a digit and you'll be transferred into `goto-line`{.verbatim} prompt with that digit already entered. This means that you can just bind `M-g g` to `avy-goto-line`{.verbatim} without losing anything.

See [\#29](https://github.com/abo-abo/avy/issues/29).

### `avy-goto-line`{.verbatim} now works with all kinds of overlay styles

Any of the following do something different now:

``` elisp
(setq avy-styles-alist
      '((avy-goto-line . post)))
(setq avy-styles-alist
      '((avy-goto-line . at)))
(setq avy-styles-alist
      '((avy-goto-line . at-full)))
(setq avy-styles-alist
      '((avy-goto-line . pre)))
```

See [\#17](https://github.com/abo-abo/ace-link/issues/17).

### New defcustom `avy-case-fold-search`{.verbatim}

Non-nil when searches should ignore case, so e.g. `avy-goto-char`{.verbatim} "b" will match both "b" and "B". On by default. Use this to turn off this behavior:

``` elisp
(setq avy-case-fold-search nil)
```

See [\#34](https://github.com/abo-abo/avy/issues/34).

### New command `avy-goto-word-or-subword-1`{.verbatim}

Enter one char, and select a visible word or subword that starts with it, depending on `subword-mode`{.verbatim}. Move the point there.

See [\#33](https://github.com/abo-abo/avy/issues/33).

### `avy-move-line`{.verbatim} should remove empty line after original one is moved

See [\#40](https://github.com/abo-abo/avy/issues/40).

### `avy-move-line`{.verbatim} now takes a prefix arg

Use e.g. `M-3` before `avy-move-line`{.verbatim} to move 3 lines at once.

### Most commands can be used non-interactively

Example:

``` elisp
(defun avy-goto-lp ()
  (interactive)
  (avy-goto-char ?\())
```

This command only goes to the "(" character. This is actually very similar to [`lispy-ace-paren`{.verbatim}](http://oremacs.com/lispy/#lispy-ace-paren), except the implementation is only one line.

See [\#44](https://github.com/abo-abo/avy/issues/44).

### (almost) all defcustoms are explained on the wiki

See [the defcustom wiki page](https://github.com/abo-abo/avy/wiki/defcustom).

### Allow all operations to work across frames

You have to customize `avy-all-windows`{.verbatim} for this. By default, it's set to work on all windows on the current frame.

To make it work only on the current window, use:

``` elisp
(setq avy-all-windows nil)
```

To make it work on all frames, use:

``` elisp
(setq avy-all-windows 'all-frames)
```

### New command `avy-goto-char-in-line`{.verbatim}

This is `avy-goto-char`{.verbatim} reduced only to the current line. Few candidates means very short decision chars path.

See [\#49](https://github.com/abo-abo/avy/issues/49).

### New overlay style `de-bruijn`{.verbatim}

How to use it:

``` elisp
(setq avy-style 'de-bruijn)
```

What it does: when your leading chars are clumped up together, it's impossible to overlay the decision path without shifting the buffer text a bit. For example, with the word "buffer", you `avy-goto-char`{.verbatim} "b", and:

- the path for the first "f" is "aj"
- the path for the second "f" is "ak"

It's not possible to overlay 4 characters over "ff" in "buffer". But to with `de-bruijn`{.verbatim} style, which results in the path being "aj" and "jk". It's possible to overlay "ajk" just fine.

Pros and cons of `de-bruijn`{.verbatim} over other styles:

- a pro is that it's possible to display the full decision path for clumped up chars, which is truncated for other styles
- a con is that the decision path is of the same length (e.g. 2 or 3) for all candidates, while with other styles it's possible to have a few candidates with a shorter path.

See [\#51](https://github.com/abo-abo/avy/issues/51) and [\#5](https://github.com/abo-abo/avy/issues/5).

### New defcustom `avy-ignored-modes`{.verbatim}

This is meant for visual modes like `doc-view-mode`{.verbatim} or `image-mode`{.verbatim} that can have a huge number of chars in a single window. Which results in a huge number of candidates even in other windows.

Current setting:

``` elisp
(setq avy-ignored-modes '(image-mode doc-view-mode pdf-view-mode))
```

See [\#57](https://github.com/abo-abo/avy/issues/57).

### New tutorial on writing custom commands

See the [the custom-commands wiki page](https://github.com/abo-abo/avy/wiki/custom-commands) and [\#55](https://github.com/abo-abo/avy/issues/55).

### New face setup

New variable `avy-lead-faces`{.verbatim} will determine the faces used to color the current decision depth you're in. For example, if to select a particular candidate you need to press "abc":

- "a" will be highlighted with a face that corresponds to depth 3
- "b" will be highlighted with a face that corresponds to depth 2
- "c" will be highlighted with a face that corresponds to depth 1

But if another candidate needs "ef":

- "e" will be highlighted with a face that corresponds to depth 2
- "f" will be highlighted with a face that corresponds to depth 1

See [\#53](https://github.com/abo-abo/avy/issues/53).

### New variable `avy-translate-char-function`{.verbatim}

You can use this, for example, to interpret one character as another in `avy-keys`{.verbatim}.

Example:

``` elisp
(setq avy-translate-char-function
          (lambda (c) (if (= c 32) ?a c)))
```

This will translate `SPC` (32) into `a`. So you can press either `a` or `SPC` to mean "a".

### `avy-isearch`{.verbatim} works for different styles

See [\#61](https://github.com/abo-abo/avy/issues/61).

### Switch the default style from `pre`{.verbatim} to `at-full`{.verbatim}

I've come to like `at-full`{.verbatim} more than `pre`{.verbatim} over time. The difference is that `pre`{.verbatim} hides no chars in your buffer, while `at-full`{.verbatim} doesn't shift text.

Use this to restore the previous default behavior:

``` elisp
(setq avy-style 'pre)
```

# 0.4.0 {#section-2}

## Fixes

### `avy-goto-char-timer`{.verbatim} obeys `avy-styles-alist`{.verbatim}

See [\#67](https://github.com/abo-abo/avy/issues/67).

### Add `de-bruijn`{.verbatim} to the defcustom of `avy-styles-alist`{.verbatim}

See [\#73](https://github.com/abo-abo/avy/issues/73).

### Respect the current input method for target chars

See [\#76](https://github.com/abo-abo/avy/issues/76).

### `avy-goto-subword-0`{.verbatim} shouldn't offer invisible chars

See [\#90](https://github.com/abo-abo/avy/issues/90).

### Better `case-fold-search`{.verbatim} handling

See [\#87](https://github.com/abo-abo/avy/issues/87).

### Add misc punctuation to subword commands

See [\#93](https://github.com/abo-abo/avy/issues/93).

### Add padding for wide-width chars (ex. Japanese and Chinese) {#add-padding-for-wide-width-chars-ex.-japanese-and-chinese}

See [\#96](https://github.com/abo-abo/avy/issues/96).

### `avy-goto-line`{.verbatim}

1.  Push mark for numeric line

    See [\#74](https://github.com/abo-abo/avy/issues/74).

2.  Allow numeric prefix arg

    The old behavior remains for ARG 1 or 4. For all other ARG, simply go to that line. See [\#86](https://github.com/abo-abo/avy/issues/86).

3.  Work for `visual-line-mode`{.verbatim}

    See [\#91](https://github.com/abo-abo/avy/issues/91).

4.  Don't error on end of buffer

    See [\#91](https://github.com/abo-abo/avy/issues/91).

5.  Obey `avy-background`{.verbatim}

    See [\#94](https://github.com/abo-abo/avy/issues/94).

6.  Fix for narrowed regions

    See [\#122](https://github.com/abo-abo/avy/issues/122), [\#123](https://github.com/abo-abo/avy/issues/123).

7.  Don't modify `avy-action`{.verbatim}

    See [\#124](https://github.com/abo-abo/avy/issues/124).

### `avy-goto-char-timer`{.verbatim}

1.  May read as many chars as you want

    See [\#97](https://github.com/abo-abo/avy/issues/97).

2.  Highlight matches while reading chars

    See [\#98](https://github.com/abo-abo/avy/issues/98).

3.  Highlight depending on `avy-all-windows`{.verbatim}

    See [\#104](https://github.com/abo-abo/avy/issues/104).

4.  Make faster for `org-mode`{.verbatim}

    See [\#100](https://github.com/abo-abo/avy/issues/100).

5.  Add case fold search

    See [\#128](https://github.com/abo-abo/avy/issues/128).

### `avy-copy-region`{.verbatim}

1.  Keep the same selectors for the second pass

    See [\#120](https://github.com/abo-abo/avy/issues/120), [\#121](https://github.com/abo-abo/avy/issues/121).

2.  Copy/move to initial window

    See [\#131](https://github.com/abo-abo/avy/issues/131).

### Search only in the visible region

See [\#108](https://github.com/abo-abo/avy/issues/108), [\#109](https://github.com/abo-abo/avy/issues/109).

### Fix jumping to the last char of a folded Org outline

See [\#108](https://github.com/abo-abo/avy/issues/108).

### Fix for both `org-indent-mode`{.verbatim} and `visual-line-mode`{.verbatim}

See [\#110](https://github.com/abo-abo/avy/issues/110).

### Beep when there are no matches

See [\#111](https://github.com/abo-abo/avy/issues/111).

### Simplify overlay code

Most functions reuse `avy--overlay`{.verbatim} now.

### Fix de-bruijn "no catch for tag"

See [\#116](https://github.com/abo-abo/avy/issues/116).

### Fix overlays at `point-max`{.verbatim}

See [\#125](https://github.com/abo-abo/avy/issues/125).

### Improve `case-fold-search`{.verbatim} condition

See [\#126](https://github.com/abo-abo/avy/issues/126).

### Don't shorten selector string for `visual-line-mode`{.verbatim} and `bolp`{.verbatim}

See [\#129](https://github.com/abo-abo/avy/issues/129).

### Fix interaction with `goto-address-mode`{.verbatim}

## New Features

### Allow non-printing keys in `avy-keys`{.verbatim}

Now you can set avy-keys also to the arrow keys and page up/down, e.g.

``` elisp
(setq avy-keys '(left right up down prior next))
```

and those will be displayed as ▲, ▼, ◀, ▶, △, ▽ in the overlays. The display is controlled by the variable `avy-key-to-char-alist`{.verbatim}.

See [\#77](https://github.com/abo-abo/avy/issues/77).

### Allow to switch action midway from goto to kill/mark/copy

For example, suppose you have:

``` elisp
(global-set-key (kbd "M-t") 'avy-goto-word-1)
```

- To jump to a certain word starting with "w" (e.g. first one on screen): `M-t w a`
- To copy the word instead of jumping to it: `M-t w na`.
- To mark the word after jumping to it: `M-t w ma`.
- To kill the word after jumping to it: `M-t w xa`.

You can customize `avy-dispatch-alist`{.verbatim} to modify these actions.

See [\#78](https://github.com/abo-abo/avy/issues/78).

### New command `avy-pop-mark`{.verbatim}

Goes back to the last location of `push-mark`{.verbatim}:

- has its own history,
- handles multiple frames.

See [\#81](https://github.com/abo-abo/avy/issues/81) [\#88](https://github.com/abo-abo/avy/issues/88) [\#69](https://github.com/abo-abo/avy/issues/69).

### New commands `avy-goto-line-above`{.verbatim} and `avy-goto-line-below`{.verbatim}

See [\#106](https://github.com/abo-abo/avy/issues/106).

### New defcustom `avy-line-insert-style`{.verbatim}

Allows to modify the behavior of `avy-copy-line`{.verbatim}, `avy-move-line`{.verbatim}, and `avy-copy-region`{.verbatim}. See [\#117](https://github.com/abo-abo/avy/issues/117).

### New defcustom `avy-all-windows-alt`{.verbatim}

Allows to customize the behavior of `universal-argument`{.verbatim} modifying `avy-all-windows`{.verbatim}. See [\#118](https://github.com/abo-abo/avy/issues/118).

### New defcustom `avy-subword-extra-word-chars`{.verbatim}

Allows to customize the behavior of `avy-goto-subword-0`{.verbatim} and `avy-goto-subword-1`{.verbatim} by adding extra chars that should match as word constituents. See [\#116](https://github.com/abo-abo/avy/issues/116).

# 0.5.0 {#section-3}

## Fixes

### el:avy-action-copy

Save selected window and frame. See [\#133](https://github.com/abo-abo/avy/issues/133).

Copy line for el:avy-goto-line. See [\#191](https://github.com/abo-abo/avy/issues/191).

### el:avy-read

Make `C-g` and `ESC` fail silently when reading char. See [\#137](https://github.com/abo-abo/avy/issues/137).

Display error message on mouse clicks. See [\#226](https://github.com/abo-abo/avy/issues/226).

Update el:avy-current-path before returning. See [\#226](https://github.com/abo-abo/avy/issues/226).

Quit on `ESC`. See [\#249](https://github.com/abo-abo/avy/issues/249).

Fix for el:org-toggle-link-display. See [\#261](https://github.com/abo-abo/avy/issues/261).

Fix for el:buffer-invisibility-spec being t. See [\#264](https://github.com/abo-abo/avy/issues/264).

Allow "invisible" 'org-link. See [\#269](https://github.com/abo-abo/avy/issues/269).

### el:avy-goto-word-1

Works for "<sup>A</sup>"-"<sup>Z</sup>", see [\#167](https://github.com/abo-abo/avy/issues/167).

### el:avy-goto-subword-0

Add char at window start if empty, See [\#145](https://github.com/abo-abo/avy/issues/145).

Add option to limit scope. See [\#235](https://github.com/abo-abo/avy/issues/235).

### el:avy-goto-subword-1

Check el:char-after. See [\#163](https://github.com/abo-abo/avy/issues/163).

### el:avy-isearch

Escape regex. See [\#147](https://github.com/abo-abo/avy/issues/147).

### el:avy-goto-char-2

Translate `RET` to `C-j`. See [\#153](https://github.com/abo-abo/avy/issues/153).

### el:avy-action-goto

Add el:raise-frame.

### el:avy-goto-char-timer

Allow `C-h` to delete. See [\#193](https://github.com/abo-abo/avy/issues/193).

Obey el:avy-background for the initial search. See [\#259](https://github.com/abo-abo/avy/issues/259).

### el:avy-goto-line

Fix for empty buffer. See [\#238](https://github.com/abo-abo/avy/issues/238).

Add ability to display candidates from bottom to top. See [\#236](https://github.com/abo-abo/avy/issues/236).

### el:avy–overlay-at-full

More consistent face order. See [\#270](https://github.com/abo-abo/avy/issues/270).

### documentation

See [\#223](https://github.com/abo-abo/avy/issues/223), [\#226](https://github.com/abo-abo/avy/issues/226), [\#218](https://github.com/abo-abo/avy/issues/218), [\#245](https://github.com/abo-abo/avy/issues/245), [\#262](https://github.com/abo-abo/avy/issues/262).

## New Features

### API

New functions have been added as drop-in replacements of double-dash (private) avy functions that were used in other packages and configs. Please replace the references to the obsolete functions.

1.  el:avy-jump

    New API function to replace el:avy–generic-jump. See [\#265](https://github.com/abo-abo/avy/issues/265), [\#267](https://github.com/abo-abo/avy/issues/267).

2.  el:avy-process

    New API function to replace el:avy–process. See [\#266](https://github.com/abo-abo/avy/issues/266).

### New actions

1.  el:avy-action-kill-stay

    Kill a word with el:avy-goto-char without moving there. Bound to `X`.

2.  el:avy-action-ispell

    Auto-correct word at point. See [\#142](https://github.com/abo-abo/avy/issues/142), [\#160](https://github.com/abo-abo/avy/issues/160), [\#161](https://github.com/abo-abo/avy/issues/161). Bound to `i`.

3.  el:avy-action-yank

    Yank sexp starting at selected point at the current point. See [\#183](https://github.com/abo-abo/avy/issues/183). Bound to `y`.

4.  el:avy-action-teleport

    Kill sexp starting on selected point and yank into the current location. See [\#207](https://github.com/abo-abo/avy/issues/207). Bound to `t`.

5.  el:avy-action-zap-to-char

    Kill from point up to selected point. See [\#234](https://github.com/abo-abo/avy/issues/234). Bound to `z`.

### New defcustoms

1.  New el:avy-style setting: 'words

    Use this setting:

    ``` elisp
    (setq avy-style 'words)
    ```

    And you'll see overlays like "by", "if", "is", "it", "my" for 2-letter sequences, and "can", "car", "cog" for 3-letter sequences. You might find them easier to type than "hla", "lls" and "jhl". But you will have to adjust your el:avy-dispatch-alist, e.g. to use only upper case characters.

    See [\#210](https://github.com/abo-abo/avy/issues/210), [\#219](https://github.com/abo-abo/avy/issues/219).

2.  el:avy-orders-alist

    Use it to customize the order of candidates with relation to point. The default is for el:avy-goto-char to have the shortest overlay for candidates closest to point. See [\#242](https://github.com/abo-abo/avy/issues/242).

3.  el:avy-indent-line-overlay

    When non-nil el:avy-goto-line will display the line overlay next to the first non-whitespace character of each line. See [\#244](https://github.com/abo-abo/avy/issues/244).

4.  el:avy-single-candidate-jump

    When non-nil, and there is only one candidate, jump there. See [\#250](https://github.com/abo-abo/avy/issues/250).

5.  el:avy-del-last-char-by

    Customize keys which delete the last read char. The defaults are `C-h` and `DEL`. See [\#251](https://github.com/abo-abo/avy/issues/251).

6.  el:avy-goto-word-0-regexp

    Customize el:avy-goto-word-0. See [\#136](https://github.com/abo-abo/avy/issues/136), [\#156](https://github.com/abo-abo/avy/issues/156).

7.  el:avy-pre-action

    Function to all before el:avy-action. See [\#260](https://github.com/abo-abo/avy/issues/260).

8.  el:avy-enter-times-out

    When non-nil (the default), `RET` exists el:avy-goto-char-timer early. When nil, it matches a newline. See [\#220](https://github.com/abo-abo/avy/issues/220), [\#225](https://github.com/abo-abo/avy/issues/225).

### New commands

1.  el:avy-move-region

    Select two lines and move the text between them above the current line. See [\#75](https://github.com/abo-abo/avy/issues/75), [\#187](https://github.com/abo-abo/avy/issues/187), [\#188](https://github.com/abo-abo/avy/issues/188).

2.  el:avy-goto-end-of-line

    Call el:avy-goto-line and move to the end of the line. See [\#240](https://github.com/abo-abo/avy/issues/240).

3.  el:avy-linum-mode

    Minor mode that uses avy hints for el:linum-mode.

4.  el:avy-resume

    Holds last command avy command after user input. This is a quick way to bring back the same markers after a jump. See [\#157](https://github.com/abo-abo/avy/issues/157), [\#165](https://github.com/abo-abo/avy/issues/165).

5.  el:avy-next

    Go to the next candidate after el:avy-read. Example config:

    ``` elisp
    (defhydra hydra-avy-cycle ()
      ("j" avy-next "next")
      ("k" avy-prev "prev")
      ("q" nil "quit"))

    (global-set-key (kbd "C-M-'") 'hydra-avy-cycle/body)
    ```

    After e.g. el:avy-goto-char or el:avy-goto-char-timer, use the above hydra to cycle between the last candidates. See [\#254](https://github.com/abo-abo/avy/issues/254).

6.  \*-above and \*-below variants

    Command versions restricted to matches before or after the point.

    See [\#148](https://github.com/abo-abo/avy/issues/148):

    - el:avy-goto-char-2-above
    - el:avy-goto-char-2-below

    See [\#151](https://github.com/abo-abo/avy/issues/151):

    - el:avy-goto-word-1-above
    - el:avy-goto-word-1-below

    See [\#156](https://github.com/abo-abo/avy/issues/156):

    - el:avy-goto-symbol-1-above
    - el:avy-goto-symbol-1-below

    See [\#186](https://github.com/abo-abo/avy/issues/186):

    - el:avy-goto-word-0-below
    - el:avy-goto-word-0-above

7.  kill and save region functionality

    New avy-enabled commands:

    - el:avy-kill-whole-line
    - el:avy-kill-region
    - el:avy-kill-ring-save-whole-line
    - el:avy-kill-ring-save-region

    See [\#158](https://github.com/abo-abo/avy/issues/158).

8.  org-mode functionality

    New avy-enabled commands:

    - el:avy-org-refile-as-child
    - el:avy-org-goto-heading-timer

    See [\#214](https://github.com/abo-abo/avy/issues/214), [\#258](https://github.com/abo-abo/avy/issues/258).

### el:avy-goto-char-timer

Show the number of matches so far in the prompt. See [\#253](https://github.com/abo-abo/avy/issues/253).

### el:avy-read

Ignore mistyping when no candidates are available. See [\#256](https://github.com/abo-abo/avy/issues/256).

When the overlays are shown, press `?` to get dispatch help.
