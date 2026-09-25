---
title: Gnuplot for Emacs
description: This package allows running Gnuplot files from within the GNU Emacs editor.
---

<a href="https://www.gnu.org/software/emacs/"><img alt="GNU Emacs" src="https://github.com/minad/corfu/blob/screenshots/emacs.svg?raw=true"/></a>
<a href="https://elpa.nongnu.org/nongnu/gnuplot.html"><img alt="NonGNU ELPA" src="https://elpa.nongnu.org/nongnu/gnuplot.svg"/></a>
<a href="https://elpa.nongnu.org/nongnu-devel/gnuplot.html"><img alt="NonGNU-devel ELPA" src="https://elpa.nongnu.org/nongnu-devel/gnuplot.svg"/></a>
<a href="https://melpa.org/#/gnuplot"><img alt="MELPA" src="https://melpa.org/packages/gnuplot-badge.svg"/></a>
<a href="https://stable.melpa.org/#/gnuplot"><img alt="MELPA Stable" src="https://stable.melpa.org/packages/gnuplot-badge.svg"/></a>

This package allows running [Gnuplot](http://www.gnuplot.info/) files from within the [GNU Emacs](https://www.gnu.org/software/emacs/) editor. It features:

- Syntax highlighting and indentation for Gnuplot scripts.
- Pull-down menus for common Gnuplot-related tasks.
- Interactive Gnuplot sessions using `comint`{.verbatim}.
- Context-sensitive completion.
- Inline display of Gnuplot plots.

It is recommended to use GNU Emacs 28 or above, and Gnuplot version 5.0 or above.

# Installation

The easiest way to install `gnuplot`{.verbatim} is to directly get it from [NonGNU ELPA](https://elpa.nongnu.org/) or [MELPA](https://melpa.org). After configuring Emacs to use MELPA, you should be able to install `gnuplot`{.verbatim} by typing

``` example
M-x install-package RET gnuplot RET
```

or do `M-x list-packages`{.verbatim} and search for `gnuplot`{.verbatim} in the list. Note that there is a different [gnuplot-mode](https://github.com/mkmcc/gnuplot-mode) package on MELPA which is less featureful.

# Configuration

In order to customize Gnuplot, use `M-x gnuplot-customize`{.verbatim} or set the respective customizable variables in your user configuration.

It is recommended to configure `read-extended-command-predicate`{.verbatim} in your Emacs configuration, such that `M-x`{.verbatim} only completes commands relevant for the current mode. For example `gnuplot-*`{.verbatim} commands are only shown in Gnuplot buffers. Alternatively press the key `M-X`{.verbatim} instead of `M-x`{.verbatim} if you want relevant commands only.

``` {.commonlisp org-language="emacs-lisp"}
(setq read-extended-command-predicate #'command-completion-default-include-p)
```

# Usage

`gnuplot-mode`{.verbatim} is enabled automatically for `*.gp`{.verbatim} files. These functions are useful as entry points:

- `M-x run-gnuplot`{.verbatim} - start `gnuplot-comint-mode`{.verbatim} REPL.
- `M-x gnuplot-mode`{.verbatim} - switch to `gnuplot-mode`{.verbatim} in the current buffer
- `M-x gnuplot-make-buffer`{.verbatim} - open a new buffer, which is not visiting a file, and start `gnuplot-mode`{.verbatim} in that buffer.

## Bindings

When `gnuplot-mode`{.verbatim} is on, the following keybindings are available:

|                          |                                                      |
|--------------------------|------------------------------------------------------|
| `C-c C-l`{.verbatim}     | send current line to gnuplot                         |
| `C-c C-v`{.verbatim}     | send current line to gnuplot and move forward 1 line |
| `C-c C-r`{.verbatim}     | send current region to gnuplot                       |
| `C-c C-b`{.verbatim}     | send entire buffer to gnuplot                        |
| `C-c C-f`{.verbatim}     | send a file to gnuplot                               |
| `C-c C-i`{.verbatim}     | insert filename at point                             |
| `C-c C-n`{.verbatim}     | negate set option on current line                    |
| `C-c C-c`{.verbatim}     | comment region                                       |
| `C-c C-o`{.verbatim}     | set arguments for command at point                   |
| `S-<mouse-2>`{.verbatim} | set arguments for command under mouse cursor         |
| `C-c C-d`{.verbatim}     | read the gnuplot info manual                         |
| `C-c C-e`{.verbatim}     | show gnuplot buffer                                  |
| `C-c C-k`{.verbatim}     | kill gnuplot process                                 |
| `C-c C-z`{.verbatim}     | customize gnuplot-mode                               |
| `M-TAB`{.verbatim}       | complete keyword before point                        |
| `TAB`{.verbatim}         | indent current line                                  |

With the exception of the commands for sending commands to Gnuplot, most of the above commands also work in the Gnuplot comint buffer, in addition to the following:

|                      |                                                   |
|----------------------|---------------------------------------------------|
| `M-C-p`{.verbatim}   | plot the most recent script buffer line-by-line   |
| `M-C-f`{.verbatim}   | save the current script buffer and load that file |
| `C-c C-e`{.verbatim} | pop back to most recent script buffer             |

## Context-sensitive keyword completion

By default `gnuplot-mode`{.verbatim} will try to parse your commands as you type and suggest only relevant completion candidates on typing `M-TAB`{.verbatim} or `TAB`{.verbatim}. For example, with point after the `with`{.verbatim} of a `plot`{.verbatim} command, tab completion will suggest only plotting styles. This also enables more specific help topic lookup in the Gnuplot info manual.

If the context-sensitivity annoys you, you can get simple non-context-sensitive completion back by toggling `gnuplot-context-sensitive-mode`{.verbatim}.

By its nature, the completion code has to know a fair bit about the structure of the gnuplot language. If you use it with an outdated version of gnuplot it will make mistakes. Most of gnuplot 4.6's command language is parsed correctly except for the `set terminal`{.verbatim} commands.

## Eldoc mode

`gnuplot-mode` shows syntax hints in the modeline when `eldoc-mode` is turned on and context sensitivity is enabled. Both are enabled by default.

## Inline Images

Plots are displayed inline in the Gnuplot Comint process buffer. This is handy for trying things out without having to switch between Emacs and the Gnuplot display. It requires Gnuplot and Emacs to have `png`{.verbatim} support. Call `gnuplot-external-display-mode`{.verbatim} in a gnuplot-mode buffer to disable the feature.

# Common issues

## Usage on Windows

Multiple users have reported issues when trying to work with `gnuplot.el`{.verbatim} on Windows. Most notably, the Gnuplot process hangs after sending a first line of input (this is a common Emacs issue on Windows, see [here](https://www.gnu.org/software/emacs/manual/html_mono/efaq-w32.html#Sub_002dprocesses)). More information on `gnuplot.el`{.verbatim} and Windows can be found on these threads [1](https://github.com/emacs-gnuplot/gnuplot/issues/15) and [2](https://github.com/emacs-gnuplot/gnuplot/pull/33). You currently have two solutions:

1.  Experiment using the `gnuplot-program`{.verbatim} and `gnuplot-program-args`{.verbatim} variables. For instance the following setting has been reported to work (see [here](https://github.com/emacs-gnuplot/gnuplot/pull/33/files)).

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq gnuplot-program "/path/to/cmdproxy.exe"
          gnuplot-program-args "/C /path/to/gnuplot.exe")
    ```

2.  Try the simpler [gnuplot-mode](https://github.com/mkmcc/gnuplot-mode) package that sends the entire buffer to Gnuplot. Since no `comint`{.verbatim} is involved, it should function correctly, but you lose most features of this package.

## Pause Command

Gnuplot's `pause -1`{.verbatim} command, which waits for the user to press a key, is problematic when running under Emacs. Sending `pause -1`{.verbatim} to the running Gnuplot process will make Emacs appear to freeze. (It isn't really crashed: typing `C-g`{.verbatim} will unlock it and let you continue). The workaround for now is to make Gnuplot output a string before pausing, by doing `pause -1 "Hit return"`{.verbatim} or similar.

## Issue with Unicode Character Display

Some users have reported [issues when trying to display unicode characters](https://github.com/emacs-gnuplot/gnuplot/issues/39). This issue is likely due to your distribution bundling Gnuplot with [editline instead of readline](https://unix.stackexchange.com/questions/496206/unicode-in-gnuplot-terminal/496245#496245). Recompiling the source with support for Unicode fixes the issue until this issue is fixed upstream.

# Maintenance of generated files

The files `gnuplot.texi` and `gnuplot-eldoc.el` are generated from the Gnuplot source, which can be obtained from <https://packages.debian.org/unstable/gnuplot>. Run `make` inside the `admin` directory to download the source and regenerate the files.
