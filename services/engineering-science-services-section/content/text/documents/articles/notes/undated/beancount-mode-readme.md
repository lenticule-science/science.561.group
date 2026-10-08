---
title: Emacs major-mode to work with Beancount ledger files
description: This package provides beancount-mode{.verbatim} an Emacs major-mode implementing syntax highlighting, indentation, completion , and other facilities to edit and work with Beancount ledger files.
---

This package provides `beancount-mode`{.verbatim} an Emacs [major-mode](https://www.gnu.org/software/emacs/manual/html_node/emacs/Major-Modes.html) implementing syntax highlighting, indentation, completion , and other facilities to edit and work with Beancount ledger files.

To instruct Emacs to activate `beancount-mode`{.verbatim} when opening files with a `.beancount` extension, you can add this code to your Emacs configuration, typically in the `~/.emacs.d/init.el`{.verbatim} file:

``` elisp
(add-to-list 'load-path "/path/to/beancount-mode/")
(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))
```

Most facilities commonly provided by Emacs major modes are implemented by `beancount-mode`{.verbatim}. Documentation on the provided functionality and on the default keybindings can be obtained with the `describe-mode`{.verbatim} command in a buffer with `beancount-mode`{.verbatim} active.

In a nutshell, when `beancount-mode`{.verbatim} is active:

- The "TAB" key either indents, completes, or folds the heading at point, depending on the context.

- Amounts in postings are indented so that the decimal point is at the `beancount-number-alignment-column`{.verbatim} column. Setting this variable to 0 will cause the alignment column to be determined from file content.

- Postings in transactions, as well as metadata, links, and tags following directives, and are indented with `beancount-transaction-indent`{.verbatim} spaces.

- Pressing the "RET" key causes the current line to be automatically indented. If the current line is a posting, the amount will be indented as described above.

The automatic indentation behavior is defined by Emacs auto indent mechanism, however, it can be surprising or undesired. It can be disabled setting `electric-indent-chars`{.verbatim} to `nil`{.verbatim} after loading `beancount-mode`{.verbatim}, for example like this:

``` elisp
(add-hook 'beancount-mode-hook
  (lambda () (setq-local electric-indent-chars nil)))
```

Beancount ledger files can grow very large. It is thus often practical to structure them in sections and subsections. To support this, `beancount-mode`{.verbatim} leverages [Outline minor-mode](https://www.gnu.org/software/emacs/manual/html_node/emacs/Outline-Mode.html) to enable navigation of the document structure to fold and unfold the document sections, similarly to what is possible in [Org mode](https://orgmode.org/). Lines starting with one asterisks "`*`{.verbatim}" or three or more semicolons "`;;;`{.verbatim}" are interpreted as section headings. In Beancount, the semicolon starts a comment and all lines starting with an asterisks are ignored. The number of semicolons or asterisks determines the heading level.

To enable this functionality, `outline-minor-mode`{.verbatim} should be explicitly activated. It is possible to do so automatically when `beancout-mode`{.verbatim} is activated:

``` elisp
(add-hook 'beancount-mode-hook #'outline-minor-mode)
```

Outline minor mode uses a rather peculiar choice of keybindings. It is possible to map the most used functionality to keys more familiar to `org-mode`{.verbatim} users adding a few lines to the Emacs configuration:

``` elisp
(define-key beancount-mode-map (kbd "C-c C-n") #'outline-next-visible-heading)
(define-key beancount-mode-map (kbd "C-c C-p") #'outline-previous-visible-heading)
```

Alternatively the keybindings for `outline-minor-mode`{.verbatim} can be globally remapped. Please refer to the `outline-minor-mode`{.verbatim} documentation in the Emacs manual for more details.

You can enable on-the-fly checks on your ledger file using `bean-check`{.verbatim} via flymake:

``` elisp
(add-hook 'beancount-mode-hook #'flymake-bean-check-enable)
```

The `etc/emacsrc`{.verbatim} file contains some example configuration for `beancount-mode`{.verbatim} and some experiments that may find their way into the main codebase.

# Keybinding compatibility

In mid-2023 the default keybindings for many commands in `beancount-mode`{.verbatim} were changed to become compliant with the [Emacs keybinding conventions](https://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Conventions.html). However, if you are accustomed to the old keybindings and would prefer to continue using them, just put this into your Emacs configuration before `beancount.el`{.verbatim} is loaded:

``` elisp
(setq beancount-mode-old-style-keybindings t)
```
