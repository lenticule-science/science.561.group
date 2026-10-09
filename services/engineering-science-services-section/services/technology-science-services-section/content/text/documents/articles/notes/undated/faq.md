---
title: Frequently Asked Questions
description: If there is a newline at the end of a snippet definition file, YASnippet will add a newline when expanding that snippet.
aliases:
  - Frequently Asked Questions
---

- **Note**: In addition to the questions and answers presented here, you might also with to visit the list of [solved support issues](https://github.com/joaotavora/yasnippet/issues?q=label%3Asupport) in the Github issue tracker. It might be more up-to-date than this list.

# Why are my snippet abbrev keys triggering when I don't want them too?

Expansion of abbrev keys is controlled by [`yas-key-syntaxes`{.verbatim}](sym:yas-key-syntaxes). Try removing entries which correspond to the abbrev key character syntax. For example, if you have a snippet with abbrev key "bar", that you don't want to trigger when point follows the text `foo_bar`{.verbatim}, remove the `"w"`{.verbatim} entry (since "bar" has only word syntax characters).

# Why aren't my snippet abbrev keys triggering when I want them too?

See previous question, but in reverse.

# Why is there an extra newline?

If there is a newline at the end of a snippet definition file, YASnippet will add a newline when expanding that snippet. When editing or saving a snippet file, please be careful not to accidentally add a terminal newline.

Note that some editors will automatically add a newline for you. In Emacs, if you set `require-final-newline`{.verbatim} to `t`{.verbatim}, it will add the final newline automatically.

# Why doesn't TAB navigation work with flyspell

This is [Emacs Bug#26672](https://debbugs.gnu.org/26672), so you should upgrade to version 25.3 or better. Otherwise, a workaround is to inhibit flyspell overlays while the snippet is active:

``` {.commonlisp org-language="emacs-lisp"}
(add-hook 'flyspell-incorrect-hook
          #'(lambda (&rest _)
              (and yas-active-field-overlay
                   (overlay-buffer yas-active-field-overlay))))
```

# How do I use alternative keys, i.e. not TAB? {#how-do-i-use-alternative-keys-i.e.-not-tab}

Edit the keymaps [`yas-minor-mode-map`{.verbatim}](sym:yas-minor-mode-map) and [`yas-keymap`{.verbatim}](sym:yas-keymap) as you would any other keymap, but use [`yas-filtered-definition`{.verbatim}](sym:yas-filtered-definition) on the definition if you want to respect [`yas-keymap-disable-hook`{.verbatim}](sym:yas-keymap-disable-hook):

``` {.commonlisp org-language="emacs-lisp" exports="code"}
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<the new key>") yas-maybe-expand)

;;keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "<new-next-field-key>")
  (yas-filtered-definition 'yas-next-field-or-maybe-expand))
(define-key yas-keymap (kbd "<new-prev-field-key>")
  (yas-filtered-definition 'yas-prev-field))
```

# How do I define an abbrev key containing characters not supported by the filesystem?

- **Note**: This question applies if you're still defining snippets whose key *is* the filename. This is behavior still provided by version 0.6 for backward compatibilty, but is somewhat deprecated…

For example, you want to define a snippet by the key `<`{.verbatim} which is not a valid character for filename on Windows. This means you can't use the filename as a trigger key in this case.

You should rather use the `# key:`{.verbatim} directive to specify the key of the defined snippet explicitly and name your snippet with an arbitrary valid filename, `lt.YASnippet`{.verbatim} for example, using `<`{.verbatim} for the `# key:`{.verbatim} directive:

``` snippet
# key: <
# name: <...></...>
# --
<${1:div}>$0</$1>
```

\## Earlier material

- ****Note****: In addition to the questions and answers presented here, you might also with to visit the list of \[solved support issues\](<https://github.com/joaotavora/yasnippet/issues?q=label%3Asupport>) in the Github issue tracker. It might be more up-to-date than this list.

Expansion of abbrev keys is controlled by \[\`yas-key-syntaxes\`{.verbatim}\](sym:yas-key-syntaxes). Try removing entries which correspond to the abbrev key character syntax. For example, if you have a snippet with abbrev key "bar", that you don't want to trigger when point follows the text \`foo<sub>bar</sub>\`{.verbatim}, remove the \`"w"\`{.verbatim} entry (since "bar" has only word syntax characters).

Note that some editors will automatically add a newline for you. In Emacs, if you set \`require-final-newline\`{.verbatim} to \`t\`{.verbatim}, it will add the final newline automatically.

This is \[Emacs Bug#26672\](<https://debbugs.gnu.org/26672>), so you should upgrade to version 25.3 or better. Otherwise, a workaround is to inhibit flyspell overlays while the snippet is active:

Edit the keymaps \[\`yas-minor-mode-map\`{.verbatim}\](sym:yas-minor-mode-map) and \[\`yas-keymap\`{.verbatim}\](sym:yas-keymap) as you would any other keymap, but use \[\`yas-filtered-definition\`{.verbatim}\](sym:yas-filtered-definition) on the definition if you want to respect \[\`yas-keymap-disable-hook\`{.verbatim}\](sym:yas-keymap-disable-hook):

You should rather use the \`# key:\`{.verbatim} directive to specify the key of the defined snippet explicitly and name your snippet with an arbitrary valid filename, \`lt.YASnippet\`{.verbatim} for example, using \`\<\`{.verbatim} for the \`# key:\`{.verbatim} directive:
