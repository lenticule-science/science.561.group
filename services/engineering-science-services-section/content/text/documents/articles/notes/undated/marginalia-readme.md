---
author: Omar Antolín Camarena, Daniel Mendler
lang: en
title: marginalia.el - Marginalia in the minibuffer
description: This package provides marginalia-mode{.verbatim} which adds marginalia to the minibuffer completions.
---

<a href="https://www.gnu.org/software/emacs/"><img alt="GNU Emacs" src="https://github.com/minad/corfu/blob/screenshots/emacs.svg?raw=true"/></a>
<a href="https://elpa.gnu.org/packages/marginalia.html"><img alt="GNU ELPA" src="https://elpa.gnu.org/packages/marginalia.svg"/></a>
<a href="https://elpa.gnu.org/devel/marginalia.html"><img alt="GNU-devel ELPA" src="https://elpa.gnu.org/devel/marginalia.svg"/></a>
<a href="https://melpa.org/#/marginalia"><img alt="MELPA" src="https://melpa.org/packages/marginalia-badge.svg"/></a>
<a href="https://stable.melpa.org/#/marginalia"><img alt="MELPA Stable" src="https://stable.melpa.org/packages/marginalia-badge.svg"/></a>
<img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Marginalia_%285095211566%29.jpg" align="right" width="30%">

