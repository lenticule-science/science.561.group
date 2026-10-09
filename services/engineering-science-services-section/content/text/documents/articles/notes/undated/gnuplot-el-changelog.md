---
title: Changelog for `gnuplot.el`{.verbatim}
description: inline{.verbatim}, dedicated{.verbatim}.
---

# Version 0.11 (2025-06-13) {#version-0.11-2025-06-13}

- Keymap and menu setup simplification.

# Version 0.10 (2025-06-04) {#version-0.10-2025-06-04}

- Add `interactive`{.verbatim} mode specifications to commands, such that only relevant commands are shown in `M-X`{.verbatim}.
- Require Emacs 28.
- Code cleanup and updates.
- Removed deprecated functions.

# Version 0.9 (2025-05-30) {#version-0.9-2025-05-30}

- Enable `gnuplot-inline-image-mode` by default.
- Enable Eldoc messages by default and provide `gnuplot-eldoc.el`.
- Made many functions and variables private to ease refactoring in the future.
- Remove `gnuplot-prompt-face` since Comint highlights the prompt by default.
- Remove `gnuplot-tab-completion` option. Set `tab-always-indent` to `complete` instead.
- Remove `gnuplot-eldoc-mode` option. Toggle `eldoc-mode` locally instead.
- Unbind `C-c C-c`. Use the default binding `M-;` instead.
- Unbind `M-RET` for tab completion. Use the default `M-TAB` instead.
- Fix compatibility with Emacs 30 and newer.

# Version 0.8.1 (2023-02-18) {#version-0.8.1-2023-02-18}

- Fixed the `completion-at-point`{.verbatim} function
- Improve lazy loading of the gnuplot-gui library
- Remove legacy code
- Lexical scoping and linting

# Version 0.8.0 (2021-01-03) {#version-0.8.0-2021-01-03}

- Changed project license to GPLv3.
- Greatly simplify the compilation process.
- Fix deprecated calls to the `cl`{.verbatim} library.
- Deprecated XEmacs support. Bump minimal GNU Emacs version to 24.3.
- Add a `gnuplot-program-args`{.verbatim} variable for passing additional arguments to the gnuplot program binary.
- The `gnuplot-inline-image-mode`{.verbatim} can now take three values: `nil`{.verbatim},

`inline`{.verbatim}, `dedicated`{.verbatim}.

- Add the `gnuplot-use-context-sensitive-completion`{.verbatim} configuration option.
- Removed the `gnuplot-bug-report`{.verbatim} function.
- The provided `gnuplot.info`{.verbatim} manual file has been updated for gnuplot version 5.2.6.
- Add the `gnuplot-program-args`{.verbatim} customization option to pass additional arguments to the gnuplot process.
- Use `syntax-proprietize-rules`{.verbatim} in gnuplot buffers.
- `gnuplot-context-sensitive-mode`{.verbatim} is now a normal minor mode.
- Enable `completion-at-point`{.verbatim} in gnuplot `comint`{.verbatim} buffers.
- Remove the unused `dotemacs.el`{.verbatim} file.
- `comint-process-echoes`{.verbatim} is now buffer-local.

# Version 0.7.0 (2021-10-20) {#version-0.7.0-2021-10-20}

- Contextual completion & help, inline plots, some other stuff.

# Version 0.6.0 (2011-12-13) {#version-0.6.0-2011-12-13}

- Changed numbering scheme to accommodate gnuplot packaging requirements.
- Moved to github, updated contact info.

# Version 0.5.0 (2002-09-16) {#version-0.5.0-2002-09-16}

- Wrote initial draft of gnuplot-gui.el, included it in insertions menu and in `gnuplot-insert`{.verbatim}. Negate option function, bound to `C-c
   C-n`{.verbatim}.
