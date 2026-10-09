---
title: HISTORY
description: The feature that converts spaces in a selected region into underscores is useful when turning English text into method names.
---
# HISTORY

## Version 1.2.1 {#version-1.2.1}

The feature that converts spaces in a selected region into underscores is useful when turning English text into method names. It had disappeared over time, and at first I thought it might not be essential, but I quickly realized it was extremely inconvenient without it, so I brought it back. Since many others are likely to find this equally inconvenient, I've made it the default.

If you don't need this feature and prefer to convert each symbol individually, you can do so with the following setting.

`(setq string-inflection-region-selection-behavior 'apply-to-each-symbols)`{.verbatim}

## Version 1.2.0 {#version-1.2.0}

- [\#44](https://github.com/akicho8/string-inflection/pull/44) Create function for custom selection of string used for inflection

The conversion target range has been changed to vary depending on the mode since the previous version, but if you prefer the previous behavior that was independent of the mode, you can do the following:

`(setq string-inflection-bounds-function 'string-inflection-bounds-of-mode-independent-chunk)`{.verbatim}

- [\#46](https://github.com/akicho8/string-inflection/issues/46) Refactoring of the general name

I've revised some method names that were previously a bit awkward. The main changes are:

- camelcase -\> camel-case
- underscore -\> snake-case
- cursor -\> point
- word -\> symbol

For now, I've kept the old methods using fset, but I might remove them in the future.

## Version 1.1.0 {#version-1.1.0}

- Support non ascii [\#39](https://github.com/akicho8/string-inflection/pull/39)
- Use (bounds-of-thing-at-point) for word detection [\#41](https://github.com/akicho8/string-inflection/pull/41)
- Implement string-inflect-final-position [\#43](https://github.com/akicho8/string-inflection/pull/43)

`string-inflection-skip-backward-when-done`{.verbatim} is deprecated. Use the `string-inflection-final-position`{.verbatim} option instead. However, leaving it as the default seems to be the easiest to use.

Previously, the rule for identifying words was shared across all modes. However, with this recent change, we have adapted the word boundaries to reflect the specifics of each mode. As a result, we have eliminated the need for handling edge cases, allowing for simpler and more flexible transformations.

On the other hand, there are now cases where the range considered as a "word" has become too broad, leading to situations where the intended transformation does not occur. For example, in org-mode, when you try to transform only the "foo<sub>bar</sub>" portion of "path/to/foo<sub>bar</sub>.txt" by placing the cursor over it, nothing happens. In such cases, you can achieve a partial transformation by selecting "foo<sub>bar</sub>" as a range.

## Version 1.0.16 {#version-1.0.16}

Fix [\#34](https://github.com/akicho8/string-inflection/issues/34) kebabing a region can insert an unexpected hyphen

add `string-inflection-erase-chars-when-region`{.verbatim} variable

Changed behavior when selecting region.

    before: Foo::Bar --> foo_bar
    after:  Foo::Bar --> foo::bar

Include `:`{.verbatim} in `string-inflection-erase-chars-when-region`{.verbatim} if want to behave as before.

## Version 1.0.14 {#version-1.0.14}

Merged [PR \#32](https://github.com/akicho8/string-inflection/pull/32) Use defcustom and Change Some Wording

## Version 1.0.13 {#version-1.0.13}

Fix [\#31](https://github.com/akicho8/string-inflection/issues/31) Better Whitespace Handling When Converting a Region

## Version 1.0.12 {#version-1.0.12}

Fix [\#30](https://github.com/akicho8/string-inflection/issues/30) string-inflection-underscore affects C++ method accessors

    before: fooBar->method --> foo_bar_>method
    after:  fooBar->method --> foo_bar->method

## Version 1.0.11 {#version-1.0.11}

Merged [PR \#28](https://github.com/akicho8/string-inflection/pull/28) Make string-inflection-get-current-word work more sensibly when transient mark mode is off

## Version 1.0.10 {#version-1.0.10}

Merged [PR \#26](https://github.com/akicho8/string-inflection/pull/26) Add \`Capital<sub>UnderscoreForm</sub>\`

add string-inflection-capital-underscore function

The behavior of `string-inflection-all-cycle`{.verbatim} has changed

    before: foo_bar => FOO_BAR => FooBar => fooBar => foo-bar => foo_bar
    after:  foo_bar => FOO_BAR => FooBar => fooBar => foo-bar => Foo_Bar => foo_bar

## Version 1.0.9 {#version-1.0.9}

Bugfix [issue \#25](https://github.com/akicho8/string-inflection/issues/27) When executing kebab-case etc., point advances to the next word, and the previous word can not be converted continuously

## Version 1.0.8 {#version-1.0.8}

[issue \#25](https://github.com/akicho8/string-inflection/issues/25)

When it is simply `camel-case`{.verbatim}, it means the name with the leading letters in lowercase.

The name with the initial capital letter is called the `pascal-case`{.verbatim}.

### Behavior of the camel-case function has changed

| Before | After  |
|--------|--------|
| FooBar | fooBar |

### Function name changed as well

| Before           | After       |
|------------------|-------------|
| camel-case       | pascal-case |
| lower-camel-case | camel-case  |

### Add alias

``` elisp
(fset 'string-inflection-upper-camel-case-function 'string-inflection-pascal-case-function)
(fset 'string-inflection-lower-camel-case-function 'string-inflection-camel-case-function)

(fset 'string-inflection-upper-camel-case-p 'string-inflection-pascal-case-p)
(fset 'string-inflection-lower-camel-case-p 'string-inflection-camel-case-p)
```

### Remove camelize function

Originally we had defined functions of both `camel-case`{.verbatim} and `camelize`{.verbatim} names.

I deleted the function containing `camelize`{.verbatim} to make it simple.
