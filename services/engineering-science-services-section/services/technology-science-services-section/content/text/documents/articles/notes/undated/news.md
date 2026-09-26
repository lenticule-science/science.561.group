---
title: Dash NEWS -- history of user-visible changes
description: This is a minor release that hopes to address compat-srht:7.
---
# Release of "Compat" Version 30.1.0.1 {#release-of-compat-version-30.1.0.1}

- compat-28: Fix `named-let`{.verbatim} tail recursion.

(Release \<2025-06-19 Thu\>)

# Release of "Compat" Version 30.1.0.0 {#release-of-compat-version-30.1.0.0}

- compat-30: Add oklab color functions.

(Release \<2025-04-02 Wed\>)

# Release of "Compat" Version 30.0.2.0 {#release-of-compat-version-30.0.2.0}

- compat-30: Rename `trusted-files`{.verbatim} to `trusted-content`{.verbatim}.

(Release \<2025-01-04 Sat\>)

# Release of "Compat" Version 30.0.1.0 {#release-of-compat-version-30.0.1.0}

- compat-30: New variable `untrusted-content`{.verbatim}.
- compat-30: New variable `trusted-files`{.verbatim}.
- compat-30: New function `trusted-content-p`{.verbatim}.

(Release \<2024-12-15 Sun\>)

# Release of "Compat" Version 30.0.0.0 {#release-of-compat-version-30.0.0.0}

- compat-28: Mark `subr-native-elisp-p`{.verbatim} as obsolete (renamed in Emacs 30).
- compat-30: New function `char-to-name`{.verbatim}.
- compat-30: New function `obarray-clear`{.verbatim}.
- compat-30: New function `interpreted-function-p`{.verbatim}.
- compat-30: New function `primitive-function-p`{.verbatim}.
- compat-30: New function `closurep`{.verbatim}.
- compat-30: Add extended function `sort`{.verbatim} with keyword arguments.
- compat-30: New function `value<`{.verbatim}.
- compat-30: Add extended `copy-tree`{.verbatim} with support for copying records with non-nil optional second argument.
- compat-30: New macro `static-if`{.verbatim}.
- compat-30: New alias `drop`{.verbatim}.
- compat-30: New function `merge-ordered-lists`{.verbatim}.
- compat-30: New variables `completion-lazy-hilit`{.verbatim} and `completion-lazy-hilit-fn`{.verbatim} and new function `completion-lazy-hilit`{.verbatim}.
- compat-30: New function `require-with-check`{.verbatim}.
- compat-30: New functions `find-buffer`{.verbatim} and `get-truename-buffer`{.verbatim}.
- compat-30: Add extended `completion-metadata-get`{.verbatim} with support for `completion-category-overrides`{.verbatim} and `completion-extra-properties`{.verbatim}.

(Release \<2024-07-08 Mon\>)

# Release of "Compat" Version 29.1.4.5 {#release-of-compat-version-29.1.4.5}

- Minor optimization of `plist-get` and `plist-put`.
- Minor compatibility adjustments for the Emacs 30 development version.
- A minimal version of `compat.el`{.verbatim} will be part of Emacs 30. Emacs :core packages can directly `(require 'compat)` without the `NOERROR` flag. Furthermore Compat will not be installed unnecessarily. If a package depending on Emacs 25.1 and Compat 29.1 is installed on Emacs 30.1, Compat 29.1 will not be installed from ELPA, since Emacs 30.1 already provides the required functionality.

(Release \<2024-03-16 Sat\>)

# Release of "Compat" Version 29.1.4.4 {#release-of-compat-version-29.1.4.4}

- Fix `Package-Requires` header in compat.el
- Fix `Maintainer` header in compat.el

(Release \<2023-11-13 Mon\>)

# Release of "Compat" Version 29.1.4.3 {#release-of-compat-version-29.1.4.3}

- compat-29: Add function `char-uppercase-p`{.verbatim}.
- compat-29: Add function `window-configuration-equal-p`{.verbatim}.

(Release \<2023-11-04 Sat\>)

# Release of "Compat" Version 29.1.4.2 {#release-of-compat-version-29.1.4.2}

- compat-28: Improve `make-separator-line`{.verbatim} visuals on graphic displays.
- compat-28: Add `native-comp-available-p`{.verbatim}, which always returns nil.
- compat-29: Add variable `lisp-directory`{.verbatim}.

(Release \<2023-07-30 Sun\>)

# Release of "Compat" Version 29.1.4.1 {#release-of-compat-version-29.1.4.1}

- compat-29: Add `directory-abbrev-apply`.
- compat-29: Add `directory-abbrev-make-regexp`.

(Release \<2023-03-26 Sun\>)

# Release of "Compat" Version 29.1.4.0 {#release-of-compat-version-29.1.4.0}

- compat-27: Drop obsolete `compat-call dired-get-marked-files`.
- compat-28: Add support for `defcustom` type `natnum`.
- compat-29: Add `with-restriction` and `without-restriction`.
- compat-29: Add `cl-constantly`.
- compat-29: Drop `with-narrowing` which was renamed to `with-restriction`.
- compat-28: Add support for `defcustom` type `key`.

(Release \<2023-03-05 Sun\>)

# Release of "Compat" Version 29.1.3.4 {#release-of-compat-version-29.1.3.4}

- Ensure that `seq` is required properly both at compile time and runtime, such that compilation of downstream packages works even if Compat itself is not compiled. Magit uses a complex continuous integration system, where Magit is compiled and tested, while the Compat dependency is not compiled.
- compat-28: Add `process-lines-handling-status` and `process-lines-ignore-status`.

(Release \<2023-02-11 Sat\>)

# Release of "Compat" Version 29.1.3.3 {#release-of-compat-version-29.1.3.3}

- compat-27: Add `with-suppressed-warnings`.
- compat-29: Add `cl-with-gensyms` and `cl-once-only`.
- compat-29: Load `seq`, which is preloaded on Emacs 29.

(Release \<2023-02-08 Wed\>)

# Release of "Compat" Version 29.1.3.2 {#release-of-compat-version-29.1.3.2}

- compat-26: Add `make-temp-file` with optional argument TEXT.
- compat-27: Mark `compat-call dired-get-marked-files` as obsolete. See the section limitations in the Compat manual.
- compat-29: Add `funcall-with-delayed-message` and `with-delayed-message`.
- compat-29: Add `ert-with-temp-file` and `ert-with-temp-directory`.
- compat-29: Add `set-transient-map` with optional arguments MESSAGE and TIMEOUT.

(Release \<2023-02-01 Wed\>)

# Release of "Compat" Version 29.1.3.1 {#release-of-compat-version-29.1.3.1}

- Fix regression, which prevented loading Compat in interpreted mode. We ensure that Compat works interpreted and byte compiled by running the entire test suite twice in the CI. See <https://github.com/magit/magit/issues/4858> for the corresponding Magit issue.
- compat-27: Add `file-name-unquote`.
- compat-28: Add `mark-thing-at-mouse`.
- compat-29: Replace `string-lines` with version from Emacs 29, support optional KEEP-NEWLINES argument.

(Release \<2023-01-25 Wed\>)

# Release of "Compat" Version 29.1.3.0 {#release-of-compat-version-29.1.3.0}

- compat-25: Add `hash-table-empty-p`.
- compat-25: Add `macroexp-parse-body` and `macroexp-quote`.
- compat-25: Add `region-noncontiguous-p`.
- compat-25: Add `save-mark-and-excursion`.
- compat-26: Add `read-answer`.
- compat-26: Add `region-bounds`.
- compat-27: Add `date-ordinal-to-time`.
- compat-27: Add `file-size-human-readable-iec`.
- compat-27: Add `major-mode-suspend` and `major-mode-restore`.
- compat-27: Add `make-decoded-time`.
- compat-27: Add `minibuffer-history-value`.
- compat-27: Add `read-char-from-minibuffer`.
- compat-27: Add `ring-resize`.
- compat-28: Add `color-dark-p`.
- compat-28: Add `directory-files-and-attributes` with COUNT argument.
- compat-28: Add `text-quoting-style`.
- compat-28: Add `with-window-non-dedicated`.
- compat-29: Add `buffer-local-set-state` and `buffer-local-restore-state`.
- compat-29: Add `compiled-function-p`.
- compat-29: Add `count-sentences`.
- compat-29: Add `delete-line`.
- compat-29: Add `get-scratch-buffer-create`.
- compat-29: Add `list-of-strings-p`.
- compat-29: Add `plist-get` generalized variable.
- compat-29: Add `plistp`.
- compat-29: Add `read-multiple-choice` with LONG-FORM argument.
- compat-29: Add `readablep`.
- compat-29: Add `substitute-quotes`.
- compat-29: Add `use-region-beginning`, `use-region-end` and `use-region-noncontiguous-p`.
- compat-29: Add `with-narrowing`.

(Release \<2023-01-22 Sun\>)

# Release of "Compat" Version 29.1.2.0 {#release-of-compat-version-29.1.2.0}

- All compatibility functions are covered by tests!
- Add links from compatibility definitions to tests.
- BREAKING: Drop JSON parsing support (libjansson API, unused downstream).
- BREAKING: Drop `null-device` (unused downstream).
- BREAKING: Drop `unlock-buffer` (unused downstream).
- compat-26: Add `buffer-hash`.
- compat-27: Add `fixnump` and `bignump`.
- compat-27: Add `with-minibuffer-selected-window`.
- compat-27: Add generalized variables for `decoded-time-*`.
- compat-28: Add `macroexp-warn-and-return`.
- compat-28: Add `subr-native-elisp-p`.
- compat-28: Add `bounds-of-thing-at-mouse`.
- compat-29: Add `with-buffer-unmodified-if-unchanged`.
- compat-29: Fix and test `define-key` with REMOVE argument.

(Release \<2023-01-16 Mon\>)

# Release of "Compat" Version 29.1.1.1 {#release-of-compat-version-29.1.1.1}

- Add tests, 167 out of 203 definitions tested (82%).
- compat-25: Improve algorithmic complexity of `sort`.
- compat-28: Add `make-separator-line`.
- compat-29: Minor fixes to `keymap-*` functions.
- compat-29: Add `with-memoization`.
- compat-29: Add `buttonize` and `buttonize-region`.

(Release \<2023-01-14 Sat\>)

# Release of "Compat" Version 29.1.1.0 {#release-of-compat-version-29.1.1.0}

