---
author: Daniel Mendler
lang: en
title: consult.el - Changelog
---

# Development

- Require Emacs 29.
- Improve interaction with upcoming `minibuffer-nonselected-mode`{.verbatim}.
- `consult-info`{.verbatim}: Reuse current info buffer when jumping to a search result.

# Version 2.8 (2025-09-08) {#version-2.8-2025-09-08}

- New command `consult-grep-match`{.verbatim} based on `consult-compile-error`{.verbatim}, which shows Grep matches of related Grep buffers.
- `consult-compile-error`{.verbatim}: Exclude Grep matches. Show only compilation errors from compilation buffers.
- `consult-compile-error`{.verbatim}: Remove `g`{.verbatim} narrow key.

# Version 2.7 (2025-08-05) {#version-2.7-2025-08-05}

- `consult-buffer-list-function`: New customizable variable to support frame or tab isolation (see `tab-bar-mode`). Set to `consult--frame-buffer-list` for frame isolation. Alternatively use buffer functions provided by packages like [beframe](https://github.com/protesilaos/beframe).
- `consult--source-other-buffer`: Buffer source which lists all buffers which missing from the list returned by `consult-buffer-list-function`. If buffers are restricted to the current frame or tab by default, then this source will list the buffers belonging to other frames or tabs.

# Version 2.6 (2025-06-28) {#version-2.6-2025-06-28}

- `consult--read`, `consult--prompt`: Accept a `:command` keyword argument which specifies the current command symbol to lookup the customization (see `consult-customize`). This change fixes an issue in `embark-consult`.

# Version 2.5 (2025-06-05) {#version-2.5-2025-06-05}

- `consult--source-buffer-register`: New source for buffer registers.
- `consult--jump-ensure-buffer`: Reuse window if possible.
- `consult-compile-error`: Add prefix argument to jump to error message in the compilation buffer instead of error location.
- `consult--read`, `consult--prompt`: Add `:command` keyword argument. Avoid overriding `this-command` for `consult-xref` and `consult-completion-in-region`.

# Version 2.4 (2025-05-21) {#version-2.4-2025-05-21}

- `consult-register-store`: Add `M-b`{.verbatim} action to store the buffer in a register.
- `consult-compile`: Ignore messages without a location.
- `consult-compile`: Introduce key `g`{.verbatim} for grep locations.

# Version 2.3 (2025-04-19) {#version-2.3-2025-04-19}

- Bugfix: `consult--read` accepts list of symbols.
- Bugfix: `consult-theme` handles invalid themes gracefully.

# Version 2.2 (2025-04-02) {#version-2.2-2025-04-02}

- Add `consult-info-define` to conveniently define custom `consult-info-*` commands to search through a subset of info manuals.
- `consult-focus-lines`: Add mode line indicator if active.
- `consult-grep`: Preserve empty context lines.
- `consult-register-store`: Support Dired buffers.

# Version 2.1 (2025-03-11) {#version-2.1-2025-03-11}

- Remove obsolete `consult--async-*` APIs.
- File preview: Ensure that remote files do not slow down preview.
- File preview: Do not preview gpg files.
- `consult-yank-pop`, `consult-history`: Respect display properties when previewing to avoid leaking hidden data.
- `consult-completion-in-region`: Auto-detect completion UI.
- `consult-completion-in-region`: Improve handling of single candidates.

# Version 2.0 (2025-01-28) {#version-2.0-2025-01-28}

- New features:
  - `consult--multi`: Add support for asynchronous sources.
  - `consult-man`: Add preview.
- **BREAKING CHANGE**: New async API
  - Async functions must have the uniform curried form `(lambda (sink) (lambda (action) ...)` and are composed with `consult--async-pipeline`. See the docstring of `consult--async-pipeline` for details.
  - `consult--read`: New `:async-wrap` keyword argument.
  - `consult--multi`: Add support for `:async` sources.
  - `consult--async-min-input`: New async function which enforces a minimum input length. The input length check has been removed from `consult--async-split`.
  - `consult--async-transform`: Macro converted to function.
  - `consult--process-collection`: New function replacing `consult--async-command`. The function accepts keyword arguments to customize the pipeline.
  - `consult--dynamic-collection`: The function accepts more keyword arguments to customize the pipeline.
  - `consult--async-refresh-timer` and `consult--async-refresh-immediate`: Replaced by `consult--async-refresh` with a `DELAY` argument.
  - `consult--async-split-thingatpt` and `consult--async-split-initial`: Removed since `consult--read` automatically inserts the splitter prefix if needed.
- Minor changes:
  - Remove obsolete `consult-yank-rotate`.
  - Add customizable variable `consult-async-indicator`.
  - `consult-completion-in-region`: When inside minibuffer, use minibuffer content as prompt.

# Version 1.9 (2024-12-22) {#version-1.9-2024-12-22}

- Require Emacs 28.1.
- `consult-grep`, `consult-find` and similar commands: Ask for project first, when invoked with double prefix argument `C-u C-u`.
- Deprecate `consult-yank-rotate` in favor of `yank-from-kill-ring-rotate`.
- `consult-grep-max-columns`: Support value `nil` to disable truncation.
- `consult-line`: Enforce global completion style settings for compatibility with buffer-local completion style settings, which may be used by Corfu.
- Support the value 0 for `consult-async-min-input`.
- Remove special `org-fold` code. Set `org-fold-core-style` to `overlays` if unfolding in Org files does not work for you.
- `consult-info`: Support sub files.
- `consult-buffer`, `consult-project-buffer`: Add sources for known project roots.
- `consult--multi`: Support multiple narrow keys per source. Used by the project buffer and project recent file source.
- `consult--async-sink`: The new action `cancel` was added to the async protocol.
- `consult--read`: Add new keyword argument `:initial-narrow`.

# Version 1.8 (2024-07-25) {#version-1.8-2024-07-25}

- `consult-preview-excluded-buffers`{.verbatim}: New customization variable.
- `consult-fd`{.verbatim}: Support multiple paths.
- Bump Compat dependency to Compat 30.

# Version 1.7 (2024-05-23) {#version-1.7-2024-05-23}

- Emacs 30 bug fix: Ensure that font locking is enabled when previewing files.
- `consult-preview-allowed-hooks`: Global minor modes, which should be enabled during preview, can be added to this list. See the README for examples.
- `consult-xref`: Bug fix: Do not error when project root directory is nil.
- `consult-fd`: Bug fix: Avoid confusion of input pattern with options by prefixing the input pattern with `--and`.
- `consult--buffer-sort-visibility`: Bug fix: Only add current buffer to sorted list, if already present in the original list.

# Version 1.6 (2024-05-15) {#version-1.6-2024-05-15}

- `consult-xref`: Compatibility with xref.el in Emacs 30.
- `consult-grep` (and similar): Preserve files which are already open literally and do not reopen them in normal mode.
- `consult-preview-allowed-hooks`: Run delayed mode hooks listed in this variable during preview.
- `consult--buffer-query`: Add buffer-list keyword argument.

# Version 1.5 (2024-04-19) {#version-1.5-2024-04-19}

- Bugfix `consult-buffer`: Handle buffer renaming during minibuffer completion gracefully, by attaching the actual buffer objects to the completion candidate strings.
- Bugfix `consult-register`: Ignore marker registers pointing to dead buffers.

# Version 1.4 (2024-03-08) {#version-1.4-2024-03-08}

- Bugfix: File preview: Ensure that binary files are not previewed partially. Otherwise `pdf-view-mode` may observe corrupted PDF files.
- `consult--async-refresh-timer`: Optimize timer reuse and efficiency. This change improves the performance of commands like `consult-ripgrep` for small values of `consult-async-refresh-delay`.
- `consult-completion-in-region`: Remove `:cycle-threshold` and `:completion-styles` customization options.

# Version 1.3 (2024-02-23) {#version-1.3-2024-02-23}

- `consult-bookmark-narrow`: More flexible grouping which supports multiple bookmark handlers per group.
- Bugfix: Ensure that preview is always executed in a non-minibuffer window.
- Bugfix: File preview: Do not preview `hexl-mode` buffers.
- Bugfix: File preview: use `error-message-string` to access error string.
- Bugfix: Buffer preview: Retrieve original window correctly.
- Bugfix: Fix `consult-global-mark` for `embark-export`.

# Version 1.2 (2024-01-23) {#version-1.2-2024-01-23}

- `consult-buffer`{.verbatim}: Bugfix. Ensure that null completion works properly.
- File preview: Add indication if previewed file got truncated.

# Version 1.1 (2023-12-27) {#version-1.1-2023-12-27}

- Bugfixes:
  - `consult-xref`: Do not error for an empty location list.
  - `consult--read`: Catch null completion if require-match is non-nil.
  - `consult--multi`: Ensure that :new action is invoked on visible source.
- File preview: Check for long lines when previewing files partially.
- Use `minibuffer-local-filename-syntax` and `read-file-name-completion-ignore-case` for directory prompt of the `consult-grep` and `consult--find` family of commands.
- Remove obsolete variables `consult-preview-max-size` and `consult-preview-raw-size`.

# Version 1.0 (2023-12-01) {#version-1.0-2023-12-01}

- Bugfixes.
- Preview large files partially. Add new customization variables `consult-preview-partial-chunk`{.verbatim} and `consult-preview-partial-limit`{.verbatim}. This new feature is experimental. Please report any issues you observe.
- Obsoleted `consult-preview-max-size`{.verbatim} and `consult-preview-raw-size`{.verbatim}.
- `consult-buffer-other-tab`{.verbatim}: New command.
- `consult-fd`{.verbatim}: New command based on the fast `fd/fdfind`{.verbatim} search utility.
- `consult-outline`{.verbatim}: New prefix argument to specify initial narrowing level.
- `consult-org-heading`{.verbatim}: Specify category `org-heading`{.verbatim} such that Embark provides appropriate Org heading actions.
- `consult-org-heading`{.verbatim}: Add annotation.
- `consult-locate`{.verbatim}: Split input into multiple words.
- Remove unreliable `consult--maybe-recenter`{.verbatim}.
- Save input history even when using `embark-export`{.verbatim} or when aborting from a command via C-g. This change affects commands like `consult-line`{.verbatim} and `consult-grep`{.verbatim}.
- Unify history of `consult-line`{.verbatim}, `consult-keep-lines`{.verbatim} and `consult-focus-lines`{.verbatim}.

# Version 0.35 (2023-07-02) {#version-0.35-2023-07-02}

- Bugfixes.
- `consult--read`{.verbatim} now accepts programmable completion tables as argument, e.g., `completion-table-dynamic`{.verbatim} or `completion--file-name-table`{.verbatim}. This allows you to reuse existing completion tables to write completion commands enhanced with Consult candidate preview.
- Replace `consult-preview-cursor`{.verbatim} face with `cursor-highlight-mark`{.verbatim}.
- Change calling convention of `consult-focus-lines`{.verbatim} and `consult-keep-lines`{.verbatim}.
- The regexps in `consult-buffer-filter`{.verbatim} are matched case sensitively now. Similarly, the `INCLUDE`{.verbatim} and `EXCLUDE`{.verbatim} arguments of `consult--buffer-query`{.verbatim} are also case sensitive.
- Do not preview remote files by default, see `consult-preview-excluded-files`{.verbatim}.
- Use `consult--maybe-recenter`{.verbatim} instead of `recenter`{.verbatim} in `consult-after-jump-hook`{.verbatim}.
- `consult-goto-line`{.verbatim}: Support `line:column`{.verbatim} input.

# Version 0.34 (2023-04-21) {#version-0.34-2023-04-21}

- Bugfixes.
- `consult-org-heading`{.verbatim}: Support tag inheritance.
- Use pure `consult--fast-abbreviate-file-name`{.verbatim} function to abbreviate file names in `consult-buffer`{.verbatim} and `consult-recent-file`{.verbatim}. This ensures that abbreviation does not access the file system (or worse remote hosts via Tramp) and is always fast. The downside is that some paths may not get abbreviated.
- Introduce buffer sources `consult--source-project-buffer-hidden`{.verbatim} and `consult--source-project-recent-file-hidden`{.verbatim}. Set the buffer sources of `consult-project`{.verbatim} to `consult--source-project-buffer`{.verbatim} and `consult--source-project-recent-file`{.verbatim} to ease customization.
- `consult-buffer`{.verbatim}: Explicitly save `window-next-buffers`{.verbatim} and `window-prev-buffers`{.verbatim}.
- When previewing files literally (`consult-preview-raw-size`{.verbatim}), set the multi byte flag of the previewed buffer, such that UTF-8 buffers are not garbled.
- Do not create preview cursor overlay. Instead display the actual point by ensuring that `cursor-in-non-selected-windows`{.verbatim} is set.

# Version 0.33 (2023-03-11) {#version-0.33-2023-03-11}

- BREAKING: The key convention has been updated. The old key convention is not supported anymore. Keys must now be strings valid according to `key-valid-p`{.verbatim}. This changes affects the keys `consult-narrow-key`{.verbatim}, `consult-widen-key`{.verbatim}, `consult-preview-key`{.verbatim} and the `:preview-key`{.verbatim} of sources and passed as keyword argument to `consult--read`{.verbatim}. See the example configurations in the manual.
- BREAKING: Remove the "." argument from `consult-grep-args`{.verbatim} and `consult-ripgrep-args`{.verbatim}, since directories or files to search are appended by the command line builder. Take this change into account, when you use a customized version of those variables.
- `consult-grep`{.verbatim}: Add support for grep and find over multiple files or directory. If the prefix argument DIR is a single C-u, prompt for comma separated directories or files to search recursively via `completing-read-multiple`{.verbatim}.
- `consult-buffer`{.verbatim} and `consult-isearch-history`{.verbatim}: Align annotations dynamically depending on candidate width, instead of computing the alignment beforehand.
- Add the full path as `help-echo`{.verbatim} property to abbreviated directory paths and project names. Enable `tooltip-mode`{.verbatim} and hover with the mouse over the abbreviated directory path to see the full path.
- `consult-grep/find/etc`{.verbatim}: Print first line of stderr output if command failed.

# Version 0.32 (2023-02-06) {#version-0.32-2023-02-06}

- Bugfixes
- Deprecate the old key convention. Keys must now be strings valid according to `key-valid-p`{.verbatim}. This changes affects the keys `consult-narrow-key`{.verbatim}, `consult-widen-key`{.verbatim}, `consult-preview-key`{.verbatim} and the `:preview-key`{.verbatim} of sources and passed as keyword argument to `consult--read`{.verbatim}. See the example configurations in the manual.
- Add `consult-info`{.verbatim} command (#634, \#727).
- `consult-buffer`{.verbatim}: Always select the first candidate when narrowing (#714).
- `consult-locate-args`{.verbatim}: Remove `--existing`{.verbatim}, which is not supported by `plocate`{.verbatim} on Debian stable.
- `consult-ripgrep-args`{.verbatim}: Add `--search-zip`{.verbatim} option to automatically search through compressed files. This will allow you to search Elisp files bundled with your Emacs installation. Move to an Elisp library via `find-library`{.verbatim}, then invoke `consult-ripgrep`{.verbatim}.
- Drop obsolete `consult-apropos`{.verbatim}. Alternatives: `describe-symbol`{.verbatim} in combination with `embark-export`{.verbatim}. See also `consult-info`{.verbatim} and `consult-ripgrep`{.verbatim} to search through info manuals and Elisp source code.
- Drop obsolete `consult-multi-occur`{.verbatim}. Alternative: Built-in `multi-occur`{.verbatim}, `multi-occur-in-matching-buffers`{.verbatim} or `consult-line-multi`{.verbatim}.
- Drop obsolete `consult-file-externally`{.verbatim}. The command has been moved to Embark under the name `embark-open-externally`{.verbatim}.

# Version 0.31 (2023-01-06) {#version-0.31-2023-01-06}

- Version bump to update the Compat package dependency (29.1.0.1)

# Version 0.30 (2023-01-02) {#version-0.30-2023-01-02}

- Bugfixes
- Drop Selectrum support
- Deprecate `consult-file-externally`{.verbatim} in favor of `embark-open-externally`{.verbatim}
- Deprecate `consult-multi-occur`{.verbatim}. The `multi-occur`{.verbatim} command should be improved upstream to take advantage of `completing-read-multiple`{.verbatim}. Consult provides the command `consult-line-multi`{.verbatim} as an alternative.
- `consult-history`{.verbatim}: Use input as initial completion input

# Version 0.29 (2022-12-03) {#version-0.29-2022-12-03}

- Bugfixes
- `consult-line-multi`{.verbatim} has been rewritten completely. The candidates are computed on demand based on the input. This reduces startup speed greatly. The command behaves like `consult-grep`{.verbatim}, but operates on buffers instead of files.
- Add `consult--source-file-register`{.verbatim}, and make the registers available in `consult-buffer`{.verbatim}. Registers are often used as quick access keys for files, e.g., `(add-to-list 'register-alist '(?i file . "~/.emacs.d/init.el")))`{.verbatim}.
- Remove obsolete `consult-line-point-placement`{.verbatim}
- `consult-grep/find`{.verbatim}: Always show directory in the prompt
- Add variable `consult-yank-rotate`{.verbatim}, `consult-yank-from-kill-ring`{.verbatim} rotates kill ring
- Emacs 29: `consult-register`{.verbatim} supports `buffer`{.verbatim} register type
- Emacs 29: Support `outline-search-function`{.verbatim}
- Org 9.6: Support new `org-fold-core`{.verbatim} API (both overlays and text-properties)
- Support abbreviated file names in `recentf-list`{.verbatim}, see `recentf-filename-handler`{.verbatim}.
- Deprecate `consult-apropos`{.verbatim}

# Version 0.20 (2022-10-16) {#version-0.20-2022-10-16}

- Bugfixes
- Allow `consult-*-args`{.verbatim} to be a string, or a list of strings or expressions.
- Introduce face `consult-highlight-match`{.verbatim} to highlight grep matches in the completion buffer.
- Highlight full matches in `consult-line`{.verbatim}, `consult-outline`{.verbatim}, `consult-*grep`{.verbatim} and `consult-flymake`{.verbatim}.
- Remove face `consult-preview-error`{.verbatim}.
- Deprecate `consult-line-point-placement`{.verbatim} in favor of more general `consult-point-placement`{.verbatim}, which is also used by the `consult-*grep`{.verbatim} commands.
- `consult-imenu`{.verbatim}: Support imenu-after-jump-hook and non-default `imenu-default-goto-function`{.verbatim}
- `consult-history`{.verbatim}: Add support for history index variables, which are updated after selection.
- Deprecate support for Selectrum in favor of Vertico. If you use Selectrum consider switching to Vertico, Icomplete, Mct or default completion.

# Version 0.19 (2022-09-09) {#version-0.19-2022-09-09}

- Bugfixes
- Allow `consult-flymake`{.verbatim} to work across all buffers in a project
- Remove deprecated `consult-completing-read-multiple`{.verbatim}
- `consult-grep/git-grep/ripgrep`{.verbatim}: Add `--fixed-strings`{.verbatim} support
- `consult-grep`{.verbatim}: Respect `grep-find-ignored-directories/files`{.verbatim}
- `consult-org-heading`{.verbatim}: Add tags to completion candidates
- Add `consult-preview-excluded-files`{.verbatim}
- `consult-themes`{.verbatim}: Support regexps

# Version 0.18 (2022-05-25) {#version-0.18-2022-05-25}

- Bugfixes
- Removed obsolete `consult-recent-file-filter`{.verbatim} and `consult-preview-excluded-hooks`{.verbatim}
- Deprecate `consult-completing-read-multiple`{.verbatim}. See \#567 for details.
- Add `consult--source-modified-buffer`{.verbatim}

# Version 0.17 (2022-04-22) {#version-0.17-2022-04-22}

- Bugfixes
- Drop Emacs 26 support.
- `consult-goto-line`{.verbatim}: Use `goto-line-history`{.verbatim} on Emacs 28.
- `consult-customize`{.verbatim}: Evaluate settings at runtime. This change makes it possible to use `thing-at-point`{.verbatim} to overwrite the `:initial`{.verbatim} and `:add-history`{.verbatim} settings.
- Rename `consult--read-config`{.verbatim} to `consult--customize-alist`{.verbatim} and change the format. The configuration is an alist. The car must be a command symbol. The cdr must be a plist of keys and expressions, where the expressions evaluate to the actual configuration values.
- Mode hooks in previewed file buffers are delayed. The buffer is only fully initialized when leaving the minibuffer for recursive editing.
- Increase `consult-preview-raw-size`{.verbatim}.
- Replace `consult-preview-excluded-hooks`{.verbatim} by `consult-preview-allowed-hooks`{.verbatim}.
- Add `consult-preview-variables`{.verbatim} to bind variables for file preview.
- BREAKING API CHANGE of `consult--read`{.verbatim}, `consult--prompt`{.verbatim}, `consult--multi`{.verbatim}: The state function protocol changed. The function gets notified of more completion state changes. See the docstring of `consult--with-preview`{.verbatim} for details.
- BREAKING API CHANGE of `consult--read`{.verbatim}: The lookup function protocol changed. The function must now accept four or more arguments.
- Remove unused `consult-preview-map`{.verbatim}.
- Remove unnecessary `consult-recent-file-filter`{.verbatim}. Use `recentf-exclude`{.verbatim} instead.
- `consult--multi`{.verbatim} sources can have a `:new`{.verbatim} function to create candidates. When narrowed to a source, new candidates will be created by calling the respective `:new`{.verbatim} function.
- `consult--multi`{.verbatim} returns `:match`{.verbatim} information. `:match`{.verbatim} can be nil, t, or new, depending on if the candidate does not exist, exists or has been created.
- `consult-locate`{.verbatim} treats the input literally to take advantage of the db index.

# Version 0.16 (2022-03-08) {#version-0.16-2022-03-08}

- Bugfixes
- Deprecate `consult-project-root-function`{.verbatim} in favor of `consult-project-function`{.verbatim}.
- Preconfigure `consult-project-function`{.verbatim} with a default function based on project.el.
- Add `consult-project-buffer`{.verbatim}, a variant of `consult-buffer`{.verbatim} restricted to the current project.
- Add `consult-register-prefix`{.verbatim} option.
- Introduced a generic and extensible `consult-register`{.verbatim} implementation.
- Lazy marker creation in `consult-line/outline`{.verbatim} (performance improvements)

# Version 0.15 (2022-01-31) {#version-0.15-2022-01-31}

- Bugfixes
- `consult-xref`{.verbatim}: Prettify the group titles, use `xref--group-name-for-display`{.verbatim} if available.
- `consult-focus-lines`{.verbatim}: Thanks to @jdtsmith, the command is much faster and actually useable in large files.
- Added Mct integration, auto refreshing of asynchronous Consult commands.

# Version 0.14 (2021-12-31) {#version-0.14-2021-12-31}

- Bugfixes
- Add `consult-recent-file-filter`{.verbatim}
- Rename `consult--source-(project-)file`{.verbatim} to `consult-source-(project-)recent-file`{.verbatim}
- `consult-keep-lines`{.verbatim} makes read-only buffers temporarily writable if confirmed

# Version 0.13 (2021-11-12) {#version-0.13-2021-11-12}

- Bugfixes
- `consult-register`{.verbatim}: Add support for file register values.
- Rename `consult-isearch`{.verbatim} to `consult-isearch-history`{.verbatim}. The command is a history browsing command and not a replacement for Isearch.
- `consult-grep`{.verbatim} support -\[ABC\] grep options
- Add `consult-grep-context`{.verbatim} face

# Version 0.12 (2021-10-11) {#version-0.12-2021-10-11}

- Bugfixes
- Removed obsolete `consult-project-imenu`{.verbatim} and `consult-x-command`{.verbatim} variables
- `consult-grep`{.verbatim}: Use `--null` argument to support file names with colons

# Version 0.11 (2021-08-18) {#version-0.11-2021-08-18}

- Bugfixes only

# Version 0.10 (2021-08-11) {#version-0.10-2021-08-11}

- `consult-mark`{.verbatim}, `consult-global-mark`{.verbatim}: Add optional marker list argument
- `consult-completing-read-multiple`{.verbatim}: New function
- Rename `consult-project-imenu`{.verbatim} to `consult-imenu-multi`{.verbatim}
- Add `consult-line-multi`{.verbatim} to search multiple buffers
- Removed obsolete `consult-yank`{.verbatim}, `consult-async-default-split`{.verbatim}, `consult-config`{.verbatim}
- `consult-ripgrep`{.verbatim}: Use `--smart-case`{.verbatim}
- `consult-grep/git-grep`{.verbatim}: Use `--ignore-case`{.verbatim}
- Deprecate `consult-<cmd>-command`{.verbatim} in favor of `consult-<cmd>-config.`{.verbatim}
- `consult-find`{.verbatim}: Use regular expressions instead of globbing/wildcards by default. Due to the changes to `consult-find`{.verbatim} it is not possible anymore to configure `fd`{.verbatim} as backend for `consult-find`{.verbatim}. A replacement is documented in the wiki.
- `consult-find/locate/man`{.verbatim}: Add highlighting to the matching file/man page names.
- `consult-grep/git-grep/ripgrep/find/locate`{.verbatim}: Add support for multiple unordered patterns. Each of the input patterns must be matched. For example, `consult-find`{.verbatim} transforms the input "first second third" to "first -and second -and third".
- `consult-grep/git-grep/ripgrep`{.verbatim}: Compute the highlighting based on the input, instead of relying on the ANSI-escaped output. This works better with multiple patterns, but may occasionally produce false highlighting.
- Deprecate `consult-x-command`{.verbatim} configuration variables in favor of `consult-x-args`{.verbatim}. The variables have been renamed since the configuration format changed.
- `consult-async-split-styles-alist`{.verbatim}: Remove the `space`{.verbatim} splitting style, since it has been obsoleted by the support for multiple unordered patterns.

# Version 0.9 (2021-06-22) {#version-0.9-2021-06-22}

- Add `consult-preview-excluded-hooks`{.verbatim}
- `consult--read/consult--prompt`{.verbatim}: Add `:inherit-input-method`{.verbatim} argument
- Add debouncing support for preview

# Version 0.8 (2021-05-30) {#version-0.8-2021-05-30}

- Async commands: Do not fix vertical height in Selectrum.
- `consult-imenu`{.verbatim}: Deduplicate items (some imenu backends generate duplicates).
- `consult-org-heading`{.verbatim}: Deduplicate items.
- `consult-buffer-filter`{.verbatim}: Hide more buffers.
- `consult-line`{.verbatim}: Matching line preview overlay only in the selected window.
- `consult-yank/completion-in-region`{.verbatim}: Insertion preview only in selected window.
- `consult-yank`{.verbatim}: Rename to `consult-yank-from-kill-ring`{.verbatim} (Emacs 28 naming).
- `consult-yank`{.verbatim} commands: `delete-selection-mode`{.verbatim} support, added properties.
- `consult-preview-at-point`{.verbatim}, `consult-preview-at-point-mode`{.verbatim}: New command and minor mode to preview candidate at point in `*Completions*`{.verbatim} buffer.
- Add `consult-async-split-style`{.verbatim} and `consult-async-split-styles-alist`{.verbatim}.
- `consult-async-default-split`{.verbatim}: Obsoleted in favor of `consult-async-split-style`{.verbatim}.
- Deprecate `consult-config`{.verbatim} in favor of new `consult-customize`{.verbatim} macro.
- `consult-buffer`{.verbatim}: Enable previews for files and bookmarks by default.
- `consult-buffer=/=consult--multi`{.verbatim}: Add support for `:preview-key`{.verbatim} per source.
- `consult-buffer`{.verbatim}: Push visible buffers down in the buffer list.
- `consult-flycheck`{.verbatim}: Moved to separate repository prior to ELPA submission.
- Submitted Consult to ELPA.

# Version 0.7 (2021-04-29) {#version-0.7-2021-04-29}

- Bugfixes
- `consult-buffer`{.verbatim}: Respect `confirm-nonexistent-file-or-buffer`{.verbatim}
- `consult-widen-key`{.verbatim}: Change default setting to twice the `consult-narrow-key`{.verbatim}
- `consult-flycheck`{.verbatim}: Sort errors first
- Added support for the Vertico completion system
- Consult adds disambiguation suffixes as suffix instead of as prefix now for the commands `consult-line`{.verbatim}, `consult-buffer`{.verbatim}, etc. This enables support for the `basic`{.verbatim} completion style and TAB completion.
- `consult--read`{.verbatim}: The `:title`{.verbatim} function must accept two arguments now, the candidate string and a flag. If the flag is nil, the function should return the title of the candidate, otherwise the function should return the transformed candidate.
- `consult-grep`{.verbatim} and related commands: Strip the file name if grouping is used.
- `consult-find/grep`{.verbatim}: Ensure that the commands work with Tramp
- `consult-outline`{.verbatim}: Add narrowing
- Added `consult-org-heading`{.verbatim} and `consult-org-agenda`{.verbatim}
- `consult-line`{.verbatim}: Highlight visual line during jump preview
- `consult-line`{.verbatim}: Start search at current line, add configuration variable `consult-start-from-top`{.verbatim}. The starting point can be toggled by the prefix argument `C-u`{.verbatim}.

# Version 0.6 (2021-03-02) {#version-0.6-2021-03-02}

- Bugfixes
- `consult-keep/focus-lines`{.verbatim}: Align behavior on regions with built-in `keep-lines`{.verbatim}.
- `consult-buffer`{.verbatim}: Enable file sources only when `recentf-mode`{.verbatim} is enabled
- `consult--multi`{.verbatim}: Add `:default`{.verbatim} flag, use flag for `consult--source-buffer`{.verbatim}
- Add `consult-grep-max-columns`{.verbatim} to prevent performance issues for long lines
- Add `consult-fontify-preserve`{.verbatim} customization variable
- `consult-line`{.verbatim}: Quits Isearch, when started from an Isearch session
- `consult-register-load`{.verbatim}: Align prefix argument handling with `insert-register`{.verbatim}
- Rename `consult-error`{.verbatim} to `consult-compile-error`{.verbatim}
- `consult-compile-error`{.verbatim}: Allow calling the command from any buffer, use the errors from all compilation buffers related to the current buffer.
- `consult-man`{.verbatim}: Handle aggregated entries returned by mandoc
- `consult-completion-in-region`{.verbatim}: Added preview and `consult-preview-region`{.verbatim} face
- Added `consult-completion-in-region-styles`{.verbatim} customization variable
- Added `consult-xref`{.verbatim}. The function can be set as `xref-show-xrefs-function`{.verbatim} and `xref-show-definitions-function`{.verbatim}.
- Added support for the candidate grouping function `x-group-function`{.verbatim}

# Version 0.5 (2021-02-09) {#version-0.5-2021-02-09}

- Bugfixes
- `consult-keep/focus-lines`{.verbatim}: If region is active, operate only on the region.
- `consult-register-format`{.verbatim}: Do not truncate register strings.
- `consult-buffer`{.verbatim} multi sources: Ensure that original buffer is shown, when the currently selected source does not perform preview.
- Add `consult-preview-raw-size`{.verbatim}
- Expose preview functionality for multi-source bookmarks/files
- Multi sources: Add `:enabled`{.verbatim}, `:state`{.verbatim} and `:action`{.verbatim} fields
- `consult-imenu`{.verbatim}: Add faces depending on item types

# Version 0.4 (2021-02-01) {#version-0.4-2021-02-01}

- Bugfixes
- Introduce multi sources, reimplement `consult-buffer`{.verbatim} with multi sources
- `consult-isearch`{.verbatim}: Add preview highlighting
- `consult-line`{.verbatim}: Use `isearch-string`{.verbatim} when invoked from running isearch

# Version 0.3 (2021-01-28) {#version-0.3-2021-01-28}

- Bugfixes
- New command `consult-isearch`{.verbatim}
- New functions `consult-register-format`{.verbatim}, `consult-register-window`{.verbatim}, removed `consult-register-preview`{.verbatim}

# Version 0.2 (2021-01-16) {#version-0.2-2021-01-16}

- Initial stable release