- `C-c C-h`{.verbatim} with no response goes to Commands menu. Transparent toolbar icons. Replace kw-compl with a simple completion function. Put gnuplot-toolbar code in gnuplot.el.
- Send file uses the load command. add `gnuplot-plot-from-comint`{.verbatim} and `gnuplot-save-and-plot-from-comint`{.verbatim} and keybindings in the comint buffer. do `(process-kill-without-query gnuplot-process nil)`{.verbatim}. `gnuplot-negate-option`{.verbatim} checks if set option has a negated form.
- `gnuplot-kill-gnuplot-buffer`{.verbatim} made more robust. fixed a bug in `gnuplot-plot-from-comint`{.verbatim}. fixed description of gnuplot-faces group.
- Update copyright information, update gpelcard
- Change installation materials. Add some support for hidden3d. Use constants in types alists in gui. Various other minor improvements to the types alists.
- Removed `gnuplot-which-highlight`{.verbatim} variable and revamped how colorization gets turned on. This is a bit tricky since I want it to work with font-lock under emacs and xemacs and with hilit19.
- Insert space at end of unique completion. add a few GUI types, rewrite some stuff in the GUI interface. primitive support for plot, splot, and fit. Fixed completion in file widget.
- Add `pgnuplot.c`{.verbatim} and Win9x install instructions to the distribution. Fixed a defface bug. Added `gnuplot-keywords-when`{.verbatim} allowing deferral of parsing the info file.
- Fixed font-locking of strings and comments. Figure out `gnuplot-version`{.verbatim} number from startup message and set `gnuplot-echo-command-line-flag`{.verbatim} accordingly. Added `gnuplot-program-version`{.verbatim} variable. Check that font-lock is actually a feature.
- Added `gnuplot-determine-gnuplot-version`{.verbatim} so that the gnuplot version number and `comint-process-echos`{.verbatim} actually get set correctly. Actually, the first time something is plotted, the echoing might not work, but the second time it will.
- Once again changed how `comint-process-echos`{.verbatim} gets set. Maybe I got it right this time? Also fixed certain situations where the info file did notget properly loaded (insertion with info toggle on and info button in GUI).
- Do a more robust check for the gnuplot process before killing the gnuplot buffer.
- Make `gnuplot-send-line-and-forward`{.verbatim} skip over blank and comment lines.
- Bound `C-c C-j`{.verbatim} to `gnuplot-forward-script-line`{.verbatim}.
- Support for pm3d in gnuplot-gui and in plot options insertions menu. mentioned pm3d in gpelcard. gui support for x11 pm3d and vgagl terms. `gnuplot-negate-option`{.verbatim} works with new syntax.
- Add colorization and gui support for new commands in 3.8. gui support for emf term. gui support for new "set style" syntax. much better scheme for determining gnuplot version number + make better use of it.
- Corrected a serious problem interacting with speedbar
- Fixed problem with toolbar creation and speedbar clicking
- Added font-lock bindings for words associated with plotting
- Bind `C-c C-c`{.verbatim} to `comment-region`{.verbatim} and `C-c C-o`{.verbatim} to the GUI, also make `C-c C-l`{.verbatim} respect continuation lines. Added feature to trim length of gnuplot process buffer.
- Yet again changed how `comint-process-echos`{.verbatim} gets set. It really needs to be nil on NTEmacs 21.1 or comint gets stuck in an infinate loop.
- Fixed a problem with `C-c C-v`{.verbatim} jumping forward 2 lines at a time

# Version 0.4.0 (1998-12-14) {#version-0.4.0-1998-12-14}

- Use info-look for info interface. No change to gnuplot-mode user interface, but cleaner code. With info-look, the help funcion works regardless of the version number of gnuplot. Also, `gnuplot-keywords`{.verbatim} (used for help, keyword-completion, and hilit19 highlighting) is now generated automatically.
- `info-look`{.verbatim} leaves a couple of really useless buffers lying around so I cleaned them up. Also fixed font-lock rules so that things in quotes get highlighted correctly and the surrounding text is unhighlighted. Fixed up font-lock rules for plot and splot. Added `gnuplot-send-line-and-forward`{.verbatim}.
- Added toolbar for xemacs – see file `gnuplot-toolbar.el`{.verbatim}. Fixed error message in plot line function when line is empty. Option added to display the comint buffer showing the gnuplot process in a separate frame
- Fixed highlighting in comint buffer. fixed frame behavior. added "\[:\]" to range insertions. added :link to defgroup.
- Fixed some mismatched defcustoms. added a few lines to suppress some compile-time warnings.
- Fixed behavior of filename insertion function. Added more :links to defgroup.
- Added function `gnuplot-setup-info-look`{.verbatim} and variable `gnuplot-info-hook`{.verbatim} to handle various versions of the gnuplot info file.
- Split up gnuplot-insertions-menu for ease of custimization, put menubar initialization in a function.
- defcustom the insertions submenus, add `gnuplot-insertion-menu-flag`{.verbatim}, intelligent Makefile knows which info-look to compile

# Version 0.3.0 (1998-09-15) {#version-0.3.0-1998-09-15}

- Include insertions menu.
- Fixed bug finding info file if missing, fixed bug starting font-lock, fixed bug re overwriting files in installation script.
- Added `(require info)`{.verbatim} to `eval-and-compile`{.verbatim} clause, Added `(kill-all-local-variables)`{.verbatim} to `gnuplot-mode`{.verbatim}, altered order of: `(provide gnuplot)`{.verbatim} `(run-hooks gnuplot-load-hook)`{.verbatim} at the end of the file in case something in the load hook requires gnuplot (oh not that old one again…), added `gnuplot-comint-setup-hook`{.verbatim}, corrected `gnuplot-mark-active`{.verbatim} which caused an error to be raised by (mark) when the mark was inactive. Some changes to font-lock rules.

# Version 0.2.0 (1998-09-11) {#version-0.2.0-1998-09-11}

- Added filename insertion, indentation, and colorization/completion in comint buffer.
- Made `indent-line-function`{.verbatim} buffer-local (whoops!) and fixed some stuff in the installation script

# Version 0.1.0 (1998-06-25) {#version-0.1.0-1998-06-25}

- Finished with initial release.