This package provides `marginalia-mode`{.verbatim} which adds marginalia to the minibuffer completions. [Marginalia](https://en.wikipedia.org/wiki/Marginalia) are marks or annotations placed at the margin of the page of a book or in this case helpful colorful annotations placed at the margin of the minibuffer for your completion candidates. Marginalia can only add annotations to the completion candidates. It cannot modify the appearance of the candidates themselves, which are shown unaltered as supplied by the original command.

The annotations are added based on the completion category. For example `find-file`{.verbatim} reports the `file`{.verbatim} category and `M-x`{.verbatim} reports the `command`{.verbatim} category. You can cycle between more or less detailed annotators or even disable the annotator with command `marginalia-cycle`{.verbatim}.

<img src="https://github.com/minad/marginalia/blob/screenshots/marginalia-mode.png?raw=true">

# Configuration

It is recommended to use Marginalia together with either the [Vertico](https://github.com/minad/vertico), [Mct](https://github.com/protesilaos/mct), [Icomplete](https://www.gnu.org/software/emacs/manual/html_node/emacs/Icomplete.html) or the default completion UI. Furthermore Marginalia can be combined with [Embark](https://github.com/oantolin/embark) for action support and [Consult](https://github.com/minad/consult), which provides many useful commands.

``` {.commonlisp org-language="emacs-lisp"}
;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))
```

# Information shown by the annotators

In general, to learn more about what different annotations mean, a good starting point is to look at `marginalia-annotators`, and follow up to the annotation function of the category you are interested in.

For example the annotations for Elisp symbols include their symbol class - `v`{.verbatim} for variable, `f`{.verbatim} for function, `c`{.verbatim} for command, etc. For more information on what the different classifications mean, see the docstring of `marginalia--symbol-class`.

# Adding custom annotators or classifiers

**IMPORTANT NOTICE FOR PACKAGE AUTHORS**: The intention of the Marginalia package is to give the user means to overwrite completion categories and to add custom annotators for existing commands in their user configuration. **Marginalia is a user facing package and is not intended to be used as a library**. Therefore Marginalia does not expose library functions as part of its public API. If you add your own completion commands to your package we recommend to specify an `annotation-function`{.verbatim} or an `affixation-function`{.verbatim}, avoiding the Marginalia dependency this way. The `annotation-function`{.verbatim} and `affixation-function`{.verbatim} are documented in the [Elisp manual](https://www.gnu.org/software/emacs/manual/html_node/elisp/Completion.html). If you use `consult--read`{.verbatim}, you can specify an `:annotate`{.verbatim} keyword argument.

There is an exception to our recommendation: If you want to implement annotations for an existing package `hypothetic.el`{.verbatim}, which does not have annotations and where annotations cannot be added, then the creation of a `marginalia-hypothetic.el`{.verbatim} package is a good idea, since Marginalia provides the facilities to enhance existing commands from the outside.

Commands that support minibuffer completion use a completion table of all the available candidates. Candidates are associated with a **category** such as `command`{.verbatim}, `file`{.verbatim}, `face`{.verbatim}, or `variable`{.verbatim} depending on what the candidates are. Based on the category of the candidates, Marginalia selects an **annotator** to generate annotations for display for each candidate.

Unfortunately, not all commands (including Emacs' builtin ones) specify the category of their candidates. To compensate for this shortcoming, Marginalia hooks into the Emacs completion framework and runs the **classifiers** listed in the variable `marginalia-classifiers`{.verbatim}, which use the command's prompt or other properties of the candidates to specify the completion category.

For example, the `marginalia-classify-by-prompt`{.verbatim} classifier checks the minibuffer prompt against regexps listed in the `marginalia-prompt-categories`{.verbatim} alist to determine a category. The following is already included but would be a way to assign the category `face`{.verbatim} to all candidates from commands with prompts that include the word "face".

``` {.commonlisp org-language="emacs-lisp"}
(add-to-list 'marginalia-prompt-categories '("\\<face\\>" . face))
```

The `marginalia-classify-by-command-name`{.verbatim} classifier uses the alist `marginalia-command-categories`{.verbatim} to specify the completion category based on the command name. This is particularly useful if the prompt classifier yields a false positive.

Completion categories are also important for [Embark](https://github.com/oantolin/embark), which associates actions based on the completion category and benefits from Marginalia's classifiers.

Once the category of the candidates is known, Marginalia looks in the `marginalia-annotators`{.verbatim} to find the associated annotator to use. An annotator is a function that takes a completion candidate string as an argument and returns an annotation string to be displayed after the candidate in the minibuffer. More than one annotator can be assigned to each each category, displaying more, less or different information. Use the `marginalia-cycle`{.verbatim} command to cycle between the annotations of different annotators defined for the current category.

Here's an example of a basic face annotator:

``` {.commonlisp org-language="emacs-lisp"}
(defun my-face-annotator (cand)
  (when-let (sym (intern-soft cand))
    (concat (propertize " " 'display '(space :align-to center))
            (propertize "The quick brown fox jumps over the lazy dog" 'face sym))))
```

After defining a new annotator, associate it with a category in the annotator registry as follows:

``` {.commonlisp org-language="emacs-lisp"}
(add-to-list 'marginalia-annotators
             '(face my-face-annotator marginalia-annotate-face builtin none))
```

This makes the `my-face-annotator`{.verbatim} the first of four annotators for the face category. The others are the annotator provided by Marginalia (`marginalia-annotate-face`{.verbatim}), the `builtin`{.verbatim} annotator as defined by Emacs and the `none`{.verbatim} annotator, which disables the annotations. With this setting, after invoking `M-x describe-face RET`{.verbatim} you can cycle between all of these annotators using `marginalia-cycle`{.verbatim}.

# Disabling annotators, builtin or lightweight annotators

Marginalia activates rich annotators by default. Depending on your preference you may want to use the builtin annotators or even no annotators by default and only activate the annotators on demand by invoking `marginalia-cycle`.

In order to disable an annotator permanently, the `marginalia-annotators` can be modified. For example if you prefer to never see file annotations, you can delete all file annotators from the registry.

``` {.commonlisp org-language="emacs-lisp"}
(setq marginalia-annotators
      (assq-delete-all 'file marginalia-annotators))
```

To use the builtin annotators by default, you can run the following code. Replace `builtin`{.verbatim} by `none`{.verbatim} to disable annotators by default.

``` {.commonlisp org-language="emacs-lisp"}
(mapc (lambda (x)
        (setcdr x (cons 'builtin (remq 'builtin (cdr x)))))
      marginalia-annotators)
```

As an alternative to `marginalia-cycle`, if a completion category supports two annotators, you can toggle between them using the following command.

``` {.commonlisp org-language="emacs-lisp"}
(defun marginalia-toggle ()
  (interactive)
  (mapc
   (lambda (x)
     (setcdr x (append (reverse (remq 'none
                                      (remq 'builtin (cdr x))))
                       '(builtin none))))
   marginalia-annotators))
```

After cycling the annotators you may want to automatically save the configuration. This can be achieved using an advice which calls `customize-save-variable`.

``` {.commonlisp org-language="emacs-lisp"}
(advice-add #'marginalia-cycle :after
            (lambda ()
              (let ((inhibit-message t))
                (customize-save-variable 'marginalia-annotators
                                         marginalia-annotators))))
```

# Icons in the minibuffer

Marginalia focuses on text annotations. The [nerd-icons-completion](https://github.com/rainstormstudio/nerd-icons-completion) package is compatible with Marginalia and uses the special NerdFonts to add icons in front of minibuffer completion candidates. There exist related packages to enhance Dired, Ibuffer, Corfu and other modes with icons consistently.

# Contributions

Since this package is part of [GNU ELPA](https://elpa.gnu.org/packages/marginalia.html) contributions require a copyright assignment to the FSF.
