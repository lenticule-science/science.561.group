---
author: Daniel Mendler
lang: en
title: consult.el - Consulting completing-read
description: Consult provides search and navigation commands based on the Emacs completion function completing-read documented in the Elisp manual.
---

<a href="https://www.gnu.org/software/emacs/"><img alt="GNU Emacs" src="https://github.com/minad/corfu/blob/screenshots/emacs.svg?raw=true"/></a>
<a href="https://elpa.gnu.org/packages/consult.html"><img alt="GNU ELPA" src="https://elpa.gnu.org/packages/consult.svg"/></a>
<a href="https://elpa.gnu.org/devel/consult.html"><img alt="GNU-devel ELPA" src="https://elpa.gnu.org/devel/consult.svg"/></a>
<a href="https://melpa.org/#/consult"><img alt="MELPA" src="https://melpa.org/packages/consult-badge.svg"/></a>
<a href="https://stable.melpa.org/#/consult"><img alt="MELPA Stable" src="https://stable.melpa.org/packages/consult-badge.svg"/></a>

Consult provides search and navigation commands based on the Emacs completion function [completing-read](https://www.gnu.org/software/emacs/manual/html_node/elisp/Minibuffer-Completion.html) documented in the [Elisp manual](info:elisp#Minibuffer Completion). Completion allows you to quickly select an item from a list of candidates. Consult offers asynchronous and interactive `consult-grep`{.verbatim} and `consult-ripgrep`{.verbatim} commands, and the line-based search command `consult-line`{.verbatim}. Furthermore Consult provides an advanced buffer switching command `consult-buffer`{.verbatim} to switch between buffers, recently opened files, bookmarks and buffer-like candidates from other sources. Some of the Consult commands are enhanced versions of built-in Emacs commands. For example the command `consult-imenu`{.verbatim} presents a flat list of the Imenu with [live preview](#live-previews), [grouping and narrowing](#narrowing-and-grouping). Please take a look at the [full list of commands](#available-commands).

Consult is fully compatible with completion systems centered around the standard Emacs `completing-read`{.verbatim} API, [Vertico](https://github.com/minad/vertico), [Mct](https://github.com/protesilaos/mct), and the built-in default completion system and Icomplete.

This package keeps the completion system specifics to a minimum. The ability of the Consult commands to work well with arbitrary completion systems is one of the main advantages of the package. Consult fits well into existing setups and it helps you to create a full completion environment out of small and independent components.

You can combine the complementary packages [Marginalia](https://github.com/minad/marginalia/), [Embark](https://github.com/oantolin/embark/) and [Orderless](https://github.com/oantolin/orderless) with Consult. Marginalia enriches the completion display with annotations, e.g., documentation strings or file information. The versatile Embark package provides local actions, comparable to a context menu. These actions operate on the selected candidate in the minibuffer or at point in normal buffers. For example, when selecting from a list of files, Embark offers an action to delete the file. Additionally Embark offers a facility to collect completion candidates in a collect buffer. The section [Embark integration](#embark-integration) documents in detail how Consult and Embark work together.

# Available commands {#available-commands description="Navigation, search, editing commands and more"}

Most Consult commands follow the meaningful naming scheme `consult-<thing>`{.verbatim}. Many commands implement a little known but convenient Emacs feature called "future history", which guesses what input the user wants. At a command prompt type `M-n`{.verbatim} and typically Consult will insert the symbol or thing at point into the input.

**TIP:** If you have [Marginalia](https://github.com/minad/marginalia) annotators activated, type `M-x ^consult`{.verbatim} to see all Consult commands with their abbreviated description. Alternatively, type `C-h a ^consult`{.verbatim} to get an overview of all Consult variables and functions with their descriptions.

## Virtual Buffers {#virtual-buffers description="Buffers, bookmarks and recent files"}

- `consult-buffer`{.verbatim}: Enhanced version of `switch-to-buffer`{.verbatim} with support for virtual buffers. Supports live preview of buffers and narrowing to the virtual buffer types. You can type `f SPC`{.verbatim} in order to narrow to recent files. Press `SPC`{.verbatim} to show ephemeral buffers. Supported narrowing keys:
  - b Buffers
  - SPC Hidden buffers
  - 
  - o Buffers from other frames/tabs
  - f Files (Requires `recentf-mode`{.verbatim})
  - r File and buffer registers
  - m Bookmarks
  - p Project
  - B Project buffers
  - F Project files
  - R Project roots
  - Custom [other sources](#multiple-sources) configured in `consult-buffer-sources`{.verbatim}.

  By default, buffers from all frames are taken into account. The buffers which are taken into account, can be customized by the variable `consult-buffer-list-function`{.verbatim}. Other buffers are available by pressing `o SPC`{.verbatim}.
- `consult-buffer-other-window`{.verbatim}, `consult-buffer-other-frame`{.verbatim}, `consult-buffer-other-tab`{.verbatim}: Variants of `consult-buffer`{.verbatim}.
- `consult-project-buffer`{.verbatim}: Variant of `consult-buffer`{.verbatim} restricted to buffers and recent files of the current project. You can add custom sources to `consult-project-buffer-sources`{.verbatim}. The command may prompt you for a project if you invoke it from outside a project.
- `consult-bookmark`{.verbatim}: Select or create bookmark. To select bookmarks you might use the `consult-buffer`{.verbatim} as an alternative, which can include a bookmark virtual buffer source. Note that `consult-bookmark`{.verbatim} supports preview of bookmarks and narrowing.
- `consult-recent-file`{.verbatim}: Select from recent files with preview. You might prefer the powerful `consult-buffer`{.verbatim} instead, which can include recent files as a virtual buffer source. The `recentf-mode`{.verbatim} enables tracking of recent files.

## Editing {#editing description="Commands useful for editing"}

- `consult-yank-from-kill-ring`{.verbatim}: Enhanced version of `yank`{.verbatim} to select an item from the `kill-ring`{.verbatim}. The selected text previewed as overlay in the buffer.
- `consult-yank-pop`{.verbatim}: Enhanced version of `yank-pop`{.verbatim} with DWIM-behavior, which either replaces the last `yank`{.verbatim} by cycling through the `kill-ring`{.verbatim}, or if there has not been a last `yank`{.verbatim} consults the `kill-ring`{.verbatim}. The selected text previewed as overlay in the buffer.
- `consult-yank-replace`{.verbatim}: Like `consult-yank-pop`{.verbatim}, but always replaces the last `yank`{.verbatim} with an item from the `kill-ring`{.verbatim}.
- `consult-kmacro`{.verbatim}: Select macro from the macro ring and execute it.

## Register {#register description="Searching through registers and fast access"}

- `consult-register`{.verbatim}: Select from list of registers. The command supports narrowing to register types and preview of marker positions. This command is useful to search the register contents. For quick access use the commands `consult-register-load`{.verbatim}, `consult-register-store`{.verbatim} or the built-in Emacs register commands.
- `consult-register-format`{.verbatim}: Set `register-preview-function`{.verbatim} to this function for an enhanced register formatting. Used automatically by `consult-register-window`{.verbatim}.
- `consult-register-window`{.verbatim}: Replace `register-preview`{.verbatim} with this function for a better register window. See the [example configuration](#use-package-example).
- `consult-register-load`{.verbatim}: Utility command to quickly load a register. The command either jumps to the register value or inserts it.
- `consult-register-store`{.verbatim}: Improved UI to store registers depending on the current context with an action menu. With an active region, store/append/prepend the contents, optionally deleting the region when a prefix argument is given. With a numeric prefix argument, store/add the number. Otherwise store point, file, buffer, frameset, window or kmacro. Usage examples:
  - `M-' x`{.verbatim}: If no region is active, store point in register `x`{.verbatim}. If a region is active, store the region in register `x`{.verbatim}.
  - `M-' M-w x`{.verbatim}: Store window configuration in register `x`{.verbatim}.
  - `C-u 100 M-' x`{.verbatim}: Store number in register `x`{.verbatim}.

## Navigation {#navigation description="Mark rings, outlines and imenu"}

- `consult-goto-line`{.verbatim}: Jump to line number enhanced with live preview. This is a drop-in replacement for `goto-line`{.verbatim}. Enter a line number to jump to the first column of the given line. Alternatively enter `line:column`{.verbatim} in order to jump to a specific column.
- `consult-mark`{.verbatim}: Jump to a marker in the `mark-ring`{.verbatim}. Supports live preview and recursive editing.
- `consult-global-mark`{.verbatim}: Jump to a marker in the `global-mark-ring`{.verbatim}. Supports live preview and recursive editing.
- `consult-outline`{.verbatim}: Jump to a heading of the outline. Supports narrowing to a heading level, live preview and recursive editing.
- `consult-imenu`{.verbatim}: Jump to imenu item in the current buffer. Supports live preview, recursive editing and narrowing.
- `consult-imenu-multi`{.verbatim}: Jump to imenu item in project buffers, with the same major mode as the current buffer. Supports live preview, recursive editing and narrowing. This feature has been inspired by [imenu-anywhere](https://github.com/vspinu/imenu-anywhere).

## Search {#search description="Line search, grep and file search"}

- `consult-line`{.verbatim}: Enter search string and select from matching lines. Supports live preview and recursive editing. The symbol at point and the recent Isearch string are added to the "future history" and can be accessed by pressing `M-n`{.verbatim}. When `consult-line`{.verbatim} is bound to the `isearch-mode-map`{.verbatim} and is invoked during a running Isearch, it will use the current Isearch string.
- `consult-line-multi`{.verbatim}: Search dynamically across multiple buffers. By default search across project buffers. If invoked with a prefix argument search across all buffers. The candidates are computed on demand based on the input. The command behaves like `consult-grep`{.verbatim}, but operates on buffers instead of files.
- `consult-keep-lines`{.verbatim}: Replacement for `keep/flush-lines`{.verbatim} which uses the current completion style for filtering the buffer. The function updates the buffer while typing. In particular `consult-keep-lines`{.verbatim} can narrow down an exported Embark collect buffer further, relying on the same completion filtering as `completing-read`. If the input begins with the negation operator, i.e., `! SPC`, the filter matches the complement. If a region is active, the region restricts the filtering.
- `consult-focus-lines`{.verbatim}: Temporarily hide lines by filtering them using the current completion style. Call with `C-u`{.verbatim} prefix argument in order to show the hidden lines again. If the input begins with the negation operator, i.e., `!
   SPC`, the filter matches the complement. In contrast to `consult-keep-lines`{.verbatim} this function does not edit the buffer. If a region is active, the region restricts the filtering.

## Grep and Find {#grep-and-find description="Searching through the filesystem"}

- `consult-grep-match`{.verbatim}: Jump to a Grep match in related Grep buffers. Supports live preview narrowing and recursive editing.
- `consult-grep`{.verbatim}, `consult-ripgrep`{.verbatim}, `consult-git-grep`{.verbatim}: Search for regular expression in files. Consult invokes Grep asynchronously, while you enter the search term. After at least `consult-async-min-input`{.verbatim} characters, the search gets started. Consult splits the input string into two parts, if the first character is a punctuation character, like `#`{.verbatim}. For example `#regexps#filter-string`{.verbatim}, is split at the second `#`{.verbatim}. The string `regexps`{.verbatim} is passed to Grep. Note that Consult transforms Emacs regular expressions to expressions understand by the search program. Always use Emacs regular expressions at the prompt. If you enter multiple regular expressions separated by space only lines matching all regular expressions are shown. In order to match space literally, escape the space with a backslash. The `filter-string`{.verbatim} is passed to the *fast* Emacs filtering to further narrow down the list of matches. This is particularly useful if you are using an advanced completion style like orderless. `consult-grep`{.verbatim} supports preview. `consult-grep`{.verbatim} searches the current [project directory](#project-support) if a project is found. Otherwise the `default-directory`{.verbatim} is searched. If `consult-grep`{.verbatim} is invoked with prefix argument `C-u M-s g`{.verbatim}, you can specify one or more comma-separated files and directories manually. If invoked with two prefix arguments `C-u C-u M-s g`{.verbatim}, you can first select a project if you are not yet inside a project.
- `consult-find`{.verbatim}, `consult-fd`{.verbatim}, `consult-locate`{.verbatim}: Find file by matching the path against a regexp. Like for `consult-grep`{.verbatim}, either the project root or the current directory is the root directory for the search. The input string is treated similarly to `consult-grep`{.verbatim}, where the first part is passed to find, and the second part is used for Emacs filtering. Prefix arguments to `consult-find`{.verbatim} work just like those for the consult grep commands.

## Compilation {#compilation description="Jumping to references and compilation errors"}

- `consult-compile-error`{.verbatim}: Jump to a compilation error in related compilation buffers. Supports live preview narrowing and recursive editing.
- `consult-flymake`{.verbatim}: Jump to Flymake diagnostic. Supports live preview and recursive editing. The command supports narrowing. Press `e SPC`{.verbatim}, `w SPC`{.verbatim}, `n SPC`{.verbatim} to only show errors, warnings and notes respectively.
- `consult-xref`{.verbatim}: Integration with xref. This function can be set as `xref-show-xrefs-function`{.verbatim} and `xref-show-definitions-function`{.verbatim}.

## Histories {#histories description="Navigating histories"}

- `consult-complex-command`{.verbatim}: Select a command from the `command-history`{.verbatim}. This command is a `completing-read`{.verbatim} version of `repeat-complex-command`{.verbatim} and is also a replacement for the `command-history`{.verbatim} command from chistory.el.
- `consult-history`{.verbatim}: Insert a string from the current buffer history, for example the Eshell or Comint history. You can also invoke this command from the minibuffer. In that case `consult-history`{.verbatim} uses the history stored in the `minibuffer-history-variable`{.verbatim}. If you prefer `completion-at-point`{.verbatim}, take a look at `cape-history`{.verbatim} from the [Cape](https://github.com/minad/cape) package.
- `consult-isearch-history`{.verbatim}: During an Isearch session, this command picks a search string from history and continues the search with the newly selected string. Outside of Isearch, the command allows you to pick a string from the history and starts a new Isearch. `consult-isearch-history`{.verbatim} acts as a drop-in replacement for `isearch-edit-string`{.verbatim}.

## Modes {#modes description="Toggling minor modes and executing commands"}

- `consult-minor-mode-menu`{.verbatim}: Enable/disable minor mode. Supports narrowing to on/off/local/global modes by pressing `i/o/l/g SPC`{.verbatim} respectively.
- `consult-mode-command`{.verbatim}: Run a command from the currently active minor or major modes. Supports narrowing to local-minor/global-minor/major mode via the keys `l/g/m`{.verbatim}.

## Org Mode {#org-mode description="Org-specific commands"}

- `consult-org-heading`{.verbatim}: Variant of `consult-imenu`{.verbatim} or `consult-outline`{.verbatim} for Org buffers. The headline and its ancestors headlines are separated by slashes. Supports narrowing by heading level, priority and TODO keyword, as well as live preview and recursive editing.
- `consult-org-agenda`{.verbatim}: Jump to an Org agenda heading. Supports narrowing by heading level, priority and TODO keyword, as well as live preview and recursive editing.

## Help {#help description="Searching through help"}

- `consult-man`{.verbatim}: Find Unix man page, via Unix `apropos`{.verbatim} or `man -k`{.verbatim}. `consult-man`{.verbatim} opens the selected man page using the Emacs `man`{.verbatim} command. Supports live preview of the theme while scrolling through the candidates.
- `consult-info`{.verbatim}: Full text search through info pages. If the command is invoked from within an `*info*` buffer, it will search through the current manual. You may want to create your own `consult-info-*`{.verbatim} commands which search through a predefined set of info pages. You can use the function `consult-info-define`{.verbatim} to define commands `consult-info-emacs`{.verbatim}, `consult-info-completion`{.verbatim}, `consult-info-org`{.verbatim}, and so on:

``` {.commonlisp org-language="emacs-lisp"}
(consult-info-define "emacs" "efaq" "elisp" "cl" "compat" "eshell")
(consult-info-define 'completion
                     "vertico" "consult" "marginalia" "orderless"
                     "embark" "corfu" "cape" "tempel")
(consult-info-define "org")
(consult-info-define "gnus")
(consult-info-define "magit")
```

## Miscellaneous {#miscellaneous description="Various other useful commands"}

- `consult-theme`{.verbatim}: Select a theme and disable all currently enabled themes. Supports live preview of the theme while scrolling through the candidates.

- `consult-preview-at-point`{.verbatim} and `consult-preview-at-point-mode`{.verbatim}: Command and minor mode which previews the candidate at point in the `*Completions*`{.verbatim} buffer. This mode is relevant if you use [Mct](https://git.sr.ht/~protesilaos/mct) or the default `*Completions*`{.verbatim} UI.

- `consult-completion-in-region`{.verbatim}: In case you don't use [Corfu](https://github.com/minad/corfu) as your in-buffer completion UI, this function can be set as `completion-in-region-function`{.verbatim}. Then your minibuffer completion UI (e.g., Vertico or Icomplete) will be used for `completion-at-point`{.verbatim}.

  ``` {.commonlisp org-language="emacs-lisp"}
  (setq completion-in-region-function #'consult-completion-in-region)
  ```

  Instead of `consult-completion-in-region`{.verbatim}, you may prefer to see the completions directly in the buffer as a small popup. In that case, I recommend the [Corfu](https://github.com/minad/corfu) package. There is a technical limitation of `consult-completion-in-region`{.verbatim} in combination with the Lsp modes. The Lsp server relies on the input at point, in order to generate refined candidate strings. Since the completion is transferred from the original buffer to the minibuffer, the server does not receive the updated input. In contrast, in-buffer Lsp completion for example via Corfu works properly since the completion takes place directly in the original buffer.

# Special features {#special-features description="Enhancements over built-in `completing-read'"}

Consult enhances `completing-read`{.verbatim} with live previews of candidates, additional narrowing capabilities to candidate groups and asynchronously generated candidate lists. The internal `consult--read`{.verbatim} function, which is used by most Consult commands, is a thin wrapper around `completing-read`{.verbatim} and provides the special functionality. In order to support multiple candidate sources there exists the high-level function `consult--multi`{.verbatim}. The architecture of Consult allows it to work with different completion systems in the backend, while still offering advanced features.

## Live previews {#live-previews description="Preview the currently selected candidate"}

Some Consult commands support live previews. For example when you scroll through the items of `consult-line`{.verbatim}, the buffer will scroll to the corresponding position. It is possible to jump back and forth between the minibuffer and the buffer to perform recursive editing while the search is ongoing.

Consult enables previews by default. You can disable them by adjusting the `consult-preview-key`{.verbatim} variable. Furthermore it is possible to specify keybindings which trigger the preview manually as shown in the [example configuration](#use-package-example). The default setting of `consult-preview-key`{.verbatim} is `any`{.verbatim} which means that Consult triggers the preview *immediately* on any key press when the selected candidate changes. You can configure each command individually with its own `:preview-key`{.verbatim}. The following settings are possible:

- Automatic and immediate `'any`{.verbatim}
- Automatic and delayed `(list :debounce 0.5 'any)`{.verbatim}
- Manual and immediate `"M-."`{.verbatim}
- Manual and delayed `(list :debounce 0.5 "M-.")`{.verbatim}
- Disabled `nil`{.verbatim}

A safe recommendation is to leave automatic immediate previews enabled in general and disable the automatic preview only for commands where the preview may be expensive due to file loading. Internally, Consult uses the value of `this-command`{.verbatim} to determine the `:preview-key`{.verbatim} customized. This means that if you wrap a `consult-*`{.verbatim} command within your own function or command, you will also need to add the name of *your custom command* to the `consult-customize`{.verbatim} call in order for it to be considered.

``` {.commonlisp org-language="emacs-lisp"}
(consult-customize
 consult-ripgrep consult-git-grep consult-grep consult-man
 consult-bookmark consult-recent-file consult-xref
 consult--source-bookmark consult--source-file-register
 consult--source-recent-file consult--source-project-recent-file
 ;; my/command-wrapping-consult    ;; disable auto previews inside my command
 :preview-key '(:debounce 0.4 any) ;; Option 1: Delay preview
 ;; :preview-key "M-.")            ;; Option 2: Manual preview
```

In this case one may wonder what the difference is between using an Embark action on the current candidate in comparison to a manually triggered preview. The main difference is that the files opened by manual preview are closed again after the completion session. During preview some functionality is disabled to improve the performance, see for example the customization variables `consult-preview-variables`{.verbatim} and `consult-preview-allowed-hooks`{.verbatim}. Only hooks listed in `consult-preview-allowed-hooks`{.verbatim} are executed. This variable applies to `find-file-hook`{.verbatim}, `change-major-mode-hook`{.verbatim} and mode hooks, e.g., `prog-mode-hook`{.verbatim}. In order to enable additional font locking during preview, add the corresponding hooks to the allow list. The following code demonstrates this for [org-modern](https://github.com/minad/org-modern) and [hl-todo](https://github.com/tarsius/hl-todo).

``` {.commonlisp org-language="emacs-lisp"}
;; local modes added to prog-mode hooks
(add-to-list 'consult-preview-allowed-hooks 'hl-todo-mode)
(add-to-list 'consult-preview-allowed-hooks 'elide-head-mode)
;; enabled global modes
(add-to-list 'consult-preview-allowed-hooks 'global-org-modern-mode)
(add-to-list 'consult-preview-allowed-hooks 'global-hl-todo-mode)
```

Files larger than `consult-preview-partial-size`{.verbatim} are previewed partially. Delaying the preview is also useful for `consult-theme`{.verbatim}, since the theme preview is slow. The delay results in a smoother UI experience.

``` {.commonlisp org-language="emacs-lisp"}
;; Preview on any key press, but delay 0.5s
(consult-customize consult-theme :preview-key '(:debounce 0.5 any))
;; Preview immediately on M-., on up/down after 0.5s, on any other key after 1s
(consult-customize consult-theme
                   :preview-key
                   '("M-."
                     :debounce 0.5 "<up>" "<down>"
                     :debounce 1 any))
```

## Narrowing and grouping {#narrowing-and-grouping description="Restricting the completion to a candidate group"}

Consult has special support for candidate groups. If the completion UI supports the grouping functionality, the UI separates the groups with thin lines and shows group titles. Grouping is useful if the list of candidates consists of candidates of multiple types or candidates from [multiple sources](#multiple-sources), like the `consult-buffer`{.verbatim} command, which shows both buffers and recently opened files. Note that you can disable the group titles by setting the `:group`{.verbatim} property of the corresponding command to nil using the `consult-customize`{.verbatim} macro.

By entering a narrowing prefix or by pressing a narrowing key it is possible to restrict the completion candidates to a certain candidate group. When you use the `consult-buffer`{.verbatim} command, you can enter the prefix `b SPC`{.verbatim} to restrict list of candidates to buffers only. If you press `DEL`{.verbatim} afterwards, the full candidate list will be shown again. Furthermore a narrowing prefix key and a widening key can be configured which can be pressed to achieve the same effect, see the configuration variables `consult-narrow-key`{.verbatim} and `consult-widen-key`{.verbatim}.

After pressing `consult-narrow-key`{.verbatim}, the possible narrowing keys can be shown by pressing `C-h`{.verbatim}. When pressing `C-h`{.verbatim} after some prefix key, the `prefix-help-command`{.verbatim} is invoked, which shows the keybinding help window by default. As a more compact alternative, there is the `consult-narrow-help`{.verbatim} command which can be bound to a key, for example `?`{.verbatim} or `C-h`{.verbatim} in the `consult-narrow-map`{.verbatim}, as shown in the [example configuration](#use-package-example). If [which-key](https://github.com/justbur/emacs-which-key) is installed, the narrowing keys are automatically shown in the which-key window after pressing the `consult-narrow-key`{.verbatim}.

## Asynchronous search {#asynchronous-search description="Filtering asynchronously generated candidate lists"}

Consult has support for asynchronous generation of candidate lists. This feature is used for search commands like `consult-grep`{.verbatim}, where the list of matches is generated dynamically while the user is typing a regular expression. The grep process is executed in the background. When modifying the regular expression, the background process is terminated and a new process is started with the modified regular expression.

The matches, which have been found, can then be narrowed using the installed Emacs completion-style. This can be powerful if you are using for example the `orderless`{.verbatim} completion style.

This two-level filtering is possible by splitting the input string. Part of the input string is treated as input to grep and part of the input is used for filtering. There are multiple splitting styles available, configured in `consult-async-split-styles-alist`: `nil`{.verbatim}, `comma`{.verbatim}, `semicolon`{.verbatim} and `perl`{.verbatim}. The default splitting style is configured with the variable `consult-async-split-style`.

With the `comma`{.verbatim} and `semicolon`{.verbatim} splitting styles, the first word before the comma or semicolon is passed to grep, the remaining string is used for filtering. The `nil`{.verbatim} splitting style does not perform any splitting, the whole input is passed to grep.

The `perl`{.verbatim} splitting style splits the input string at a punctuation character, using a similar syntax as Perl regular expressions.

Examples:

- `#defun`{.verbatim}: Search for "defun" using grep.
- `#consult embark`{.verbatim}: Search for both "consult" and "embark" using grep in any order.
- `#first.*second`{.verbatim}: Search for "first" followed by "second" using grep.
- `#\(consult\|embark\)`{.verbatim}: Search for "consult" or "embark" using grep. Note the usage of Emacs-style regular expressions.
- `#defun#consult`{.verbatim}: Search for "defun" using grep, filter with the word "consult".
- `/defun/consult`{.verbatim}: It is also possible to use other punctuation characters.
- `#to#`{.verbatim}: Force searching for "to" using grep, since the grep pattern must be longer than `consult-async-min-input`{.verbatim} characters by default.
- `#defun -- --invert-match#`{.verbatim}: Pass argument `--invert-match`{.verbatim} to grep.

Asynchronous processes like `find`{.verbatim} and `grep`{.verbatim} create an error log buffer `_*consult-async*`{.verbatim} (note the leading space), which is useful for troubleshooting. The prompt has a small indicator showing the process status:

- `:`{.verbatim} the usual prompt colon, before input is provided.
- `*`{.verbatim} with warning face, the process is running.
- `:`{.verbatim} with success face, success, process exited with an error code of zero.
- `!`{.verbatim} with error face, failure, process exited with a nonzero error code.
- `;`{.verbatim} with error face, interrupted, for example if more input is provided.

## Multiple sources {#multiple-sources description="Combining candidates from different sources"}

Multiple static and asynchronous candidate sources can be combined. This feature is used by the `consult-buffer`{.verbatim} command to present buffer-like candidates in a single menu for quick access. By default `consult-buffer`{.verbatim} includes buffers, bookmarks, recent files and project-specific buffers and files. The `consult-buffer-sources`{.verbatim} variable configures the list of sources. Arbitrary custom sources can be added to this list.

As an example, the bookmark source is defined as follows:

``` {.commonlisp org-language="emacs-lisp"}
(defvar consult--source-bookmark
  `(:name     "Bookmark"
    :narrow   ?m
    :category bookmark
    :face     consult-bookmark
    :history  bookmark-history
    :items    ,#'bookmark-all-names
    :action   ,#'consult--bookmark-action))
```

Either the `:items`{.verbatim} or the `:async`{.verbatim} source field is required:

- `:items`{.verbatim} List of strings to select from or function returning list of strings. The strings can carry metadata in text properties, which is then available to the `:annotate`{.verbatim}, `:action`{.verbatim} and `:state`{.verbatim} functions. The list can also consist of pairs, with the string in the `car`{.verbatim} used for display and the `cdr`{.verbatim} the actual candidate.
- `:async`{.verbatim} Alternative to `:items`{.verbatim} for asynchronous sources. See the docstring for details.

Optional source fields:

- `:name`{.verbatim} Name of the source, used for narrowing, group titles and annotations.
- `:narrow`{.verbatim} Narrowing character, `(char . string)`{.verbatim} pair or list of pairs.
- `:category`{.verbatim} Completion category.
- `:preview-key`{.verbatim} Preview key or keys which trigger preview.
- `:enabled`{.verbatim} Function which must return t if the source is enabled.
- `:hidden`{.verbatim} When t candidates of this source are hidden by default.
- `:face`{.verbatim} Face used for highlighting the candidates.
- `:annotate`{.verbatim} Annotation function called for each candidate, returns string.
- `:history`{.verbatim} Name of history variable to add selected candidate.
- `:default`{.verbatim} Must be t if the first item of the source is the default value.
- `:action`{.verbatim} Function called with the selected candidate.
- `:new`{.verbatim} Function called with new candidate name, only if `:require-match`{.verbatim} is nil.
- `:state`{.verbatim} State constructor for the source, must return the state function.
- Other source fields can be added specifically to the use case.

The `:state`{.verbatim} and `:action`{.verbatim} fields of the sources deserve a longer explanation. The `:action`{.verbatim} function takes a single argument and is only called after selection with the selected candidate, if the selection has not been aborted. This functionality is provided for convenience and easy definition of sources. The `:state`{.verbatim} field is more general. The `:state`{.verbatim} function is a constructor function without arguments, which can perform some setup necessary for the preview. It must return a closure which takes an ACTION and a CANDIDATE argument. See the docstring of `consult--with-preview`{.verbatim} for more details about the ACTION argument.

By default, `consult-buffer`{.verbatim} previews buffers, bookmarks and files. Loading recent files or bookmarks can result in expensive operations. However it is possible to configure a manual preview as follows.

``` {.commonlisp org-language="emacs-lisp"}
(consult-customize
 consult--source-bookmark consult--source-file-register
 consult--source-recent-file consult--source-project-recent-file
 :preview-key "M-.")
```

Sources can be added directly to the `consult-buffer-source`{.verbatim} list for convenience. For example, the following source lists all Org buffers and lets you create new ones.

``` {.commonlisp org-language="emacs-lisp"}
(defvar org-source
  (list :name     "Org Buffer"
        :category 'buffer
        :narrow   ?o
        :face     'consult-buffer
        :history  'buffer-name-history
        :state    #'consult--buffer-state
        :new
        (lambda (name)
          (with-current-buffer (get-buffer-create name)
            (insert "#+title: " name "\n\n")
            (org-mode)
            (consult--buffer-action (current-buffer))))
        :items
        (lambda ()
          (consult--buffer-query :mode 'org-mode :as #'consult--buffer-pair))))

(add-to-list 'consult-buffer-sources 'org-source 'append)
```

One can create similar sources for other major modes. See the [Consult wiki](https://github.com/minad/consult/wiki) for many additional source examples. See also the documentation of `consult-buffer`{.verbatim} and of the internal `consult--multi`{.verbatim} API. The function `consult--multi`{.verbatim} can be used to create new multi-source commands.

## Embark integration {#embark-integration description="Actions, Grep/Occur-buffer export"}

**NOTE**: Install the `embark-consult`{.verbatim} package from MELPA, which provides Consult-specific Embark actions and the Occur buffer export.

Embark is a versatile package which offers context dependent actions, comparable to a context menu. See the [Embark manual](https://github.com/oantolin/embark) for an extensive description of its capabilities.

Actions are commands which can operate on the currently selected candidate (or target in Embark terminology). When completing files, for example the `delete-file`{.verbatim} command is offered. With Embark you can execute arbitrary commands on the currently selected candidate via `M-x`{.verbatim}.

Furthermore Embark provides the `embark-collect`{.verbatim} command, which collects candidates and presents them in an Embark collect buffer, where further actions can be applied to them. A related feature is the `embark-export`{.verbatim} command, which exports candidate lists to a buffer of a special type. For example in the case of file completion, a Dired buffer is opened.

In the context of Consult, particularly exciting is the possibility to export the matching lines from `consult-line`{.verbatim}, `consult-outline`{.verbatim}, `consult-mark`{.verbatim} and `consult-global-mark`{.verbatim}. The matching lines are exported to an Occur buffer where they can be edited via the `occur-edit-mode`{.verbatim} (press key `e`{.verbatim}). Similarly, Embark supports exporting the matches found by `consult-grep`{.verbatim}, `consult-ripgrep`{.verbatim} and `consult-git-grep`{.verbatim} to a Grep buffer, where the matches across files can be edited, via `grep-edit-mode`{.verbatim} on Emacs 31 (or via the [wgrep](https://github.com/mhayashi1120/Emacs-wgrep) package). These three workflows are symmetric.

- `consult-line`{.verbatim} -\> `embark-export`{.verbatim} to `occur-mode`{.verbatim} buffer -\> `occur-edit-mode`{.verbatim} for editing of matches.
- `consult-grep`{.verbatim} -\> `embark-export`{.verbatim} to `grep-mode`{.verbatim} buffer -\> `grep-edit-mode`{.verbatim} for editing of matches.
- `consult-find`{.verbatim} -\> `embark-export`{.verbatim} to `dired-mode`{.verbatim} buffer -\> `wdired-change-to-wdired-mode`{.verbatim} for editing.

# Configuration {#configuration description="Example configuration and customization variables"}

Consult can be installed from [ELPA](https://elpa.gnu.org/packages/consult.html) or [MELPA](https://melpa.org/#/consult) via the Emacs built-in package manager. Alternatively it can be directly installed from the development repository via other non-standard package managers.

There is the [Consult wiki](https://github.com/minad/consult/wiki), where additional configuration examples can be contributed.

**IMPORTANT:** It is recommended that you enable lexical binding in your configuration. Many Consult-related code snippets require lexical binding, since they use lambdas and closures.

## Use-package example {#use-package-example description="Configuration example based on use-package"}

The Consult package only provides commands and does not add any keybindings or modes. Therefore the package is non-intrusive but requires a little setup effort. While the configuration example is long, it consists essentially of key bindings only, such that the risk of interference with other Emacs functionality is minimized.

In order to use the Consult commands, it is recommended to add keybindings for commands which are accessed often. Rarely used commands can be invoked via `M-x`{.verbatim}. Feel free to only bind the commands you consider useful to your workflow. The configuration shown here relies on the `use-package`{.verbatim} macro, which is a convenient tool to manage package configurations.

**NOTE:** There is the [Consult wiki](https://github.com/minad/consult/wiki), where you can contribute additional configuration examples.

``` {.commonlisp org-language="emacs-lisp"}
;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g r" . consult-grep-match)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
)
```

## Custom variables {#custom-variables description="Short description of all customization settings"}

**TIP:** If you have [Marginalia](https://github.com/minad/marginalia) installed, type `M-x customize-variable RET
^consult`{.verbatim} to see all Consult-specific customizable variables with their current values and abbreviated description. Alternatively, type `C-h a ^consult`{.verbatim} to get an overview of all Consult variables and functions with their descriptions.

| Variable                         | Description                                                |
|----------------------------------|------------------------------------------------------------|
| consult-after-jump-hook          | Functions to call after jumping to a location              |
| consult-async-input-debounce     | Input debounce for asynchronous commands                   |
| consult-async-input-throttle     | Input throttle for asynchronous commands                   |
| consult-async-min-input          | Minimum numbers of input characters                        |
| consult-async-refresh-delay      | Refresh delay for asynchronous commands                    |
| consult-async-split-style        | Splitting style used for async commands                    |
| consult-async-split-styles-alist | Available splitting styles used for async commands         |
| consult-async-indicator          | Async indicator characters                                 |
| consult-bookmark-narrow          | Narrowing configuration for `consult-bookmark`{.verbatim}  |
| consult-buffer-filter            | Filter for `consult-buffer`{.verbatim}                     |
| consult-buffer-list-function     | Function to retrieve list of buffers                       |
| consult-buffer-sources           | List of virtual buffer sources                             |
| consult-fd-args                  | Command line arguments for fd                              |
| consult-find-args                | Command line arguments for find                            |
| consult-fontify-max-size         | Buffers larger than this limit are not fontified           |
| consult-fontify-preserve         | Preserve fontification for line-based commands.            |
| consult-git-grep-args            | Command line arguments for git-grep                        |
| consult-goto-line-numbers        | Show line numbers for `consult-goto-line`{.verbatim}       |
| consult-grep-max-columns         | Maximal number of columns of the matching lines            |
| consult-grep-args                | Command line arguments for grep                            |
| consult-imenu-config             | Mode-specific configuration for `consult-imenu`{.verbatim} |
| consult-line-numbers-widen       | Show absolute line numbers when narrowing is active        |
| consult-line-start-from-top      | Start the `consult-line`{.verbatim} search from the top    |
| consult-locate-args              | Command line arguments for locate                          |
| consult-man-args                 | Command line arguments for man                             |
| consult-mode-command-filter      | Filter for `consult-mode-command`{.verbatim}               |
| consult-mode-histories           | Mode-specific history variables                            |
| consult-narrow-key               | Narrowing prefix key during completion                     |
| consult-point-placement          | Placement of the point when jumping to matches             |
| consult-preview-key              | Keys which triggers preview                                |
| consult-preview-allowed-hooks    | List of hooks to allow during preview                      |
| consult-preview-excluded-buffers | Predicate to exclude buffers from preview                  |
| consult-preview-excluded-files   | Regexps matched against file names during preview          |
| consult-preview-max-count        | Maximum number of files to keep open during preview        |
| consult-preview-partial-size     | Files larger than this size are previewed partially        |
| consult-preview-partial-chunk    | Size of the file chunk which is previewed partially        |
| consult-preview-variables        | Alist of variables to bind during preview                  |
| consult-project-buffer-sources   | List of virtual project buffer sources                     |
| consult-project-function         | Function which returns current project root                |
| consult-register-prefix          | Prefix string for register keys during completion          |
| consult-ripgrep-args             | Command line arguments for ripgrep                         |
| consult-themes                   | List of themes to be presented for selection               |
| consult-widen-key                | Widening key during completion                             |

## Project support {#project-support description="Project discovery support for search commands"}

Multiple Consult search commands like `consult-grep`{.verbatim} try to discover the current project and search in the project top level directory by default, if a project is found. Otherwise they fall back to the `default-directory`{.verbatim}. By default, Consult uses the Emacs built-in project discovery support (`project-current`{.verbatim} and `project-root`{.verbatim}). It is possible to configure alternative methods via the customization variable `consult-project-function`{.verbatim}.

``` {.commonlisp org-language="emacs-lisp"}
;; Optionally configure a different project root function.
;; 1. project.el (the default)
(setq consult-project-function #'consult--default-project--function)
;; 2. vc.el (vc-root-dir)
(setq consult-project-function (lambda (_) (vc-root-dir)))
;; 3. locate-dominating-file
(setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
;; 4. projectile.el (projectile-project-root)
(autoload 'projectile-project-root "projectile")
(setq consult-project-function (lambda (_) (projectile-project-root)))
;; 5. Disable project support
(setq consult-project-function nil)
```

## Fine-tuning of individual commands {#fine-tuning-of-individual-commands alt_title="Fine-tuning" description="Fine-grained configuration for special requirements"}

**NOTE:** Consult supports fine-grained customization of individual commands. This configuration feature exists for experienced users with special requirements. There is the [Consult wiki](https://github.com/minad/consult/wiki), where we collect further configuration examples.

Commands and buffer sources allow flexible, individual customization by using the `consult-customize`{.verbatim} macro. You can override any option passed to the internal `consult--read`{.verbatim} API. Note that since `consult--read`{.verbatim} is part of the internal API, options could be removed, replaced or renamed in future versions of the package.

Useful options are:

- `:prompt`{.verbatim} set the prompt string
- `:preview-key`{.verbatim} set the preview key, default is `consult-preview-key`{.verbatim}
- `:initial`{.verbatim} set the initial input
- `:initial-narrow`{.verbatim} set the initial narrow key
- `:default`{.verbatim} set the default value
- `:history`{.verbatim} set the history variable symbol
- `:add-history`{.verbatim} add items to the future history, for example symbol at point
- `:sort`{.verbatim} enable or disable sorting
- `:group`{.verbatim} set to nil to disable candidate grouping and titles.
- `:inherit-input-method`{.verbatim} set to non-nil to inherit the input method.

``` {.commonlisp org-language="emacs-lisp"}
(consult-customize
 ;; Disable preview for `consult-theme' completely.
 consult-theme :preview-key nil
 ;; Set preview for `consult-buffer' to key `M-.'
 consult-buffer :preview-key "M-."
 ;; For `consult-line' change the prompt and specify multiple preview
 ;; keybindings. Note that you should bind <S-up> and <S-down> in the
 ;; `minibuffer-local-completion-map' or `vertico-map' to the commands which
 ;; select the previous or next candidate.
 consult-line :prompt "Search: "
 :preview-key '("S-<down>" "S-<up>"))
```

The configuration values are evaluated at runtime, just before the completion session is started. Therefore you can use for example `thing-at-point`{.verbatim} to adjust the initial input or the future history.

``` {.commonlisp org-language="emacs-lisp"}
(consult-customize
 consult-line
 :add-history (seq-some #'thing-at-point '(region symbol)))

(defalias 'consult-line-thing-at-point 'consult-line)

(consult-customize
 consult-line-thing-at-point
 :initial (thing-at-point 'symbol))
```

Generally it is possible to modify commands for your individual needs by the following techniques:

1.  Use `consult-customize`{.verbatim} in order to change the command or source settings.
2.  Create your own wrapper function which passes modified arguments to the Consult functions.
3.  Create your own buffer [multi sources](#multiple-sources) for `consult-buffer`{.verbatim}.
4.  Create advices to modify some internal behavior.
5.  Write or propose a patch.

# Recommended packages {#recommended-packages description="Related packages recommended for installation"}

I use and recommend this combination of packages:

- consult: This package
- [vertico](https://github.com/minad/vertico): Fast and minimal vertical completion system
- [marginalia](https://github.com/minad/marginalia): Annotations for the completion candidates
- [embark and embark-consult](https://github.com/oantolin/embark): Action commands, which can act on the completion candidates
- [orderless](https://github.com/oantolin/orderless): Completion style which offers flexible candidate filtering
- [wgrep](https://github.com/mhayashi1120/Emacs-wgrep) (or `grep-edit-mode`{.verbatim} on Emacs 31): Editing of grep buffers. Use with `consult-grep`{.verbatim} via `embark-export`{.verbatim}.

There exist multiple fine completion UIs beside Vertico, which are supported by Consult. Give them a try and find out which interaction model fits best for you.

- The builtin completion UI, which pops up the `*Completions*`{.verbatim} buffer.
- The builtin `icomplete-vertical-mode`{.verbatim}.
- [mct by Protesilaos Stavrou](https://git.sr.ht/~protesilaos/mct): Minibuffer and Completions in Tandem, which builds on the default completion UI.

Note that all packages are independent and can be exchanged with alternative components, since there exist no hard dependencies. Furthermore it is possible to get started with only default completion and Consult and add more components later to the mix. For example you can omit Marginalia if you don't need annotations. I highly recommend the Embark package, but in order to familiarize yourself with the other components, you can first start without it - or you could use with Embark right away and add the other components later on.

We document a [list of auxiliary packages](https://github.com/minad/consult/wiki/Auxiliary-packages) in the Consult wiki. These packages integrate Consult with special programs or with other packages in the wider Emacs ecosystem.

# Bug reports {#bug-reports description="How to create reproducible bug reports"}

If you find a bug or suspect that there is a problem with Consult, please carry out the following steps:

1.  **Search through the issue tracker** if your issue has been reported before (and has been resolved eventually) in the meantime.
2.  **Remove all packages involved in the suspected bug from your installation.**
3.  **Reinstall the newest version of all relevant packages**. Updating alone is not sufficient, since package.el sometimes causes miscompilation. The list of packages includes Consult, Compat, Vertico or other completion UIs, Marginalia, Embark and Orderless.
4.  Either use the default completion UI or ensure that exactly one of `vertico-mode`{.verbatim}, `mct-mode`{.verbatim}, or `icomplete-mode`{.verbatim} is enabled. The unsupported modes `selectrum-mode`{.verbatim}, `ivy-mode`{.verbatim}, `helm-mode`{.verbatim}, `ido-mode`{.verbatim} and `ido-ubiquitous-mode`{.verbatim} must be disabled.
5.  Ensure that the `completion-styles`{.verbatim} variable is properly configured. Try to set `completion-styles`{.verbatim} to a list including `substring`{.verbatim} or `orderless`{.verbatim}.
6.  Try to reproduce the issue with the newest stable Emacs version. Start a bare bone Emacs instance with `emacs -Q`{.verbatim} on the command line. Execute the following minimal code snippets in the scratch buffer. This way we can exclude side effects due to configuration settings. If other packages are relevant to reproduce the issue, include them in the minimal configuration snippet.

Minimal setup with Vertico for `emacs -Q`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(package-initialize)
(require 'consult)
(require 'vertico)
(vertico-mode)
(setq completion-styles '(substring basic))
```

Minimal setup with the default completion system for `emacs -Q`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(package-initialize)
(require 'consult)
(setq completion-styles '(substring basic))
```

Please provide the necessary important information with your bug report:

- The minimal configuration snippet used to reproduce the issue.
- Your completion UI (Default completion, Vertico, Mct or Icomplete).
- A stack trace in case the bug triggers an exception.
- Your Emacs version, since bugs may be fixed or introduced in newer versions.
- Your operating system, since Emacs behavior varies subtly between Linux, Mac and Windows.
- The package manager, e.g., straight.el or package.el, used to install the Emacs packages, in order to exclude update issues. Did you install Consult as part of the Doom Emacs distribution?
- Do you use Evil? Consult does not provide Evil integration out of the box, but there is some support in [evil-collection](https://github.com/emacs-evil/evil-collection).

When evaluating Consult-related code snippets you should enable lexical binding. Consult relies on lambdas and lexical closures.

# Hacking

## Creating asynchronous completion commands

If you have a completion source that's both dynamic and expensive to generate, `completing-read`{.verbatim} may not be the best choice. Instead, `consult--read`{.verbatim} serves as a thin wrapper around `completing-read`{.verbatim} that provides this functionality. For example, consider the following slow script that splits its input on space:

``` {.bash org-language="sh"}
#!/usr/bin/env bash
# simulate work
sleep .1
# generate completion candidates
printf "%s\n" "$*" | tr " " "\n" | sort
```

Let's assume this script is callable as `testibus hello world`{.verbatim}. To have Consult use it for completion, use `consult--process-collection`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(consult--read
 (consult--process-collection
  (lambda (input) (list "testibus" (string-trim input))))
 :prompt "run testibus: ")
```

If the completion candidates are generated by Lisp instead, use `consult--dynamic-collection`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(consult--read
 (consult--dynamic-collection
  (lambda (input)
    (sleep-for 0.1) ;; Simulate work
    (split-string input nil t)))
 :prompt "run testibus: ")
```

`consult--dynamic-collection`{.verbatim} can take a function with a callback such that the completion UI can update for long running computations.

``` {.commonlisp org-language="emacs-lisp"}
(consult--read
 (consult--dynamic-collection
  (lambda (input callback)
    (dotimes (i 3)
      (sleep-for 0.1) ;; Simulate work
      (funcall callback (mapcar (lambda (s) (format "%s%s" s i))
                                (split-string input nil t))))))
 :prompt "run testibus: ")
```

The asynchronous completion collections `consult--dynamic-collection`{.verbatim} and `consult--process-collection`{.verbatim} can be used for `consult--multi`{.verbatim} sources. Specify them as `:async`{.verbatim} field of the source plist.

## Live preview

Implementing live preview requires the definition of a state or preview function as defined by `consult--with-preview`{.verbatim}. The preview function receives the candidate and some action to perform (e.g., `'preview`{.verbatim}). In its simplest form supporting live preview, it looks something like this:

``` {.commonlisp org-language="emacs-lisp"}
(defun testibus--preview (action cand)
  (pcase action
    ('preview
     (with-current-buffer-window " *testibus*" 'action nil
       (erase-buffer)
       (insert (format "input: %s\n" cand))))))
```

See the docstring of `consult--with-preview`{.verbatim} for the lifecycle of the action argument. Once defined, we can use this preview function in `consult--read`{.verbatim}:

``` {.commonlisp org-language="emacs-lisp"}
(consult--read
 (consult--dynamic-collection
  (lambda (input callback)
    (dotimes (i 3)
      (sleep-for 0.1) ;; Simulate work
      (funcall callback (mapcar (lambda (s) (format "%s%s" s i))
                                (split-string input nil t))))))
 :prompt "run testibus: "
 :state #'testibus--preview)
```

# Contributions {#contributions description="Feature requests and pull requests"}

Consult is a community effort, please participate in the discussions. Contributions are welcome, but you may want to discuss potential contributions first. Since this package is part of [GNU ELPA](https://elpa.gnu.org/packages/consult.html) contributions require a copyright assignment to the FSF.

If you have a proposal, take a look at the [Consult issue tracker](https://github.com/minad/consult/issues) and the [Consult wishlist](https://github.com/minad/consult/issues/6). There have been many prior feature discussions. Please search through the issue tracker, maybe your issue or feature request has already been discussed. You can contribute to the [Consult wiki](https://github.com/minad/consult/wiki), in case you want to share small configuration or command snippets.

# Acknowledgments {#acknowledgments description="Contributors and Sources of Inspiration"}

This package took inspiration from [Counsel](https://github.com/abo-abo/swiper#counsel) by Oleh Krehel. Some of the Consult commands originated in the Counsel package or the wiki of the Selectrum package. This package exists only thanks to the help of these great contributors and thanks to the feedback of many users. Thank you!

Code contributions: [Aymeric Agon-Rambosson](https://github.com/aagon), [Amos Bird](https://github.com/amosbird), [Ashton Wiersdorf](https://github.com/ashton314), [Adam Spiers](https://github.com/aspiers/), [Augusto Stoffel](https://github.com/astoff), [Clemens Radermacher](https://github.com/clemera/), [Zhengyi](https://github.com/fuzy112), [Geoffrey Lessel](https://github.com/geolessel), [Illia Ostapyshyn](https://github.com/iostapyshyn), [jakanakaevangeli](https://github.com/jakanakaevangeli), [JD Smith](https://github.com/jdtsmith), [Jean-Philippe Bernardy](https://github.com/jyp), [mattiasdrp](https://github.com/mattiasdrp), [Mohamed Abdelnour](https://github.com/mohamed-abdelnour), [Mohsin Kaleem](https://github.com/mohkale), [Fox Kiester](https://github.com/noctuid), [Omar Antolín Camarena](https://github.com/oantolin/), [Earl Hyatt](https://github.com/okamsn/), [Omar Polo](https://github.com/omar-polo), [Piotr Kwiecinski](https://github.com/piotrkwiecinski), [Robert Weiner](https://github.com/rswgnu), [Sergey Kostyaev](https://github.com/s-kostyaev/), [Alexandru Scvorțov](https://github.com/scvalex), [Tecosaur](https://github.com/tecosaur), [Sylvain Rousseau](https://github.com/thisirs), [Tom Fitzhenry](https://github.com/tomfitzhenry/), [Iñigo Serna](https://hg.serna.eu) and [Alex Kreisher](https://github.com/akreisher).

Advice and useful discussions: [Enrique Kessler Martínez](https://github.com/Qkessler), [Adam Porter](https://github.com/alphapapa/), [Bruce d'Arcus](https://github.com/bdarcus), [Clemens Radermacher](https://github.com/clemera/), [Dmitry Gutov](https://github.com/dgutov/), [Howard Melman](https://github.com/hmelman/), [Itai Y. Efrat](https://github.com/iyefrat), [JD Smith](https://github.com/jdtsmith), [Manuel Uberti](https://github.com/manuel-uberti/), [Stefan Monnier](https://github.com/monnier/), [Omar Antolín Camarena](https://github.com/oantolin/), [Steve Purcell](https://github.com/purcell/), [Radon Rosborough](https://github.com/raxod502), [Tom Fitzhenry](https://github.com/tomfitzhenry/) and [Protesilaos Stavrou](https://protesilaos.com).

<!--

# Indices {#indices description="Indices of concepts and functions"}

## Function index {#function-index description="List of all Consult commands" index="fn"}

## Concept index {#concept-index description="List of all Consult-specific concepts" index="cp"}

-->