- The macros in `compat-macs.el` have been rewritten and simplified. The refactoring allows to further refine the criteria under which compatibility aliases, functions, macros and variables are installed.
- Remove deprecated, prefixed compatibility functions.
- Remove deprecated features `compat-help`, `compat-font-lock` and `compat-24`.
- Compat uses runtime checks (`boundp`, `fboundp`) to ensure that existing definitions are never overridden, when Compat is loaded on a newer Emacs than it was compiled on.
- Compat compiles without byte compilation warnings on all supported Emacs versions. Warnings are treated as errors in the test suite.
- Compat takes great care to remove unneeded definitions at compile time. On recent Emacs 29 the byte compiled files are empty and not loaded, such that Compat does not any cost to the Emacs process.
- compat-26: Fix and test `image-property` setter.
- compat-26: Fix and test `read-multiple-choice`.
- compat-28: Fix and test `with-existing-directory`.
- compat-28: Drop obsolete function `make-directory-autoloads`.
- compat-29: Drop broken functions `string-pixel-width` and `buffer-text-pixel-size`. These functions had poor performance which lead to a downstream issue in the doom-modeline package. If a more efficient solution is possible, the function will be added back. See [compat-gh:8](compat-gh:8) for the bug report.
- compat-29: Drop broken function `string-limit`.
- compat-29: Drop broken macro `with-buffer-unmodified-if-unchanged`, which relied on `buffer-hash` which does not exist on all supported Emacs versions.
- compat-29: Add `pos-bol` and `pos-eol`.

(Release \<2023-01-07 Sat\>)

# Release of "Compat" Version 29.1.0.1 {#release-of-compat-version-29.1.0.1}

- Add multiple new tests for existing APIs.
- Fix bugs in compatibility functions: `setq-local`, `proper-list-p, prop-match-p`, `file-name-concat`, `replace-regexp-in-region`, `replace-string-in-region`.
- Add new Emacs 29 APIs. Some of them are still untested and may change. If you intend to use an Emacs 29 API please be careful and if possible contribute test cases. All untested functions are marked in the Compat code. Over time tests for all functions will be added gradually.
- Add the macros `compat-call` and `compat-function` to call compatibility functions. Since Compat avoids overwriting already existing functions, we must define separate compatibility function definitions for functions which changed their calling convention or behavior. These compatibility definitions can be looked up using `compat-function` and called with `compat-call`. For example `assoc` can be called with a `TESTFN` since Emacs 26. In Emacs 25 and older the calling convention was `(assoc KEY ALIST)`. In order to use the new calling convention you can use `(compat-call assoc KEY ALIST TESTFN)`.
- Deprecate all `compat-*` prefixed functions. Instead use the aforementioned `compat-call` or `compat-function` macros.
- Deprecate `compat-help.el` and `compat-font-lock.el.`
- Development moved to GitHub.
- BREAKING: Drop broken function `func-arity`. Using `func-arity` is generally discouraged and the function is hard to implement properly due to all the various function types. There it is unlikely that the function will get reintroduced in Compat.
- BREAKING: Drop broken function `directory-files-recursively`. In case you need this function, a patch including tests is welcome.
- BREAKING: Drop support for Emacs 24.3. Emacs 24.4 is required now. In case you still need Emacs 24.3 support, you can rely on Compat 28.1.2.2.

(Release \<2023-01-05 Thu\>)

# Release of "Compat" Version 28.1.2.2 {#release-of-compat-version-28.1.2.2}

This is a minor release that hopes to address [compat-srht:7](compat-srht:7).

(Release \<2022-08-25 Thu\>)

# Release of "Compat" Version 28.1.2.1 {#release-of-compat-version-28.1.2.1}

This is a minor release adding the following changes:

- Add `derived-mode-p`{.verbatim} defined in Emacs 27
- Add `provided-mode-derived-p`{.verbatim} defined in Emacs 27
- Add `read-multiple-choice`{.verbatim} defined in Emacs 26
- Add `file-name-absolute-p`{.verbatim} defined in Emacs 28

The only other notable change is that the manual has been rewritten to include much more documentation that had been the case previously.

(Release \<2022-08-24 Wed\>)

# Release of "Compat" Version 28.1.2.0 {#release-of-compat-version-28.1.2.0}

The main change of this release has been the major simplification of Compat's initialisation system, improving the situation around issues people had been reporting ([compat-srht:4](compat-srht:4), once again) with unconventional or unpopular packaging systems.

In addition to this, the following functional changes have been made:

- Fix `format-prompt`{.verbatim} of an empty string as "default" argument
- Add `decoded-time-period`{.verbatim} defined in Emacs 28
- Add `subr-primitive-p`{.verbatim} defined in Emacs 28

Minor improvements to manual are also part of this release.

(Release \<2022-07-18 Mon\>)

# Release of "Compat" Version 28.1.1.3 {#release-of-compat-version-28.1.1.3}

This release just contains a hot-fix for an issue introduced in the last version, where compat.el raises an error during byte compilation. See [compat-srht:4](compat-srht:4).

(Release \<2022-06-19 Sun\>)

# Release of "Compat" Version 28.1.1.2 {#release-of-compat-version-28.1.1.2}

Two main changes have necessitated a new patch release:

1.  Fix issues related to the loading of compat when uncompiled. See [this thread](https://lists.sr.ht/~pkal/compat-devel/%3C20220530191000.2183047-1-jonas%40bernoul.li%3E) for more details on the problem.
2.  Fix issues related to the loading of compat on old pre-releases (think of 28.0.50). See [this thread](https://lists.sr.ht/~pkal/compat-devel/%3Cf8635d7d-e233-448f-b325-9e850363241c%40www.fastmail.com%3E) for more details on the problem.

(Released \<2022-06-22 Wed\>)

# Release of "Compat" Version 28.1.1.1 {#release-of-compat-version-28.1.1.1}

This is a minor release fixing a bug in `json-serialize`{.verbatim}, that could cause unintended side-effects, not related to packages using Compat directly (see [compat-srht:2](compat-srht:2)).

(Released \<2022-05-05 Thu\>)

# Release of "Compat" Version 28.1.1.0 {#release-of-compat-version-28.1.1.0}

This release mostly fixes a number of smaller bugs that were not identified as of 28.1.0.0. Nevertheless these warrant a version bump, as some of these changes a functional. These include:

- The addition of the `file-attribute-*`{.verbatim} accessor functions.
- The addition of `file-attribute-collect`{.verbatim}.
- Improvements to the Texinfo manual (via Jonas Bernoulli's recent work on `ox-texinfo`{.verbatim}). For the time being, the Texinfo file is maintained in the repository itself, next to the `MANUAL`{.verbatim} file. This might change in the future.
- Adding a prefix to `string-trim`{.verbatim}, `string-trim-left`{.verbatim} and `string-trim-right`{.verbatim} (i.e. now `compat-string-trim`{.verbatim}, `compat-string-trim-left`{.verbatim} and `compat-string-trim-right`{.verbatim})
- Improving the version inference used in the `compat-*`{.verbatim} macros. This improves the compile-time optimisation that strips away functions that are known to be defined for a specific version.
- The addition of generalised variable (`setf`{.verbatim}) support for `compat-alist-get`{.verbatim}.
- The addition of `image-property`{.verbatim} and generalised variable support for `image-property`{.verbatim}.
- The addition of the function `compat-executable-find`{.verbatim}.
- The addition of the function `compat-dired-get-marked-files`{.verbatim}.
- The addition of the function `exec-path`{.verbatim}.
- The addition of the function `make-lock-file-name`{.verbatim}.
- The addition of the function `null-device`{.verbatim}.
- The addition of the function `time-equal-p`{.verbatim}.
- The addition of the function `date-days-in-month`{.verbatim}.
- Handling out-of-directory byte compilation better.
- Fixing the usage and edge-cases of `and-let*`{.verbatim}.

(Released \<2022-04-22 Fri\>)

—

\<!– source: archive/library/emacs/references/packages/dash/NEWS–000778.md –\>

\## Imported source: archive/library/emacs/references/packages/dash/NEWS–000778.md

Copyright (C) 2012-2025 Free Software Foundation, Inc.

See the end of the file for license conditions.

\## Change log

\### From 2.19.1 to 2.20.0

\#### Deprecations

- Calling \`-zip\` with two arguments now emits a warning. This long-discouraged calling convention remains supported, but the caller is now referred to the equivalent \`-zip-pair\` instead (Stefan Monnier, \#400).
- Calling \`-zip-pair\` with less than or more than two arguments is now deprecated, and can be replaced with the equivalent call to \`-zip-lists\` instead.

\#### Fixes

- Fixed a regression from \`2.18\` in \`-take\` that caused it to prematurely signal an error on improper lists (#393).

- The function \`-pad\` can now be called with zero lists as arguments.

- The functions \`-union\`, \`-intersection\`, and \`-difference\` now return proper sets, without duplicate elements (#397).

- The functions \`-same-items?\` and \`-permutations\` now work on multisets (lists with duplicate elements) (#390, \#397, \#399).

  For example:

  \`\`\`el (-same-items? '(1 1 2 3) '(3 1 2)) ; =\> t (-permutations '(1 1 2)) ; =\> '((1 1 2) (1 2 1) (2 1 1)) \`\`\`

- Several functions which are documented as returning a fresh, mutable object (such as a copy of one of their arguments) are no longer marked as \`pure\`. Pure functions called with constant arguments are evaluated during byte-compilation; the resulting value is an immutable constant, and thus unsafe to modify destructively. The functions in question are: \`-clone\`, \`-cons\*\`, \`-drop-last\`, \`-interleave\`, \`-interpose\`, \`-iota\`, \`-non-nil\`, \`-repeat\`, \`-slice\`, \`-snoc\`, \`-split-at\`, \`-take\`, \`-take-last\`.

\#### New features

- The function \`-contains?\` now returns the matching tail of the list instead of just \`t\`, similarly to \`member\` (#397).
- New function \`-frequencies\` that takes a list and counts how many times each distinct element occurs in it (suggested by @ebpa, \#209, \#214, \#399).
- New functions \`-zip-lists-fill\` and \`-unzip-lists\` which are better-behaved versions of \`-zip-fill\` and \`-unzip\`, respectively (#400).

\### From 2.19.0 to 2.19.1

\#### Fixes

- Fixed a regression from \`2.18\` in \`-is-suffix-p\` which led to false negatives when parts of the suffix appeared multiple times in the list being searched (Bennett Rennier, \#384).

\### From 2.18.1 to 2.19.0

\#### Fixes

- Reverted a breaking change introduced in \`2.18.0\` that caused the threading macro \`–\>\` to be indented differently from \`-\>\` and \`-\>\>\` (#375).
- Added and fixed Edebug specifications for many Dash macros (Philipp Stephani, \#380, \#381).

\#### New features

- The combinators \`-on\`, \`-flip\`, \`-not\`, \`-andfn\`, and \`-orfn\` now return variadic functions that take any number of arguments (#308).
- New combinator \`-rotate-args\` similar to \`-flip\`, but for arbitrary arglist rotations (suggested by @vapniks, \#72).
- New function \`-every\` and its anaphoric macro counterpart \`–every\`. They are like the existing \`-every-p\` and \`–every-p\`, respectively, but return the last non-\`nil\` result instead of just \`t\`.
- New macro \`–partition-after-pred\` which affords \`-partition-after-pred\` better performance (Per Weijnitz, \#362).

\### From 2.18.0 to 2.18.1

- Fixed a regression from \`2.17\` as well as a long-standing bug in \`–iterate\`, which evaluated its arguments one too many times. This in turn could lead to errors in \`-flatten-n\` when it tried flattening certain structures too far (#373).

\### From 2.17 to 2.18

This release absorbs the now obsolete \`dash-functional\` version \`1.3.0\` into \`dash\`, and brings the very old version of \`dash\` on GNU ELPA up to date.

Package maintainers should replace all uses of \`dash-functional\`, which will eventually be deleted, with \`dash\` version \`2.18.0\`. For more information on this, see: <https://github.com/magnars/dash.el/wiki/Obsoletion-of-dash-functional.el>

- New function \`-iota\` for generating arithmetic sequences (@holomorph, \#215).

- Calling \`-list\` with more than one argument is now deprecated.

- \`-lambda\` now accepts an empty argument list.

- New anaphoric macros \`–reductions-from\`, \`–reductions\`, \`–reductions-r-from\`, and \`–reductions-r\` corresponding to the analogous non-anaphoric functions.

- \`-doto\` threading now works as with \`-\>\`.

- New buffer-local minor mode \`dash-fontify-mode\` and globalized counterpart \`global-dash-fontify-mode\` for fontifying special Dash variables such as \`it\`, \`it-index\`, \`acc\`, etc. The minor mode also fontifies calls to Dash macros in older Emacs versions which did not dynamically detect macro calls.

  This obsoletes the user option \`dash-enable-fontlock\` and the function \`dash-enable-font-lock\`, which is now an alias of \`global-dash-fontify-mode\`.

- New command \`dash-register-info-lookup\` for integration with \`C-h S\` (\`info-lookup-symbol\`). This command allows Dash symbols to be looked up in the Dash manual just like Elisp symbols are looked up in the Elisp manual. The command can be called directly when needed, or automatically from your \`user-init-file\`. For example:

  \`\`\`el (with-eval-after-load 'info-look (dash-register-info-lookup)) \`\`\`

- Dash is now listed under the standard \[Customization groups\](<https://gnu.org/software/emacs/manual/html_node/emacs/Customization-Groups.html>) and \[Finder keywords\](<https://gnu.org/software/emacs/manual/html_node/emacs/Package-Keywords.html>) \`extensions\` and \`lisp\`.

- The Dash manual is now licensed under the GNU Free Documentation License version 1.3.

- Various other bug fix, performance, byte-compilation, and documentation improvements.

\### From 2.16 to 2.17

- Sped up \`-uniq\` by using hash-tables when possible (@cireu, \#305).
- Fixed \`-inits\` to be non-destructive (@SwiftLawnGnome, \#313).
- Fixed indent rules for \`-some-\>\` and family (@wbolster, \#321).
- Added \`-zip-lists\` which always returns a list of proper lists, even for two input lists, in contrast to \`-zip\` (see issue \#135).

\### From 2.15 to 2.16

- Added \`–doto\`, anaphoric version of \`-doto\` (#282).
- Aliased \`-cons-pair-p\` to \`-cons-pair?\` (#288).
- Generalized \`-rotate\` for \`\|N\|\` greater than the length of the list (@leungbk, \#290).
- Added a mechanism to extend destructuring with custom matchers (@yyoncho, \#277).

\### From 2.14 to 2.15

This release brings new destructuring features, some new control flow functions and performance optimizations.

- Added \`-setq\` with destructuring binding support similar to the \`-let\` family (#116).
- Added smarter key destructuring in \`-let\` and friends where variables are auto-derived from keys (#111).
- Allowed \`-let\` bindings without a source value form (#256).
- Added \`-each-r\` and \`-each-r-while\` (@doublep, \#159).
- Added \`-common-suffix\` (@basil-conto, \#263).
- Improved performance of folds (\`-reduce\` and friends) (@basil-conto, \#264).

\### From 2.13 to 2.14

This release retired Emacs 23 support.

- Added Edebug support for threading macros (@Wilfred).
- Added \`-unzip\`.
- Added support for \`-first-item\` and \`-last-item\` as \[place forms\](<https://gnu.org/software/emacs/manual/html_node/elisp/Generalized-Variables.html>).
- Added \`-powerset\` and \`-permutations\` (@holomorph).
- Added \`-as-\>\` for threading a named variable (@zck).
- Added \`-partition-after-pred\`, \`-partition-before-pred\`, \`-partition-after-item\`, and \`-partition-before-item\` (@zck).
- Fixed a bug in \`-any-p\` and friends testing for \`null\` on lists containing \`nil\` (#239).
- Fixed infinite loop bug in \`-zip\` and \`-interleave\` when called with empty input.
- Added \`-second-item\` through \`-fifth-item\` as alternatives to \`nth\` (@Wilfred).
- Added \`-tails\` and \`-inits\`.
- Added \`-running-sum\` and \`-running-product\`.
- Added the \`-reductions\[-r\]\[-from\]\` family of functions (like \`-reduce\` but collecting intermediate results).
- Added \`-common-prefix\` (@basil-conto).

\### From 2.12 to 2.13

- \`-let\` now supports \`&alist\` destructuring.
- Various performance improvements.
- \`-zip\` might change in a future release to always return a list of proper lists. Added \`-zip-pair\` for users who explicitly want the old behavior.
- Enabled lexical binding in \`dash.el\` for Emacs versions 24 or newer (#130).
- Added \`-select-column\` and \`-select-columns\`.
- Fixed \`-map-last\` and \`–remove-last\` to be non-destructive (#158).
- Added \`-each-indexed\` and \`–each-indexed\`.
- Added \`-take-last\` and \`-drop-last\`.
- Added the \`-doto\` macro.
- \`-cut \<\>\` is now treated as a function, consistent with \[SRFI 26\](<https://srfi.schemers.org/srfi-26/srfi-26.html>) (#185).

\### From 2.11 to 2.12

- Added GNU ELPA support (Phillip Lord).
- Added \`-some-\>\`, \`-some-\>\>\`, and \`-some–\>\` macros (Cam Saul).
- \`-is-suffix?\` is now non-destructive.
- Faster hash table implementation for \`-union\`.
- Improvements to docstrings and examples.

\### From 2.10 to 2.11

- Lots of clean up w.r.t. byte compilation, debug macros, and tests.

\### From 2.9 to 2.10

- Added \`-let\` destructuring to \`-if-let\` and \`-when-let\` (Fredrik Bergroth).

\### From 2.8 to 2.9

- Added \`-let\`, \`-let\*\`, and \`-lambda\` with destructuring.
- Added \`-tree-seq\` and \`-tree-map-nodes\`.
- Added \`-non-nil\`.
- Added \`-fix\`.
- Added \`-fixfn\` (\`dash-functional\` version \`1.2\`).
- Added \`-copy\` (Wilfred Hughes).

\### From 2.7 to 2.8

- Added \`-butlast\`.

\### From 2.6 to 2.7

- \`-zip\` now supports more than two lists (Steve Lamb).
- Added \`-cycle\`, \`-pad\`, \`-annotate\`, and \`-zip-fill\` (Steve Lamb).
- Added \`-table\`, \`-table-flat\` (finite Cartesian product).
- Added \`-flatten-n\`.
- \`-slice\` now supports a "step" argument.
- Added functional combinators \`-iteratefn\` and \`-prodfn\`.
- Added \`-replace\`, \`-splice\`, and \`-splice-list\` which generalize \`-replace-at\` and \`-insert-at\`.
- Added \`-compose\`, \`-iteratefn\`, and \`-prodfn\` (\`dash-functional\` version \`1.1\`).

\### From 2.5 to 2.6

- Added \`-is-prefix-p\`, \`-is-suffix-p\`, and \`-is-infix-p\` (Matus Goljer).
- Added \`-iterate\` and \`-unfold\` (Matus Goljer).
- Added \`-split-on\` and \`-split-when\` (Matus Goljer).
- Added \`-find-last-index\` (Matus Goljer).
- Added \`-list\` (Johan Andersson).

\### From 2.4 to 2.5

- Added \`-same-items?\` (Johan Andersson).
- Various bugfixes.

\### From 2.3 to 2.4

- Added \`-snoc\` (Matus Goljer).
- Added \`-replace-at\`, \`-update-at\`, \`-remove-at\`, and \`-remove-at-indices\` (Matus Goljer).

\### From 2.2 to 2.3

- Added tree operations (Matus Goljer).
- Made Font Lock optional.

\### From 2.1 to 2.2

- Added \`-compose\` (Christina Whyte).

\### From 2.0 to 2.1

- Added indexing operations (Matus Goljer).

\### From 1.8 to 2.0

- Split out \`dash-functional.el\` (Matus Goljer).
- Added \`-andfn\`, \`-orfn\`, \`-not\`, \`-cut\`, \`-const\`, \`-flip\`, and \`-on\` (Matus Goljer).
- Fixed \`-min\`, \`-max\`, \`-min-by\`, and \`-max-by\` (Matus Goljer).

\### From 1.7 to 1.8

- Added \`-first-item\` and \`-last-item\` (Wilfred Hughes).

\### From 1.6 to 1.7

- Added \`-rotate\` (Matus Goljer).

\### From 1.5 to 1.6

- Added \`-min\`, \`-max\`, \`-min-by\`, and \`-max-by\` (Johan Andersson).

\### From 1.4 to 1.5

- Added \`-sum\` and \`-product\` (Johan Andersson).

\### From 1.3 to 1.4

- Added \`-sort\`.
- Added \`-reduce-r\` (Matus Goljer).
- Added \`-reduce-r-from\` (Matus Goljer).

\### From 1.2 to 1.3

- Added \`-partition-in-steps\`.
- Added \`-partition-all-in-steps\`.

\### From 1.1 to 1.2

- Added \`-last\` (Matus Goljer).
- Added \`-insert-at\` (Emanuel Evans).
- Added \`-when-let\` and \`-if-let\` (Emanuel Evans).
- Added \`-when-let\*\` and \`-if-let\*\` (Emanuel Evans).
- Various bugfixes.

\## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

—

\<!– source: archive/library/emacs/references/packages/olivetti/NEWS–000901.md –\>

\## Imported source: archive/library/emacs/references/packages/olivetti/NEWS–000901.md

\## Version 2.0.7

- Only scale body width with \`text-scale-mode\` for integer body width

\## Version 2.0.6

- Reset window margins upon exit.

\## Version 2.0.5

- Prevent initialize failure in console Emacs (#71).
- Quote mouse wheel events.
- Require \`face-remap\`.

\## Version 2.0.4

- Add \`olivetti-mode-off-hook\` option

\## Version 2.0.3

- Explicitly require fringe for console Emacs versions \< 27

\## Version 2.0.2

- Fix option misspelling of \`olivetti-minimum-body-width\`

\## Version 2.0.1

- Fix \`olivetti-reset-window\` with cons \`fringe-mode\` value

\## Version 2.0.0

- New option \`olivetti-style\` allows a choice of window elements to balance text body:

  \`nil\` margins (default) \`t\` fringes \`fancy\` fringes and margins (fringes outside)

- Add \`olivetti-fringe\` face, remapped in olivetti buffers

- Change default value of \`olivetti-body-width\` to \`nil\`, which calculates to \`fill-column\` +2

- Rewrite internals to use pixels

- Avoid overriding \`split-window-preferred-function\`

- Call \`mouse-set-point\` to move point when clicking in margins and fringes

- Fix calling \`olivetti-set-width\` with prefix arg as width

- Kill local variables on quit

- Walk all windows when calling \`olivetti-reset-all-windows\`, not just windows in the current frame

- Remove obsolete \`olivetti-enable-visual-line-mode\`

- Remove use of \`min-margins\` window parameter

- Remove obsolete alias for \`turn-on-olivetti-mode\`

- \`olivetti-(shrink\|expand)\` now allow setting body width to any value, no matter how stupid

- Simplify code

\## Version 1.11.4

- On quit, only activate \`visual-line-mode\` if it was enabled before and not now; only deactivate \`visual-line-mode\` if it was disabled before and enabled. This prevents killing local variable \`truncate-lines\`.

\## Version 1.11.3

- Update copyright, email, URLs

\## Version 1.11.2

- Make \`set-transient-map\` a little more safe
- History is now tracked in a fancy NEWS file

\## Version 1.11.1

- Fix issue when deactivating olivetti in single window with multiple windows with olivetti active in frame (#50)

This release is not affiliated with CloudFlare DNS :)

\## Version 1.11.0

- Use \`olivetti-mode-on-hook\` to enable \`visual-line-mode\` rather than \`olivetti-enable-visual-line-mode\`. This option is marked obsolete and has a setter function to add/remove visual-line-mode to the hook.
- Implement scrolling when pointer is in margin [^1]
- Added undocumented \`C-c \|\` binding shadowing \`C-\\
- Refactor code for clarity.

[^1]:
    ``` example
    https://www.gnu.org/software/emacs/manual/html_node/elisp/Lexical-Binding.html
    ```

    \## Version 1.4.0

    - Added a feature by @larstvei to more easily use \`olivetti-shrink\` and \`olivetti-expand\` by pressing \`\[ \`or \`\]\` in succession:

      \`olivetti-shrink C-c \[ \[ \[ …\` \`olivetti-expand C-c \] \] \] …\`

    \## Version 1.3.0

    - Olivetti now acts uniformly on all windows displaying the current buffer.

    - Olivetti now has a keymap. Interactively change olivetti-body-width with:

      \`olivetti-shrink C-c \[\` \`olivetti-expand C-c \]\` and \`olivetti-set-width\`

    - Optionally remember the state of \`visual-line-mode\` on entry and recall its state on exit.

    - Fixes some bad behaviour when exiting (ref \#7).

    - Added some missing docs.

    \## Version 1.2.0

    - Added integration with \`text-scale-mode\` (#5)

    \## Version 1.1.1

    - Fixed \#3
    - Allow \`olivetti-set-width\` to accept any number

    \## Version 1.1.0

    - Made \`olivetti-body-width\` a buffer-local variable, so buffers can have different text body widths
    - Added \`olivetti-set-width\` to interactively change the text body width
    - Added \`olivetti-expand\` and \`olivetti-shrink\` to change the text body width incrementally
    - Always checks that the text body width is "safe"
    - Hard-coded \`visual-line-mode\` and removed mode hook bug

    \## Version 1.0.1

    - Fixes \#1

    \## Version 1.0.0

    - Set a desired text body width to automatically resize window margins to keep the text comfortably in the middle of the window
    - Text body width can be the number of characters (an integer) or a fraction of the window width (a float between 0.0 and 1.0)
    - Optionally hide the modeline for distraction-free writing

    \## Earlier material

    - compat-28: Fix \`named-let\`{.verbatim} tail recursion.

    - compat-30: Rename \`trusted-files\`{.verbatim} to \`trusted-content\`{.verbatim}.

    - compat-30: New variable \`untrusted-content\`{.verbatim}.

    - compat-30: New variable \`trusted-files\`{.verbatim}.

    - compat-30: New function \`trusted-content-p\`{.verbatim}.

    - compat-28: Mark \`subr-native-elisp-p\`{.verbatim} as obsolete (renamed in Emacs 30).

    - compat-30: New function \`char-to-name\`{.verbatim}.

    - compat-30: New function \`obarray-clear\`{.verbatim}.

    - compat-30: New function \`interpreted-function-p\`{.verbatim}.

    - compat-30: New function \`primitive-function-p\`{.verbatim}.

    - compat-30: New function \`closurep\`{.verbatim}.

    - compat-30: Add extended function \`sort\`{.verbatim} with keyword arguments.

    - compat-30: New function \`value\<\`{.verbatim}.

    - compat-30: Add extended \`copy-tree\`{.verbatim} with support for copying records with non-nil optional second argument.

    - compat-30: New macro \`static-if\`{.verbatim}.

    - compat-30: New alias \`drop\`{.verbatim}.

    - compat-30: New function \`merge-ordered-lists\`{.verbatim}.

    - compat-30: New variables \`completion-lazy-hilit\`{.verbatim} and \`completion-lazy-hilit-fn\`{.verbatim} and new function \`completion-lazy-hilit\`{.verbatim}.

    - compat-30: New function \`require-with-check\`{.verbatim}.

    - compat-30: New functions \`find-buffer\`{.verbatim} and \`get-truename-buffer\`{.verbatim}.

    - compat-30: Add extended \`completion-metadata-get\`{.verbatim} with support for \`completion-category-overrides\`{.verbatim} and \`completion-extra-properties\`{.verbatim}.

    - compat-29: Add function \`char-uppercase-p\`{.verbatim}.

    - compat-29: Add function \`window-configuration-equal-p\`{.verbatim}.

    - compat-28: Improve \`make-separator-line\`{.verbatim} visuals on graphic displays.

    - compat-28: Add \`native-comp-available-p\`{.verbatim}, which always returns nil.

    - compat-29: Add variable \`lisp-directory\`{.verbatim}.

    This is a minor release that hopes to address \[compat-srht:7\](compat-srht:7).

    - Add \`derived-mode-p\`{.verbatim} defined in Emacs 27

    - Add \`provided-mode-derived-p\`{.verbatim} defined in Emacs 27

    - Add \`read-multiple-choice\`{.verbatim} defined in Emacs 26

    - Add \`file-name-absolute-p\`{.verbatim} defined in Emacs 28

    - Fix \`format-prompt\`{.verbatim} of an empty string as "default" argument

    - Add \`decoded-time-period\`{.verbatim} defined in Emacs 28

    - Add \`subr-primitive-p\`{.verbatim} defined in Emacs 28

    1.  Fix issues related to the loading of compat when uncompiled. See \[this thread\](<https://lists.sr.ht/~pkal/compat-devel/%3C20220530191000.2183047-1-jonas%40bernoul.li%3E>) for more details on the problem.
    2.  Fix issues related to the loading of compat on old pre-releases (think of 28.0.50). See \[this thread\](<https://lists.sr.ht/~pkal/compat-devel/%3Cf8635d7d-e233-448f-b325-9e850363241c%40www.fastmail.com%3E>) for more details on the problem.

    This is a minor release fixing a bug in \`json-serialize\`{.verbatim}, that could cause unintended side-effects, not related to packages using Compat directly (see \[compat-srht:2\](compat-srht:2)).

    - The addition of the \`file-attribute-\*\`{.verbatim} accessor functions.
    - The addition of \`file-attribute-collect\`{.verbatim}.
    - Improvements to the Texinfo manual (via Jonas Bernoulli's recent work on \`ox-texinfo\`{.verbatim}). For the time being, the Texinfo file is maintained in the repository itself, next to the \`MANUAL\`{.verbatim} file. This might change in the future.
    - Adding a prefix to \`string-trim\`{.verbatim}, \`string-trim-left\`{.verbatim} and \`string-trim-right\`{.verbatim} (i.e. now \`compat-string-trim\`{.verbatim}, \`compat-string-trim-left\`{.verbatim} and \`compat-string-trim-right\`{.verbatim})
    - Improving the version inference used in the \`compat-\*\`{.verbatim} macros. This improves the compile-time optimisation that strips away functions that are known to be defined for a specific version.
    - The addition of generalised variable (\`setf\`{.verbatim}) support for \`compat-alist-get\`{.verbatim}.
    - The addition of \`image-property\`{.verbatim} and generalised variable support for \`image-property\`{.verbatim}.
    - The addition of the function \`compat-executable-find\`{.verbatim}.
    - The addition of the function \`compat-dired-get-marked-files\`{.verbatim}.
    - The addition of the function \`exec-path\`{.verbatim}.
    - The addition of the function \`make-lock-file-name\`{.verbatim}.
    - The addition of the function \`null-device\`{.verbatim}.
    - The addition of the function \`time-equal-p\`{.verbatim}.
    - The addition of the function \`date-days-in-month\`{.verbatim}.
    - Handling out-of-directory byte compilation better.
    - Fixing the usage and edge-cases of \`and-let\*\`{.verbatim}.
