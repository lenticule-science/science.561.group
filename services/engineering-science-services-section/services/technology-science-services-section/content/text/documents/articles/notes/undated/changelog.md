---
title: Summary of user-visible changes
description: Walk SwitchCase nodes as separate nodes.
aliases:
  - 0.3.2
  - 0.4.11 (August 8, 2025)
  - 1.2.0
---
# Summary of user-visible changes

## 0.9.3 / ???

* Support `.fnlm` files.
* Remove old reloading mechanism in favor of the `,reload` REPL
  command
* Obsolete `fennel-mode-annotate-completion` in favor of
  `fennel-proto-repl`
* Highlight backquoted (``; `sym` ``) symbols in comments
* Remove old find-definition mechanism in favor of the `,find` REPL
  command
* Guess module name based on project structure in `fennel-proto-repl`

## 0.9.2 / 2025-03-13

* Switch `M-.` find definition to using `xref`, allowing graceful
  fallback to eglot when the repl can't find the target.
* Avoid binding `q` in all Lua buffers when viewving compilation.
* Provide a customization variable to change what Lua major mode to
  use in a compilation view.
* Better handling of ANSI colors in Fennel Proto REPL.
* `ob-fennel` now can send Emacs Lisp hash tables to Fennel.
* major update to the `fennel-proto-repl` - new protocol version,
  changes in user-input handling, ability to extend with custom
  operations.
* Add Flymake support via `fennel-ls`
* Add dynamic font-locking support to the `fennel-proto-repl` mode
* Add project integration to the `fennel-proto-repl` mode
* Remove `M-'` in favor of `C-u M-.`

## 0.9.1 / 2024-04-24

* Add `fennel-proto-repl-read-handler` for custom `io.read` handling
* Fix bug with discarding undo history in proto-repl buffers
* Move Fennel Proto REPL settings to a subgroup
* Provide `fennel-proto-repl-fennel-module-name` for customizing
  Fennel module location for `fennel-proto-repl` to work with apps
  that embed Fennel.
* Update protocol to 0.5.0
* Add support to the `,return` command in `fennel-proto-repl`.
* Fix bug with `poly-org` overriding `compile-command` in
  `fennel-view-compilation`.

## 0.9.0 / 2023-08-14

* Added support for Org Babel via proto-repl

## 0.8.1 / 2023-04-23

* Log results and errors to the *Messages* buffer.
* Indicate REPL state in the mode-line.
* Add a binding to link the current buffer to the REPL.
* Allow using proto-repl from fennel-scratch via custom variable.

## 0.8.0 / 2023-04-17

* Remove `fennel-eldoc` module and Eldoc integration with
  `fennel-repl`.  Eldoc is now a feature of the `fennel-proto-repl`.
* Add `fennel-mode-repl-prompt` and `fennel-mode-repl-subprompt`
  variables that are now strings that are automatically escaped.
* Obsolete `fennel-mode-repl-prompt-regexp` and
  `fennel-mode-repl-subprompt-regexp` variables.
* Fix duplicate prompt bug in the `fennel-repl` REPL.

## 0.7.0 / 2023-04-03

* New protocol-based REPL integration via `fennel-proto-repl` command

## 0.6.0 / 2023-02-15

* Add fennel-mode to `interpreter-mode-alist`
* Add `fennel-macroexpand` command and a shortcut
* Add separate `antifennel.el` file
* Add `fennel-mode-repl-subprompt-regexp` for REPL subprompt recognition
* Add `fennel-mode-repl-prompt-readonly` custom
* Add experimental `fennel-repl-minify-code` custom that defines how
  to collapse code before sending it to the REPL
* Add new forms from Fennel 1.3.0
* Support the `with-*` and `def*` naming convention for body macros
* Add `fennel-format-region` command

## 0.5.0 / 2022-04-03

* Add optional Eldoc support when REPL is connected
* Add `fennel-mode-repl-prompt-regexp` to define a regular expression
  to recognize prompt

## 0.4.1 / 2021-11-22

* Add `fennel-scratch` command, that opens scratch buffer for Fennel evaluation
* Make REPL prompt readonly
* Add missing highlighting for names defined with `macro`

## 0.4.0 / 2021-10-26

* Add completion annotation and improve syntax highlighting consistency
* Highlight local definitions
* Highlight function definitions with `font-lock-function-name-face`
* Fix REPL prompt duplication when completing symbols
* Fix multiline input breaking the REPL interaction
* Fix `fennel-find-definition` to use `symbol-at-point` as default value
* Allow restarting and reusing fennel-repl buffer if present with C-c C-z
* Implement more content aware table indentation
* Inherit major mode from `prog-mode` instead of `lisp-mode`
* Bump required Emacs version to 26.1

## 0.3.1 / 2021-07-04

* Fix `M-.` to use the symbol at point by default
* Improve arglist and docstring lookup
* Fix several bugs around completion
* Fix a bug where the `fennel-program` setting was ignored
* Don't default to `--correlate` mode in repl

## 0.3.0 / 2021-06-18

* Add support for `completion-at-point`
* Add `fennel-format` command
* Extend jump-to-definition to working on functions in modules
* Add font-lock and indentation for new forms up to Fennel 0.9.3

## 0.2.0 / 2020-06-17

* Add font-lock for new fennel forms up to 0.4.1
* Add docstring lookup with `C-c C-d`
* Fail gracefully during compilation errors in fennel-reload

## 0.1.0 / 2018-11-01

* Fix imenu support
* Add fennel-view-compilation function
* Make fennel-reload safe for compiler errors
* Fixed a bug where indentation wouldn't work unless lisp-mode was loaded
* Add a setting to disable switching to repl on reload

## 0.0.2 / 2018-05-09

* Add fennel-reload
* Add imenu support
* Add find-definition
* Lots more keywords

## 0.0.1 / 2018-02-18

* Initial commit


---

<!-- source: archive/library/javascript/references/packages/acorn-walk/CHANGELOG--000373.md -->

## Imported source: archive/library/javascript/references/packages/acorn-walk/CHANGELOG--000373.md

## 8.3.4 (2024-09-09)

### Bug fixes

Walk SwitchCase nodes as separate nodes.

## 8.3.3 (2024-01-11)

### Bug fixes

Make acorn a dependency because acorn-walk uses the types from that package.

## 8.3.2 (2024-01-11)

### Bug fixes

Add missing type for `findNodeBefore`.

## 8.3.1 (2023-12-06)

### Bug fixes

Add `Function` and `Class` to the `AggregateType` type, so that they can be used in walkers without raising a type error.

Visitor functions are now called in such a way that their `this` refers to the object they are part of.

## 8.3.0 (2023-10-26)

### New features

Use a set of new, much more precise, TypeScript types.

## 8.2.0 (2021-09-06)

### New features

Add support for walking ES2022 class static blocks.

## 8.1.1 (2021-06-29)

### Bug fixes

Include `base` in the type declarations.

## 8.1.0 (2021-04-24)

### New features

Support node types for class fields and private methods.

## 8.0.2 (2021-01-25)

### Bug fixes

Adjust package.json to work with Node 12.16.0 and 13.0-13.6.

## 8.0.0 (2021-01-05)

### Bug fixes

Fix a bug where `full` and `fullAncestor` would skip nodes with overridden types.

## 8.0.0 (2020-08-12)

### New features

The package can now be loaded directly as an ECMAScript module in node 13+.

## 7.2.0 (2020-06-17)

### New features

Support optional chaining and nullish coalescing.

Support `import.meta`.

Add support for `export * as ns from "source"`.

## 7.1.1 (2020-02-13)

### Bug fixes

Clean up the type definitions to actually work well with the main parser.

## 7.1.0 (2020-02-11)

### New features

Add a TypeScript definition file for the library.

## 7.0.0 (2017-08-12)

### New features

Support walking `ImportExpression` nodes.

## 6.2.0 (2017-07-04)

### New features

Add support for `Import` nodes.

## 6.1.0 (2018-09-28)

### New features

The walker now walks `TemplateElement` nodes.

## 6.0.1 (2018-09-14)

### Bug fixes

Fix bad "main" field in package.json.

## 6.0.0 (2018-09-14)

### Breaking changes

This is now a separate package, `acorn-walk`, rather than part of the main `acorn` package.

The `ScopeBody` and `ScopeExpression` meta-node-types are no longer supported.

## 5.7.1 (2018-06-15)

### Bug fixes

Make sure the walker and bin files are rebuilt on release (the previous release didn't get the up-to-date versions).

## 5.7.0 (2018-06-15)

### Bug fixes

Fix crash in walker when walking a binding-less catch node.

## 5.6.2 (2018-06-05)

### Bug fixes

In the walker, go back to allowing the `baseVisitor` argument to be null to default to the default base everywhere.

## 5.6.1 (2018-06-01)

### Bug fixes

Fix regression when passing `null` as fourth argument to `walk.recursive`.

## 5.6.0 (2018-05-31)

### Bug fixes

Fix a bug in the walker that caused a crash when walking an object pattern spread.

## 5.5.1 (2018-03-06)

### Bug fixes

Fix regression in walker causing property values in object patterns to be walked as expressions.

## 5.5.0 (2018-02-27)

### Bug fixes

Support object spread in the AST walker.

## 5.4.1 (2018-02-02)

### Bug fixes

5.4.0 somehow accidentally included an old version of walk.js.

## 5.2.0 (2017-10-30)

### Bug fixes

The `full` and `fullAncestor` walkers no longer visit nodes multiple times.

## 5.1.0 (2017-07-05)

### New features

New walker functions `full` and `fullAncestor`.

## 3.2.0 (2016-06-07)

### New features

Make it possible to use `visit.ancestor` with a walk state.

## 3.1.0 (2016-04-18)

### New features

The walker now allows defining handlers for `CatchClause` nodes.

## 2.5.2 (2015-10-27)

### Fixes

Fix bug where the walker walked an exported `let` statement as an expression.


---

<!-- source: archive/library/javascript/references/packages/acorn/CHANGELOG--000280.md -->

## Imported source: archive/library/javascript/references/packages/acorn/CHANGELOG--000280.md

## 8.14.1 (2025-03-05)

### Bug fixes

Fix an issue where `await` expressions in class field initializers were inappropriately allowed.

Properly allow await inside an async arrow function inside a class field initializer.

Mention the source file name in syntax error messages when given.

Properly add an empty `attributes` property to every form of `ExportNamedDeclaration`.

## 8.14.0 (2024-10-27)

### New features

Support ES2025 import attributes.

Support ES2025 RegExp modifiers.

### Bug fixes

Support some missing Unicode properties.

## 8.13.0 (2024-10-16)

### New features

Upgrade to Unicode 16.0.

## 8.12.1 (2024-07-03)

### Bug fixes

Fix a regression that caused Acorn to no longer run on Node versions <8.10.

## 8.12.0 (2024-06-14)

### New features

Support ES2025 duplicate capture group names in regular expressions.

### Bug fixes

Include `VariableDeclarator` in the `AnyNode` type so that walker objects can refer to it without getting a type error.

Properly raise a parse error for invalid `for`/`of` statements using `async` as binding name.

Properly recognize \"use strict\" when preceded by a string with an escaped newline.

Mark the `Parser` constructor as protected, not private, so plugins can extend it without type errors.

Fix a bug where some invalid `delete` expressions were let through when the operand was parenthesized and `preserveParens` was enabled.

Properly normalize line endings in raw strings of invalid template tokens.

Properly track line numbers for escaped newlines in strings.

Fix a bug that broke line number accounting after a template literal with invalid escape sequences.

## 8.11.3 (2023-12-29)

### Bug fixes

Add `Function` and `Class` to the `AggregateType` type, so that they can be used in walkers without raising a type error.

Make sure `onToken` get an `import` keyword token when parsing `import.meta`.

Fix a bug where `.loc.start` could be undefined for `new.target` `meta` nodes.

## 8.11.2 (2023-10-27)

### Bug fixes

Fix a bug that caused regular expressions after colon tokens to not be properly tokenized in some circumstances.

## 8.11.1 (2023-10-26)

### Bug fixes

Fix a regression where `onToken` would receive 'name' tokens for 'new' keyword tokens.

## 8.11.0 (2023-10-26)

### Bug fixes

Fix an issue where tokenizing (without parsing) an object literal with a property named `class` or `function` could, in some circumstance, put the tokenizer into an invalid state.

Fix an issue where a slash after a call to a propery named the same as some keywords would be tokenized as a regular expression.

### New features

Upgrade to Unicode 15.1.

Use a set of new, much more precise, TypeScript types.

## 8.10.0 (2023-07-05)

### New features

Add a `checkPrivateFields` option that disables strict checking of private property use.

## 8.9.0 (2023-06-16)

### Bug fixes

Forbid dynamic import after `new`, even when part of a member expression.

### New features

Add Unicode properties for ES2023.

Add support for the `v` flag to regular expressions.

## 8.8.2 (2023-01-23)

### Bug fixes

Fix a bug that caused `allowHashBang` to be set to false when not provided, even with `ecmaVersion >= 14`.

Fix an exception when passing no option object to `parse` or `new Parser`.

Fix incorrect parse error on `if (0) let\n[astral identifier char]`.

## 8.8.1 (2022-10-24)

### Bug fixes

Make type for `Comment` compatible with estree types.

## 8.8.0 (2022-07-21)

### Bug fixes

Allow parentheses around spread args in destructuring object assignment.

Fix an issue where the tree contained `directive` properties in when parsing with a language version that doesn't support them.

### New features

Support hashbang comments by default in ECMAScript 2023 and later.

## 8.7.1 (2021-04-26)

### Bug fixes

Stop handling `"use strict"` directives in ECMAScript versions before 5.

Fix an issue where duplicate quoted export names in `export *` syntax were incorrectly checked.

Add missing type for `tokTypes`.

## 8.7.0 (2021-12-27)

### New features

Support quoted export names.

Upgrade to Unicode 14.

Add support for Unicode 13 properties in regular expressions.

### Bug fixes

Use a loop to find line breaks, because the existing regexp search would overrun the end of the searched range and waste a lot of time in minified code.

## 8.6.0 (2021-11-18)

### Bug fixes

Fix a bug where an object literal with multiple `__proto__` properties would incorrectly be accepted if a later property value held an assigment.

### New features

Support class private fields with the `in` operator.

## 8.5.0 (2021-09-06)

### Bug fixes

Improve context-dependent tokenization in a number of corner cases.

Fix location tracking after a 0x2028 or 0x2029 character in a string literal (which before did not increase the line number).

Fix an issue where arrow function bodies in for loop context would inappropriately consume `in` operators.

Fix wrong end locations stored on SequenceExpression nodes.

Implement restriction that `for`/`of` loop LHS can't start with `let`.

### New features

Add support for ES2022 class static blocks.

Allow multiple input files to be passed to the CLI tool.

## 8.4.1 (2021-06-24)

### Bug fixes

Fix a bug where `allowAwaitOutsideFunction` would allow `await` in class field initializers, and setting `ecmaVersion` to 13 or higher would allow top-level await in non-module sources.

## 8.4.0 (2021-06-11)

### New features

A new option, `allowSuperOutsideMethod`, can be used to suppress the error when `super` is used in the wrong context.

## 8.3.0 (2021-05-31)

### New features

Default `allowAwaitOutsideFunction` to true for ECMAScript 2022 an higher.

Add support for the `d` ([indices](https://github.com/tc39/proposal-regexp-match-indices)) regexp flag.

## 8.2.4 (2021-05-04)

### Bug fixes

Fix spec conformity in corner case 'for await (async of ...)'.

## 8.2.3 (2021-05-04)

### Bug fixes

Fix an issue where the library couldn't parse 'for (async of ...)'.

Fix a bug in UTF-16 decoding that would read characters incorrectly in some circumstances.

## 8.2.2 (2021-04-29)

### Bug fixes

Fix a bug where a class field initialized to an async arrow function wouldn't allow await inside it. Same issue existed for generator arrow functions with yield.

## 8.2.1 (2021-04-24)

### Bug fixes

Fix a regression introduced in 8.2.0 where static or async class methods with keyword names fail to parse.

## 8.2.0 (2021-04-24)

### New features

Add support for ES2022 class fields and private methods.

## 8.1.1 (2021-04-12)

### Various

Stop shipping source maps in the NPM package.

## 8.1.0 (2021-03-09)

### Bug fixes

Fix a spurious error in nested destructuring arrays.

### New features

Expose `allowAwaitOutsideFunction` in CLI interface.

Make `allowImportExportAnywhere` also apply to `import.meta`.

## 8.0.5 (2021-01-25)

### Bug fixes

Adjust package.json to work with Node 12.16.0 and 13.0-13.6.

## 8.0.4 (2020-10-05)

### Bug fixes

Make `await x ** y` an error, following the spec.

Fix potentially exponential regular expression.

## 8.0.3 (2020-10-02)

### Bug fixes

Fix a wasteful loop during `Parser` creation when setting `ecmaVersion` to `"latest"`.

## 8.0.2 (2020-09-30)

### Bug fixes

Make the TypeScript types reflect the current allowed values for `ecmaVersion`.

Fix another regexp/division tokenizer issue.

## 8.0.1 (2020-08-12)

### Bug fixes

Provide the correct value in the `version` export.

## 8.0.0 (2020-08-12)

### Bug fixes

Disallow expressions like `(a = b) = c`.

Make non-octal escape sequences a syntax error in strict mode.

### New features

The package can now be loaded directly as an ECMAScript module in node 13+.

Update to the set of Unicode properties from ES2021.

### Breaking changes

The `ecmaVersion` option is now required. For the moment, omitting it will still work with a warning, but that will change in a future release.

Some changes to method signatures that may be used by plugins.

## 7.4.0 (2020-08-03)

### New features

Add support for logical assignment operators.

Add support for numeric separators.

## 7.3.1 (2020-06-11)

### Bug fixes

Make the string in the `version` export match the actual library version.

## 7.3.0 (2020-06-11)

### Bug fixes

Fix a bug that caused parsing of object patterns with a property named `set` that had a default value to fail.

### New features

Add support for optional chaining (`?.`).

## 7.2.0 (2020-05-09)

### Bug fixes

Fix precedence issue in parsing of async arrow functions.

### New features

Add support for nullish coalescing.

Add support for `import.meta`.

Support `export * as ...` syntax.

Upgrade to Unicode 13.

## 6.4.1 (2020-03-09)

### Bug fixes

More carefully check for valid UTF16 surrogate pairs in regexp validator.

## 7.1.1 (2020-03-01)

### Bug fixes

Treat `\8` and `\9` as invalid escapes in template strings.

Allow unicode escapes in property names that are keywords.

Don't error on an exponential operator expression as argument to `await`.

More carefully check for valid UTF16 surrogate pairs in regexp validator.

## 7.1.0 (2019-09-24)

### Bug fixes

Disallow trailing object literal commas when ecmaVersion is less than 5.

### New features

Add a static `acorn` property to the `Parser` class that contains the entire module interface, to allow plugins to access the instance of the library that they are acting on.

## 7.0.0 (2019-08-13)

### Breaking changes

Changes the node format for dynamic imports to use the `ImportExpression` node type, as defined in [ESTree](https://github.com/estree/estree/blob/master/es2020.md#importexpression).

Makes 10 (ES2019) the default value for the `ecmaVersion` option.

## 6.3.0 (2019-08-12)

### New features

`sourceType: "module"` can now be used even when `ecmaVersion` is less than 6, to parse module-style code that otherwise conforms to an older standard.

## 6.2.1 (2019-07-21)

### Bug fixes

Fix bug causing Acorn to treat some characters as identifier characters that shouldn't be treated as such.

Fix issue where setting the `allowReserved` option to `"never"` allowed reserved words in some circumstances.

## 6.2.0 (2019-07-04)

### Bug fixes

Improve valid assignment checking in `for`/`in` and `for`/`of` loops.

Disallow binding `let` in patterns.

### New features

Support bigint syntax with `ecmaVersion` >= 11.

Support dynamic `import` syntax with `ecmaVersion` >= 11.

Upgrade to Unicode version 12.

## 6.1.1 (2019-02-27)

### Bug fixes

Fix bug that caused parsing default exports of with names to fail.

## 6.1.0 (2019-02-08)

### Bug fixes

Fix scope checking when redefining a `var` as a lexical binding.

### New features

Split up `parseSubscripts` to use an internal `parseSubscript` method to make it easier to extend with plugins.

## 6.0.7 (2019-02-04)

### Bug fixes

Check that exported bindings are defined.

Don't treat `\u180e` as a whitespace character.

Check for duplicate parameter names in methods.

Don't allow shorthand properties when they are generators or async methods.

Forbid binding `await` in async arrow function's parameter list.

## 6.0.6 (2019-01-30)

### Bug fixes

The content of class declarations and expressions is now always parsed in strict mode.

Don't allow `let` or `const` to bind the variable name `let`.

Treat class declarations as lexical.

Don't allow a generator function declaration as the sole body of an `if` or `else`.

Ignore `"use strict"` when after an empty statement.

Allow string line continuations with special line terminator characters.

Treat `for` bodies as part of the `for` scope when checking for conflicting bindings.

Fix bug with parsing `yield` in a `for` loop initializer.

Implement special cases around scope checking for functions.

## 6.0.5 (2019-01-02)

### Bug fixes

Fix TypeScript type for `Parser.extend` and add `allowAwaitOutsideFunction` to options type.

Don't treat `let` as a keyword when the next token is `{` on the next line.

Fix bug that broke checking for parentheses around an object pattern in a destructuring assignment when `preserveParens` was on.

## 6.0.4 (2018-11-05)

### Bug fixes

Further improvements to tokenizing regular expressions in corner cases.

## 6.0.3 (2018-11-04)

### Bug fixes

Fix bug in tokenizing an expression-less return followed by a function followed by a regular expression.

Remove stray symlink in the package tarball.

## 6.0.2 (2018-09-26)

### Bug fixes

Fix bug where default expressions could fail to parse inside an object destructuring assignment expression.

## 6.0.1 (2018-09-14)

### Bug fixes

Fix wrong value in `version` export.

## 6.0.0 (2018-09-14)

### Bug fixes

Better handle variable-redefinition checks for catch bindings and functions directly under if statements.

Forbid `new.target` in top-level arrow functions.

Fix issue with parsing a regexp after `yield` in some contexts.

### New features

The package now comes with TypeScript definitions.

### Breaking changes

The default value of the `ecmaVersion` option is now 9 (2018).

Plugins work differently, and will have to be rewritten to work with this version.

The loose parser and walker have been moved into separate packages (`acorn-loose` and `acorn-walk`).

## 5.7.3 (2018-09-10)

### Bug fixes

Fix failure to tokenize regexps after expressions like `x.of`.

Better error message for unterminated template literals.

## 5.7.2 (2018-08-24)

### Bug fixes

Properly handle `allowAwaitOutsideFunction` in for statements.

Treat function declarations at the top level of modules like let bindings.

Don't allow async function declarations as the only statement under a label.

## 5.7.0 (2018-06-15)

### New features

Upgraded to Unicode 11.

## 5.6.0 (2018-05-31)

### New features

Allow U+2028 and U+2029 in string when ECMAVersion >= 10.

Allow binding-less catch statements when ECMAVersion >= 10.

Add `allowAwaitOutsideFunction` option for parsing top-level `await`.

## 5.5.3 (2018-03-08)

### Bug fixes

A _second_ republish of the code in 5.5.1, this time with yarn, to hopefully get valid timestamps.

## 5.5.2 (2018-03-08)

### Bug fixes

A republish of the code in 5.5.1 in an attempt to solve an issue with the file timestamps in the npm package being 0.

## 5.5.1 (2018-03-06)

### Bug fixes

Fix misleading error message for octal escapes in template strings.

## 5.5.0 (2018-02-27)

### New features

The identifier character categorization is now based on Unicode version 10.

Acorn will now validate the content of regular expressions, including new ES9 features.

## 5.4.0 (2018-02-01)

### Bug fixes

Disallow duplicate or escaped flags on regular expressions.

Disallow octal escapes in strings in strict mode.

### New features

Add support for async iteration.

Add support for object spread and rest.

## 5.3.0 (2017-12-28)

### Bug fixes

Fix parsing of floating point literals with leading zeroes in loose mode.

Allow duplicate property names in object patterns.

Don't allow static class methods named `prototype`.

Disallow async functions directly under `if` or `else`.

Parse right-hand-side of `for`/`of` as an assignment expression.

Stricter parsing of `for`/`in`.

Don't allow unicode escapes in contextual keywords.

### New features

Parsing class members was factored into smaller methods to allow plugins to hook into it.

## 5.2.1 (2017-10-30)

### Bug fixes

Fix a token context corruption bug.

## 5.2.0 (2017-10-30)

### Bug fixes

Fix token context tracking for `class` and `function` in property-name position.

Make sure `%*` isn't parsed as a valid operator.

Allow shorthand properties `get` and `set` to be followed by default values.

Disallow `super` when not in callee or object position.

### New features

Support [`directive` property](https://github.com/estree/estree/compare/b3de58c9997504d6fba04b72f76e6dd1619ee4eb...1da8e603237144f44710360f8feb7a9977e905e0) on directive expression statements.

## 5.1.2 (2017-09-04)

### Bug fixes

Disable parsing of legacy HTML-style comments in modules.

Fix parsing of async methods whose names are keywords.

## 5.1.1 (2017-07-06)

### Bug fixes

Fix problem with disambiguating regexp and division after a class.

## 5.1.0 (2017-07-05)

### Bug fixes

Fix tokenizing of regexps in an object-desctructuring `for`/`of` loop and after `yield`.

Parse zero-prefixed numbers with non-octal digits as decimal.

Allow object/array patterns in rest parameters.

Don't error when `yield` is used as a property name.

Allow `async` as a shorthand object property.

### New features

Implement the [template literal revision proposal](https://github.com/tc39/proposal-template-literal-revision) for ES9.

## 5.0.3 (2017-04-01)

### Bug fixes

Fix spurious duplicate variable definition errors for named functions.

## 5.0.2 (2017-03-30)

### Bug fixes

A binary operator after a parenthesized arrow expression is no longer incorrectly treated as an error.

## 5.0.0 (2017-03-28)

### Bug fixes

Raise an error for duplicated lexical bindings.

Fix spurious error when an assignement expression occurred after a spread expression.

Accept regular expressions after `of` (in `for`/`of`), `yield` (in a generator), and braced arrow functions.

Allow labels in front or `var` declarations, even in strict mode.

### Breaking changes

Parse declarations following `export default` as declaration nodes, not expressions. This means that class and function declarations nodes can now have `null` as their `id`.

## 4.0.11 (2017-02-07)

### Bug fixes

Allow all forms of member expressions to be parenthesized as lvalue.

## 4.0.10 (2017-02-07)

### Bug fixes

Don't expect semicolons after default-exported functions or classes, even when they are expressions.

Check for use of `'use strict'` directives in non-simple parameter functions, even when already in strict mode.

## 4.0.9 (2017-02-06)

### Bug fixes

Fix incorrect error raised for parenthesized simple assignment targets, so that `(x) = 1` parses again.

## 4.0.8 (2017-02-03)

### Bug fixes

Solve spurious parenthesized pattern errors by temporarily erring on the side of accepting programs that our delayed errors don't handle correctly yet.

## 4.0.7 (2017-02-02)

### Bug fixes

Accept invalidly rejected code like `(x).y = 2` again.

Don't raise an error when a function _inside_ strict code has a non-simple parameter list.

## 4.0.6 (2017-02-02)

### Bug fixes

Fix exponential behavior (manifesting itself as a complete hang for even relatively small source files) introduced by the new 'use strict' check.

## 4.0.5 (2017-02-02)

### Bug fixes

Disallow parenthesized pattern expressions.

Allow keywords as export names.

Don't allow the `async` keyword to be parenthesized.

Properly raise an error when a keyword contains a character escape.

Allow `"use strict"` to appear after other string literal expressions.

Disallow labeled declarations.

## 4.0.4 (2016-12-19)

### Bug fixes

Fix crash when `export` was followed by a keyword that can't be
exported.

## 4.0.3 (2016-08-16)

### Bug fixes

Allow regular function declarations inside single-statement `if` branches in loose mode. Forbid them entirely in strict mode.

Properly parse properties named `async` in ES2017 mode.

Fix bug where reserved words were broken in ES2017 mode.

## 4.0.2 (2016-08-11)

### Bug fixes

Don't ignore period or 'e' characters after octal numbers.

Fix broken parsing for call expressions in default parameter values of arrow functions.

## 4.0.1 (2016-08-08)

### Bug fixes

Fix false positives in duplicated export name errors.

## 4.0.0 (2016-08-07)

### Breaking changes

The default `ecmaVersion` option value is now 7.

A number of internal method signatures changed, so plugins might need to be updated.

### Bug fixes

The parser now raises errors on duplicated export names.

`arguments` and `eval` can now be used in shorthand properties.

Duplicate parameter names in non-simple argument lists now always produce an error.

### New features

The `ecmaVersion` option now also accepts year-style version numbers
(2015, etc).

Support for `async`/`await` syntax when `ecmaVersion` is >= 8.

Support for trailing commas in call expressions when `ecmaVersion` is >= 8.

## 3.3.0 (2016-07-25)

### Bug fixes

Fix bug in tokenizing of regexp operator after a function declaration.

Fix parser crash when parsing an array pattern with a hole.

### New features

Implement check against complex argument lists in functions that enable strict mode in ES7.

## 3.2.0 (2016-06-07)

### Bug fixes

Improve handling of lack of unicode regexp support in host
environment.

Properly reject shorthand properties whose name is a keyword.

### New features

Visitors created with `visit.make` now have their base as _prototype_, rather than copying properties into a fresh object.

## 3.1.0 (2016-04-18)

### Bug fixes

Properly tokenize the division operator directly after a function expression.

Allow trailing comma in destructuring arrays.

## 3.0.4 (2016-02-25)

### Fixes

Allow update expressions as left-hand-side of the ES7 exponential operator.

## 3.0.2 (2016-02-10)

### Fixes

Fix bug that accidentally made `undefined` a reserved word when parsing ES7.

## 3.0.0 (2016-02-10)

### Breaking changes

The default value of the `ecmaVersion` option is now 6 (used to be 5).

Support for comprehension syntax (which was dropped from the draft spec) has been removed.

### Fixes

`let` and `yield` are now “contextual keywords”, meaning you can mostly use them as identifiers in ES5 non-strict code.

A parenthesized class or function expression after `export default` is now parsed correctly.

### New features

When `ecmaVersion` is set to 7, Acorn will parse the exponentiation operator (`**`).

The identifier character ranges are now based on Unicode 8.0.0.

Plugins can now override the `raiseRecoverable` method to override the way non-critical errors are handled.

## 2.7.0 (2016-01-04)

### Fixes

Stop allowing rest parameters in setters.

Disallow `y` rexexp flag in ES5.

Disallow `\00` and `\000` escapes in strict mode.

Raise an error when an import name is a reserved word.

## 2.6.2 (2015-11-10)

### Fixes

Don't crash when no options object is passed.

## 2.6.0 (2015-11-09)

### Fixes

Add `await` as a reserved word in module sources.

Disallow `yield` in a parameter default value for a generator.

Forbid using a comma after a rest pattern in an array destructuring.

### New features

Support parsing stdin in command-line tool.

## 2.5.0 (2015-10-27)

### Fixes

Fix tokenizer support in the command-line tool.

Stop allowing `new.target` outside of functions.

Remove legacy `guard` and `guardedHandler` properties from try nodes.

Stop allowing multiple `__proto__` properties on an object literal in strict mode.

Don't allow rest parameters to be non-identifier patterns.

Check for duplicate paramter names in arrow functions.


---

<!-- source: archive/library/javascript/references/packages/axios/CHANGELOG--000282.md -->

## Imported source: archive/library/javascript/references/packages/axios/CHANGELOG--000282.md

# Changelog

## [1.8.3](https://github.com/axios/axios/compare/v1.8.2...v1.8.3) (2025-03-10)


### Bug Fixes

* add missing type for allowAbsoluteUrls ([#6818](https://github.com/axios/axios/issues/6818)) ([10fa70e](https://github.com/axios/axios/commit/10fa70ef14fe39558b15a179f0e82f5f5e5d11b2))
* **xhr/fetch:** pass `allowAbsoluteUrls` to `buildFullPath` in `xhr` and `fetch` adapters ([#6814](https://github.com/axios/axios/issues/6814)) ([ec159e5](https://github.com/axios/axios/commit/ec159e507bdf08c04ba1a10fe7710094e9e50ec9))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/3238291?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Ashcon Partovi](https://github.com/Electroid "+6/-0 (#6811 )")
- <img src="https://avatars.githubusercontent.com/u/28559054?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [StefanBRas](https://github.com/StefanBRas "+4/-0 (#6818 )")
- <img src="https://avatars.githubusercontent.com/u/8029107?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Marc Hassan](https://github.com/mhassan1 "+2/-2 (#6814 )")

## [1.8.2](https://github.com/axios/axios/compare/v1.8.1...v1.8.2) (2025-03-07)


### Bug Fixes

* **http-adapter:** add allowAbsoluteUrls to path building ([#6810](https://github.com/axios/axios/issues/6810)) ([fb8eec2](https://github.com/axios/axios/commit/fb8eec214ce7744b5ca787f2c3b8339b2f54b00f))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/14166260?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Fasoro-Joseph Alexander](https://github.com/lexcorp16 "+1/-1 (#6810 )")

## [1.8.1](https://github.com/axios/axios/compare/v1.8.0...v1.8.1) (2025-02-26)


### Bug Fixes

* **utils:** move `generateString` to platform utils to avoid importing crypto module into client builds; ([#6789](https://github.com/axios/axios/issues/6789)) ([36a5a62](https://github.com/axios/axios/commit/36a5a620bec0b181451927f13ac85b9888b86cec))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+51/-47 (#6789 )")

# [1.8.0](https://github.com/axios/axios/compare/v1.7.9...v1.8.0) (2025-02-25)


### Bug Fixes

* **examples:** application crashed when navigating examples in browser ([#5938](https://github.com/axios/axios/issues/5938)) ([1260ded](https://github.com/axios/axios/commit/1260ded634ec101dd5ed05d3b70f8e8f899dba6c))
* missing word in SUPPORT_QUESTION.yml ([#6757](https://github.com/axios/axios/issues/6757)) ([1f890b1](https://github.com/axios/axios/commit/1f890b13f2c25a016f3c84ae78efb769f244133e))
* **utils:** replace getRandomValues with crypto module ([#6788](https://github.com/axios/axios/issues/6788)) ([23a25af](https://github.com/axios/axios/commit/23a25af0688d1db2c396deb09229d2271cc24f6c))


### Features

* Add config for ignoring absolute URLs ([#5902](https://github.com/axios/axios/issues/5902)) ([#6192](https://github.com/axios/axios/issues/6192)) ([32c7bcc](https://github.com/axios/axios/commit/32c7bcc0f233285ba27dec73a4b1e81fb7a219b3))


### Reverts

* Revert "chore: expose fromDataToStream to be consumable (#6731)" (#6732) ([1317261](https://github.com/axios/axios/commit/1317261125e9c419fe9f126867f64d28f9c1efda)), closes [#6731](https://github.com/axios/axios/issues/6731) [#6732](https://github.com/axios/axios/issues/6732)


### BREAKING CHANGES

* code relying on the above will now combine the URLs instead of prefer request URL

* feat: add config option for allowing absolute URLs

* fix: add default value for allowAbsoluteUrls in buildFullPath

* fix: typo in flow control when setting allowAbsoluteUrls

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/7661715?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Michael Toscano](https://github.com/GethosTheWalrus "+42/-8 (#6192 )")
- <img src="https://avatars.githubusercontent.com/u/22686401?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Willian Agostini](https://github.com/WillianAgostini "+26/-3 (#6788 #6777 )")
- <img src="https://avatars.githubusercontent.com/u/72578270?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Naron](https://github.com/naronchen "+27/-0 (#5901 )")
- <img src="https://avatars.githubusercontent.com/u/47430686?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [shravan || श्रvan](https://github.com/shravan20 "+7/-3 (#6116 )")
- <img src="https://avatars.githubusercontent.com/u/145078271?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Justin Dhillon](https://github.com/justindhillon "+0/-7 (#6312 )")
- <img src="https://avatars.githubusercontent.com/u/30925732?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [yionr](https://github.com/yionr "+5/-1 (#6129 )")
- <img src="https://avatars.githubusercontent.com/u/534166?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Shin&#x27;ya Ueoka](https://github.com/ueokande "+3/-3 (#5935 )")
- <img src="https://avatars.githubusercontent.com/u/33569?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dan Dascalescu](https://github.com/dandv "+3/-3 (#5908 #6757 )")
- <img src="https://avatars.githubusercontent.com/u/16476523?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Nitin Ramnani](https://github.com/NitinRamnani "+2/-2 (#5938 )")
- <img src="https://avatars.githubusercontent.com/u/152275799?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Shay Molcho](https://github.com/shaymolcho "+2/-2 (#6770 )")
- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+0/-3 (#6732 )")
- fancy45daddy
- <img src="https://avatars.githubusercontent.com/u/127725897?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Habip Akyol](https://github.com/habipakyol "+1/-1 (#6030 )")
- <img src="https://avatars.githubusercontent.com/u/54869395?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Bailey Lissington](https://github.com/llamington "+1/-1 (#6771 )")
- <img src="https://avatars.githubusercontent.com/u/14969290?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Bernardo da Eira Duarte](https://github.com/bernardoduarte "+1/-1 (#6480 )")
- <img src="https://avatars.githubusercontent.com/u/117800149?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Shivam Batham](https://github.com/Shivam-Batham "+1/-1 (#5949 )")
- <img src="https://avatars.githubusercontent.com/u/67861627?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Lipin Kariappa](https://github.com/lipinnnnn "+1/-1 (#5936 )")

## [1.7.9](https://github.com/axios/axios/compare/v1.7.8...v1.7.9) (2024-12-04)


### Reverts

* Revert "fix(types): export CJS types from ESM (#6218)" (#6729) ([c44d2f2](https://github.com/axios/axios/commit/c44d2f2316ad289b38997657248ba10de11deb6c)), closes [#6218](https://github.com/axios/axios/issues/6218) [#6729](https://github.com/axios/axios/issues/6729)

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+596/-108 (#6729 )")

## [1.7.8](https://github.com/axios/axios/compare/v1.7.7...v1.7.8) (2024-11-25)


### Bug Fixes

* allow passing a callback as paramsSerializer to buildURL ([#6680](https://github.com/axios/axios/issues/6680)) ([eac4619](https://github.com/axios/axios/commit/eac4619fe2e0926e876cd260ee21e3690381dbb5))
* **core:** fixed config merging bug ([#6668](https://github.com/axios/axios/issues/6668)) ([5d99fe4](https://github.com/axios/axios/commit/5d99fe4491202a6268c71e5dcc09192359d73cea))
* fixed width form to not shrink after 'Send Request' button is clicked ([#6644](https://github.com/axios/axios/issues/6644)) ([7ccd5fd](https://github.com/axios/axios/commit/7ccd5fd42402102d38712c32707bf055be72ab54))
* **http:** add support for File objects as payload in http adapter ([#6588](https://github.com/axios/axios/issues/6588)) ([#6605](https://github.com/axios/axios/issues/6605)) ([6841d8d](https://github.com/axios/axios/commit/6841d8d18ddc71cc1bd202ffcfddb3f95622eef3))
* **http:** fixed proxy-from-env module import ([#5222](https://github.com/axios/axios/issues/5222)) ([12b3295](https://github.com/axios/axios/commit/12b32957f1258aee94ef859809ed39f8f88f9dfa))
* **http:** use `globalThis.TextEncoder` when available ([#6634](https://github.com/axios/axios/issues/6634)) ([df956d1](https://github.com/axios/axios/commit/df956d18febc9100a563298dfdf0f102c3d15410))
* ios11 breaks when build ([#6608](https://github.com/axios/axios/issues/6608)) ([7638952](https://github.com/axios/axios/commit/763895270f7b50c7c780c3c9807ae8635de952cd))
* **types:** add missing types for mergeConfig function ([#6590](https://github.com/axios/axios/issues/6590)) ([00de614](https://github.com/axios/axios/commit/00de614cd07b7149af335e202aef0e076c254f49))
* **types:** export CJS types from ESM ([#6218](https://github.com/axios/axios/issues/6218)) ([c71811b](https://github.com/axios/axios/commit/c71811b00f2fcff558e4382ba913bdac4ad7200e))
* updated stream aborted error message to be more clear ([#6615](https://github.com/axios/axios/issues/6615)) ([cc3217a](https://github.com/axios/axios/commit/cc3217a612024d83a663722a56d7a98d8759c6d5))
* use URL API instead of DOM to fix a potential vulnerability warning; ([#6714](https://github.com/axios/axios/issues/6714)) ([0a8d6e1](https://github.com/axios/axios/commit/0a8d6e19da5b9899a2abafaaa06a75ee548597db))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/779047?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Remco Haszing](https://github.com/remcohaszing "+108/-596 (#6218 )")
- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+281/-19 (#6640 #6619 )")
- <img src="https://avatars.githubusercontent.com/u/140250471?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Aayush Yadav](https://github.com/aayushyadav020 "+124/-111 (#6617 )")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+12/-65 (#6714 )")
- <img src="https://avatars.githubusercontent.com/u/479715?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Ell Bradshaw](https://github.com/cincodenada "+29/-0 (#6489 )")
- <img src="https://avatars.githubusercontent.com/u/60218780?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Amit Saini](https://github.com/amitsainii "+13/-3 (#5237 )")
- <img src="https://avatars.githubusercontent.com/u/19817867?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Tommaso Paulon](https://github.com/guuido "+14/-1 (#6680 )")
- <img src="https://avatars.githubusercontent.com/u/63336443?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Akki](https://github.com/Aakash-Rana "+5/-5 (#6668 )")
- <img src="https://avatars.githubusercontent.com/u/20028934?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Sampo Silvennoinen](https://github.com/stscoundrel "+3/-3 (#6633 )")
- <img src="https://avatars.githubusercontent.com/u/1174718?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Kasper Isager Dalsgarð](https://github.com/kasperisager "+2/-2 (#6634 )")
- <img src="https://avatars.githubusercontent.com/u/3709715?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Christian Clauss](https://github.com/cclauss "+4/-0 (#6683 )")
- <img src="https://avatars.githubusercontent.com/u/1639119?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Pavan Welihinda](https://github.com/pavan168 "+2/-2 (#5222 )")
- <img src="https://avatars.githubusercontent.com/u/5742900?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Taylor Flatt](https://github.com/taylorflatt "+2/-2 (#6615 )")
- <img src="https://avatars.githubusercontent.com/u/79452224?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Kenzo Wada](https://github.com/Kenzo-Wada "+2/-2 (#6608 )")
- <img src="https://avatars.githubusercontent.com/u/50064240?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Ngole Lawson](https://github.com/echelonnought "+3/-0 (#6644 )")
- <img src="https://avatars.githubusercontent.com/u/1262198?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Haven](https://github.com/Baoyx007 "+3/-0 (#6590 )")
- <img src="https://avatars.githubusercontent.com/u/149003676?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Shrivali Dutt](https://github.com/shrivalidutt "+1/-1 (#6637 )")
- <img src="https://avatars.githubusercontent.com/u/1304290?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Henco Appel](https://github.com/hencoappel "+1/-1 (#6605 )")

## [1.7.7](https://github.com/axios/axios/compare/v1.7.6...v1.7.7) (2024-08-31)


### Bug Fixes

* **fetch:** fix stream handling in Safari by fallback to using a stream reader instead of an async iterator; ([#6584](https://github.com/axios/axios/issues/6584)) ([d198085](https://github.com/axios/axios/commit/d1980854fee1765cd02fa0787adf5d6e34dd9dcf))
* **http:** fixed support for IPv6 literal strings in url ([#5731](https://github.com/axios/axios/issues/5731)) ([364993f](https://github.com/axios/axios/commit/364993f0d8bc6e0e06f76b8a35d2d0a35cab054c))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/10539109?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Rishi556](https://github.com/Rishi556 "+39/-1 (#5731 )")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+27/-7 (#6584 )")

## [1.7.6](https://github.com/axios/axios/compare/v1.7.5...v1.7.6) (2024-08-30)


### Bug Fixes

* **fetch:** fix content length calculation for FormData payload; ([#6524](https://github.com/axios/axios/issues/6524)) ([085f568](https://github.com/axios/axios/commit/085f56861a83e9ac02c140ad9d68dac540dfeeaa))
* **fetch:** optimize signals composing logic; ([#6582](https://github.com/axios/axios/issues/6582)) ([df9889b](https://github.com/axios/axios/commit/df9889b83c2cc37e9e6189675a73ab70c60f031f))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+98/-46 (#6582 )")
- <img src="https://avatars.githubusercontent.com/u/3534453?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jacques Germishuys](https://github.com/jacquesg "+5/-1 (#6524 )")
- <img src="https://avatars.githubusercontent.com/u/53894505?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [kuroino721](https://github.com/kuroino721 "+3/-1 (#6575 )")

## [1.7.5](https://github.com/axios/axios/compare/v1.7.4...v1.7.5) (2024-08-23)


### Bug Fixes

* **adapter:** fix undefined reference to hasBrowserEnv ([#6572](https://github.com/axios/axios/issues/6572)) ([7004707](https://github.com/axios/axios/commit/7004707c4180b416341863bd86913fe4fc2f1df1))
* **core:** add the missed implementation of AxiosError#status property; ([#6573](https://github.com/axios/axios/issues/6573)) ([6700a8a](https://github.com/axios/axios/commit/6700a8adac06942205f6a7a21421ecb36c4e0852))
* **core:** fix `ReferenceError: navigator is not defined` for custom environments; ([#6567](https://github.com/axios/axios/issues/6567)) ([fed1a4b](https://github.com/axios/axios/commit/fed1a4b2d78ed4a588c84e09d32749ed01dc2794))
* **fetch:** fix credentials handling in Cloudflare workers ([#6533](https://github.com/axios/axios/issues/6533)) ([550d885](https://github.com/axios/axios/commit/550d885eb90fd156add7b93bbdc54d30d2f9a98d))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+187/-83 (#6573 #6567 #6566 #6564 #6563 #6557 #6556 #6555 #6554 #6552 )")
- <img src="https://avatars.githubusercontent.com/u/2495809?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Antonin Bas](https://github.com/antoninbas "+6/-6 (#6572 )")
- <img src="https://avatars.githubusercontent.com/u/5406212?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Hans Otto Wirtz](https://github.com/hansottowirtz "+4/-1 (#6533 )")

## [1.7.4](https://github.com/axios/axios/compare/v1.7.3...v1.7.4) (2024-08-13)


### Bug Fixes

* **sec:** CVE-2024-39338 ([#6539](https://github.com/axios/axios/issues/6539)) ([#6543](https://github.com/axios/axios/issues/6543)) ([6b6b605](https://github.com/axios/axios/commit/6b6b605eaf73852fb2dae033f1e786155959de3a))
* **sec:** disregard protocol-relative URL to remediate SSRF ([#6539](https://github.com/axios/axios/issues/6539)) ([07a661a](https://github.com/axios/axios/commit/07a661a2a6b9092c4aa640dcc7f724ec5e65bdda))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/31389480?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Lev Pachmanov](https://github.com/levpachmanov "+47/-11 (#6543 )")
- <img src="https://avatars.githubusercontent.com/u/41283691?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Đỗ Trọng Hải](https://github.com/hainenber "+49/-4 (#6539 )")

## [1.7.3](https://github.com/axios/axios/compare/v1.7.2...v1.7.3) (2024-08-01)


### Bug Fixes

* **adapter:** fix progress event emitting; ([#6518](https://github.com/axios/axios/issues/6518)) ([e3c76fc](https://github.com/axios/axios/commit/e3c76fc9bdd03aa4d98afaf211df943e2031453f))
* **fetch:** fix withCredentials request config ([#6505](https://github.com/axios/axios/issues/6505)) ([85d4d0e](https://github.com/axios/axios/commit/85d4d0ea0aae91082f04e303dec46510d1b4e787))
* **xhr:** return original config on errors from XHR adapter ([#6515](https://github.com/axios/axios/issues/6515)) ([8966ee7](https://github.com/axios/axios/commit/8966ee7ea62ecbd6cfb39a905939bcdab5cf6388))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+211/-159 (#6518 #6519 )")
- <img src="https://avatars.githubusercontent.com/u/10867286?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Valerii Sidorenko](https://github.com/ValeraS "+3/-3 (#6515 )")
- <img src="https://avatars.githubusercontent.com/u/8599535?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [prianYu](https://github.com/prianyu "+2/-2 (#6505 )")

## [1.7.2](https://github.com/axios/axios/compare/v1.7.1...v1.7.2) (2024-05-21)


### Bug Fixes

* **fetch:** enhance fetch API detection; ([#6413](https://github.com/axios/axios/issues/6413)) ([4f79aef](https://github.com/axios/axios/commit/4f79aef81b7c4644328365bfc33acf0a9ef595bc))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+3/-3 (#6413 )")

## [1.7.1](https://github.com/axios/axios/compare/v1.7.0...v1.7.1) (2024-05-20)


### Bug Fixes

* **fetch:** fixed ReferenceError issue when TextEncoder is not available in the environment; ([#6410](https://github.com/axios/axios/issues/6410)) ([733f15f](https://github.com/axios/axios/commit/733f15fe5bd2d67e1fadaee82e7913b70d45dc5e))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+14/-9 (#6410 )")

# [1.7.0](https://github.com/axios/axios/compare/v1.7.0-beta.2...v1.7.0) (2024-05-19)


### Features

* **adapter:** add fetch adapter; ([#6371](https://github.com/axios/axios/issues/6371)) ([a3ff99b](https://github.com/axios/axios/commit/a3ff99b59d8ec2ab5dd049e68c043617a4072e42))

### Bug Fixes

* **core/axios:** handle un-writable error stack ([#6362](https://github.com/axios/axios/issues/6362)) ([81e0455](https://github.com/axios/axios/commit/81e0455b7b57fbaf2be16a73ebe0e6591cc6d8f9))  

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+1015/-127 (#6371 )")
- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+30/-14 ()")
- <img src="https://avatars.githubusercontent.com/u/16711696?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Alexandre ABRIOUX](https://github.com/alexandre-abrioux "+56/-6 (#6362 )")

# [1.7.0-beta.2](https://github.com/axios/axios/compare/v1.7.0-beta.1...v1.7.0-beta.2) (2024-05-19)


### Bug Fixes

* **fetch:** capitalize HTTP method names; ([#6395](https://github.com/axios/axios/issues/6395)) ([ad3174a](https://github.com/axios/axios/commit/ad3174a3515c3c2573f4bcb94818d582826f3914))
* **fetch:** fix & optimize progress capturing for cases when the request data has a nullish value or zero data length ([#6400](https://github.com/axios/axios/issues/6400)) ([95a3e8e](https://github.com/axios/axios/commit/95a3e8e346cfd6a5548e171f2341df3235d0e26b))
* **fetch:** fix headers getting from a stream response; ([#6401](https://github.com/axios/axios/issues/6401)) ([870e0a7](https://github.com/axios/axios/commit/870e0a76f60d0094774a6a63fa606eec52a381af))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+99/-46 (#6405 #6404 #6401 #6400 #6395 )")

# [1.7.0-beta.1](https://github.com/axios/axios/compare/v1.7.0-beta.0...v1.7.0-beta.1) (2024-05-07)


### Bug Fixes

* **core/axios:** handle un-writable error stack ([#6362](https://github.com/axios/axios/issues/6362)) ([81e0455](https://github.com/axios/axios/commit/81e0455b7b57fbaf2be16a73ebe0e6591cc6d8f9))
* **fetch:** fix cases when ReadableStream or Response.body are not available; ([#6377](https://github.com/axios/axios/issues/6377)) ([d1d359d](https://github.com/axios/axios/commit/d1d359da347704e8b28d768e61515a3e96c5b072))
* **fetch:** treat fetch-related TypeError as an AxiosError.ERR_NETWORK error; ([#6380](https://github.com/axios/axios/issues/6380)) ([bb5f9a5](https://github.com/axios/axios/commit/bb5f9a5ab768452de9e166dc28d0ffc234245ef1))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/16711696?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Alexandre ABRIOUX](https://github.com/alexandre-abrioux "+56/-6 (#6362 )")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+42/-17 (#6380 #6377 )")

# [1.7.0-beta.0](https://github.com/axios/axios/compare/v1.6.8...v1.7.0-beta.0) (2024-04-28)


### Features

* **adapter:** add fetch adapter; ([#6371](https://github.com/axios/axios/issues/6371)) ([a3ff99b](https://github.com/axios/axios/commit/a3ff99b59d8ec2ab5dd049e68c043617a4072e42))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+1015/-127 (#6371 )")
- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+30/-14 ()")

## [1.6.8](https://github.com/axios/axios/compare/v1.6.7...v1.6.8) (2024-03-15)


### Bug Fixes

* **AxiosHeaders:** fix AxiosHeaders conversion to an object during config merging ([#6243](https://github.com/axios/axios/issues/6243)) ([2656612](https://github.com/axios/axios/commit/2656612bc10fe2757e9832b708ed773ab340b5cb))
* **import:** use named export for EventEmitter; ([7320430](https://github.com/axios/axios/commit/7320430aef2e1ba2b89488a0eaf42681165498b1))
* **vulnerability:** update follow-redirects to 1.15.6 ([#6300](https://github.com/axios/axios/issues/6300)) ([8786e0f](https://github.com/axios/axios/commit/8786e0ff55a8c68d4ca989801ad26df924042e27))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+4572/-3446 (#6238 )")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+30/-0 (#6231 )")
- <img src="https://avatars.githubusercontent.com/u/68230846?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Mitchell](https://github.com/Creaous "+9/-9 (#6300 )")
- <img src="https://avatars.githubusercontent.com/u/53797821?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Emmanuel](https://github.com/mannoeu "+2/-2 (#6196 )")
- <img src="https://avatars.githubusercontent.com/u/44109284?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Lucas Keller](https://github.com/ljkeller "+3/-0 (#6194 )")
- <img src="https://avatars.githubusercontent.com/u/72791488?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Aditya Mogili](https://github.com/ADITYA-176 "+1/-1 ()")
- <img src="https://avatars.githubusercontent.com/u/46135319?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Miroslav Petrov](https://github.com/petrovmiroslav "+1/-1 (#6243 )")

## [1.6.7](https://github.com/axios/axios/compare/v1.6.6...v1.6.7) (2024-01-25)


### Bug Fixes

* capture async stack only for rejections with native error objects; ([#6203](https://github.com/axios/axios/issues/6203)) ([1a08f90](https://github.com/axios/axios/commit/1a08f90f402336e4d00e9ee82f211c6adb1640b0))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+30/-26 (#6203 )")
- <img src="https://avatars.githubusercontent.com/u/73059627?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [zhoulixiang](https://github.com/zh-lx "+0/-3 (#6186 )")

## [1.6.6](https://github.com/axios/axios/compare/v1.6.5...v1.6.6) (2024-01-24)


### Bug Fixes

* fixed missed dispatchBeforeRedirect argument ([#5778](https://github.com/axios/axios/issues/5778)) ([a1938ff](https://github.com/axios/axios/commit/a1938ff073fcb0f89011f001dfbc1fa1dc995e39))
* wrap errors to improve async stack trace ([#5987](https://github.com/axios/axios/issues/5987)) ([123f354](https://github.com/axios/axios/commit/123f354b920f154a209ea99f76b7b2ef3d9ebbab))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/1186084?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Ilya Priven](https://github.com/ikonst "+91/-8 (#5987 )")
- <img src="https://avatars.githubusercontent.com/u/1884246?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Zao Soula](https://github.com/zaosoula "+6/-6 (#5778 )")

## [1.6.5](https://github.com/axios/axios/compare/v1.6.4...v1.6.5) (2024-01-05)


### Bug Fixes

* **ci:** refactor notify action as a job of publish action; ([#6176](https://github.com/axios/axios/issues/6176)) ([0736f95](https://github.com/axios/axios/commit/0736f95ce8776366dc9ca569f49ba505feb6373c))
* **dns:** fixed lookup error handling; ([#6175](https://github.com/axios/axios/issues/6175)) ([f4f2b03](https://github.com/axios/axios/commit/f4f2b039dd38eb4829e8583caede4ed6d2dd59be))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+41/-6 (#6176 #6175 )")
- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+6/-1 ()")

## [1.6.4](https://github.com/axios/axios/compare/v1.6.3...v1.6.4) (2024-01-03)


### Bug Fixes

* **security:** fixed formToJSON prototype pollution vulnerability; ([#6167](https://github.com/axios/axios/issues/6167)) ([3c0c11c](https://github.com/axios/axios/commit/3c0c11cade045c4412c242b5727308cff9897a0e))
* **security:** fixed security vulnerability in follow-redirects ([#6163](https://github.com/axios/axios/issues/6163)) ([75af1cd](https://github.com/axios/axios/commit/75af1cdff5b3a6ca3766d3d3afbc3115bb0811b8))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+34/-6 ()")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+34/-3 (#6172 #6167 )")
- <img src="https://avatars.githubusercontent.com/u/1402060?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Guy Nesher](https://github.com/gnesher "+10/-10 (#6163 )")

## [1.6.3](https://github.com/axios/axios/compare/v1.6.2...v1.6.3) (2023-12-26)


### Bug Fixes

* Regular Expression Denial of Service (ReDoS) ([#6132](https://github.com/axios/axios/issues/6132)) ([5e7ad38](https://github.com/axios/axios/commit/5e7ad38fb0f819fceb19fb2ee5d5d38f56aa837d))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/4814473?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jay](https://github.com/jasonsaayman "+15/-6 (#6145 )")
- <img src="https://avatars.githubusercontent.com/u/22686401?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Willian Agostini](https://github.com/WillianAgostini "+17/-2 (#6132 )")
- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+3/-0 (#6084 )")

## [1.6.2](https://github.com/axios/axios/compare/v1.6.1...v1.6.2) (2023-11-14)


### Features

* **withXSRFToken:** added withXSRFToken option as a workaround to achieve the old `withCredentials` behavior; ([#6046](https://github.com/axios/axios/issues/6046)) ([cff9967](https://github.com/axios/axios/commit/cff996779b272a5e94c2b52f5503ccf668bc42dc))

### PRs
- feat(withXSRFToken): added withXSRFToken option as a workaround to achieve the old &#x60;withCredentials&#x60; behavior; ( [#6046](https://api.github.com/repos/axios/axios/pulls/6046) )
```

📢 This PR added &#x27;withXSRFToken&#x27; option as a replacement for old withCredentials behaviour. 
You should now use withXSRFToken along with withCredential to get the old behavior.
This functionality is considered as a fix.
```

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+271/-146 (#6081 #6080 #6079 #6078 #6046 #6064 #6063 )")
- <img src="https://avatars.githubusercontent.com/u/79681367?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Ng Choon Khon (CK)](https://github.com/ckng0221 "+4/-4 (#6073 )")
- <img src="https://avatars.githubusercontent.com/u/9162827?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Muhammad Noman](https://github.com/mnomanmemon "+2/-2 (#6048 )")

## [1.6.1](https://github.com/axios/axios/compare/v1.6.0...v1.6.1) (2023-11-08)


### Bug Fixes

* **formdata:** fixed content-type header normalization for non-standard browser environments; ([#6056](https://github.com/axios/axios/issues/6056)) ([dd465ab](https://github.com/axios/axios/commit/dd465ab22bbfa262c6567be6574bf46a057d5288))
* **platform:** fixed emulated browser detection in node.js environment; ([#6055](https://github.com/axios/axios/issues/6055)) ([3dc8369](https://github.com/axios/axios/commit/3dc8369e505e32a4e12c22f154c55fd63ac67fbb))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+432/-65 (#6059 #6056 #6055 )")
- <img src="https://avatars.githubusercontent.com/u/3982806?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Fabian Meyer](https://github.com/meyfa "+5/-2 (#5835 )")

### PRs
- feat(withXSRFToken): added withXSRFToken option as a workaround to achieve the old &#x60;withCredentials&#x60; behavior; ( [#6046](https://api.github.com/repos/axios/axios/pulls/6046) )
```

📢 This PR added &#x27;withXSRFToken&#x27; option as a replacement for old withCredentials behaviour. 
You should now use withXSRFToken along with withCredential to get the old behavior.
This functionality is considered as a fix.
```

# [1.6.0](https://github.com/axios/axios/compare/v1.5.1...v1.6.0) (2023-10-26)


### Bug Fixes

* **CSRF:** fixed CSRF vulnerability CVE-2023-45857 ([#6028](https://github.com/axios/axios/issues/6028)) ([96ee232](https://github.com/axios/axios/commit/96ee232bd3ee4de2e657333d4d2191cd389e14d0))
* **dns:** fixed lookup function decorator to work properly in node v20; ([#6011](https://github.com/axios/axios/issues/6011)) ([5aaff53](https://github.com/axios/axios/commit/5aaff532a6b820bb9ab6a8cd0f77131b47e2adb8))
* **types:** fix AxiosHeaders types; ([#5931](https://github.com/axios/axios/issues/5931)) ([a1c8ad0](https://github.com/axios/axios/commit/a1c8ad008b3c13d53e135bbd0862587fb9d3fc09))

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+449/-114 (#6032 #6021 #6011 #5932 #5931 )")
- <img src="https://avatars.githubusercontent.com/u/63700910?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Valentin Panov](https://github.com/valentin-panov "+4/-4 (#6028 )")
- <img src="https://avatars.githubusercontent.com/u/76877078?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Rinku Chaudhari](https://github.com/therealrinku "+1/-1 (#5889 )")

## [1.5.1](https://github.com/axios/axios/compare/v1.5.0...v1.5.1) (2023-09-26)


### Bug Fixes

* **adapters:** improved adapters loading logic to have clear error messages; ([#5919](https://github.com/axios/axios/issues/5919)) ([e410779](https://github.com/axios/axios/commit/e4107797a7a1376f6209fbecfbbce73d3faa7859))
* **formdata:** fixed automatic addition of the `Content-Type` header for FormData in non-browser environments; ([#5917](https://github.com/axios/axios/issues/5917)) ([bc9af51](https://github.com/axios/axios/commit/bc9af51b1886d1b3529617702f2a21a6c0ed5d92))
* **headers:** allow `content-encoding` header to handle case-insensitive values ([#5890](https://github.com/axios/axios/issues/5890)) ([#5892](https://github.com/axios/axios/issues/5892)) ([4c89f25](https://github.com/axios/axios/commit/4c89f25196525e90a6e75eda9cb31ae0a2e18acd))
* **types:** removed duplicated code ([9e62056](https://github.com/axios/axios/commit/9e6205630e1c9cf863adf141c0edb9e6d8d4b149))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+89/-18 (#5919 #5917 )")
- <img src="https://avatars.githubusercontent.com/u/110460234?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [David Dallas](https://github.com/DavidJDallas "+11/-5 ()")
- <img src="https://avatars.githubusercontent.com/u/71556073?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Sean Sattler](https://github.com/fb-sean "+2/-8 ()")
- <img src="https://avatars.githubusercontent.com/u/4294069?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Mustafa Ateş Uzun](https://github.com/0o001 "+4/-4 ()")
- <img src="https://avatars.githubusercontent.com/u/132928043?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Przemyslaw Motacki](https://github.com/sfc-gh-pmotacki "+2/-1 (#5892 )")
- <img src="https://avatars.githubusercontent.com/u/5492927?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Michael Di Prisco](https://github.com/Cadienvan "+1/-1 ()")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

# [1.5.0](https://github.com/axios/axios/compare/v1.4.0...v1.5.0) (2023-08-26)


### Bug Fixes

* **adapter:** make adapter loading error more clear by using platform-specific adapters explicitly ([#5837](https://github.com/axios/axios/issues/5837)) ([9a414bb](https://github.com/axios/axios/commit/9a414bb6c81796a95c6c7fe668637825458e8b6d))
* **dns:** fixed `cacheable-lookup` integration; ([#5836](https://github.com/axios/axios/issues/5836)) ([b3e327d](https://github.com/axios/axios/commit/b3e327dcc9277bdce34c7ef57beedf644b00d628))
* **headers:** added support for setting header names that overlap with class methods; ([#5831](https://github.com/axios/axios/issues/5831)) ([d8b4ca0](https://github.com/axios/axios/commit/d8b4ca0ea5f2f05efa4edfe1e7684593f9f68273))
* **headers:** fixed common Content-Type header merging; ([#5832](https://github.com/axios/axios/issues/5832)) ([8fda276](https://github.com/axios/axios/commit/8fda2766b1e6bcb72c3fabc146223083ef13ce17))


### Features

* export getAdapter function ([#5324](https://github.com/axios/axios/issues/5324)) ([ca73eb8](https://github.com/axios/axios/commit/ca73eb878df0ae2dace81fe3a7f1fb5986231bf1))
* **export:** export adapters without `unsafe` prefix ([#5839](https://github.com/axios/axios/issues/5839)) ([1601f4a](https://github.com/axios/axios/commit/1601f4a27a81ab47fea228f1e244b2c4e3ce28bf))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+66/-29 (#5839 #5837 #5836 #5832 #5831 )")
- <img src="https://avatars.githubusercontent.com/u/102841186?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [夜葬](https://github.com/geekact "+42/-0 (#5324 )")
- <img src="https://avatars.githubusercontent.com/u/65978976?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Jonathan Budiman](https://github.com/JBudiman00 "+30/-0 (#5788 )")
- <img src="https://avatars.githubusercontent.com/u/5492927?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Michael Di Prisco](https://github.com/Cadienvan "+3/-5 (#5791 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

# [1.4.0](https://github.com/axios/axios/compare/v1.3.6...v1.4.0) (2023-04-27)


### Bug Fixes

* **formdata:** add `multipart/form-data` content type for FormData payload on custom client environments; ([#5678](https://github.com/axios/axios/issues/5678)) ([bbb61e7](https://github.com/axios/axios/commit/bbb61e70cb1185adfb1cbbb86eaf6652c48d89d1))
* **package:** export package internals with unsafe path prefix; ([#5677](https://github.com/axios/axios/issues/5677)) ([df38c94](https://github.com/axios/axios/commit/df38c949f26414d88ba29ec1e353c4d4f97eaf09))


### Features

* **dns:** added support for a custom lookup function; ([#5339](https://github.com/axios/axios/issues/5339)) ([2701911](https://github.com/axios/axios/commit/2701911260a1faa5cc5e1afe437121b330a3b7bb))
* **types:** export `AxiosHeaderValue` type. ([#5525](https://github.com/axios/axios/issues/5525)) ([726f1c8](https://github.com/axios/axios/commit/726f1c8e00cffa0461a8813a9bdcb8f8b9d762cf))


### Performance Improvements

* **merge-config:** optimize mergeConfig performance by avoiding duplicate key visits; ([#5679](https://github.com/axios/axios/issues/5679)) ([e6f7053](https://github.com/axios/axios/commit/e6f7053bf1a3e87cf1f9da8677e12e3fe829d68e))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+151/-16 (#5684 #5339 #5679 #5678 #5677 )")
- <img src="https://avatars.githubusercontent.com/u/47537704?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Arthur Fiorette](https://github.com/arthurfiorette "+19/-19 (#5525 )")
- <img src="https://avatars.githubusercontent.com/u/43876655?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [PIYUSH NEGI](https://github.com/npiyush97 "+2/-18 (#5670 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.6](https://github.com/axios/axios/compare/v1.3.5...v1.3.6) (2023-04-19)


### Bug Fixes

* **types:** added transport to RawAxiosRequestConfig ([#5445](https://github.com/axios/axios/issues/5445)) ([6f360a2](https://github.com/axios/axios/commit/6f360a2531d8d70363fd9becef6a45a323f170e2))
* **utils:** make isFormData detection logic stricter to avoid unnecessary calling of the `toString` method on the target; ([#5661](https://github.com/axios/axios/issues/5661)) ([aa372f7](https://github.com/axios/axios/commit/aa372f7306295dfd1100c1c2c77ce95c95808e76))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+48/-10 (#5665 #5661 #5663 )")
- <img src="https://avatars.githubusercontent.com/u/5492927?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Michael Di Prisco](https://github.com/Cadienvan "+2/-0 (#5445 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.5](https://github.com/axios/axios/compare/v1.3.4...v1.3.5) (2023-04-05)


### Bug Fixes

* **headers:** fixed isValidHeaderName to support full list of allowed characters; ([#5584](https://github.com/axios/axios/issues/5584)) ([e7decef](https://github.com/axios/axios/commit/e7decef6a99f4627e27ed9ea5b00ce8e201c3841))
* **params:** re-added the ability to set the function as `paramsSerializer` config; ([#5633](https://github.com/axios/axios/issues/5633)) ([a56c866](https://github.com/axios/axios/commit/a56c8661209d5ce5a645a05f294a0e08a6c1f6b3))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+28/-10 (#5633 #5584 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.4](https://github.com/axios/axios/compare/v1.3.3...v1.3.4) (2023-02-22)


### Bug Fixes

* **blob:** added a check to make sure the Blob class is available in the browser's global scope; ([#5548](https://github.com/axios/axios/issues/5548)) ([3772c8f](https://github.com/axios/axios/commit/3772c8fe74112a56e3e9551f894d899bc3a9443a))
* **http:** fixed regression bug when handling synchronous errors inside the adapter; ([#5564](https://github.com/axios/axios/issues/5564)) ([a3b246c](https://github.com/axios/axios/commit/a3b246c9de5c3bc4b5a742e15add55b375479451))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+38/-26 (#5564 )")
- <img src="https://avatars.githubusercontent.com/u/19550000?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [lcysgsg](https://github.com/lcysgsg "+4/-0 (#5548 )")
- <img src="https://avatars.githubusercontent.com/u/5492927?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Michael Di Prisco](https://github.com/Cadienvan "+3/-0 (#5444 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.3](https://github.com/axios/axios/compare/v1.3.2...v1.3.3) (2023-02-13)


### Bug Fixes

* **formdata:** added a check to make sure the FormData class is available in the browser's global scope; ([#5545](https://github.com/axios/axios/issues/5545)) ([a6dfa72](https://github.com/axios/axios/commit/a6dfa72010db5ad52db8bd13c0f98e537e8fd05d))
* **formdata:** fixed setting NaN as Content-Length for form payload in some cases; ([#5535](https://github.com/axios/axios/issues/5535)) ([c19f7bf](https://github.com/axios/axios/commit/c19f7bf770f90ae8307f4ea3104f227056912da1))
* **headers:** fixed the filtering logic of the clear method; ([#5542](https://github.com/axios/axios/issues/5542)) ([ea87ebf](https://github.com/axios/axios/commit/ea87ebfe6d1699af072b9e7cd40faf8f14b0ab93))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+11/-7 (#5545 #5535 #5542 )")
- <img src="https://avatars.githubusercontent.com/u/19842213?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [陈若枫](https://github.com/ruofee "+2/-2 (#5467 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.2](https://github.com/axios/axios/compare/v1.3.1...v1.3.2) (2023-02-03)


### Bug Fixes

* **http:** treat http://localhost as base URL for relative paths to avoid `ERR_INVALID_URL` error; ([#5528](https://github.com/axios/axios/issues/5528)) ([128d56f](https://github.com/axios/axios/commit/128d56f4a0fb8f5f2ed6e0dd80bc9225fee9538c))
* **http:** use explicit import instead of TextEncoder global; ([#5530](https://github.com/axios/axios/issues/5530)) ([6b3c305](https://github.com/axios/axios/commit/6b3c305fc40c56428e0afabedc6f4d29c2830f6f))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+2/-1 (#5530 #5528 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.3.1](https://github.com/axios/axios/compare/v1.3.0...v1.3.1) (2023-02-01)


### Bug Fixes

* **formdata:** add hotfix to use the asynchronous API to compute the content-length header value; ([#5521](https://github.com/axios/axios/issues/5521)) ([96d336f](https://github.com/axios/axios/commit/96d336f527619f21da012fe1f117eeb53e5a2120))
* **serializer:** fixed serialization of array-like objects; ([#5518](https://github.com/axios/axios/issues/5518)) ([08104c0](https://github.com/axios/axios/commit/08104c028c0f9353897b1b6691d74c440fd0c32d))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+27/-8 (#5521 #5518 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

# [1.3.0](https://github.com/axios/axios/compare/v1.2.6...v1.3.0) (2023-01-31)


### Bug Fixes

* **headers:** fixed & optimized clear method; ([#5507](https://github.com/axios/axios/issues/5507)) ([9915635](https://github.com/axios/axios/commit/9915635c69d0ab70daca5738488421f67ca60959))
* **http:** add zlib headers if missing ([#5497](https://github.com/axios/axios/issues/5497)) ([65e8d1e](https://github.com/axios/axios/commit/65e8d1e28ce829f47a837e45129730e541950d3c))


### Features

* **fomdata:** added support for spec-compliant FormData & Blob types; ([#5316](https://github.com/axios/axios/issues/5316)) ([6ac574e](https://github.com/axios/axios/commit/6ac574e00a06731288347acea1e8246091196953))

### Contributors to this release

- <img src="https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+352/-67 (#5514 #5512 #5510 #5509 #5508 #5316 #5507 )")
- <img src="https://avatars.githubusercontent.com/u/35015993?v&#x3D;4&amp;s&#x3D;18" alt="avatar" width="18"/> [ItsNotGoodName](https://github.com/ItsNotGoodName "+43/-2 (#5497 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.6](https://github.com/axios/axios/compare/v1.2.5...v1.2.6) (2023-01-28)


### Bug Fixes

* **headers:** added missed Authorization accessor; ([#5502](https://github.com/axios/axios/issues/5502)) ([342c0ba](https://github.com/axios/axios/commit/342c0ba9a16ea50f5ed7d2366c5c1a2c877e3f26))
* **types:** fixed `CommonRequestHeadersList` & `CommonResponseHeadersList` types to be private in commonJS; ([#5503](https://github.com/axios/axios/issues/5503)) ([5a3d0a3](https://github.com/axios/axios/commit/5a3d0a3234d77361a1bc7cedee2da1e11df08e2c))

### Contributors to this release

- ![avatar](https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;16) [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+24/-9 (#5503 #5502 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.5](https://github.com/axios/axios/compare/v1.2.4...v1.2.5) (2023-01-26)


### Bug Fixes

* **types:** fixed AxiosHeaders to handle spread syntax by making all methods non-enumerable; ([#5499](https://github.com/axios/axios/issues/5499)) ([580f1e8](https://github.com/axios/axios/commit/580f1e8033a61baa38149d59fd16019de3932c22))

### Contributors to this release

- ![avatar](https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;16) [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+82/-54 (#5499 )")
- ![avatar](https://avatars.githubusercontent.com/u/20516159?v&#x3D;4&amp;s&#x3D;16) [Elliot Ford](https://github.com/EFord36 "+1/-1 (#5462 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.4](https://github.com/axios/axios/compare/v1.2.3...v1.2.4) (2023-01-22)


### Bug Fixes

* **types:** renamed `RawAxiosRequestConfig` back to `AxiosRequestConfig`; ([#5486](https://github.com/axios/axios/issues/5486)) ([2a71f49](https://github.com/axios/axios/commit/2a71f49bc6c68495fa419003a3107ed8bd703ad0))
* **types:** fix `AxiosRequestConfig` generic; ([#5478](https://github.com/axios/axios/issues/5478)) ([9bce81b](https://github.com/axios/axios/commit/186ea062da8b7d578ae78b1a5c220986b9bce81b))

### Contributors to this release

- ![avatar](https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;16) [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+242/-108 (#5486 #5482 )")
- ![avatar](https://avatars.githubusercontent.com/u/9430821?v&#x3D;4&amp;s&#x3D;16) [Daniel Hillmann](https://github.com/hilleer "+1/-1 (#5478 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.3](https://github.com/axios/axios/compare/1.2.2...1.2.3) (2023-01-10)


### Bug Fixes

* **types:** fixed AxiosRequestConfig header interface by refactoring it to RawAxiosRequestConfig; ([#5420](https://github.com/axios/axios/issues/5420)) ([0811963](https://github.com/axios/axios/commit/08119634a22f1d5b19f5c9ea0adccb6d3eebc3bc))

### Contributors to this release

- ![avatar](https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;16) [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS "+938/-442 (#5456 #5455 #5453 #5451 #5449 #5447 #5446 #5443 #5442 #5439 #5420 )")

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.2] - 2022-12-29

### Fixed
- fix(ci): fix release script inputs [#5392](https://github.com/axios/axios/pull/5392)
- fix(ci): prerelease scipts [#5377](https://github.com/axios/axios/pull/5377)
- fix(ci): release scripts [#5376](https://github.com/axios/axios/pull/5376)
- fix(ci): typescript tests [#5375](https://github.com/axios/axios/pull/5375)
- fix: Brotli decompression [#5353](https://github.com/axios/axios/pull/5353)
- fix: add missing HttpStatusCode [#5345](https://github.com/axios/axios/pull/5345)

### Chores
- chore(ci): set conventional-changelog header config [#5406](https://github.com/axios/axios/pull/5406)
- chore(ci): fix automatic contributors resolving [#5403](https://github.com/axios/axios/pull/5403)
- chore(ci): improved logging for the contributors list generator [#5398](https://github.com/axios/axios/pull/5398)
- chore(ci): fix release action [#5397](https://github.com/axios/axios/pull/5397)
- chore(ci): fix version bump script by adding bump argument for target version [#5393](https://github.com/axios/axios/pull/5393)
- chore(deps): bump decode-uri-component from 0.2.0 to 0.2.2 [#5342](https://github.com/axios/axios/pull/5342)
- chore(ci): GitHub Actions Release script [#5384](https://github.com/axios/axios/pull/5384)
- chore(ci): release scripts [#5364](https://github.com/axios/axios/pull/5364)

### Contributors to this release
- ![avatar](https://avatars.githubusercontent.com/u/12586868?v&#x3D;4&amp;s&#x3D;16) [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- ![avatar](https://avatars.githubusercontent.com/u/1652293?v&#x3D;4&amp;s&#x3D;16) [Winnie](https://github.com/winniehell)

## [1.2.1] - 2022-12-05

### Changed
- feat(exports): export mergeConfig [#5151](https://github.com/axios/axios/pull/5151)

### Fixed
- fix(CancelledError): include config [#4922](https://github.com/axios/axios/pull/4922)
- fix(general): removing multiple/trailing/leading whitespace [#5022](https://github.com/axios/axios/pull/5022)
- fix(headers): decompression for responses without Content-Length header [#5306](https://github.com/axios/axios/pull/5306)
- fix(webWorker): exception to sending form data in web worker [#5139](https://github.com/axios/axios/pull/5139)

### Refactors
- refactor(types): AxiosProgressEvent.event type to any [#5308](https://github.com/axios/axios/pull/5308)
- refactor(types): add missing types for static AxiosError.from method [#4956](https://github.com/axios/axios/pull/4956)

### Chores
- chore(docs): remove README link to non-existent upgrade guide [#5307](https://github.com/axios/axios/pull/5307)
- chore(docs): typo in issue template name [#5159](https://github.com/axios/axios/pull/5159)

### Contributors to this release

- [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- [Zachary Lysobey](https://github.com/zachlysobey)
- [Kevin Ennis](https://github.com/kevincennis)
- [Philipp Loose](https://github.com/phloose)
- [secondl1ght](https://github.com/secondl1ght)
- [wenzheng](https://github.com/0x30)
- [Ivan Barsukov](https://github.com/ovarn)
- [Arthur Fiorette](https://github.com/arthurfiorette)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.2.0] - 2022-11-10

### Changed

- changed: refactored module exports [#5162](https://github.com/axios/axios/pull/5162)
- change: re-added support for loading Axios with require('axios').default [#5225](https://github.com/axios/axios/pull/5225)

### Fixed

- fix: improve AxiosHeaders class [#5224](https://github.com/axios/axios/pull/5224)
- fix: TypeScript type definitions for commonjs [#5196](https://github.com/axios/axios/pull/5196)
- fix: type definition of use method on AxiosInterceptorManager to match the the README [#5071](https://github.com/axios/axios/pull/5071)
- fix: __dirname is not defined in the sandbox [#5269](https://github.com/axios/axios/pull/5269)
- fix: AxiosError.toJSON method to avoid circular references [#5247](https://github.com/axios/axios/pull/5247)
- fix: Z_BUF_ERROR when content-encoding is set but the response body is empty [#5250](https://github.com/axios/axios/pull/5250)

### Refactors
- refactor: allowing adapters to be loaded by name [#5277](https://github.com/axios/axios/pull/5277)

### Chores

- chore: force CI restart [#5243](https://github.com/axios/axios/pull/5243)
- chore: update ECOSYSTEM.md [#5077](https://github.com/axios/axios/pull/5077)
- chore: update get/index.html [#5116](https://github.com/axios/axios/pull/5116)
- chore: update Sandbox UI/UX [#5205](https://github.com/axios/axios/pull/5205)
- chore:(actions): remove git credentials after checkout [#5235](https://github.com/axios/axios/pull/5235)
- chore(actions): bump actions/dependency-review-action from 2 to 3 [#5266](https://github.com/axios/axios/pull/5266)
- chore(packages): bump loader-utils from 1.4.1 to 1.4.2 [#5295](https://github.com/axios/axios/pull/5295)
- chore(packages): bump engine.io from 6.2.0 to 6.2.1 [#5294](https://github.com/axios/axios/pull/5294)
- chore(packages): bump socket.io-parser from 4.0.4 to 4.0.5 [#5241](https://github.com/axios/axios/pull/5241)
- chore(packages): bump loader-utils from 1.4.0 to 1.4.1 [#5245](https://github.com/axios/axios/pull/5245)
- chore(docs): update Resources links in README [#5119](https://github.com/axios/axios/pull/5119)
- chore(docs): update the link for JSON url [#5265](https://github.com/axios/axios/pull/5265)
- chore(docs): fix broken links [#5218](https://github.com/axios/axios/pull/5218)
- chore(docs): update and rename UPGRADE_GUIDE.md to MIGRATION_GUIDE.md [#5170](https://github.com/axios/axios/pull/5170)
- chore(docs): typo fix line #856 and #920 [#5194](https://github.com/axios/axios/pull/5194)
- chore(docs): typo fix #800 [#5193](https://github.com/axios/axios/pull/5193)
- chore(docs): fix typos [#5184](https://github.com/axios/axios/pull/5184)
- chore(docs): fix punctuation in README.md [#5197](https://github.com/axios/axios/pull/5197)
- chore(docs): update readme in the Handling Errors section - issue reference #5260 [#5261](https://github.com/axios/axios/pull/5261)
- chore: remove \b from filename [#5207](https://github.com/axios/axios/pull/5207)
- chore(docs): update CHANGELOG.md [#5137](https://github.com/axios/axios/pull/5137)
- chore: add sideEffects false to package.json [#5025](https://github.com/axios/axios/pull/5025)

### Contributors to this release

- [Maddy Miller](https://github.com/me4502)
- [Amit Saini](https://github.com/amitsainii)
- [ecyrbe](https://github.com/ecyrbe)
- [Ikko Ashimine](https://github.com/eltociear)
- [Geeth Gunnampalli](https://github.com/thetechie7)
- [Shreem Asati](https://github.com/shreem-123)
- [Frieder Bluemle](https://github.com/friederbluemle)
- [윤세영](https://github.com/yunseyeong)
- [Claudio Busatto](https://github.com/cjcbusatto)
- [Remco Haszing](https://github.com/remcohaszing)
- [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- [Csaba Maulis](https://github.com/om4csaba)
- [MoPaMo](https://github.com/MoPaMo)
- [Daniel Fjeldstad](https://github.com/w3bdesign)
- [Adrien Brunet](https://github.com/adrien-may)
- [Frazer Smith](https://github.com/Fdawgs)
- [HaiTao](https://github.com/836334258)
- [AZM](https://github.com/aziyatali)
- [relbns](https://github.com/relbns)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.1.3] - 2022-10-15

### Added

- Added custom params serializer support [#5113](https://github.com/axios/axios/pull/5113)

### Fixed

- Fixed top-level export to keep them in-line with static properties [#5109](https://github.com/axios/axios/pull/5109)
- Stopped including null values to query string. [#5108](https://github.com/axios/axios/pull/5108)
- Restored proxy config backwards compatibility with 0.x [#5097](https://github.com/axios/axios/pull/5097)
- Added back AxiosHeaders in AxiosHeaderValue [#5103](https://github.com/axios/axios/pull/5103)
- Pin CDN install instructions to a specific version [#5060](https://github.com/axios/axios/pull/5060)
- Handling of array values fixed for AxiosHeaders [#5085](https://github.com/axios/axios/pull/5085)

### Chores

- docs: match badge style, add link to them [#5046](https://github.com/axios/axios/pull/5046)
- chore: fixing comments typo [#5054](https://github.com/axios/axios/pull/5054)
- chore: update issue template [#5061](https://github.com/axios/axios/pull/5061)
- chore: added progress capturing section to the docs; [#5084](https://github.com/axios/axios/pull/5084)

### Contributors to this release

- [Jason Saayman](https://github.com/jasonsaayman)
- [scarf](https://github.com/scarf005)
- [Lenz Weber-Tronic](https://github.com/phryneas)
- [Arvindh](https://github.com/itsarvindh)
- [Félix Legrelle](https://github.com/FelixLgr)
- [Patrick Petrovic](https://github.com/ppati000)
- [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- [littledian](https://github.com/littledian)
- [ChronosMasterOfAllTime](https://github.com/ChronosMasterOfAllTime)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.1.2] - 2022-10-07

### Fixed

- Fixed broken exports for UMD builds.

### Contributors to this release

- [Jason Saayman](https://github.com/jasonsaayman)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.1.1] - 2022-10-07

### Fixed

- Fixed broken exports for common js. This fix breaks a prior fix, I will fix both issues ASAP but the commonJS use is more impactful.

### Contributors to this release

- [Jason Saayman](https://github.com/jasonsaayman)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.1.0] - 2022-10-06

### Fixed

- Fixed missing exports in type definition index.d.ts [#5003](https://github.com/axios/axios/pull/5003)
- Fixed query params composing [#5018](https://github.com/axios/axios/pull/5018)
- Fixed GenericAbortSignal interface by making it more generic [#5021](https://github.com/axios/axios/pull/5021)
- Fixed adding "clear" to AxiosInterceptorManager [#5010](https://github.com/axios/axios/pull/5010)
- Fixed commonjs & umd exports [#5030](https://github.com/axios/axios/pull/5030)
- Fixed inability to access response headers when using axios 1.x with Jest [#5036](https://github.com/axios/axios/pull/5036)

### Contributors to this release

- [Trim21](https://github.com/trim21)
- [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- [shingo.sasaki](https://github.com/s-sasaki-0529)
- [Ivan Pepelko](https://github.com/ivanpepelko)
- [Richard Kořínek](https://github.com/risa)

### PRs
- CVE 2023 45857 ( [#6028](https://api.github.com/repos/axios/axios/pulls/6028) )
```

⚠️ Critical vulnerability fix. See https://security.snyk.io/vuln/SNYK-JS-AXIOS-6032459
```

## [1.0.0] - 2022-10-04

### Added

- Added stack trace to AxiosError [#4624](https://github.com/axios/axios/pull/4624)
- Add AxiosError to AxiosStatic [#4654](https://github.com/axios/axios/pull/4654)
- Replaced Rollup as our build runner [#4596](https://github.com/axios/axios/pull/4596)
- Added generic TS types for the exposed toFormData helper [#4668](https://github.com/axios/axios/pull/4668)
- Added listen callback function [#4096](https://github.com/axios/axios/pull/4096)
- Added instructions for installing using PNPM [#4207](https://github.com/axios/axios/pull/4207)
- Added generic AxiosAbortSignal TS interface to avoid importing AbortController polyfill [#4229](https://github.com/axios/axios/pull/4229)
- Added axios-url-template in ECOSYSTEM.md [#4238](https://github.com/axios/axios/pull/4238)
- Added a clear() function to the request and response interceptors object so a user can ensure that all interceptors have been removed from an axios instance [#4248](https://github.com/axios/axios/pull/4248)
- Added react hook plugin [#4319](https://github.com/axios/axios/pull/4319)
- Adding HTTP status code for transformResponse [#4580](https://github.com/axios/axios/pull/4580)
- Added blob to the list of protocols supported by the browser [#4678](https://github.com/axios/axios/pull/4678)
- Resolving proxy from env on redirect [#4436](https://github.com/axios/axios/pull/4436)
- Added enhanced toFormData implementation with additional options [4704](https://github.com/axios/axios/pull/4704)
- Adding Canceler parameters config and request [#4711](https://github.com/axios/axios/pull/4711)
- Added automatic payload serialization to application/x-www-form-urlencoded [#4714](https://github.com/axios/axios/pull/4714)
- Added the ability for webpack users to overwrite built-ins [#4715](https://github.com/axios/axios/pull/4715)
- Added string[] to AxiosRequestHeaders type [#4322](https://github.com/axios/axios/pull/4322)
- Added the ability for the url-encoded-form serializer to respect the formSerializer config [#4721](https://github.com/axios/axios/pull/4721)
- Added isCancel type assert [#4293](https://github.com/axios/axios/pull/4293)
- Added data URL support for node.js [#4725](https://github.com/axios/axios/pull/4725)
- Adding types for progress event callbacks [#4675](https://github.com/axios/axios/pull/4675)
- URL params serializer [#4734](https://github.com/axios/axios/pull/4734)
- Added axios.formToJSON method [#4735](https://github.com/axios/axios/pull/4735)
- Bower platform add data protocol [#4804](https://github.com/axios/axios/pull/4804)
- Use WHATWG URL API instead of url.parse() [#4852](https://github.com/axios/axios/pull/4852)
- Add ENUM containing Http Status Codes to typings [#4903](https://github.com/axios/axios/pull/4903)
- Improve typing of timeout in index.d.ts [#4934](https://github.com/axios/axios/pull/4934)

### Changed

- Updated AxiosError.config to be optional in the type definition [#4665](https://github.com/axios/axios/pull/4665)
- Updated README emphasizing the URLSearchParam built-in interface over other solutions [#4590](https://github.com/axios/axios/pull/4590)
- Include request and config when creating a CanceledError instance [#4659](https://github.com/axios/axios/pull/4659)
- Changed func-names eslint rule to as-needed [#4492](https://github.com/axios/axios/pull/4492)
- Replacing deprecated substr() with slice() as substr() is deprecated [#4468](https://github.com/axios/axios/pull/4468)
- Updating HTTP links in README.md to use HTTPS [#4387](https://github.com/axios/axios/pull/4387)
- Updated to a better trim() polyfill [#4072](https://github.com/axios/axios/pull/4072)
- Updated types to allow specifying partial default headers on instance create [#4185](https://github.com/axios/axios/pull/4185)
- Expanded isAxiosError types [#4344](https://github.com/axios/axios/pull/4344)
- Updated type definition for axios instance methods [#4224](https://github.com/axios/axios/pull/4224)
- Updated eslint config [#4722](https://github.com/axios/axios/pull/4722)
- Updated Docs [#4742](https://github.com/axios/axios/pull/4742)
- Refactored Axios to use ES2017 [#4787](https://github.com/axios/axios/pull/4787)


### Deprecated
- There are multiple deprecations, refactors and fixes provided in this release. Please read through the full release notes to see how this may impact your project and use case.

### Removed

- Removed incorrect argument for NetworkError constructor [#4656](https://github.com/axios/axios/pull/4656)
- Removed Webpack [#4596](https://github.com/axios/axios/pull/4596)
- Removed function that transform arguments to array [#4544](https://github.com/axios/axios/pull/4544)

### Fixed

- Fixed grammar in README [#4649](https://github.com/axios/axios/pull/4649)
- Fixed code error in README [#4599](https://github.com/axios/axios/pull/4599)
- Optimized the code that checks cancellation [#4587](https://github.com/axios/axios/pull/4587)
- Fix url pointing to defaults.js in README [#4532](https://github.com/axios/axios/pull/4532)
- Use type alias instead of interface for AxiosPromise [#4505](https://github.com/axios/axios/pull/4505)
- Fix some word spelling and lint style in code comments [#4500](https://github.com/axios/axios/pull/4500)
- Edited readme with 3 updated browser icons of Chrome, FireFox and Safari [#4414](https://github.com/axios/axios/pull/4414)
- Bump follow-redirects from 1.14.9 to 1.15.0 [#4673](https://github.com/axios/axios/pull/4673)
- Fixing http tests to avoid hanging when assertions fail [#4435](https://github.com/axios/axios/pull/4435)
- Fix TS definition for AxiosRequestTransformer [#4201](https://github.com/axios/axios/pull/4201)
- Fix grammatical issues in README [#4232](https://github.com/axios/axios/pull/4232)
- Fixing instance.defaults.headers type [#4557](https://github.com/axios/axios/pull/4557)
- Fixed race condition on immediate requests cancellation [#4261](https://github.com/axios/axios/pull/4261)
- Fixing Z_BUF_ERROR when no content [#4701](https://github.com/axios/axios/pull/4701)
- Fixing proxy beforeRedirect regression [#4708](https://github.com/axios/axios/pull/4708)
- Fixed AxiosError status code type [#4717](https://github.com/axios/axios/pull/4717)
- Fixed AxiosError stack capturing [#4718](https://github.com/axios/axios/pull/4718)
- Fixing AxiosRequestHeaders typings [#4334](https://github.com/axios/axios/pull/4334)
- Fixed max body length defaults [#4731](https://github.com/axios/axios/pull/4731)
- Fixed toFormData Blob issue on node>v17 [#4728](https://github.com/axios/axios/pull/4728)
- Bump grunt from 1.5.2 to 1.5.3 [#4743](https://github.com/axios/axios/pull/4743)
- Fixing content-type header repeated [#4745](https://github.com/axios/axios/pull/4745)
- Fixed timeout error message for http [4738](https://github.com/axios/axios/pull/4738)
- Request ignores false, 0 and empty string as body values [#4785](https://github.com/axios/axios/pull/4785)
- Added back missing minified builds [#4805](https://github.com/axios/axios/pull/4805)
- Fixed a type error [#4815](https://github.com/axios/axios/pull/4815)
- Fixed a regression bug with unsubscribing from cancel token; [#4819](https://github.com/axios/axios/pull/4819)
- Remove repeated compression algorithm [#4820](https://github.com/axios/axios/pull/4820)
- The error of calling extend to pass parameters [#4857](https://github.com/axios/axios/pull/4857)
- SerializerOptions.indexes allows boolean | null | undefined [#4862](https://github.com/axios/axios/pull/4862)
- Require interceptors to return values [#4874](https://github.com/axios/axios/pull/4874)
- Removed unused imports [#4949](https://github.com/axios/axios/pull/4949)
- Allow null indexes on formSerializer and paramsSerializer [#4960](https://github.com/axios/axios/pull/4960)

### Chores
- Set permissions for GitHub actions [#4765](https://github.com/axios/axios/pull/4765)
- Included githubactions in the dependabot config [#4770](https://github.com/axios/axios/pull/4770)
- Included dependency review [#4771](https://github.com/axios/axios/pull/4771)
- Update security.md [#4784](https://github.com/axios/axios/pull/4784)
- Remove unnecessary spaces [#4854](https://github.com/axios/axios/pull/4854)
- Simplify the import path of AxiosError [#4875](https://github.com/axios/axios/pull/4875)
- Fix Gitpod dead link [#4941](https://github.com/axios/axios/pull/4941)
- Enable syntax highlighting for a code block [#4970](https://github.com/axios/axios/pull/4970)
- Using Logo Axios in Readme.md [#4993](https://github.com/axios/axios/pull/4993)
- Fix markup for note in README [#4825](https://github.com/axios/axios/pull/4825)
- Fix typo and formatting, add colons [#4853](https://github.com/axios/axios/pull/4853)
- Fix typo in readme [#4942](https://github.com/axios/axios/pull/4942)

### Security

- Update SECURITY.md [#4687](https://github.com/axios/axios/pull/4687)

### Contributors to this release

- [Bertrand Marron](https://github.com/tusbar)
- [Dmitriy Mozgovoy](https://github.com/DigitalBrainJS)
- [Dan Mooney](https://github.com/danmooney)
- [Michael Li](https://github.com/xiaoyu-tamu)
- [aong](https://github.com/yxwzaxns)
- [Des Preston](https://github.com/despreston)
- [Ted Robertson](https://github.com/tredondo)
- [zhoulixiang](https://github.com/zh-lx)
- [Arthur Fiorette](https://github.com/arthurfiorette)
- [Kumar Shanu](https://github.com/Kr-Shanu)
- [JALAL](https://github.com/JLL32)
- [Jingyi Lin](https://github.com/MageeLin)
- [Philipp Loose](https://github.com/phloose)
- [Alexander Shchukin](https://github.com/sashsvamir)
- [Dave Cardwell](https://github.com/davecardwell)
- [Cat Scarlet](https://github.com/catscarlet)
- [Luca Pizzini](https://github.com/lpizzinidev)
- [Kai](https://github.com/Schweinepriester)
- [Maxime Bargiel](https://github.com/mbargiel)
- [Brian Helba](https://github.com/brianhelba)
- [reslear](https://github.com/reslear)
- [Jamie Slome](https://github.com/JamieSlome)
- [Landro3](https://github.com/Landro3)
- [rafw87](https://github.com/rafw87)
- [Afzal Sayed](https://github.com/afzalsayed96)
- [Koki Oyatsu](https://github.com/kaishuu0123)
- [Dave](https://github.com/wangcch)
- [暴走老七](https://github.com/baozouai)
- [Spencer](https://github.com/spalger)
- [Adrian Wieprzkowicz](https://github.com/Argeento)
- [Jamie Telin](https://github.com/lejahmie)
- [毛呆](https://github.com/aweikalee)
- [Kirill Shakirov](https://github.com/turisap)
- [Rraji Abdelbari](https://github.com/estarossa0)
- [Jelle Schutter](https://github.com/jelleschutter)
- [Tom Ceuppens](https://github.com/KyorCode)
- [Johann Cooper](https://github.com/JohannCooper)
- [Dimitris Halatsis](https://github.com/mitsos1os)
- [chenjigeng](https://github.com/chenjigeng)
- [João Gabriel Quaresma](https://github.com/joaoGabriel55)
- [Victor Augusto](https://github.com/VictorAugDB)
- [neilnaveen](https://github.com/neilnaveen)
- [Pavlos](https://github.com/psmoros)
- [Kiryl Valkovich](https://github.com/visortelle)
- [Naveen](https://github.com/naveensrinivasan)
- [wenzheng](https://github.com/0x30)
- [hcwhan](https://github.com/hcwhan)
- [Bassel Rachid](https://github.com/basselworkforce)
- [Grégoire Pineau](https://github.com/lyrixx)
- [felipedamin](https://github.com/felipedamin)
- [Karl Horky](https://github.com/karlhorky)
- [Yue JIN](https://github.com/kingyue737)
- [Usman Ali Siddiqui](https://github.com/usman250994)
- [WD](https://github.com/techbirds)
- [Günther Foidl](https://github.com/gfoidl)
- [Stephen Jennings](https://github.com/jennings)
- [C.T.Lin](https://github.com/chentsulin)
- [mia-z](https://github.com/mia-z)
- [Parth Banathia](https://github.com/Parth0105)
- [parth0105pluang](https://github.com/parth0105pluang)
- [Marco Weber](https://github.com/mrcwbr)
- [Luca Pizzini](https://github.com/lpizzinidev)
- [Willian Agostini](https://github.com/WillianAgostini)
- [Huyen Nguyen](https://github.com/huyenltnguyen)


---

<!-- source: archive/library/javascript/references/packages/call-bind-apply-helpers/CHANGELOG--000367.md -->

## Imported source: archive/library/javascript/references/packages/call-bind-apply-helpers/CHANGELOG--000367.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.2](https://github.com/ljharb/call-bind-apply-helpers/compare/v1.0.1...v1.0.2) - 2025-02-12

### Commits

- [types] improve inferred types [`e6f9586`](https://github.com/ljharb/call-bind-apply-helpers/commit/e6f95860a3c72879cb861a858cdfb8138fbedec1)
- [Dev Deps] update `@arethetypeswrong/cli`, `@ljharb/tsconfig`, `@types/tape`, `es-value-fixtures`, `for-each`, `has-strict-mode`, `object-inspect` [`e43d540`](https://github.com/ljharb/call-bind-apply-helpers/commit/e43d5409f97543bfbb11f345d47d8ce4e066d8c1)

## [v1.0.1](https://github.com/ljharb/call-bind-apply-helpers/compare/v1.0.0...v1.0.1) - 2024-12-08

### Commits

- [types] `reflectApply`: fix types [`4efc396`](https://github.com/ljharb/call-bind-apply-helpers/commit/4efc3965351a4f02cc55e836fa391d3d11ef2ef8)
- [Fix] `reflectApply`: oops, Reflect is not a function [`83cc739`](https://github.com/ljharb/call-bind-apply-helpers/commit/83cc7395de6b79b7730bdf092f1436f0b1263c75)
- [Dev Deps] update `@arethetypeswrong/cli` [`80bd5d3`](https://github.com/ljharb/call-bind-apply-helpers/commit/80bd5d3ae58b4f6b6995ce439dd5a1bcb178a940)

## v1.0.0 - 2024-12-05

### Commits

- Initial implementation, tests, readme [`7879629`](https://github.com/ljharb/call-bind-apply-helpers/commit/78796290f9b7430c9934d6f33d94ae9bc89fce04)
- Initial commit [`3f1dc16`](https://github.com/ljharb/call-bind-apply-helpers/commit/3f1dc164afc43285631b114a5f9dd9137b2b952f)
- npm init [`081df04`](https://github.com/ljharb/call-bind-apply-helpers/commit/081df048c312fcee400922026f6e97281200a603)
- Only apps should have lockfiles [`5b9ca0f`](https://github.com/ljharb/call-bind-apply-helpers/commit/5b9ca0fe8101ebfaf309c549caac4e0a017ed930)


---

<!-- source: archive/library/javascript/references/packages/call-bound/CHANGELOG--000328.md -->

## Imported source: archive/library/javascript/references/packages/call-bound/CHANGELOG--000328.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.4](https://github.com/ljharb/call-bound/compare/v1.0.3...v1.0.4) - 2025-03-03

### Commits

- [types] improve types [`e648922`](https://github.com/ljharb/call-bound/commit/e6489222a9e54f350fbf952ceabe51fd8b6027ff)
- [Dev Deps] update `@arethetypeswrong/cli`, `@ljharb/tsconfig`, `@types/tape`, `es-value-fixtures`, `for-each`, `has-strict-mode`, `object-inspect` [`a42a5eb`](https://github.com/ljharb/call-bound/commit/a42a5ebe6c1b54fcdc7997c7dc64fdca9e936719)
- [Deps] update `call-bind-apply-helpers`, `get-intrinsic` [`f529eac`](https://github.com/ljharb/call-bound/commit/f529eac132404c17156bbc23ab2297a25d0f20b8)

## [v1.0.3](https://github.com/ljharb/call-bound/compare/v1.0.2...v1.0.3) - 2024-12-15

### Commits

- [Refactor] use `call-bind-apply-helpers` instead of `call-bind` [`5e0b134`](https://github.com/ljharb/call-bound/commit/5e0b13496df14fb7d05dae9412f088da8d3f75be)
- [Deps] update `get-intrinsic` [`41fc967`](https://github.com/ljharb/call-bound/commit/41fc96732a22c7b7e8f381f93ccc54bb6293be2e)
- [readme] fix example [`79a0137`](https://github.com/ljharb/call-bound/commit/79a0137723f7c6d09c9c05452bbf8d5efb5d6e49)
- [meta] add `sideEffects` flag [`08b07be`](https://github.com/ljharb/call-bound/commit/08b07be7f1c03f67dc6f3cdaf0906259771859f7)

## [v1.0.2](https://github.com/ljharb/call-bound/compare/v1.0.1...v1.0.2) - 2024-12-10

### Commits

- [Dev Deps] update `@arethetypeswrong/cli`, `@ljharb/tsconfig`, `gopd` [`e6a5ffe`](https://github.com/ljharb/call-bound/commit/e6a5ffe849368fe4f74dfd6cdeca1b9baa39e8d5)
- [Deps] update `call-bind`, `get-intrinsic` [`2aeb5b5`](https://github.com/ljharb/call-bound/commit/2aeb5b521dc2b2683d1345c753ea1161de2d1c14)
- [types] improve return type [`1a0c9fe`](https://github.com/ljharb/call-bound/commit/1a0c9fe3114471e7ca1f57d104e2efe713bb4871)

## v1.0.1 - 2024-12-05

### Commits

- Initial implementation, tests, readme, types [`6d94121`](https://github.com/ljharb/call-bound/commit/6d94121a9243602e506334069f7a03189fe3363d)
- Initial commit [`0eae867`](https://github.com/ljharb/call-bound/commit/0eae867334ea025c33e6e91cdecfc9df96680cf9)
- npm init [`71b2479`](https://github.com/ljharb/call-bound/commit/71b2479c6723e0b7d91a6b663613067e98b7b275)
- Only apps should have lockfiles [`c3754a9`](https://github.com/ljharb/call-bound/commit/c3754a949b7f9132b47e2d18c1729889736741eb)
- [actions] skip `npm ls` in node &lt; 10 [`74275a5`](https://github.com/ljharb/call-bound/commit/74275a5186b8caf6309b6b97472bdcb0df4683a8)
- [Dev Deps] add missing peer dep [`1354de8`](https://github.com/ljharb/call-bound/commit/1354de8679413e4ae9c523d85f76fa7a5e032d97)


---

<!-- source: archive/library/javascript/references/packages/create-require/CHANGELOG--000362.md -->

## Imported source: archive/library/javascript/references/packages/create-require/CHANGELOG--000362.md

# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [1.1.1](https://github.com/nuxt-contrib/create-require/compare/v1.1.0...v1.1.1) (2020-11-26)


### Bug Fixes

* **types:** explicitly import the URL type ([#3](https://github.com/nuxt-contrib/create-require/issues/3)) ([66a98cc](https://github.com/nuxt-contrib/create-require/commit/66a98cc60a430c3689f11ad111c5fbf4574a37b6))

## [1.1.0](https://github.com/nuxt-contrib/create-require/compare/v1.0.2...v1.1.0) (2020-11-21)


### Features

* fallback to process.cwd() if no filename provided either ([ae5e0d6](https://github.com/nuxt-contrib/create-require/commit/ae5e0d665945b980b82ae6e998146c32295a6734))

### [1.0.2](https://github.com/nuxt-contrib/create-require/compare/v1.0.1...v1.0.2) (2020-06-12)


### Bug Fixes

* use fake path if filename is directory ([c8e0983](https://github.com/nuxt-contrib/create-require/commit/c8e09834e322d8a106ac8018011f799e2fed03f2))

### [1.0.1](https://github.com/nuxt-contrib/create-require/compare/v1.0.0...v1.0.1) (2020-06-06)


### Bug Fixes

* **types:** specify types field ([2c06464](https://github.com/nuxt-contrib/create-require/commit/2c0646407704c1c534babdfed39a48f51fc4f616))

### 0.0.1 (2020-05-04)


---

<!-- source: archive/library/javascript/references/packages/debug/CHANGELOG--000452.md -->

## Imported source: archive/library/javascript/references/packages/debug/CHANGELOG--000452.md


2.6.9 / 2017-09-22
==================

  * remove ReDoS regexp in %o formatter (#504)

2.6.8 / 2017-05-18
==================

  * Fix: Check for undefined on browser globals (#462, @marbemac)

2.6.7 / 2017-05-16
==================

  * Fix: Update ms to 2.0.0 to fix regular expression denial of service vulnerability (#458, @hubdotcom)
  * Fix: Inline extend function in node implementation (#452, @dougwilson)
  * Docs: Fix typo (#455, @msasad)

2.6.5 / 2017-04-27
==================
  
  * Fix: null reference check on window.documentElement.style.WebkitAppearance (#447, @thebigredgeek)
  * Misc: clean up browser reference checks (#447, @thebigredgeek)
  * Misc: add npm-debug.log to .gitignore (@thebigredgeek)


2.6.4 / 2017-04-20
==================

  * Fix: bug that would occure if process.env.DEBUG is a non-string value. (#444, @LucianBuzzo)
  * Chore: ignore bower.json in npm installations. (#437, @joaovieira)
  * Misc: update "ms" to v0.7.3 (@tootallnate)

2.6.3 / 2017-03-13
==================

  * Fix: Electron reference to `process.env.DEBUG` (#431, @paulcbetts)
  * Docs: Changelog fix (@thebigredgeek)

2.6.2 / 2017-03-10
==================

  * Fix: DEBUG_MAX_ARRAY_LENGTH (#420, @slavaGanzin)
  * Docs: Add backers and sponsors from Open Collective (#422, @piamancini)
  * Docs: Add Slackin invite badge (@tootallnate)

2.6.1 / 2017-02-10
==================

  * Fix: Module's `export default` syntax fix for IE8 `Expected identifier` error
  * Fix: Whitelist DEBUG_FD for values 1 and 2 only (#415, @pi0)
  * Fix: IE8 "Expected identifier" error (#414, @vgoma)
  * Fix: Namespaces would not disable once enabled (#409, @musikov)

2.6.0 / 2016-12-28
==================

  * Fix: added better null pointer checks for browser useColors (@thebigredgeek)
  * Improvement: removed explicit `window.debug` export (#404, @tootallnate)
  * Improvement: deprecated `DEBUG_FD` environment variable (#405, @tootallnate)

2.5.2 / 2016-12-25
==================

  * Fix: reference error on window within webworkers (#393, @KlausTrainer)
  * Docs: fixed README typo (#391, @lurch)
  * Docs: added notice about v3 api discussion (@thebigredgeek)

2.5.1 / 2016-12-20
==================

  * Fix: babel-core compatibility

2.5.0 / 2016-12-20
==================

  * Fix: wrong reference in bower file (@thebigredgeek)
  * Fix: webworker compatibility (@thebigredgeek)
  * Fix: output formatting issue (#388, @kribblo)
  * Fix: babel-loader compatibility (#383, @escwald)
  * Misc: removed built asset from repo and publications (@thebigredgeek)
  * Misc: moved source files to /src (#378, @yamikuronue)
  * Test: added karma integration and replaced babel with browserify for browser tests (#378, @yamikuronue)
  * Test: coveralls integration (#378, @yamikuronue)
  * Docs: simplified language in the opening paragraph (#373, @yamikuronue)

2.4.5 / 2016-12-17
==================

  * Fix: `navigator` undefined in Rhino (#376, @jochenberger)
  * Fix: custom log function (#379, @hsiliev)
  * Improvement: bit of cleanup + linting fixes (@thebigredgeek)
  * Improvement: rm non-maintainted `dist/` dir (#375, @freewil)
  * Docs: simplified language in the opening paragraph. (#373, @yamikuronue)

2.4.4 / 2016-12-14
==================

  * Fix: work around debug being loaded in preload scripts for electron (#368, @paulcbetts)

2.4.3 / 2016-12-14
==================

  * Fix: navigation.userAgent error for react native (#364, @escwald)

2.4.2 / 2016-12-14
==================

  * Fix: browser colors (#367, @tootallnate)
  * Misc: travis ci integration (@thebigredgeek)
  * Misc: added linting and testing boilerplate with sanity check (@thebigredgeek)

2.4.1 / 2016-12-13
==================

  * Fix: typo that broke the package (#356)

2.4.0 / 2016-12-13
==================

  * Fix: bower.json references unbuilt src entry point (#342, @justmatt)
  * Fix: revert "handle regex special characters" (@tootallnate)
  * Feature: configurable util.inspect()`options for NodeJS (#327, @tootallnate)
  * Feature: %O`(big O) pretty-prints objects (#322, @tootallnate)
  * Improvement: allow colors in workers (#335, @botverse)
  * Improvement: use same color for same namespace. (#338, @lchenay)

2.3.3 / 2016-11-09
==================

  * Fix: Catch `JSON.stringify()` errors (#195, Jovan Alleyne)
  * Fix: Returning `localStorage` saved values (#331, Levi Thomason)
  * Improvement: Don't create an empty object when no `process` (Nathan Rajlich)

2.3.2 / 2016-11-09
==================

  * Fix: be super-safe in index.js as well (@TooTallNate)
  * Fix: should check whether process exists (Tom Newby)

2.3.1 / 2016-11-09
==================

  * Fix: Added electron compatibility (#324, @paulcbetts)
  * Improvement: Added performance optimizations (@tootallnate)
  * Readme: Corrected PowerShell environment variable example (#252, @gimre)
  * Misc: Removed yarn lock file from source control (#321, @fengmk2)

2.3.0 / 2016-11-07
==================

  * Fix: Consistent placement of ms diff at end of output (#215, @gorangajic)
  * Fix: Escaping of regex special characters in namespace strings (#250, @zacronos)
  * Fix: Fixed bug causing crash on react-native (#282, @vkarpov15)
  * Feature: Enabled ES6+ compatible import via default export (#212 @bucaran)
  * Feature: Added %O formatter to reflect Chrome's console.log capability (#279, @oncletom)
  * Package: Update "ms" to 0.7.2 (#315, @DevSide)
  * Package: removed superfluous version property from bower.json (#207 @kkirsche)
  * Readme: fix USE_COLORS to DEBUG_COLORS
  * Readme: Doc fixes for format string sugar (#269, @mlucool)
  * Readme: Updated docs for DEBUG_FD and DEBUG_COLORS environment variables (#232, @mattlyons0)
  * Readme: doc fixes for PowerShell (#271 #243, @exoticknight @unreadable)
  * Readme: better docs for browser support (#224, @matthewmueller)
  * Tooling: Added yarn integration for development (#317, @thebigredgeek)
  * Misc: Renamed History.md to CHANGELOG.md (@thebigredgeek)
  * Misc: Added license file (#226 #274, @CantemoInternal @sdaitzman)
  * Misc: Updated contributors (@thebigredgeek)

2.2.0 / 2015-05-09
==================

  * package: update "ms" to v0.7.1 (#202, @dougwilson)
  * README: add logging to file example (#193, @DanielOchoa)
  * README: fixed a typo (#191, @amir-s)
  * browser: expose `storage` (#190, @stephenmathieson)
  * Makefile: add a `distclean` target (#189, @stephenmathieson)

2.1.3 / 2015-03-13
==================

  * Updated stdout/stderr example (#186)
  * Updated example/stdout.js to match debug current behaviour
  * Renamed example/stderr.js to stdout.js
  * Update Readme.md (#184)
  * replace high intensity foreground color for bold (#182, #183)

2.1.2 / 2015-03-01
==================

  * dist: recompile
  * update "ms" to v0.7.0
  * package: update "browserify" to v9.0.3
  * component: fix "ms.js" repo location
  * changed bower package name
  * updated documentation about using debug in a browser
  * fix: security error on safari (#167, #168, @yields)

2.1.1 / 2014-12-29
==================

  * browser: use `typeof` to check for `console` existence
  * browser: check for `console.log` truthiness (fix IE 8/9)
  * browser: add support for Chrome apps
  * Readme: added Windows usage remarks
  * Add `bower.json` to properly support bower install

2.1.0 / 2014-10-15
==================

  * node: implement `DEBUG_FD` env variable support
  * package: update "browserify" to v6.1.0
  * package: add "license" field to package.json (#135, @panuhorsmalahti)

2.0.0 / 2014-09-01
==================

  * package: update "browserify" to v5.11.0
  * node: use stderr rather than stdout for logging (#29, @stephenmathieson)

1.0.4 / 2014-07-15
==================

  * dist: recompile
  * example: remove `console.info()` log usage
  * example: add "Content-Type" UTF-8 header to browser example
  * browser: place %c marker after the space character
  * browser: reset the "content" color via `color: inherit`
  * browser: add colors support for Firefox >= v31
  * debug: prefer an instance `log()` function over the global one (#119)
  * Readme: update documentation about styled console logs for FF v31 (#116, @wryk)

1.0.3 / 2014-07-09
==================

  * Add support for multiple wildcards in namespaces (#122, @seegno)
  * browser: fix lint

1.0.2 / 2014-06-10
==================

  * browser: update color palette (#113, @gscottolson)
  * common: make console logging function configurable (#108, @timoxley)
  * node: fix %o colors on old node <= 0.8.x
  * Makefile: find node path using shell/which (#109, @timoxley)

1.0.1 / 2014-06-06
==================

  * browser: use `removeItem()` to clear localStorage
  * browser, node: don't set DEBUG if namespaces is undefined (#107, @leedm777)
  * package: add "contributors" section
  * node: fix comment typo
  * README: list authors

1.0.0 / 2014-06-04
==================

  * make ms diff be global, not be scope
  * debug: ignore empty strings in enable()
  * node: make DEBUG_COLORS able to disable coloring
  * *: export the `colors` array
  * npmignore: don't publish the `dist` dir
  * Makefile: refactor to use browserify
  * package: add "browserify" as a dev dependency
  * Readme: add Web Inspector Colors section
  * node: reset terminal color for the debug content
  * node: map "%o" to `util.inspect()`
  * browser: map "%j" to `JSON.stringify()`
  * debug: add custom "formatters"
  * debug: use "ms" module for humanizing the diff
  * Readme: add "bash" syntax highlighting
  * browser: add Firebug color support
  * browser: add colors for WebKit browsers
  * node: apply log to `console`
  * rewrite: abstract common logic for Node & browsers
  * add .jshintrc file

0.8.1 / 2014-04-14
==================

  * package: re-add the "component" section

0.8.0 / 2014-03-30
==================

  * add `enable()` method for nodejs. Closes #27
  * change from stderr to stdout
  * remove unnecessary index.js file

0.7.4 / 2013-11-13
==================

  * remove "browserify" key from package.json (fixes something in browserify)

0.7.3 / 2013-10-30
==================

  * fix: catch localStorage security error when cookies are blocked (Chrome)
  * add debug(err) support. Closes #46
  * add .browser prop to package.json. Closes #42

0.7.2 / 2013-02-06
==================

  * fix package.json
  * fix: Mobile Safari (private mode) is broken with debug
  * fix: Use unicode to send escape character to shell instead of octal to work with strict mode javascript

0.7.1 / 2013-02-05
==================

  * add repository URL to package.json
  * add DEBUG_COLORED to force colored output
  * add browserify support
  * fix component. Closes #24

0.7.0 / 2012-05-04
==================

  * Added .component to package.json
  * Added debug.component.js build

0.6.0 / 2012-03-16
==================

  * Added support for "-" prefix in DEBUG [Vinay Pulim]
  * Added `.enabled` flag to the node version [TooTallNate]

0.5.0 / 2012-02-02
==================

  * Added: humanize diffs. Closes #8
  * Added `debug.disable()` to the CS variant
  * Removed padding. Closes #10
  * Fixed: persist client-side variant again. Closes #9

0.4.0 / 2012-02-01
==================

  * Added browser variant support for older browsers [TooTallNate]
  * Added `debug.enable('project:*')` to browser variant [TooTallNate]
  * Added padding to diff (moved it to the right)

0.3.0 / 2012-01-26
==================

  * Added millisecond diff when isatty, otherwise UTC string

0.2.0 / 2012-01-22
==================

  * Added wildcard support

0.1.0 / 2011-12-02
==================

  * Added: remove colors unless stderr isatty [TooTallNate]

0.0.1 / 2010-01-03
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/dotenv/CHANGELOG--000354.md -->

## Imported source: archive/library/javascript/references/packages/dotenv/CHANGELOG--000354.md

# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [Unreleased](https://github.com/motdotla/dotenv/compare/v16.4.7...master)

## [16.4.7](https://github.com/motdotla/dotenv/compare/v16.4.6...v16.4.7 (2024-12-03)

### Changed

- Ignore `.tap` folder when publishing. (oops, sorry about that everyone. - @motdotla) [#848](https://github.com/motdotla/dotenv/pull/848)

## [16.4.6](https://github.com/motdotla/dotenv/compare/v16.4.5...v16.4.6) (2024-12-02)

### Changed

- Clean up stale dev dependencies [#847](https://github.com/motdotla/dotenv/pull/847)
- Various README updates clarifying usage and alternative solutions using [dotenvx](https://github.com/dotenvx/dotenvx)

## [16.4.5](https://github.com/motdotla/dotenv/compare/v16.4.4...v16.4.5) (2024-02-19)

### Changed

- 🐞 Fix recent regression when using `path` option. return to historical behavior: do not attempt to auto find `.env` if `path` set. (regression was introduced in `16.4.3`) [#814](https://github.com/motdotla/dotenv/pull/814)

## [16.4.4](https://github.com/motdotla/dotenv/compare/v16.4.3...v16.4.4) (2024-02-13)

### Changed

- 🐞 Replaced chaining operator `?.` with old school `&&` (fixing node 12 failures) [#812](https://github.com/motdotla/dotenv/pull/812)

## [16.4.3](https://github.com/motdotla/dotenv/compare/v16.4.2...v16.4.3) (2024-02-12)

### Changed

- Fixed processing of multiple files in `options.path` [#805](https://github.com/motdotla/dotenv/pull/805)

## [16.4.2](https://github.com/motdotla/dotenv/compare/v16.4.1...v16.4.2) (2024-02-10)

### Changed

- Changed funding link in package.json to [`dotenvx.com`](https://dotenvx.com)

## [16.4.1](https://github.com/motdotla/dotenv/compare/v16.4.0...v16.4.1) (2024-01-24)

- Patch support for array as `path` option [#797](https://github.com/motdotla/dotenv/pull/797)

## [16.4.0](https://github.com/motdotla/dotenv/compare/v16.3.2...v16.4.0) (2024-01-23)

- Add `error.code` to error messages around `.env.vault` decryption handling [#795](https://github.com/motdotla/dotenv/pull/795)
- Add ability to find `.env.vault` file when filename(s) passed as an array [#784](https://github.com/motdotla/dotenv/pull/784)

## [16.3.2](https://github.com/motdotla/dotenv/compare/v16.3.1...v16.3.2) (2024-01-18)

### Added

- Add debug message when no encoding set [#735](https://github.com/motdotla/dotenv/pull/735)

### Changed

- Fix output typing for `populate` [#792](https://github.com/motdotla/dotenv/pull/792)
- Use subarray instead of slice [#793](https://github.com/motdotla/dotenv/pull/793)

## [16.3.1](https://github.com/motdotla/dotenv/compare/v16.3.0...v16.3.1) (2023-06-17)

### Added

- Add missing type definitions for `processEnv` and `DOTENV_KEY` options. [#756](https://github.com/motdotla/dotenv/pull/756)

## [16.3.0](https://github.com/motdotla/dotenv/compare/v16.2.0...v16.3.0) (2023-06-16)

### Added

- Optionally pass `DOTENV_KEY` to options rather than relying on `process.env.DOTENV_KEY`. Defaults to `process.env.DOTENV_KEY` [#754](https://github.com/motdotla/dotenv/pull/754)

## [16.2.0](https://github.com/motdotla/dotenv/compare/v16.1.4...v16.2.0) (2023-06-15)

### Added

- Optionally write to your own target object rather than `process.env`. Defaults to `process.env`. [#753](https://github.com/motdotla/dotenv/pull/753)
- Add import type URL to types file [#751](https://github.com/motdotla/dotenv/pull/751)

## [16.1.4](https://github.com/motdotla/dotenv/compare/v16.1.3...v16.1.4) (2023-06-04)

### Added

- Added `.github/` to `.npmignore` [#747](https://github.com/motdotla/dotenv/pull/747)

## [16.1.3](https://github.com/motdotla/dotenv/compare/v16.1.2...v16.1.3) (2023-05-31)

### Removed

- Removed `browser` keys for `path`, `os`, and `crypto` in package.json. These were set to false incorrectly as of 16.1. Instead, if using dotenv on the front-end make sure to include polyfills for `path`, `os`, and `crypto`. [node-polyfill-webpack-plugin](https://github.com/Richienb/node-polyfill-webpack-plugin) provides these.

## [16.1.2](https://github.com/motdotla/dotenv/compare/v16.1.1...v16.1.2) (2023-05-31)

### Changed

- Exposed private function `_configDotenv` as `configDotenv`. [#744](https://github.com/motdotla/dotenv/pull/744)

## [16.1.1](https://github.com/motdotla/dotenv/compare/v16.1.0...v16.1.1) (2023-05-30)

### Added

- Added type definition for `decrypt` function

### Changed

- Fixed `{crypto: false}` in `packageJson.browser`

## [16.1.0](https://github.com/motdotla/dotenv/compare/v16.0.3...v16.1.0) (2023-05-30)

### Added

- Add `populate` convenience method [#733](https://github.com/motdotla/dotenv/pull/733)
- Accept URL as path option [#720](https://github.com/motdotla/dotenv/pull/720)
- Add dotenv to `npm fund` command
- Spanish language README [#698](https://github.com/motdotla/dotenv/pull/698)
- Add `.env.vault` support. 🎉 ([#730](https://github.com/motdotla/dotenv/pull/730))

ℹ️ `.env.vault` extends the `.env` file format standard with a localized encrypted vault file. Package it securely with your production code deploys. It's cloud agnostic so that you can deploy your secrets anywhere – without [risky third-party integrations](https://techcrunch.com/2023/01/05/circleci-breach/). [read more](https://github.com/motdotla/dotenv#-deploying)

### Changed

- Fixed "cannot resolve 'fs'" error on tools like Replit [#693](https://github.com/motdotla/dotenv/pull/693)

## [16.0.3](https://github.com/motdotla/dotenv/compare/v16.0.2...v16.0.3) (2022-09-29)

### Changed

- Added library version to debug logs ([#682](https://github.com/motdotla/dotenv/pull/682))

## [16.0.2](https://github.com/motdotla/dotenv/compare/v16.0.1...v16.0.2) (2022-08-30)

### Added

- Export `env-options.js` and `cli-options.js` in package.json for use with downstream [dotenv-expand](https://github.com/motdotla/dotenv-expand) module

## [16.0.1](https://github.com/motdotla/dotenv/compare/v16.0.0...v16.0.1) (2022-05-10)

### Changed

- Minor README clarifications
- Development ONLY: updated devDependencies as recommended for development only security risks ([#658](https://github.com/motdotla/dotenv/pull/658))

## [16.0.0](https://github.com/motdotla/dotenv/compare/v15.0.1...v16.0.0) (2022-02-02)

### Added

- _Breaking:_ Backtick support 🎉 ([#615](https://github.com/motdotla/dotenv/pull/615))

If you had values containing the backtick character, please quote those values with either single or double quotes.

## [15.0.1](https://github.com/motdotla/dotenv/compare/v15.0.0...v15.0.1) (2022-02-02)

### Changed

- Properly parse empty single or double quoted values 🐞 ([#614](https://github.com/motdotla/dotenv/pull/614))

## [15.0.0](https://github.com/motdotla/dotenv/compare/v14.3.2...v15.0.0) (2022-01-31)

`v15.0.0` is a major new release with some important breaking changes.

### Added

- _Breaking:_ Multiline parsing support (just works. no need for the flag.)

### Changed

- _Breaking:_ `#` marks the beginning of a comment (UNLESS the value is wrapped in quotes. Please update your `.env` files to wrap in quotes any values containing `#`. For example: `SECRET_HASH="something-with-a-#-hash"`).

..Understandably, (as some teams have noted) this is tedious to do across the entire team. To make it less tedious, we recommend using [dotenv cli](https://github.com/dotenv-org/cli) going forward. It's an optional plugin that will keep your `.env` files in sync between machines, environments, or team members.

### Removed

- _Breaking:_ Remove multiline option (just works out of the box now. no need for the flag.)

## [14.3.2](https://github.com/motdotla/dotenv/compare/v14.3.1...v14.3.2) (2022-01-25)

### Changed

- Preserve backwards compatibility on values containing `#` 🐞 ([#603](https://github.com/motdotla/dotenv/pull/603))

## [14.3.1](https://github.com/motdotla/dotenv/compare/v14.3.0...v14.3.1) (2022-01-25)

### Changed

- Preserve backwards compatibility on exports by re-introducing the prior in-place exports 🐞 ([#606](https://github.com/motdotla/dotenv/pull/606))

## [14.3.0](https://github.com/motdotla/dotenv/compare/v14.2.0...v14.3.0) (2022-01-24)

### Added

- Add `multiline` option 🎉 ([#486](https://github.com/motdotla/dotenv/pull/486))

## [14.2.0](https://github.com/motdotla/dotenv/compare/v14.1.1...v14.2.0) (2022-01-17)

### Added

- Add `dotenv_config_override` cli option
- Add `DOTENV_CONFIG_OVERRIDE` command line env option

## [14.1.1](https://github.com/motdotla/dotenv/compare/v14.1.0...v14.1.1) (2022-01-17)

### Added

- Add React gotcha to FAQ on README

## [14.1.0](https://github.com/motdotla/dotenv/compare/v14.0.1...v14.1.0) (2022-01-17)

### Added

- Add `override` option 🎉 ([#595](https://github.com/motdotla/dotenv/pull/595))

## [14.0.1](https://github.com/motdotla/dotenv/compare/v14.0.0...v14.0.1) (2022-01-16)

### Added

- Log error on failure to load `.env` file ([#594](https://github.com/motdotla/dotenv/pull/594))

## [14.0.0](https://github.com/motdotla/dotenv/compare/v13.0.1...v14.0.0) (2022-01-16)

### Added

- _Breaking:_ Support inline comments for the parser 🎉 ([#568](https://github.com/motdotla/dotenv/pull/568))

## [13.0.1](https://github.com/motdotla/dotenv/compare/v13.0.0...v13.0.1) (2022-01-16)

### Changed

* Hide comments and newlines from debug output ([#404](https://github.com/motdotla/dotenv/pull/404))

## [13.0.0](https://github.com/motdotla/dotenv/compare/v12.0.4...v13.0.0) (2022-01-16)

### Added

* _Breaking:_ Add type file for `config.js` ([#539](https://github.com/motdotla/dotenv/pull/539))

## [12.0.4](https://github.com/motdotla/dotenv/compare/v12.0.3...v12.0.4) (2022-01-16)

### Changed

* README updates
* Minor order adjustment to package json format

## [12.0.3](https://github.com/motdotla/dotenv/compare/v12.0.2...v12.0.3) (2022-01-15)

### Changed

* Simplified jsdoc for consistency across editors

## [12.0.2](https://github.com/motdotla/dotenv/compare/v12.0.1...v12.0.2) (2022-01-15)

### Changed

* Improve embedded jsdoc type documentation

## [12.0.1](https://github.com/motdotla/dotenv/compare/v12.0.0...v12.0.1) (2022-01-15)

### Changed

* README updates and clarifications

## [12.0.0](https://github.com/motdotla/dotenv/compare/v11.0.0...v12.0.0) (2022-01-15)

### Removed

- _Breaking:_ drop support for Flow static type checker ([#584](https://github.com/motdotla/dotenv/pull/584))

### Changed

- Move types/index.d.ts to lib/main.d.ts ([#585](https://github.com/motdotla/dotenv/pull/585))
- Typescript cleanup ([#587](https://github.com/motdotla/dotenv/pull/587))
- Explicit typescript inclusion in package.json ([#566](https://github.com/motdotla/dotenv/pull/566))

## [11.0.0](https://github.com/motdotla/dotenv/compare/v10.0.0...v11.0.0) (2022-01-11)

### Changed

- _Breaking:_ drop support for Node v10 ([#558](https://github.com/motdotla/dotenv/pull/558))
- Patch debug option ([#550](https://github.com/motdotla/dotenv/pull/550))

## [10.0.0](https://github.com/motdotla/dotenv/compare/v9.0.2...v10.0.0) (2021-05-20)

### Added

- Add generic support to parse function
- Allow for import "dotenv/config.js"
- Add support to resolve home directory in path via ~

## [9.0.2](https://github.com/motdotla/dotenv/compare/v9.0.1...v9.0.2) (2021-05-10)

### Changed

- Support windows newlines with debug mode

## [9.0.1](https://github.com/motdotla/dotenv/compare/v9.0.0...v9.0.1) (2021-05-08)

### Changed

- Updates to README

## [9.0.0](https://github.com/motdotla/dotenv/compare/v8.6.0...v9.0.0) (2021-05-05)

### Changed

- _Breaking:_ drop support for Node v8

## [8.6.0](https://github.com/motdotla/dotenv/compare/v8.5.1...v8.6.0) (2021-05-05)

### Added

- define package.json in exports

## [8.5.1](https://github.com/motdotla/dotenv/compare/v8.5.0...v8.5.1) (2021-05-05)

### Changed

- updated dev dependencies via npm audit

## [8.5.0](https://github.com/motdotla/dotenv/compare/v8.4.0...v8.5.0) (2021-05-05)

### Added

- allow for `import "dotenv/config"`

## [8.4.0](https://github.com/motdotla/dotenv/compare/v8.3.0...v8.4.0) (2021-05-05)

### Changed

- point to exact types file to work with VS Code

## [8.3.0](https://github.com/motdotla/dotenv/compare/v8.2.0...v8.3.0) (2021-05-05)

### Changed

- _Breaking:_ drop support for Node v8 (mistake to be released as minor bump. later bumped to 9.0.0. see above.)

## [8.2.0](https://github.com/motdotla/dotenv/compare/v8.1.0...v8.2.0) (2019-10-16)

### Added

- TypeScript types

## [8.1.0](https://github.com/motdotla/dotenv/compare/v8.0.0...v8.1.0) (2019-08-18)

### Changed

- _Breaking:_ drop support for Node v6 ([#392](https://github.com/motdotla/dotenv/issues/392))

# [8.0.0](https://github.com/motdotla/dotenv/compare/v7.0.0...v8.0.0) (2019-05-02)

### Changed

- _Breaking:_ drop support for Node v6 ([#302](https://github.com/motdotla/dotenv/issues/392))

## [7.0.0] - 2019-03-12

### Fixed

- Fix removing unbalanced quotes ([#376](https://github.com/motdotla/dotenv/pull/376))

### Removed

- Removed `load` alias for `config` for consistency throughout code and documentation.

## [6.2.0] - 2018-12-03

### Added

- Support preload configuration via environment variables ([#351](https://github.com/motdotla/dotenv/issues/351))

## [6.1.0] - 2018-10-08

### Added

- `debug` option for `config` and `parse` methods will turn on logging

## [6.0.0] - 2018-06-02

### Changed

- _Breaking:_ drop support for Node v4 ([#304](https://github.com/motdotla/dotenv/pull/304))

## [5.0.0] - 2018-01-29

### Added

- Testing against Node v8 and v9
- Documentation on trim behavior of values
- Documentation on how to use with `import`

### Changed

- _Breaking_: default `path` is now `path.resolve(process.cwd(), '.env')`
- _Breaking_: does not write over keys already in `process.env` if the key has a falsy value
- using `const` and `let` instead of `var`

### Removed

- Testing against Node v7

## [4.0.0] - 2016-12-23

### Changed

- Return Object with parsed content or error instead of false ([#165](https://github.com/motdotla/dotenv/pull/165)).

### Removed

- `verbose` option removed in favor of returning result.

## [3.0.0] - 2016-12-20

### Added

- `verbose` option will log any error messages. Off by default.
- parses email addresses correctly
- allow importing config method directly in ES6

### Changed

- Suppress error messages by default ([#154](https://github.com/motdotla/dotenv/pull/154))
- Ignoring more files for NPM to make package download smaller

### Fixed

- False positive test due to case-sensitive variable ([#124](https://github.com/motdotla/dotenv/pull/124))

### Removed

- `silent` option removed in favor of `verbose`

## [2.0.0] - 2016-01-20

### Added

- CHANGELOG to ["make it easier for users and contributors to see precisely what notable changes have been made between each release"](http://keepachangelog.com/). Linked to from README
- LICENSE to be more explicit about what was defined in `package.json`. Linked to from README
- Testing nodejs v4 on travis-ci
- added examples of how to use dotenv in different ways
- return parsed object on success rather than boolean true

### Changed

- README has shorter description not referencing ruby gem since we don't have or want feature parity

### Removed

- Variable expansion and escaping so environment variables are encouraged to be fully orthogonal

## [1.2.0] - 2015-06-20

### Added

- Preload hook to require dotenv without including it in your code

### Changed

- clarified license to be "BSD-2-Clause" in `package.json`

### Fixed

- retain spaces in string vars

## [1.1.0] - 2015-03-31

### Added

- Silent option to silence `console.log` when `.env` missing

## [1.0.0] - 2015-03-13

### Removed

- support for multiple `.env` files. should always use one `.env` file for the current environment

[7.0.0]: https://github.com/motdotla/dotenv/compare/v6.2.0...v7.0.0
[6.2.0]: https://github.com/motdotla/dotenv/compare/v6.1.0...v6.2.0
[6.1.0]: https://github.com/motdotla/dotenv/compare/v6.0.0...v6.1.0
[6.0.0]: https://github.com/motdotla/dotenv/compare/v5.0.0...v6.0.0
[5.0.0]: https://github.com/motdotla/dotenv/compare/v4.0.0...v5.0.0
[4.0.0]: https://github.com/motdotla/dotenv/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/motdotla/dotenv/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/motdotla/dotenv/compare/v1.2.0...v2.0.0
[1.2.0]: https://github.com/motdotla/dotenv/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/motdotla/dotenv/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/motdotla/dotenv/compare/v0.4.0...v1.0.0


---

<!-- source: archive/library/javascript/references/packages/dunder-proto/CHANGELOG--000376.md -->

## Imported source: archive/library/javascript/references/packages/dunder-proto/CHANGELOG--000376.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.1](https://github.com/es-shims/dunder-proto/compare/v1.0.0...v1.0.1) - 2024-12-16

### Commits

- [Fix] do not crash when `--disable-proto=throw` [`6c367d9`](https://github.com/es-shims/dunder-proto/commit/6c367d919bc1604778689a297bbdbfea65752847)
- [Tests] ensure noproto tests only use the current version of dunder-proto [`b02365b`](https://github.com/es-shims/dunder-proto/commit/b02365b9cf889c4a2cac7be0c3cfc90a789af36c)
- [Dev Deps] update `@arethetypeswrong/cli`, `@types/tape` [`e3c5c3b`](https://github.com/es-shims/dunder-proto/commit/e3c5c3bd81cf8cef7dff2eca19e558f0e307f666)
- [Deps] update `call-bind-apply-helpers` [`19f1da0`](https://github.com/es-shims/dunder-proto/commit/19f1da028b8dd0d05c85bfd8f7eed2819b686450)

## v1.0.0 - 2024-12-06

### Commits

- Initial implementation, tests, readme, types [`a5b74b0`](https://github.com/es-shims/dunder-proto/commit/a5b74b0082f5270cb0905cd9a2e533cee7498373)
- Initial commit [`73fb5a3`](https://github.com/es-shims/dunder-proto/commit/73fb5a353b51ac2ab00c9fdeb0114daffd4c07a8)
- npm init [`80152dc`](https://github.com/es-shims/dunder-proto/commit/80152dc98155da4eb046d9f67a87ed96e8280a1d)
- Only apps should have lockfiles [`03e6660`](https://github.com/es-shims/dunder-proto/commit/03e6660a1d70dc401f3e217a031475ec537243dd)


---

<!-- source: archive/library/javascript/references/packages/es-define-property/CHANGELOG--000415.md -->

## Imported source: archive/library/javascript/references/packages/es-define-property/CHANGELOG--000415.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.1](https://github.com/ljharb/es-define-property/compare/v1.0.0...v1.0.1) - 2024-12-06

### Commits

- [types] use shared tsconfig [`954a663`](https://github.com/ljharb/es-define-property/commit/954a66360326e508a0e5daa4b07493d58f5e110e)
- [actions] split out node 10-20, and 20+ [`3a8e84b`](https://github.com/ljharb/es-define-property/commit/3a8e84b23883f26ff37b3e82ff283834228e18c6)
- [Dev Deps] update `@ljharb/eslint-config`, `@ljharb/tsconfig`, `@types/get-intrinsic`, `@types/tape`, `auto-changelog`, `gopd`, `tape` [`86ae27b`](https://github.com/ljharb/es-define-property/commit/86ae27bb8cc857b23885136fad9cbe965ae36612)
- [Refactor] avoid using `get-intrinsic` [`02480c0`](https://github.com/ljharb/es-define-property/commit/02480c0353ef6118965282977c3864aff53d98b1)
- [Tests] replace `aud` with `npm audit` [`f6093ff`](https://github.com/ljharb/es-define-property/commit/f6093ff74ab51c98015c2592cd393bd42478e773)
- [Tests] configure testling [`7139e66`](https://github.com/ljharb/es-define-property/commit/7139e66959247a56086d9977359caef27c6849e7)
- [Dev Deps] update `tape` [`b901b51`](https://github.com/ljharb/es-define-property/commit/b901b511a75e001a40ce1a59fef7d9ffcfc87482)
- [Tests] fix types in tests [`469d269`](https://github.com/ljharb/es-define-property/commit/469d269fd141b1e773ec053a9fa35843493583e0)
- [Dev Deps] add missing peer dep [`733acfb`](https://github.com/ljharb/es-define-property/commit/733acfb0c4c96edf337e470b89a25a5b3724c352)

## v1.0.0 - 2024-02-12

### Commits

- Initial implementation, tests, readme, types [`3e154e1`](https://github.com/ljharb/es-define-property/commit/3e154e11a2fee09127220f5e503bf2c0a31dd480)
- Initial commit [`07d98de`](https://github.com/ljharb/es-define-property/commit/07d98de34a4dc31ff5e83a37c0c3f49e0d85cd50)
- npm init [`c4eb634`](https://github.com/ljharb/es-define-property/commit/c4eb6348b0d3886aac36cef34ad2ee0665ea6f3e)
- Only apps should have lockfiles [`7af86ec`](https://github.com/ljharb/es-define-property/commit/7af86ec1d311ec0b17fdfe616a25f64276903856)


---

<!-- source: archive/library/javascript/references/packages/es-errors/CHANGELOG--000332.md -->

## Imported source: archive/library/javascript/references/packages/es-errors/CHANGELOG--000332.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.3.0](https://github.com/ljharb/es-errors/compare/v1.2.1...v1.3.0) - 2024-02-05

### Commits

- [New] add `EvalError` and `URIError` [`1927627`](https://github.com/ljharb/es-errors/commit/1927627ba68cb6c829d307231376c967db53acdf)

## [v1.2.1](https://github.com/ljharb/es-errors/compare/v1.2.0...v1.2.1) - 2024-02-04

### Commits

- [Fix] add missing `exports` entry [`5bb5f28`](https://github.com/ljharb/es-errors/commit/5bb5f280f98922701109d6ebb82eea2257cecc7e)

## [v1.2.0](https://github.com/ljharb/es-errors/compare/v1.1.0...v1.2.0) - 2024-02-04

### Commits

- [New] add `ReferenceError` [`6d8cf5b`](https://github.com/ljharb/es-errors/commit/6d8cf5bbb6f3f598d02cf6f30e468ba2caa8e143)

## [v1.1.0](https://github.com/ljharb/es-errors/compare/v1.0.0...v1.1.0) - 2024-02-04

### Commits

- [New] add base Error [`2983ab6`](https://github.com/ljharb/es-errors/commit/2983ab65f7bc5441276cb021dc3aa03c78881698)

## v1.0.0 - 2024-02-03

### Commits

- Initial implementation, tests, readme, type [`8f47631`](https://github.com/ljharb/es-errors/commit/8f476317e9ad76f40ad648081829b1a1a3a1288b)
- Initial commit [`ea5d099`](https://github.com/ljharb/es-errors/commit/ea5d099ef18e550509ab9e2be000526afd81c385)
- npm init [`6f5ebf9`](https://github.com/ljharb/es-errors/commit/6f5ebf9cead474dadd72b9e63dad315820a089ae)
- Only apps should have lockfiles [`e1a0aeb`](https://github.com/ljharb/es-errors/commit/e1a0aeb7b80f5cfc56be54d6b2100e915d47def8)
- [meta] add `sideEffects` flag [`a9c7d46`](https://github.com/ljharb/es-errors/commit/a9c7d460a492f1d8a241c836bc25a322a19cc043)


---

<!-- source: archive/library/javascript/references/packages/es-object-atoms/CHANGELOG--000316.md -->

## Imported source: archive/library/javascript/references/packages/es-object-atoms/CHANGELOG--000316.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.1.1](https://github.com/ljharb/es-object-atoms/compare/v1.1.0...v1.1.1) - 2025-01-14

### Commits

- [types] `ToObject`: improve types [`cfe8c8a`](https://github.com/ljharb/es-object-atoms/commit/cfe8c8a105c44820cb22e26f62d12ef0ad9715c8)

## [v1.1.0](https://github.com/ljharb/es-object-atoms/compare/v1.0.1...v1.1.0) - 2025-01-14

### Commits

- [New] add `isObject` [`51e4042`](https://github.com/ljharb/es-object-atoms/commit/51e4042df722eb3165f40dc5f4bf33d0197ecb07)

## [v1.0.1](https://github.com/ljharb/es-object-atoms/compare/v1.0.0...v1.0.1) - 2025-01-13

### Commits

- [Dev Deps] update `@ljharb/eslint-config`, `@ljharb/tsconfig`, `@types/tape`, `auto-changelog`, `tape` [`38ab9eb`](https://github.com/ljharb/es-object-atoms/commit/38ab9eb00b62c2f4668644f5e513d9b414ebd595)
- [types] improve types [`7d1beb8`](https://github.com/ljharb/es-object-atoms/commit/7d1beb887958b78b6a728a210a1c8370ab7e2aa1)
- [Tests] replace `aud` with `npm audit` [`25863ba`](https://github.com/ljharb/es-object-atoms/commit/25863baf99178f1d1ad33d1120498db28631907e)
- [Dev Deps] add missing peer dep [`c012309`](https://github.com/ljharb/es-object-atoms/commit/c0123091287e6132d6f4240496340c427433df28)

## v1.0.0 - 2024-03-16

### Commits

- Initial implementation, tests, readme, types [`f1499db`](https://github.com/ljharb/es-object-atoms/commit/f1499db7d3e1741e64979c61d645ab3137705e82)
- Initial commit [`99eedc7`](https://github.com/ljharb/es-object-atoms/commit/99eedc7b5fde38a50a28d3c8b724706e3e4c5f6a)
- [meta] rename repo [`fc851fa`](https://github.com/ljharb/es-object-atoms/commit/fc851fa70616d2d182aaf0bd02c2ed7084dea8fa)
- npm init [`b909377`](https://github.com/ljharb/es-object-atoms/commit/b909377c50049bd0ec575562d20b0f9ebae8947f)
- Only apps should have lockfiles [`7249edd`](https://github.com/ljharb/es-object-atoms/commit/7249edd2178c1b9ddfc66ffcc6d07fdf0d28efc1)


---

<!-- source: archive/library/javascript/references/packages/es-set-tostringtag/CHANGELOG--000264.md -->

## Imported source: archive/library/javascript/references/packages/es-set-tostringtag/CHANGELOG--000264.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v2.1.0](https://github.com/es-shims/es-set-tostringtag/compare/v2.0.3...v2.1.0) - 2025-01-01

### Commits

- [actions] split out node 10-20, and 20+ [`ede033c`](https://github.com/es-shims/es-set-tostringtag/commit/ede033cc4e506c3966d2d482d4ac5987e329162a)
- [types] use shared config [`28ef164`](https://github.com/es-shims/es-set-tostringtag/commit/28ef164ad7c5bc21837c79f7ef25542a1f258ade)
- [New] add `nonConfigurable` option [`3bee3f0`](https://github.com/es-shims/es-set-tostringtag/commit/3bee3f04caddd318f3932912212ed20b2d62aad7)
- [Fix] validate boolean option argument [`3c8a609`](https://github.com/es-shims/es-set-tostringtag/commit/3c8a609c795a305ccca163f0ff6956caa88cdc0e)
- [Dev Deps] update `@arethetypeswrong/cli`, `@ljharb/eslint-config`, `@ljharb/tsconfig`, `@types/get-intrinsic`, `@types/tape`, `auto-changelog`, `tape` [`501a969`](https://github.com/es-shims/es-set-tostringtag/commit/501a96998484226e07f5ffd447e8f305a998f1d8)
- [Tests] add coverage [`18af289`](https://github.com/es-shims/es-set-tostringtag/commit/18af2897b4e937373c9b8c8831bc338932246470)
- [readme] document `force` option [`bd446a1`](https://github.com/es-shims/es-set-tostringtag/commit/bd446a107b71a2270278442e5124f45590d3ee64)
- [Tests] use `@arethetypeswrong/cli` [`7c2c2fa`](https://github.com/es-shims/es-set-tostringtag/commit/7c2c2fa3cca0f4d263603adb75426b239514598f)
- [Tests] replace `aud` with `npm audit` [`9e372d7`](https://github.com/es-shims/es-set-tostringtag/commit/9e372d7e6db3dab405599a14d9074a99a03b8242)
- [Deps] update `get-intrinsic` [`7df1216`](https://github.com/es-shims/es-set-tostringtag/commit/7df12167295385c2a547410e687cb0c04f3a34b9)
- [Deps] update `hasown` [`993a7d2`](https://github.com/es-shims/es-set-tostringtag/commit/993a7d200e2059fd857ec1a25d0a49c2c34ae6e2)
- [Dev Deps] add missing peer dep [`148ed8d`](https://github.com/es-shims/es-set-tostringtag/commit/148ed8db99a7a94f9af3823fd083e6e437fa1587)

## [v2.0.3](https://github.com/es-shims/es-set-tostringtag/compare/v2.0.2...v2.0.3) - 2024-02-20

### Commits

- add types [`d538513`](https://github.com/es-shims/es-set-tostringtag/commit/d5385133592a32a0a416cb535327918af7fbc4ad)
- [Deps] update `get-intrinsic`, `has-tostringtag`, `hasown` [`d129b29`](https://github.com/es-shims/es-set-tostringtag/commit/d129b29536bccc8a9d03a47887ca4d1f7ad0c5b9)
- [Dev Deps] update `aud`, `npmignore`, `tape` [`132ed23`](https://github.com/es-shims/es-set-tostringtag/commit/132ed23c964a41ed55e4ab4a5a2c3fe185e821c1)
- [Tests] fix hasOwn require [`f89c831`](https://github.com/es-shims/es-set-tostringtag/commit/f89c831fe5f3edf1f979c597b56fee1be6111f56)

## [v2.0.2](https://github.com/es-shims/es-set-tostringtag/compare/v2.0.1...v2.0.2) - 2023-10-20

### Commits

- [Refactor] use `hasown` instead of `has` [`0cc6c4e`](https://github.com/es-shims/es-set-tostringtag/commit/0cc6c4e61fd13e8f00b85424ae6e541ebf289e74)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`70e447c`](https://github.com/es-shims/es-set-tostringtag/commit/70e447cf9f82b896ddf359fda0a0498c16cf3ed2)
- [Deps] update `get-intrinsic` [`826aab7`](https://github.com/es-shims/es-set-tostringtag/commit/826aab76180392871c8efa99acc0f0bbf775c64e)

## [v2.0.1](https://github.com/es-shims/es-set-tostringtag/compare/v2.0.0...v2.0.1) - 2023-01-05

### Fixed

- [Fix] move `has` to prod deps [`#2`](https://github.com/es-shims/es-set-tostringtag/issues/2)

### Commits

- [Dev Deps] update `@ljharb/eslint-config` [`b9eecd2`](https://github.com/es-shims/es-set-tostringtag/commit/b9eecd23c10b7b43ba75089ac8ff8cc6b295798b)

## [v2.0.0](https://github.com/es-shims/es-set-tostringtag/compare/v1.0.0...v2.0.0) - 2022-12-21

### Commits

- [Tests] refactor tests [`168dcfb`](https://github.com/es-shims/es-set-tostringtag/commit/168dcfbb535c279dc48ccdc89419155125aaec18)
- [Breaking] do not set toStringTag if it is already set [`226ab87`](https://github.com/es-shims/es-set-tostringtag/commit/226ab874192c625d9e5f0e599d3f60d2b2aa83b5)
- [New] add `force` option to set even if already set [`1abd4ec`](https://github.com/es-shims/es-set-tostringtag/commit/1abd4ecb282f19718c4518284b0293a343564505)

## v1.0.0 - 2022-12-21

### Commits

- Initial implementation, tests, readme [`a0e1147`](https://github.com/es-shims/es-set-tostringtag/commit/a0e11473f79a233b46374525c962ea1b4d42418a)
- Initial commit [`ffd4aff`](https://github.com/es-shims/es-set-tostringtag/commit/ffd4afffbeebf29aff0d87a7cfc3f7844e09fe68)
- npm init [`fffe5bd`](https://github.com/es-shims/es-set-tostringtag/commit/fffe5bd1d1146d084730a387a9c672371f4a8fff)
- Only apps should have lockfiles [`d363871`](https://github.com/es-shims/es-set-tostringtag/commit/d36387139465623e161a15dbd39120537f150c62)


---

<!-- source: archive/library/javascript/references/packages/function-bind/CHANGELOG--000436.md -->

## Imported source: archive/library/javascript/references/packages/function-bind/CHANGELOG--000436.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.1.2](https://github.com/ljharb/function-bind/compare/v1.1.1...v1.1.2) - 2023-10-12

### Merged

- Point to the correct file [`#16`](https://github.com/ljharb/function-bind/pull/16)

### Commits

- [Tests] migrate tests to Github Actions [`4f8b57c`](https://github.com/ljharb/function-bind/commit/4f8b57c02f2011fe9ae353d5e74e8745f0988af8)
- [Tests] remove `jscs` [`90eb2ed`](https://github.com/ljharb/function-bind/commit/90eb2edbeefd5b76cd6c3a482ea3454db169b31f)
- [meta] update `.gitignore` [`53fcdc3`](https://github.com/ljharb/function-bind/commit/53fcdc371cd66634d6e9b71c836a50f437e89fed)
- [Tests] up to `node` `v11.10`, `v10.15`, `v9.11`, `v8.15`, `v6.16`, `v4.9`; use `nvm install-latest-npm`; run audit script in tests [`1fe8f6e`](https://github.com/ljharb/function-bind/commit/1fe8f6e9aed0dfa8d8b3cdbd00c7f5ea0cd2b36e)
- [meta] add `auto-changelog` [`1921fcb`](https://github.com/ljharb/function-bind/commit/1921fcb5b416b63ffc4acad051b6aad5722f777d)
- [Robustness] remove runtime dependency on all builtins except `.apply` [`f743e61`](https://github.com/ljharb/function-bind/commit/f743e61aa6bb2360358c04d4884c9db853d118b7)
- Docs: enable badges; update wording [`503cb12`](https://github.com/ljharb/function-bind/commit/503cb12d998b5f91822776c73332c7adcd6355dd)
- [readme] update badges [`290c5db`](https://github.com/ljharb/function-bind/commit/290c5dbbbda7264efaeb886552a374b869a4bb48)
- [Tests] switch to nyc for coverage [`ea360ba`](https://github.com/ljharb/function-bind/commit/ea360ba907fc2601ed18d01a3827fa2d3533cdf8)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape` [`cae5e9e`](https://github.com/ljharb/function-bind/commit/cae5e9e07a5578dc6df26c03ee22851ce05b943c)
- [meta] add `funding` field; create FUNDING.yml [`c9f4274`](https://github.com/ljharb/function-bind/commit/c9f4274aa80ea3aae9657a3938fdba41a3b04ca6)
- [Tests] fix eslint errors from #15 [`f69aaa2`](https://github.com/ljharb/function-bind/commit/f69aaa2beb2fdab4415bfb885760a699d0b9c964)
- [actions] fix permissions [`99a0cd9`](https://github.com/ljharb/function-bind/commit/99a0cd9f3b5bac223a0d572f081834cd73314be7)
- [meta] use `npmignore` to autogenerate an npmignore file [`f03b524`](https://github.com/ljharb/function-bind/commit/f03b524ca91f75a109a5d062f029122c86ecd1ae)
- [Dev Deps] update `@ljharb/eslint‑config`, `eslint`, `tape` [`7af9300`](https://github.com/ljharb/function-bind/commit/7af930023ae2ce7645489532821e4fbbcd7a2280)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `covert`, `tape` [`64a9127`](https://github.com/ljharb/function-bind/commit/64a9127ab0bd331b93d6572eaf6e9971967fc08c)
- [Tests] use `aud` instead of `npm audit` [`e75069c`](https://github.com/ljharb/function-bind/commit/e75069c50010a8fcce2a9ce2324934c35fdb4386)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`d03555c`](https://github.com/ljharb/function-bind/commit/d03555ca59dea3b71ce710045e4303b9e2619e28)
- [meta] add `safe-publish-latest` [`9c8f809`](https://github.com/ljharb/function-bind/commit/9c8f8092aed027d7e80c94f517aa892385b64f09)
- [Dev Deps] update `@ljharb/eslint-config`, `tape` [`baf6893`](https://github.com/ljharb/function-bind/commit/baf6893e27f5b59abe88bc1995e6f6ed1e527397)
- [meta] create SECURITY.md [`4db1779`](https://github.com/ljharb/function-bind/commit/4db17799f1f28ae294cb95e0081ca2b591c3911b)
- [Tests] add `npm run audit` [`c8b38ec`](https://github.com/ljharb/function-bind/commit/c8b38ec40ed3f85dabdee40ed4148f1748375bc2)
- Revert "Point to the correct file" [`05cdf0f`](https://github.com/ljharb/function-bind/commit/05cdf0fa205c6a3c5ba40bbedd1dfa9874f915c9)

## [v1.1.1](https://github.com/ljharb/function-bind/compare/v1.1.0...v1.1.1) - 2017-08-28

### Commits

- [Tests] up to `node` `v8`; newer npm breaks on older node; fix scripts [`817f7d2`](https://github.com/ljharb/function-bind/commit/817f7d28470fdbff8ef608d4d565dd4d1430bc5e)
- [Dev Deps] update `eslint`, `jscs`, `tape`, `@ljharb/eslint-config` [`854288b`](https://github.com/ljharb/function-bind/commit/854288b1b6f5c555f89aceb9eff1152510262084)
- [Dev Deps] update `tape`, `jscs`, `eslint`, `@ljharb/eslint-config` [`83e639f`](https://github.com/ljharb/function-bind/commit/83e639ff74e6cd6921285bccec22c1bcf72311bd)
- Only apps should have lockfiles [`5ed97f5`](https://github.com/ljharb/function-bind/commit/5ed97f51235c17774e0832e122abda0f3229c908)
- Use a SPDX-compliant “license” field. [`5feefea`](https://github.com/ljharb/function-bind/commit/5feefea0dc0193993e83e5df01ded424403a5381)

## [v1.1.0](https://github.com/ljharb/function-bind/compare/v1.0.2...v1.1.0) - 2016-02-14

### Commits

- Update `eslint`, `tape`; use my personal shared `eslint` config [`9c9062a`](https://github.com/ljharb/function-bind/commit/9c9062abbe9dd70b59ea2c3a3c3a81f29b457097)
- Add `npm run eslint` [`dd96c56`](https://github.com/ljharb/function-bind/commit/dd96c56720034a3c1ffee10b8a59a6f7c53e24ad)
- [New] return the native `bind` when available. [`82186e0`](https://github.com/ljharb/function-bind/commit/82186e03d73e580f95ff167e03f3582bed90ed72)
- [Dev Deps] update `tape`, `jscs`, `eslint`, `@ljharb/eslint-config` [`a3dd767`](https://github.com/ljharb/function-bind/commit/a3dd76720c795cb7f4586b0544efabf8aa107b8b)
- Update `eslint` [`3dae2f7`](https://github.com/ljharb/function-bind/commit/3dae2f7423de30a2d20313ddb1edc19660142fe9)
- Update `tape`, `covert`, `jscs` [`a181eee`](https://github.com/ljharb/function-bind/commit/a181eee0cfa24eb229c6e843a971f36e060a2f6a)
- [Tests] up to `node` `v5.6`, `v4.3` [`964929a`](https://github.com/ljharb/function-bind/commit/964929a6a4ddb36fb128de2bcc20af5e4f22e1ed)
- Test up to `io.js` `v2.1` [`2be7310`](https://github.com/ljharb/function-bind/commit/2be7310f2f74886a7124ca925be411117d41d5ea)
- Update `tape`, `jscs`, `eslint`, `@ljharb/eslint-config` [`45f3d68`](https://github.com/ljharb/function-bind/commit/45f3d6865c6ca93726abcef54febe009087af101)
- [Dev Deps] update `tape`, `jscs` [`6e1340d`](https://github.com/ljharb/function-bind/commit/6e1340d94642deaecad3e717825db641af4f8b1f)
- [Tests] up to `io.js` `v3.3`, `node` `v4.1` [`d9bad2b`](https://github.com/ljharb/function-bind/commit/d9bad2b778b1b3a6dd2876087b88b3acf319f8cc)
- Update `eslint` [`935590c`](https://github.com/ljharb/function-bind/commit/935590caa024ab356102e4858e8fc315b2ccc446)
- [Dev Deps] update `jscs`, `eslint`, `@ljharb/eslint-config` [`8c9a1ef`](https://github.com/ljharb/function-bind/commit/8c9a1efd848e5167887aa8501857a0940a480c57)
- Test on `io.js` `v2.2` [`9a3a38c`](https://github.com/ljharb/function-bind/commit/9a3a38c92013aed6e108666e7bd40969b84ac86e)
- Run `travis-ci` tests on `iojs` and `node` v0.12; speed up builds; allow 0.8 failures. [`69afc26`](https://github.com/ljharb/function-bind/commit/69afc2617405b147dd2a8d8ae73ca9e9283f18b4)
- [Dev Deps] Update `tape`, `eslint` [`36c1be0`](https://github.com/ljharb/function-bind/commit/36c1be0ab12b45fe5df6b0fdb01a5d5137fd0115)
- Update `tape`, `jscs` [`98d8303`](https://github.com/ljharb/function-bind/commit/98d8303cd5ca1c6b8f985469f86b0d44d7d45f6e)
- Update `jscs` [`9633a4e`](https://github.com/ljharb/function-bind/commit/9633a4e9fbf82051c240855166e468ba8ba0846f)
- Update `tape`, `jscs` [`c80ef0f`](https://github.com/ljharb/function-bind/commit/c80ef0f46efc9791e76fa50de4414092ac147831)
- Test up to `io.js` `v3.0` [`7e2c853`](https://github.com/ljharb/function-bind/commit/7e2c8537d52ab9cf5a655755561d8917684c0df4)
- Test on `io.js` `v2.4` [`5a199a2`](https://github.com/ljharb/function-bind/commit/5a199a27ba46795ba5eaf0845d07d4b8232895c9)
- Test on `io.js` `v2.3` [`a511b88`](https://github.com/ljharb/function-bind/commit/a511b8896de0bddf3b56862daa416c701f4d0453)
- Fixing a typo from 822b4e1938db02dc9584aa434fd3a45cb20caf43 [`732d6b6`](https://github.com/ljharb/function-bind/commit/732d6b63a9b33b45230e630dbcac7a10855d3266)
- Update `jscs` [`da52a48`](https://github.com/ljharb/function-bind/commit/da52a4886c06d6490f46ae30b15e4163ba08905d)
- Lock covert to v1.0.0. [`d6150fd`](https://github.com/ljharb/function-bind/commit/d6150fda1e6f486718ebdeff823333d9e48e7430)

## [v1.0.2](https://github.com/ljharb/function-bind/compare/v1.0.1...v1.0.2) - 2014-10-04

## [v1.0.1](https://github.com/ljharb/function-bind/compare/v1.0.0...v1.0.1) - 2014-10-03

### Merged

- make CI build faster [`#3`](https://github.com/ljharb/function-bind/pull/3)

### Commits

- Using my standard jscs.json [`d8ee94c`](https://github.com/ljharb/function-bind/commit/d8ee94c993eff0a84cf5744fe6a29627f5cffa1a)
- Adding `npm run lint` [`7571ab7`](https://github.com/ljharb/function-bind/commit/7571ab7dfdbd99b25a1dbb2d232622bd6f4f9c10)
- Using consistent indentation [`e91a1b1`](https://github.com/ljharb/function-bind/commit/e91a1b13a61e99ec1e530e299b55508f74218a95)
- Updating jscs [`7e17892`](https://github.com/ljharb/function-bind/commit/7e1789284bc629bc9c1547a61c9b227bbd8c7a65)
- Using consistent quotes [`c50b57f`](https://github.com/ljharb/function-bind/commit/c50b57fcd1c5ec38320979c837006069ebe02b77)
- Adding keywords [`cb94631`](https://github.com/ljharb/function-bind/commit/cb946314eed35f21186a25fb42fc118772f9ee00)
- Directly export a function expression instead of using a declaration, and relying on hoisting. [`5a33c5f`](https://github.com/ljharb/function-bind/commit/5a33c5f45642de180e0d207110bf7d1843ceb87c)
- Naming npm URL and badge in README; use SVG [`2aef8fc`](https://github.com/ljharb/function-bind/commit/2aef8fcb79d54e63a58ae557c4e60949e05d5e16)
- Naming deps URLs in README [`04228d7`](https://github.com/ljharb/function-bind/commit/04228d766670ee45ca24e98345c1f6a7621065b5)
- Naming travis-ci URLs in README; using SVG [`62c810c`](https://github.com/ljharb/function-bind/commit/62c810c2f54ced956cd4d4ab7b793055addfe36e)
- Make sure functions are invoked correctly (also passing coverage tests) [`2b289b4`](https://github.com/ljharb/function-bind/commit/2b289b4dfbf037ffcfa4dc95eb540f6165e9e43a)
- Removing the strict mode pragmas; they make tests fail. [`1aa701d`](https://github.com/ljharb/function-bind/commit/1aa701d199ddc3782476e8f7eef82679be97b845)
- Adding myself as a contributor [`85fd57b`](https://github.com/ljharb/function-bind/commit/85fd57b0860e5a7af42de9a287f3f265fc6d72fc)
- Adding strict mode pragmas [`915b08e`](https://github.com/ljharb/function-bind/commit/915b08e084c86a722eafe7245e21db74aa21ca4c)
- Adding devDeps URLs to README [`4ccc731`](https://github.com/ljharb/function-bind/commit/4ccc73112c1769859e4ca3076caf4086b3cba2cd)
- Fixing the description. [`a7a472c`](https://github.com/ljharb/function-bind/commit/a7a472cf649af515c635cf560fc478fbe48999c8)
- Using a function expression instead of a function declaration. [`b5d3e4e`](https://github.com/ljharb/function-bind/commit/b5d3e4ea6aaffc63888953eeb1fbc7ff45f1fa14)
- Updating tape [`f086be6`](https://github.com/ljharb/function-bind/commit/f086be6029fb56dde61a258c1340600fa174d1e0)
- Updating jscs [`5f9bdb3`](https://github.com/ljharb/function-bind/commit/5f9bdb375ab13ba48f30852aab94029520c54d71)
- Updating jscs [`9b409ba`](https://github.com/ljharb/function-bind/commit/9b409ba6118e23395a4e5d83ef39152aab9d3bfc)
- Run coverage as part of tests. [`8e1b6d4`](https://github.com/ljharb/function-bind/commit/8e1b6d459f047d1bd4fee814e01247c984c80bd0)
- Run linter as part of tests [`c1ca83f`](https://github.com/ljharb/function-bind/commit/c1ca83f832df94587d09e621beba682fabfaa987)
- Updating covert [`701e837`](https://github.com/ljharb/function-bind/commit/701e83774b57b4d3ef631e1948143f43a72f4bb9)

## [v1.0.0](https://github.com/ljharb/function-bind/compare/v0.2.0...v1.0.0) - 2014-08-09

### Commits

- Make sure old and unstable nodes don't fail Travis [`27adca3`](https://github.com/ljharb/function-bind/commit/27adca34a4ab6ad67b6dfde43942a1b103ce4d75)
- Fixing an issue when the bound function is called as a constructor in ES3. [`e20122d`](https://github.com/ljharb/function-bind/commit/e20122d267d92ce553859b280cbbea5d27c07731)
- Adding `npm run coverage` [`a2e29c4`](https://github.com/ljharb/function-bind/commit/a2e29c4ecaef9e2f6cd1603e868c139073375502)
- Updating tape [`b741168`](https://github.com/ljharb/function-bind/commit/b741168b12b235b1717ff696087645526b69213c)
- Upgrading tape [`63631a0`](https://github.com/ljharb/function-bind/commit/63631a04c7fbe97cc2fa61829cc27246d6986f74)
- Updating tape [`363cb46`](https://github.com/ljharb/function-bind/commit/363cb46dafb23cb3e347729a22f9448051d78464)

## v0.2.0 - 2014-03-23

### Commits

- Updating test coverage to match es5-shim. [`aa94d44`](https://github.com/ljharb/function-bind/commit/aa94d44b8f9d7f69f10e060db7709aa7a694e5d4)
- initial [`942ee07`](https://github.com/ljharb/function-bind/commit/942ee07e94e542d91798137bc4b80b926137e066)
- Setting the bound function's length properly. [`079f46a`](https://github.com/ljharb/function-bind/commit/079f46a2d3515b7c0b308c2c13fceb641f97ca25)
- Ensuring that some older browsers will throw when given a regex. [`36ac55b`](https://github.com/ljharb/function-bind/commit/36ac55b87f460d4330253c92870aa26fbfe8227f)
- Removing npm scripts that don't have dependencies [`9d2be60`](https://github.com/ljharb/function-bind/commit/9d2be600002cb8bc8606f8f3585ad3e05868c750)
- Updating tape [`297a4ac`](https://github.com/ljharb/function-bind/commit/297a4acc5464db381940aafb194d1c88f4e678f3)
- Skipping length tests for now. [`d9891ea`](https://github.com/ljharb/function-bind/commit/d9891ea4d2aaffa69f408339cdd61ff740f70565)
- don't take my tea [`dccd930`](https://github.com/ljharb/function-bind/commit/dccd930bfd60ea10cb178d28c97550c3bc8c1e07)


---

<!-- source: archive/library/javascript/references/packages/get-intrinsic/CHANGELOG--000360.md -->

## Imported source: archive/library/javascript/references/packages/get-intrinsic/CHANGELOG--000360.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.3.0](https://github.com/ljharb/get-intrinsic/compare/v1.2.7...v1.3.0) - 2025-02-22

### Commits

- [Dev Deps] update `es-abstract`, `es-value-fixtures`, `for-each`, `object-inspect` [`9b61553`](https://github.com/ljharb/get-intrinsic/commit/9b61553c587f1c1edbd435597e88c7d387da97dd)
- [Deps] update `call-bind-apply-helpers`, `es-object-atoms`, `get-proto` [`a341fee`](https://github.com/ljharb/get-intrinsic/commit/a341fee0f39a403b0f0069e82c97642d5eb11043)
- [New] add `Float16Array` [`de22116`](https://github.com/ljharb/get-intrinsic/commit/de22116b492fb989a0341bceb6e573abfaed73dc)

## [v1.2.7](https://github.com/ljharb/get-intrinsic/compare/v1.2.6...v1.2.7) - 2025-01-02

### Commits

- [Refactor] use `get-proto` directly [`00ab955`](https://github.com/ljharb/get-intrinsic/commit/00ab95546a0980c8ad42a84253daaa8d2adcedf9)
- [Deps] update `math-intrinsics` [`c716cdd`](https://github.com/ljharb/get-intrinsic/commit/c716cdd6bbe36b438057025561b8bb5a879ac8a0)
- [Dev Deps] update `call-bound`, `es-abstract` [`dc648a6`](https://github.com/ljharb/get-intrinsic/commit/dc648a67eb359037dff8d8619bfa71d86debccb1)

## [v1.2.6](https://github.com/ljharb/get-intrinsic/compare/v1.2.5...v1.2.6) - 2024-12-11

### Commits

- [Refactor] use `math-intrinsics` [`841be86`](https://github.com/ljharb/get-intrinsic/commit/841be8641a9254c4c75483b30c8871b5d5065926)
- [Refactor] use `es-object-atoms` [`42057df`](https://github.com/ljharb/get-intrinsic/commit/42057dfa16f66f64787e66482af381cc6f31d2c1)
- [Deps] update `call-bind-apply-helpers` [`45afa24`](https://github.com/ljharb/get-intrinsic/commit/45afa24a9ee4d6d3c172db1f555b16cb27843ef4)
- [Dev Deps] update `call-bound` [`9cba9c6`](https://github.com/ljharb/get-intrinsic/commit/9cba9c6e70212bc163b7a5529cb25df46071646f)

## [v1.2.5](https://github.com/ljharb/get-intrinsic/compare/v1.2.4...v1.2.5) - 2024-12-06

### Commits

- [actions] split out node 10-20, and 20+ [`6e2b9dd`](https://github.com/ljharb/get-intrinsic/commit/6e2b9dd23902665681ebe453256ccfe21d7966f0)
- [Refactor] use `dunder-proto` and `call-bind-apply-helpers` instead of `has-proto` [`c095d17`](https://github.com/ljharb/get-intrinsic/commit/c095d179ad0f4fbfff20c8a3e0cb4fe668018998)
- [Refactor] use `gopd` [`9841d5b`](https://github.com/ljharb/get-intrinsic/commit/9841d5b35f7ab4fd2d193f0c741a50a077920e90)
- [Dev Deps] update `@ljharb/eslint-config`, `auto-changelog`, `es-abstract`, `es-value-fixtures`, `gopd`, `mock-property`, `object-inspect`, `tape` [`2d07e01`](https://github.com/ljharb/get-intrinsic/commit/2d07e01310cee2cbaedfead6903df128b1f5d425)
- [Deps] update `gopd`, `has-proto`, `has-symbols`, `hasown` [`974d8bf`](https://github.com/ljharb/get-intrinsic/commit/974d8bf5baad7939eef35c25cc1dd88c10a30fa6)
- [Dev Deps] update `call-bind`, `es-abstract`, `tape` [`df9dde1`](https://github.com/ljharb/get-intrinsic/commit/df9dde178186631ab8a3165ede056549918ce4bc)
- [Refactor] cache `es-define-property` as well [`43ef543`](https://github.com/ljharb/get-intrinsic/commit/43ef543cb02194401420e3a914a4ca9168691926)
- [Deps] update `has-proto`, `has-symbols`, `hasown` [`ad4949d`](https://github.com/ljharb/get-intrinsic/commit/ad4949d5467316505aad89bf75f9417ed782f7af)
- [Tests] use `call-bound` directly [`ad5c406`](https://github.com/ljharb/get-intrinsic/commit/ad5c4069774bfe90e520a35eead5fe5ca9d69e80)
- [Deps] update `has-proto`, `hasown` [`45414ca`](https://github.com/ljharb/get-intrinsic/commit/45414caa312333a2798953682c68f85c550627dd)
- [Tests] replace `aud` with `npm audit` [`18d3509`](https://github.com/ljharb/get-intrinsic/commit/18d3509f79460e7924da70409ee81e5053087523)
- [Deps] update `es-define-property` [`aadaa3b`](https://github.com/ljharb/get-intrinsic/commit/aadaa3b2188d77ad9bff394ce5d4249c49eb21f5)
- [Dev Deps] add missing peer dep [`c296a16`](https://github.com/ljharb/get-intrinsic/commit/c296a16246d0c9a5981944f4cc5cf61fbda0cf6a)

## [v1.2.4](https://github.com/ljharb/get-intrinsic/compare/v1.2.3...v1.2.4) - 2024-02-05

### Commits

- [Refactor] use all 7 &lt;+ ES6 Errors from `es-errors` [`bcac811`](https://github.com/ljharb/get-intrinsic/commit/bcac811abdc1c982e12abf848a410d6aae148d14)

## [v1.2.3](https://github.com/ljharb/get-intrinsic/compare/v1.2.2...v1.2.3) - 2024-02-03

### Commits

- [Refactor] use `es-errors`, so things that only need those do not need `get-intrinsic` [`f11db9c`](https://github.com/ljharb/get-intrinsic/commit/f11db9c4fb97d87bbd53d3c73ac6b3db3613ad3b)
- [Dev Deps] update `aud`, `es-abstract`, `mock-property`, `npmignore` [`b7ac7d1`](https://github.com/ljharb/get-intrinsic/commit/b7ac7d1616fefb03877b1aed0c8f8d61aad32b6c)
- [meta] simplify `exports` [`faa0cc6`](https://github.com/ljharb/get-intrinsic/commit/faa0cc618e2830ffb51a8202490b0c215d965cbc)
- [meta] add missing `engines.node` [`774dd0b`](https://github.com/ljharb/get-intrinsic/commit/774dd0b3e8f741c3f05a6322d124d6087f146af1)
- [Dev Deps] update `tape` [`5828e8e`](https://github.com/ljharb/get-intrinsic/commit/5828e8e4a04e69312e87a36c0ea39428a7a4c3d8)
- [Robustness] use null objects for lookups [`eb9a11f`](https://github.com/ljharb/get-intrinsic/commit/eb9a11fa9eb3e13b193fcc05a7fb814341b1a7b7)
- [meta] add `sideEffects` flag [`89bcc7a`](https://github.com/ljharb/get-intrinsic/commit/89bcc7a42e19bf07b7c21e3094d5ab177109e6d2)

## [v1.2.2](https://github.com/ljharb/get-intrinsic/compare/v1.2.1...v1.2.2) - 2023-10-20

### Commits

- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `call-bind`, `es-abstract`, `mock-property`, `object-inspect`, `tape` [`f51bcf2`](https://github.com/ljharb/get-intrinsic/commit/f51bcf26412d58d17ce17c91c9afd0ad271f0762)
- [Refactor] use `hasown` instead of `has` [`18d14b7`](https://github.com/ljharb/get-intrinsic/commit/18d14b799bea6b5765e1cec91890830cbcdb0587)
- [Deps] update `function-bind` [`6e109c8`](https://github.com/ljharb/get-intrinsic/commit/6e109c81e03804cc5e7824fb64353cdc3d8ee2c7)

## [v1.2.1](https://github.com/ljharb/get-intrinsic/compare/v1.2.0...v1.2.1) - 2023-05-13

### Commits

- [Fix] avoid a crash in envs without `__proto__` [`7bad8d0`](https://github.com/ljharb/get-intrinsic/commit/7bad8d061bf8721733b58b73a2565af2b6756b64)
- [Dev Deps] update `es-abstract` [`c60e6b7`](https://github.com/ljharb/get-intrinsic/commit/c60e6b7b4cf9660c7f27ed970970fd55fac48dc5)

## [v1.2.0](https://github.com/ljharb/get-intrinsic/compare/v1.1.3...v1.2.0) - 2023-01-19

### Commits

- [actions] update checkout action [`ca6b12f`](https://github.com/ljharb/get-intrinsic/commit/ca6b12f31eaacea4ea3b055e744cd61623385ffb)
- [Dev Deps] update `@ljharb/eslint-config`, `es-abstract`, `object-inspect`, `tape` [`41a3727`](https://github.com/ljharb/get-intrinsic/commit/41a3727d0026fa04273ae216a5f8e12eefd72da8)
- [Fix] ensure `Error.prototype` is undeniable [`c511e97`](https://github.com/ljharb/get-intrinsic/commit/c511e97ae99c764c4524b540dee7a70757af8da3)
- [Dev Deps] update `aud`, `es-abstract`, `tape` [`1bef8a8`](https://github.com/ljharb/get-intrinsic/commit/1bef8a8fd439ebb80863199b6189199e0851ac67)
- [Dev Deps] update `aud`, `es-abstract` [`0d41f16`](https://github.com/ljharb/get-intrinsic/commit/0d41f16bcd500bc28b7bfc98043ebf61ea081c26)
- [New] add `BigInt64Array` and `BigUint64Array` [`a6cca25`](https://github.com/ljharb/get-intrinsic/commit/a6cca25f29635889b7e9bd669baf9e04be90e48c)
- [Tests] use `gopd` [`ecf7722`](https://github.com/ljharb/get-intrinsic/commit/ecf7722240d15cfd16edda06acf63359c10fb9bd)

## [v1.1.3](https://github.com/ljharb/get-intrinsic/compare/v1.1.2...v1.1.3) - 2022-09-12

### Commits

- [Dev Deps] update `es-abstract`, `es-value-fixtures`, `tape` [`07ff291`](https://github.com/ljharb/get-intrinsic/commit/07ff291816406ebe5a12d7f16965bde0942dd688)
- [Fix] properly check for % signs [`50ac176`](https://github.com/ljharb/get-intrinsic/commit/50ac1760fe99c227e64eabde76e9c0e44cd881b5)

## [v1.1.2](https://github.com/ljharb/get-intrinsic/compare/v1.1.1...v1.1.2) - 2022-06-08

### Fixed

- [Fix] properly validate against extra % signs [`#16`](https://github.com/ljharb/get-intrinsic/issues/16)

### Commits

- [actions] reuse common workflows [`0972547`](https://github.com/ljharb/get-intrinsic/commit/0972547efd0abc863fe4c445a6ca7eb4f8c6901d)
- [meta] use `npmignore` to autogenerate an npmignore file [`5ba0b51`](https://github.com/ljharb/get-intrinsic/commit/5ba0b51d8d8d4f1c31d426d74abc0770fd106bad)
- [actions] use `node/install` instead of `node/run`; use `codecov` action [`c364492`](https://github.com/ljharb/get-intrinsic/commit/c364492af4af51333e6f81c0bf21fd3d602c3661)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `es-abstract`, `object-inspect`, `tape` [`dc04dad`](https://github.com/ljharb/get-intrinsic/commit/dc04dad86f6e5608775a2640cb0db5927ae29ed9)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `es-abstract`, `object-inspect`, `safe-publish-latest`, `tape` [`1c14059`](https://github.com/ljharb/get-intrinsic/commit/1c1405984e86dd2dc9366c15d8a0294a96a146a5)
- [Tests] use `mock-property` [`b396ef0`](https://github.com/ljharb/get-intrinsic/commit/b396ef05bb73b1d699811abd64b0d9b97997fdda)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `object-inspect`, `tape` [`c2c758d`](https://github.com/ljharb/get-intrinsic/commit/c2c758d3b90af4fef0a76910d8d3c292ec8d1d3e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `es-abstract`, `es-value-fixtures`, `object-inspect`, `tape` [`29e3c09`](https://github.com/ljharb/get-intrinsic/commit/29e3c091c2bf3e17099969847e8729d0e46896de)
- [actions] update codecov uploader [`8cbc141`](https://github.com/ljharb/get-intrinsic/commit/8cbc1418940d7a8941f3a7985cbc4ac095c5e13d)
- [Dev Deps] update `@ljharb/eslint-config`, `es-abstract`, `es-value-fixtures`, `object-inspect`, `tape` [`10b6f5c`](https://github.com/ljharb/get-intrinsic/commit/10b6f5c02593fb3680c581d696ac124e30652932)
- [readme] add github actions/codecov badges [`4e25400`](https://github.com/ljharb/get-intrinsic/commit/4e25400d9f51ae9eb059cbe22d9144e70ea214e8)
- [Tests] use `for-each` instead of `foreach` [`c05b957`](https://github.com/ljharb/get-intrinsic/commit/c05b957ad9a7bc7721af7cc9e9be1edbfe057496)
- [Dev Deps] update `es-abstract` [`29b05ae`](https://github.com/ljharb/get-intrinsic/commit/29b05aec3e7330e9ad0b8e0f685a9112c20cdd97)
- [meta] use `prepublishOnly` script for npm 7+ [`95c285d`](https://github.com/ljharb/get-intrinsic/commit/95c285da810516057d3bbfa871176031af38f05d)
- [Deps] update `has-symbols` [`593cb4f`](https://github.com/ljharb/get-intrinsic/commit/593cb4fb38e7922e40e42c183f45274b636424cd)
- [readme] fix repo URLs [`1c8305b`](https://github.com/ljharb/get-intrinsic/commit/1c8305b5365827c9b6fc785434aac0e1328ff2f5)
- [Deps] update `has-symbols` [`c7138b6`](https://github.com/ljharb/get-intrinsic/commit/c7138b6c6d73132d859471fb8c13304e1e7c8b20)
- [Dev Deps] remove unused `has-bigints` [`bd63aff`](https://github.com/ljharb/get-intrinsic/commit/bd63aff6ad8f3a986c557fcda2914187bdaab359)

## [v1.1.1](https://github.com/ljharb/get-intrinsic/compare/v1.1.0...v1.1.1) - 2021-02-03

### Fixed

- [meta] export `./package.json` [`#9`](https://github.com/ljharb/get-intrinsic/issues/9)

### Commits

- [readme] flesh out the readme; use `evalmd` [`d12f12c`](https://github.com/ljharb/get-intrinsic/commit/d12f12c15345a0a0772cc65a7c64369529abd614)
- [eslint] set up proper globals config [`5a8c098`](https://github.com/ljharb/get-intrinsic/commit/5a8c0984e3319d1ac0e64b102f8ec18b64e79f36)
- [Dev Deps] update `eslint` [`7b9a5c0`](https://github.com/ljharb/get-intrinsic/commit/7b9a5c0d31a90ca1a1234181c74988fb046701cd)

## [v1.1.0](https://github.com/ljharb/get-intrinsic/compare/v1.0.2...v1.1.0) - 2021-01-25

### Fixed

- [Refactor] delay `Function` eval until syntax-derived values are requested [`#3`](https://github.com/ljharb/get-intrinsic/issues/3)

### Commits

- [Tests] migrate tests to Github Actions [`2ab762b`](https://github.com/ljharb/get-intrinsic/commit/2ab762b48164aea8af37a40ba105bbc8246ab8c4)
- [meta] do not publish github action workflow files [`5e7108e`](https://github.com/ljharb/get-intrinsic/commit/5e7108e4768b244d48d9567ba4f8a6cab9c65b8e)
- [Tests] add some coverage [`01ac7a8`](https://github.com/ljharb/get-intrinsic/commit/01ac7a87ac29738567e8524cd8c9e026b1fa8cb3)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `call-bind`, `es-abstract`, `tape`; add `call-bind` [`911b672`](https://github.com/ljharb/get-intrinsic/commit/911b672fbffae433a96924c6ce013585e425f4b7)
- [Refactor] rearrange evalled constructors a bit [`7e7e4bf`](https://github.com/ljharb/get-intrinsic/commit/7e7e4bf583f3799c8ac1c6c5e10d2cb553957347)
- [meta] add Automatic Rebase and Require Allow Edits workflows [`0199968`](https://github.com/ljharb/get-intrinsic/commit/01999687a263ffce0a3cb011dfbcb761754aedbc)

## [v1.0.2](https://github.com/ljharb/get-intrinsic/compare/v1.0.1...v1.0.2) - 2020-12-17

### Commits

- [Fix] Throw for non‑existent intrinsics [`68f873b`](https://github.com/ljharb/get-intrinsic/commit/68f873b013c732a05ad6f5fc54f697e55515461b)
- [Fix] Throw for non‑existent segments in the intrinsic path [`8325dee`](https://github.com/ljharb/get-intrinsic/commit/8325deee43128f3654d3399aa9591741ebe17b21)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `has-bigints`, `object-inspect` [`0c227a7`](https://github.com/ljharb/get-intrinsic/commit/0c227a7d8b629166f25715fd242553892e458525)
- [meta] do not lint coverage output [`70d2419`](https://github.com/ljharb/get-intrinsic/commit/70d24199b620043cd9110fc5f426d214ebe21dc9)

## [v1.0.1](https://github.com/ljharb/get-intrinsic/compare/v1.0.0...v1.0.1) - 2020-10-30

### Commits

- [Tests] gather coverage data on every job [`d1d280d`](https://github.com/ljharb/get-intrinsic/commit/d1d280dec714e3f0519cc877dbcb193057d9cac6)
- [Fix] add missing dependencies [`5031771`](https://github.com/ljharb/get-intrinsic/commit/5031771bb1095b38be88ce7c41d5de88718e432e)
- [Tests] use `es-value-fixtures` [`af48765`](https://github.com/ljharb/get-intrinsic/commit/af48765a23c5323fb0b6b38dbf00eb5099c7bebc)

## v1.0.0 - 2020-10-29

### Commits

- Implementation [`bbce57c`](https://github.com/ljharb/get-intrinsic/commit/bbce57c6f33d05b2d8d3efa273ceeb3ee01127bb)
- Tests [`17b4f0d`](https://github.com/ljharb/get-intrinsic/commit/17b4f0d56dea6b4059b56fc30ef3ee4d9500ebc2)
- Initial commit [`3153294`](https://github.com/ljharb/get-intrinsic/commit/31532948de363b0a27dd9fd4649e7b7028ec4b44)
- npm init [`fb326c4`](https://github.com/ljharb/get-intrinsic/commit/fb326c4d2817c8419ec31de1295f06bb268a7902)
- [meta] add Automatic Rebase and Require Allow Edits workflows [`48862fb`](https://github.com/ljharb/get-intrinsic/commit/48862fb2508c8f6a57968e6d08b7c883afc9d550)
- [meta] add `auto-changelog` [`5f28ad0`](https://github.com/ljharb/get-intrinsic/commit/5f28ad019e060a353d8028f9f2591a9cc93074a1)
- [meta] add "funding"; create `FUNDING.yml` [`c2bbdde`](https://github.com/ljharb/get-intrinsic/commit/c2bbddeba73a875be61484ee4680b129a6d4e0a1)
- [Tests] add `npm run lint` [`0a84b98`](https://github.com/ljharb/get-intrinsic/commit/0a84b98b22b7cf7a748666f705b0003a493c35fd)
- Only apps should have lockfiles [`9586c75`](https://github.com/ljharb/get-intrinsic/commit/9586c75866c1ee678e4d5d4dbbdef6997e511b05)


---

<!-- source: archive/library/javascript/references/packages/get-proto/CHANGELOG--000454.md -->

## Imported source: archive/library/javascript/references/packages/get-proto/CHANGELOG--000454.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.1](https://github.com/ljharb/get-proto/compare/v1.0.0...v1.0.1) - 2025-01-02

### Commits

- [Fix] for the `Object.getPrototypeOf` window, throw for non-objects [`7fe6508`](https://github.com/ljharb/get-proto/commit/7fe6508b71419ebe1976bedb86001d1feaeaa49a)

## v1.0.0 - 2025-01-01

### Commits

- Initial implementation, tests, readme, types [`5c70775`](https://github.com/ljharb/get-proto/commit/5c707751e81c3deeb2cf980d185fc7fd43611415)
- Initial commit [`7c65c2a`](https://github.com/ljharb/get-proto/commit/7c65c2ad4e33d5dae2f219ebe1a046ae2256972c)
- npm init [`0b8cf82`](https://github.com/ljharb/get-proto/commit/0b8cf824c9634e4a34ef7dd2a2cdc5be6ac79518)
- Only apps should have lockfiles [`a6d1bff`](https://github.com/ljharb/get-proto/commit/a6d1bffc364f5828377cea7194558b2dbef7aea2)


---

<!-- source: archive/library/javascript/references/packages/gopd/CHANGELOG--000448.md -->

## Imported source: archive/library/javascript/references/packages/gopd/CHANGELOG--000448.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.2.0](https://github.com/ljharb/gopd/compare/v1.1.0...v1.2.0) - 2024-12-03

### Commits

- [New] add `gOPD` entry point; remove `get-intrinsic` [`5b61232`](https://github.com/ljharb/gopd/commit/5b61232dedea4591a314bcf16101b1961cee024e)

## [v1.1.0](https://github.com/ljharb/gopd/compare/v1.0.1...v1.1.0) - 2024-11-29

### Commits

- [New] add types [`f585e39`](https://github.com/ljharb/gopd/commit/f585e397886d270e4ba84e53d226e4f9ca2eb0e6)
- [Dev Deps] update `@ljharb/eslint-config`, `auto-changelog`, `tape` [`0b8e4fd`](https://github.com/ljharb/gopd/commit/0b8e4fded64397a7726a9daa144a6cc9a5e2edfa)
- [Dev Deps] update `aud`, `npmignore`, `tape` [`48378b2`](https://github.com/ljharb/gopd/commit/48378b2443f09a4f7efbd0fb6c3ee845a6cabcf3)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`78099ee`](https://github.com/ljharb/gopd/commit/78099eeed41bfdc134c912280483689cc8861c31)
- [Tests] replace `aud` with `npm audit` [`4e0d0ac`](https://github.com/ljharb/gopd/commit/4e0d0ac47619d24a75318a8e1f543ee04b2a2632)
- [meta] add missing `engines.node` [`1443316`](https://github.com/ljharb/gopd/commit/14433165d07835c680155b3dfd62d9217d735eca)
- [Deps] update `get-intrinsic` [`eee5f51`](https://github.com/ljharb/gopd/commit/eee5f51769f3dbaf578b70e2a3199116b01aa670)
- [Deps] update `get-intrinsic` [`550c378`](https://github.com/ljharb/gopd/commit/550c3780e3a9c77b62565712a001b4ed64ea61f5)
- [Dev Deps] add missing peer dep [`8c2ecf8`](https://github.com/ljharb/gopd/commit/8c2ecf848122e4e30abfc5b5086fb48b390dce75)

## [v1.0.1](https://github.com/ljharb/gopd/compare/v1.0.0...v1.0.1) - 2022-11-01

### Commits

- [Fix] actually export gOPD instead of dP [`4b624bf`](https://github.com/ljharb/gopd/commit/4b624bfbeff788c5e3ff16d9443a83627847234f)

## v1.0.0 - 2022-11-01

### Commits

- Initial implementation, tests, readme [`0911e01`](https://github.com/ljharb/gopd/commit/0911e012cd642092bd88b732c161c58bf4f20bea)
- Initial commit [`b84e33f`](https://github.com/ljharb/gopd/commit/b84e33f5808a805ac57ff88d4247ad935569acbe)
- [actions] add reusable workflows [`12ae28a`](https://github.com/ljharb/gopd/commit/12ae28ae5f50f86e750215b6e2188901646d0119)
- npm init [`280118b`](https://github.com/ljharb/gopd/commit/280118badb45c80b4483836b5cb5315bddf6e582)
- [meta] add `auto-changelog` [`bb78de5`](https://github.com/ljharb/gopd/commit/bb78de5639a180747fb290c28912beaaf1615709)
- [meta] create FUNDING.yml; add `funding` in package.json [`11c22e6`](https://github.com/ljharb/gopd/commit/11c22e6355bb01f24e7fac4c9bb3055eb5b25002)
- [meta] use `npmignore` to autogenerate an npmignore file [`4f4537a`](https://github.com/ljharb/gopd/commit/4f4537a843b39f698c52f072845092e6fca345bb)
- Only apps should have lockfiles [`c567022`](https://github.com/ljharb/gopd/commit/c567022a18573aa7951cf5399445d9840e23e98b)


---

<!-- source: archive/library/javascript/references/packages/has-symbols/CHANGELOG--000334.md -->

## Imported source: archive/library/javascript/references/packages/has-symbols/CHANGELOG--000334.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.1.0](https://github.com/inspect-js/has-symbols/compare/v1.0.3...v1.1.0) - 2024-12-02

### Commits

- [actions] update workflows [`548c0bf`](https://github.com/inspect-js/has-symbols/commit/548c0bf8c9b1235458df7a1c0490b0064647a282)
- [actions] further shard; update action deps [`bec56bb`](https://github.com/inspect-js/has-symbols/commit/bec56bb0fb44b43a786686b944875a3175cf3ff3)
- [meta] use `npmignore` to autogenerate an npmignore file [`ac81032`](https://github.com/inspect-js/has-symbols/commit/ac81032809157e0a079e5264e9ce9b6f1275777e)
- [New] add types [`6469cbf`](https://github.com/inspect-js/has-symbols/commit/6469cbff1866cfe367b2b3d181d9296ec14b2a3d)
- [actions] update rebase action to use reusable workflow [`9c9d4d0`](https://github.com/inspect-js/has-symbols/commit/9c9d4d0d8938e4b267acdf8e421f4e92d1716d72)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `tape` [`adb5887`](https://github.com/inspect-js/has-symbols/commit/adb5887ca9444849b08beb5caaa9e1d42320cdfb)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`13ec198`](https://github.com/inspect-js/has-symbols/commit/13ec198ec80f1993a87710af1606a1970b22c7cb)
- [Dev Deps] update `auto-changelog`, `core-js`, `tape` [`941be52`](https://github.com/inspect-js/has-symbols/commit/941be5248387cab1da72509b22acf3fdb223f057)
- [Tests] replace `aud` with `npm audit` [`74f49e9`](https://github.com/inspect-js/has-symbols/commit/74f49e9a9d17a443020784234a1c53ce765b3559)
- [Dev Deps] update `npmignore` [`9c0ac04`](https://github.com/inspect-js/has-symbols/commit/9c0ac0452a834f4c2a4b54044f2d6a89f17e9a70)
- [Dev Deps] add missing peer dep [`52337a5`](https://github.com/inspect-js/has-symbols/commit/52337a5621cced61f846f2afdab7707a8132cc12)

## [v1.0.3](https://github.com/inspect-js/has-symbols/compare/v1.0.2...v1.0.3) - 2022-03-01

### Commits

- [actions] use `node/install` instead of `node/run`; use `codecov` action [`518b28f`](https://github.com/inspect-js/has-symbols/commit/518b28f6c5a516cbccae30794e40aa9f738b1693)
- [meta] add `bugs` and `homepage` fields; reorder package.json [`c480b13`](https://github.com/inspect-js/has-symbols/commit/c480b13fd6802b557e1cef9749872cb5fdeef744)
- [actions] reuse common workflows [`01d0ee0`](https://github.com/inspect-js/has-symbols/commit/01d0ee0a8d97c0947f5edb73eb722027a77b2b07)
- [actions] update codecov uploader [`6424ebe`](https://github.com/inspect-js/has-symbols/commit/6424ebe86b2c9c7c3d2e9bd4413a4e4f168cb275)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `tape` [`dfa7e7f`](https://github.com/inspect-js/has-symbols/commit/dfa7e7ff38b594645d8c8222aab895157fa7e282)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `safe-publish-latest`, `tape` [`0c8d436`](https://github.com/inspect-js/has-symbols/commit/0c8d43685c45189cea9018191d4fd7eca91c9d02)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `tape` [`9026554`](https://github.com/inspect-js/has-symbols/commit/902655442a1bf88e72b42345494ef0c60f5d36ab)
- [readme] add actions and codecov badges [`eaa9682`](https://github.com/inspect-js/has-symbols/commit/eaa9682f990f481d3acf7a1c7600bec36f7b3adc)
- [Dev Deps] update `eslint`, `tape` [`bc7a3ba`](https://github.com/inspect-js/has-symbols/commit/bc7a3ba46f27b7743f8a2579732d59d1b9ac791e)
- [Dev Deps] update `eslint`, `auto-changelog` [`0ace00a`](https://github.com/inspect-js/has-symbols/commit/0ace00af08a88cdd1e6ce0d60357d941c60c2d9f)
- [meta] use `prepublishOnly` script for npm 7+ [`093f72b`](https://github.com/inspect-js/has-symbols/commit/093f72bc2b0ed00c781f444922a5034257bf561d)
- [Tests] test on all 16 minors [`9b80d3d`](https://github.com/inspect-js/has-symbols/commit/9b80d3d9102529f04c20ec5b1fcc6e38426c6b03)

## [v1.0.2](https://github.com/inspect-js/has-symbols/compare/v1.0.1...v1.0.2) - 2021-02-27

### Fixed

- [Fix] use a universal way to get the original Symbol [`#11`](https://github.com/inspect-js/has-symbols/issues/11)

### Commits

- [Tests] migrate tests to Github Actions [`90ae798`](https://github.com/inspect-js/has-symbols/commit/90ae79820bdfe7bc703d67f5f3c5e205f98556d3)
- [meta] do not publish github action workflow files [`29e60a1`](https://github.com/inspect-js/has-symbols/commit/29e60a1b7c25c7f1acf7acff4a9320d0d10c49b4)
- [Tests] run `nyc` on all tests [`8476b91`](https://github.com/inspect-js/has-symbols/commit/8476b915650d360915abe2522505abf4b0e8f0ae)
- [readme] fix repo URLs, remove defunct badges [`126288e`](https://github.com/inspect-js/has-symbols/commit/126288ecc1797c0a40247a6b78bcb2e0bc5d7036)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `core-js`, `get-own-property-symbols` [`d84bdfa`](https://github.com/inspect-js/has-symbols/commit/d84bdfa48ac5188abbb4904b42614cd6c030940a)
- [Tests] fix linting errors [`0df3070`](https://github.com/inspect-js/has-symbols/commit/0df3070b981b6c9f2ee530c09189a7f5c6def839)
- [actions] add "Allow Edits" workflow [`1e6bc29`](https://github.com/inspect-js/has-symbols/commit/1e6bc29b188f32b9648657b07eda08504be5aa9c)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape` [`36cea2a`](https://github.com/inspect-js/has-symbols/commit/36cea2addd4e6ec435f35a2656b4e9ef82498e9b)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `tape` [`1278338`](https://github.com/inspect-js/has-symbols/commit/127833801865fbc2cc8979beb9ca869c7bfe8222)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `tape` [`1493254`](https://github.com/inspect-js/has-symbols/commit/1493254eda13db5fb8fc5e4a3e8324b3d196029d)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `core-js` [`b090bf2`](https://github.com/inspect-js/has-symbols/commit/b090bf214d3679a30edc1e2d729d466ab5183e1d)
- [actions] switch Automatic Rebase workflow to `pull_request_target` event [`4addb7a`](https://github.com/inspect-js/has-symbols/commit/4addb7ab4dc73f927ae99928d68817554fc21dc0)
- [Dev Deps] update `auto-changelog`, `tape` [`81d0baf`](https://github.com/inspect-js/has-symbols/commit/81d0baf3816096a89a8558e8043895f7a7d10d8b)
- [Dev Deps] update `auto-changelog`; add `aud` [`1a4e561`](https://github.com/inspect-js/has-symbols/commit/1a4e5612c25d91c3a03d509721d02630bc4fe3da)
- [readme] remove unused testling URLs [`3000941`](https://github.com/inspect-js/has-symbols/commit/3000941f958046e923ed8152edb1ef4a599e6fcc)
- [Tests] only audit prod deps [`692e974`](https://github.com/inspect-js/has-symbols/commit/692e9743c912410e9440207631a643a34b4741a1)
- [Dev Deps] update `@ljharb/eslint-config` [`51c946c`](https://github.com/inspect-js/has-symbols/commit/51c946c7f6baa793ec5390bb5a45cdce16b4ba76)

## [v1.0.1](https://github.com/inspect-js/has-symbols/compare/v1.0.0...v1.0.1) - 2019-11-16

### Commits

- [Tests] use shared travis-ci configs [`ce396c9`](https://github.com/inspect-js/has-symbols/commit/ce396c9419ff11c43d0da5d05cdbb79f7fb42229)
- [Tests] up to `node` `v12.4`, `v11.15`, `v10.15`, `v9.11`, `v8.15`, `v7.10`, `v6.17`, `v4.9`; use `nvm install-latest-npm` [`0690732`](https://github.com/inspect-js/has-symbols/commit/0690732801f47ab429f39ba1962f522d5c462d6b)
- [meta] add `auto-changelog` [`2163d0b`](https://github.com/inspect-js/has-symbols/commit/2163d0b7f36343076b8f947cd1667dd1750f26fc)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `core-js`, `safe-publish-latest`, `tape` [`8e0951f`](https://github.com/inspect-js/has-symbols/commit/8e0951f1a7a2e52068222b7bb73511761e6e4d9c)
- [actions] add automatic rebasing / merge commit blocking [`b09cdb7`](https://github.com/inspect-js/has-symbols/commit/b09cdb7cd7ee39e7a769878f56e2d6066f5ccd1d)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `safe-publish-latest`, `core-js`, `get-own-property-symbols`, `tape` [`1dd42cd`](https://github.com/inspect-js/has-symbols/commit/1dd42cd86183ed0c50f99b1062345c458babca91)
- [meta] create FUNDING.yml [`aa57a17`](https://github.com/inspect-js/has-symbols/commit/aa57a17b19708906d1927f821ea8e73394d84ca4)
- Only apps should have lockfiles [`a2d8bea`](https://github.com/inspect-js/has-symbols/commit/a2d8bea23a97d15c09eaf60f5b107fcf9a4d57aa)
- [Tests] use `npx aud` instead of `nsp` or `npm audit` with hoops [`9e96cb7`](https://github.com/inspect-js/has-symbols/commit/9e96cb783746cbed0c10ef78e599a8eaa7ebe193)
- [meta] add `funding` field [`a0b32cf`](https://github.com/inspect-js/has-symbols/commit/a0b32cf68e803f963c1639b6d47b0a9d6440bab0)
- [Dev Deps] update `safe-publish-latest` [`cb9f0a5`](https://github.com/inspect-js/has-symbols/commit/cb9f0a521a3a1790f1064d437edd33bb6c3d6af0)

## v1.0.0 - 2016-09-19

### Commits

- Tests. [`ecb6eb9`](https://github.com/inspect-js/has-symbols/commit/ecb6eb934e4883137f3f93b965ba5e0a98df430d)
- package.json [`88a337c`](https://github.com/inspect-js/has-symbols/commit/88a337cee0864a0da35f5d19e69ff0ef0150e46a)
- Initial commit [`42e1e55`](https://github.com/inspect-js/has-symbols/commit/42e1e5502536a2b8ac529c9443984acd14836b1c)
- Initial implementation. [`33f5cc6`](https://github.com/inspect-js/has-symbols/commit/33f5cc6cdff86e2194b081ee842bfdc63caf43fb)
- read me [`01f1170`](https://github.com/inspect-js/has-symbols/commit/01f1170188ff7cb1558aa297f6ba5b516c6d7b0c)


---

<!-- source: archive/library/javascript/references/packages/has-tostringtag/CHANGELOG--000259.md -->

## Imported source: archive/library/javascript/references/packages/has-tostringtag/CHANGELOG--000259.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.2](https://github.com/inspect-js/has-tostringtag/compare/v1.0.1...v1.0.2) - 2024-02-01

### Fixed

- [Fix] move `has-symbols` back to prod deps [`#3`](https://github.com/inspect-js/has-tostringtag/issues/3)

## [v1.0.1](https://github.com/inspect-js/has-tostringtag/compare/v1.0.0...v1.0.1) - 2024-02-01

### Commits

- [patch] add types [`9276414`](https://github.com/inspect-js/has-tostringtag/commit/9276414b22fab3eeb234688841722c4be113201f)
- [meta] use `npmignore` to autogenerate an npmignore file [`5c0dcd1`](https://github.com/inspect-js/has-tostringtag/commit/5c0dcd1ff66419562a30d1fd88b966cc36bce5fc)
- [actions] reuse common workflows [`dee9509`](https://github.com/inspect-js/has-tostringtag/commit/dee950904ab5719b62cf8d73d2ac950b09093266)
- [actions] update codecov uploader [`b8cb3a0`](https://github.com/inspect-js/has-tostringtag/commit/b8cb3a0b8ffbb1593012c4c2daa45fb25642825d)
- [Tests] generate coverage [`be5b288`](https://github.com/inspect-js/has-tostringtag/commit/be5b28889e2735cdbcef387f84c2829995f2f05e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `safe-publish-latest`, `tape` [`69a0827`](https://github.com/inspect-js/has-tostringtag/commit/69a0827974e9b877b2c75b70b057555da8f25a65)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `tape` [`4c9e210`](https://github.com/inspect-js/has-tostringtag/commit/4c9e210a5682f0557a3235d36b68ce809d7fb825)
- [actions] update rebase action to use reusable workflow [`ca8dcd3`](https://github.com/inspect-js/has-tostringtag/commit/ca8dcd3a6f3f5805d7e3fd461b654aedba0946e7)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `npmignore`, `tape` [`07f3eaf`](https://github.com/inspect-js/has-tostringtag/commit/07f3eafa45dd98208c94479737da77f9a69b94c4)
- [Deps] update `has-symbols` [`999e009`](https://github.com/inspect-js/has-tostringtag/commit/999e0095a7d1749a58f55472ec8bf8108cdfdcf3)
- [Tests] remove staging tests since they fail on modern node [`9d9526b`](https://github.com/inspect-js/has-tostringtag/commit/9d9526b1dc1ca7f2292b52efda4c3d857b0e39bd)

## v1.0.0 - 2021-08-05

### Commits

- Tests [`6b6f573`](https://github.com/inspect-js/has-tostringtag/commit/6b6f5734dc2058badb300ff0783efdad95fe1a65)
- Initial commit [`2f8190e`](https://github.com/inspect-js/has-tostringtag/commit/2f8190e799fac32ba9b95a076c0255e01d7ce475)
- [meta] do not publish github action workflow files [`6e08cc4`](https://github.com/inspect-js/has-tostringtag/commit/6e08cc4e0fea7ec71ef66e70734b2af2c4a8b71b)
- readme [`94bed6c`](https://github.com/inspect-js/has-tostringtag/commit/94bed6c9560cbbfda034f8d6c260bb7b0db33c1a)
- npm init [`be67840`](https://github.com/inspect-js/has-tostringtag/commit/be67840ab92ee7adb98bcc65261975543f815fa5)
- Implementation [`c4914ec`](https://github.com/inspect-js/has-tostringtag/commit/c4914ecc51ddee692c85b471ae0a5d8123030fbf)
- [meta] use `auto-changelog` [`4aaf768`](https://github.com/inspect-js/has-tostringtag/commit/4aaf76895ae01d7b739f2b19f967ef2372506cd7)
- Only apps should have lockfiles [`bc4d99e`](https://github.com/inspect-js/has-tostringtag/commit/bc4d99e4bf494afbaa235c5f098df6e642edf724)
- [meta] add `safe-publish-latest` [`6523c05`](https://github.com/inspect-js/has-tostringtag/commit/6523c05c9b87140f3ae74c9daf91633dd9ff4e1f)


---

<!-- source: archive/library/javascript/references/packages/hasown/CHANGELOG--000371.md -->

## Imported source: archive/library/javascript/references/packages/hasown/CHANGELOG--000371.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v2.0.2](https://github.com/inspect-js/hasOwn/compare/v2.0.1...v2.0.2) - 2024-03-10

### Commits

- [types] use shared config [`68e9d4d`](https://github.com/inspect-js/hasOwn/commit/68e9d4dab6facb4f05f02c6baea94a3f2a4e44b2)
- [actions] remove redundant finisher; use reusable workflow [`241a68e`](https://github.com/inspect-js/hasOwn/commit/241a68e13ea1fe52bec5ba7f74144befc31fae7b)
- [Tests] increase coverage [`4125c0d`](https://github.com/inspect-js/hasOwn/commit/4125c0d6121db56ae30e38346dfb0c000b04f0a7)
- [Tests] skip `npm ls` in old node due to TS [`01b9282`](https://github.com/inspect-js/hasOwn/commit/01b92822f9971dea031eafdd14767df41d61c202)
- [types] improve predicate type [`d340f85`](https://github.com/inspect-js/hasOwn/commit/d340f85ce02e286ef61096cbbb6697081d40a12b)
- [Dev Deps] update `tape` [`70089fc`](https://github.com/inspect-js/hasOwn/commit/70089fcf544e64acc024cbe60f5a9b00acad86de)
- [Tests] use `@arethetypeswrong/cli` [`50b272c`](https://github.com/inspect-js/hasOwn/commit/50b272c829f40d053a3dd91c9796e0ac0b2af084)

## [v2.0.1](https://github.com/inspect-js/hasOwn/compare/v2.0.0...v2.0.1) - 2024-02-10

### Commits

- [types] use a handwritten d.ts file; fix exported type [`012b989`](https://github.com/inspect-js/hasOwn/commit/012b9898ccf91dc441e2ebf594ff70270a5fda58)
- [Dev Deps] update `@types/function-bind`, `@types/mock-property`, `@types/tape`, `aud`, `mock-property`, `npmignore`, `tape`, `typescript` [`977a56f`](https://github.com/inspect-js/hasOwn/commit/977a56f51a1f8b20566f3c471612137894644025)
- [meta] add `sideEffects` flag [`3a60b7b`](https://github.com/inspect-js/hasOwn/commit/3a60b7bf42fccd8c605e5f145a6fcc83b13cb46f)

## [v2.0.0](https://github.com/inspect-js/hasOwn/compare/v1.0.1...v2.0.0) - 2023-10-19

### Commits

- revamped implementation, tests, readme [`72bf8b3`](https://github.com/inspect-js/hasOwn/commit/72bf8b338e77a638f0a290c63ffaed18339c36b4)
- [meta] revamp package.json [`079775f`](https://github.com/inspect-js/hasOwn/commit/079775fb1ec72c1c6334069593617a0be3847458)
- Only apps should have lockfiles [`6640e23`](https://github.com/inspect-js/hasOwn/commit/6640e233d1bb8b65260880f90787637db157d215)

## v1.0.1 - 2023-10-10

### Commits

- Initial commit [`8dbfde6`](https://github.com/inspect-js/hasOwn/commit/8dbfde6e8fb0ebb076fab38d138f2984eb340a62)


---

<!-- source: archive/library/javascript/references/packages/iconv-lite/Changelog--000342.md -->

## Imported source: archive/library/javascript/references/packages/iconv-lite/Changelog--000342.md

## 0.6.3 / 2021-05-23
  * Fix HKSCS encoding to prefer Big5 codes if both Big5 and HKSCS codes are possible (#264)


## 0.6.2 / 2020-07-08
  * Support Uint8Array-s decoding without conversion to Buffers, plus fix an edge case.


## 0.6.1 / 2020-06-28
  * Support Uint8Array-s directly when decoding (#246, by @gyzerok)
  * Unify package.json version ranges to be strictly semver-compatible (#241)
  * Fix minor issue in UTF-32 decoder's endianness detection code.


## 0.6.0 / 2020-06-08
  * Updated 'gb18030' encoding to :2005 edition (see https://github.com/whatwg/encoding/issues/22).
  * Removed `iconv.extendNodeEncodings()` mechanism. It was deprecated 5 years ago and didn't work 
    in recent Node versions.
  * Reworked Streaming API behavior in browser environments to fix #204. Streaming API will be 
    excluded by default in browser packs, saving ~100Kb bundle size, unless enabled explicitly using 
    `iconv.enableStreamingAPI(require('stream'))`.
  * Updates to development environment & tests:
    * Added ./test/webpack private package to test complex new use cases that need custom environment. 
      It's tested as a separate job in Travis CI.
    * Updated generation code for the new EUC-KR index file format from Encoding Standard.
    * Removed Buffer() constructor in tests (#197 by @gabrielschulhof).


## 0.5.2 / 2020-06-08
  * Added `iconv.getEncoder()` and `iconv.getDecoder()` methods to typescript definitions (#229).
  * Fixed semver version to 6.1.2 to support Node 8.x (by @tanandara).
  * Capped iconv version to 2.x as 3.x has dropped support for older Node versions.
  * Switched from instanbul to c8 for code coverage.


## 0.5.1 / 2020-01-18

  * Added cp720 encoding (#221, by @kr-deps)
  * (minor) Changed Changelog.md formatting to use h2. 


## 0.5.0 / 2019-06-26

  * Added UTF-32 encoding, both little-endian and big-endian variants (UTF-32LE, UTF32-BE). If endianness
    is not provided for decoding, it's deduced automatically from the stream using a heuristic similar to
    what we use in UTF-16. (great work in #216 by @kshetline)
  * Several minor updates to README (#217 by @oldj, plus some more)
  * Added Node versions 10 and 12 to Travis test harness.


## 0.4.24 / 2018-08-22

  * Added MIK encoding (#196, by @Ivan-Kalatchev)


## 0.4.23 / 2018-05-07

  * Fix deprecation warning in Node v10 due to the last usage of `new Buffer` (#185, by @felixbuenemann)
  * Switched from NodeBuffer to Buffer in typings (#155 by @felixfbecker, #186 by @larssn)


## 0.4.22 / 2018-05-05

  * Use older semver style for dependencies to be compatible with Node version 0.10 (#182, by @dougwilson)
  * Fix tests to accomodate fixes in Node v10 (#182, by @dougwilson)


## 0.4.21 / 2018-04-06

  * Fix encoding canonicalization (#156)
  * Fix the paths in the "browser" field in package.json (#174 by @LMLB)
  * Removed "contributors" section in package.json - see Git history instead.


## 0.4.20 / 2018-04-06

  * Updated `new Buffer()` usages with recommended replacements as it's being deprecated in Node v10 (#176, #178 by @ChALkeR)


## 0.4.19 / 2017-09-09

  * Fixed iso8859-1 codec regression in handling untranslatable characters (#162, caused by #147)
  * Re-generated windows1255 codec, because it was updated in iconv project
  * Fixed grammar in error message when iconv-lite is loaded with encoding other than utf8


## 0.4.18 / 2017-06-13

  * Fixed CESU-8 regression in Node v8.


## 0.4.17 / 2017-04-22

 * Updated typescript definition file to support Angular 2 AoT mode (#153 by @larssn)


## 0.4.16 / 2017-04-22

 * Added support for React Native (#150)
 * Changed iso8859-1 encoding to usine internal 'binary' encoding, as it's the same thing (#147 by @mscdex)
 * Fixed typo in Readme (#138 by @jiangzhuo)
 * Fixed build for Node v6.10+ by making correct version comparison
 * Added a warning if iconv-lite is loaded not as utf-8 (see #142)


## 0.4.15 / 2016-11-21

 * Fixed typescript type definition (#137)


## 0.4.14 / 2016-11-20

 * Preparation for v1.0
 * Added Node v6 and latest Node versions to Travis CI test rig
 * Deprecated Node v0.8 support
 * Typescript typings (@larssn)
 * Fix encoding of Euro character in GB 18030 (inspired by @lygstate)
 * Add ms prefix to dbcs windows encodings (@rokoroku)


## 0.4.13 / 2015-10-01

 * Fix silly mistake in deprecation notice.


## 0.4.12 / 2015-09-26

 * Node v4 support:
   * Added CESU-8 decoding (#106)
   * Added deprecation notice for `extendNodeEncodings`
   * Added Travis tests for Node v4 and io.js latest (#105 by @Mithgol)


## 0.4.11 / 2015-07-03

 * Added CESU-8 encoding.


## 0.4.10 / 2015-05-26

 * Changed UTF-16 endianness heuristic to take into account any ASCII chars, not
   just spaces. This should minimize the importance of "default" endianness.


## 0.4.9 / 2015-05-24

 * Streamlined BOM handling: strip BOM by default, add BOM when encoding if 
   addBOM: true. Added docs to Readme.
 * UTF16 now uses UTF16-LE by default.
 * Fixed minor issue with big5 encoding.
 * Added io.js testing on Travis; updated node-iconv version to test against.
   Now we just skip testing SBCS encodings that node-iconv doesn't support.
 * (internal refactoring) Updated codec interface to use classes.
 * Use strict mode in all files.


## 0.4.8 / 2015-04-14
 
 * added alias UNICODE-1-1-UTF-7 for UTF-7 encoding (#94)


## 0.4.7 / 2015-02-05

 * stop official support of Node.js v0.8. Should still work, but no guarantees.
   reason: Packages needed for testing are hard to get on Travis CI.
 * work in environment where Object.prototype is monkey patched with enumerable 
   props (#89).


## 0.4.6 / 2015-01-12
 
 * fix rare aliases of single-byte encodings (thanks @mscdex)
 * double the timeout for dbcs tests to make them less flaky on travis


## 0.4.5 / 2014-11-20

 * fix windows-31j and x-sjis encoding support (@nleush)
 * minor fix: undefined variable reference when internal error happens


## 0.4.4 / 2014-07-16

 * added encodings UTF-7 (RFC2152) and UTF-7-IMAP (RFC3501 Section 5.1.3)
 * fixed streaming base64 encoding


## 0.4.3 / 2014-06-14

 * added encodings UTF-16BE and UTF-16 with BOM


## 0.4.2 / 2014-06-12

 * don't throw exception if `extendNodeEncodings()` is called more than once


## 0.4.1 / 2014-06-11

 * codepage 808 added


## 0.4.0 / 2014-06-10

 * code is rewritten from scratch
 * all widespread encodings are supported
 * streaming interface added
 * browserify compatibility added
 * (optional) extend core primitive encodings to make usage even simpler
 * moved from vows to mocha as the testing framework


---

<!-- source: archive/library/javascript/references/packages/iconv-lite/Changelog--000441.md -->

## Imported source: archive/library/javascript/references/packages/iconv-lite/Changelog--000441.md

# 0.4.24 / 2018-08-22

  * Added MIK encoding (#196, by @Ivan-Kalatchev)


# 0.4.23 / 2018-05-07

  * Fix deprecation warning in Node v10 due to the last usage of `new Buffer` (#185, by @felixbuenemann)
  * Switched from NodeBuffer to Buffer in typings (#155 by @felixfbecker, #186 by @larssn)


# 0.4.22 / 2018-05-05

  * Use older semver style for dependencies to be compatible with Node version 0.10 (#182, by @dougwilson)
  * Fix tests to accomodate fixes in Node v10 (#182, by @dougwilson)


# 0.4.21 / 2018-04-06

  * Fix encoding canonicalization (#156)
  * Fix the paths in the "browser" field in package.json (#174 by @LMLB)
  * Removed "contributors" section in package.json - see Git history instead.


# 0.4.20 / 2018-04-06

  * Updated `new Buffer()` usages with recommended replacements as it's being deprecated in Node v10 (#176, #178 by @ChALkeR)


# 0.4.19 / 2017-09-09

  * Fixed iso8859-1 codec regression in handling untranslatable characters (#162, caused by #147)
  * Re-generated windows1255 codec, because it was updated in iconv project
  * Fixed grammar in error message when iconv-lite is loaded with encoding other than utf8


# 0.4.18 / 2017-06-13

  * Fixed CESU-8 regression in Node v8.


# 0.4.17 / 2017-04-22

 * Updated typescript definition file to support Angular 2 AoT mode (#153 by @larssn)


# 0.4.16 / 2017-04-22

 * Added support for React Native (#150)
 * Changed iso8859-1 encoding to usine internal 'binary' encoding, as it's the same thing (#147 by @mscdex)
 * Fixed typo in Readme (#138 by @jiangzhuo)
 * Fixed build for Node v6.10+ by making correct version comparison
 * Added a warning if iconv-lite is loaded not as utf-8 (see #142)


# 0.4.15 / 2016-11-21

 * Fixed typescript type definition (#137)


# 0.4.14 / 2016-11-20

 * Preparation for v1.0
 * Added Node v6 and latest Node versions to Travis CI test rig
 * Deprecated Node v0.8 support
 * Typescript typings (@larssn)
 * Fix encoding of Euro character in GB 18030 (inspired by @lygstate)
 * Add ms prefix to dbcs windows encodings (@rokoroku)


# 0.4.13 / 2015-10-01

 * Fix silly mistake in deprecation notice.


# 0.4.12 / 2015-09-26

 * Node v4 support:
   * Added CESU-8 decoding (#106)
   * Added deprecation notice for `extendNodeEncodings`
   * Added Travis tests for Node v4 and io.js latest (#105 by @Mithgol)


# 0.4.11 / 2015-07-03

 * Added CESU-8 encoding.


# 0.4.10 / 2015-05-26

 * Changed UTF-16 endianness heuristic to take into account any ASCII chars, not
   just spaces. This should minimize the importance of "default" endianness.


# 0.4.9 / 2015-05-24

 * Streamlined BOM handling: strip BOM by default, add BOM when encoding if 
   addBOM: true. Added docs to Readme.
 * UTF16 now uses UTF16-LE by default.
 * Fixed minor issue with big5 encoding.
 * Added io.js testing on Travis; updated node-iconv version to test against.
   Now we just skip testing SBCS encodings that node-iconv doesn't support.
 * (internal refactoring) Updated codec interface to use classes.
 * Use strict mode in all files.


# 0.4.8 / 2015-04-14
 
 * added alias UNICODE-1-1-UTF-7 for UTF-7 encoding (#94)


# 0.4.7 / 2015-02-05

 * stop official support of Node.js v0.8. Should still work, but no guarantees.
   reason: Packages needed for testing are hard to get on Travis CI.
 * work in environment where Object.prototype is monkey patched with enumerable 
   props (#89).


# 0.4.6 / 2015-01-12
 
 * fix rare aliases of single-byte encodings (thanks @mscdex)
 * double the timeout for dbcs tests to make them less flaky on travis


# 0.4.5 / 2014-11-20

 * fix windows-31j and x-sjis encoding support (@nleush)
 * minor fix: undefined variable reference when internal error happens


# 0.4.4 / 2014-07-16

 * added encodings UTF-7 (RFC2152) and UTF-7-IMAP (RFC3501 Section 5.1.3)
 * fixed streaming base64 encoding


# 0.4.3 / 2014-06-14

 * added encodings UTF-16BE and UTF-16 with BOM


# 0.4.2 / 2014-06-12

 * don't throw exception if `extendNodeEncodings()` is called more than once


# 0.4.1 / 2014-06-11

 * codepage 808 added


# 0.4.0 / 2014-06-10

 * code is rewritten from scratch
 * all widespread encodings are supported
 * streaming interface added
 * browserify compatibility added
 * (optional) extend core primitive encodings to make usage even simpler
 * moved from vows to mocha as the testing framework


---

<!-- source: archive/library/javascript/references/packages/math-intrinsics/CHANGELOG--000411.md -->

## Imported source: archive/library/javascript/references/packages/math-intrinsics/CHANGELOG--000411.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.1.0](https://github.com/es-shims/math-intrinsics/compare/v1.0.0...v1.1.0) - 2024-12-18

### Commits

- [New] add `round` [`7cfb044`](https://github.com/es-shims/math-intrinsics/commit/7cfb04460c0fbdf1ca101eecbac3f59d11994130)
- [Tests] add attw [`e96be8f`](https://github.com/es-shims/math-intrinsics/commit/e96be8fbf58449eafe976446a0470e6ea561ad8d)
- [Dev Deps] update `@types/tape` [`30d0023`](https://github.com/es-shims/math-intrinsics/commit/30d00234ce8a3fa0094a61cd55d6686eb91e36ec)

## v1.0.0 - 2024-12-11

### Commits

- Initial implementation, tests, readme, types [`b898caa`](https://github.com/es-shims/math-intrinsics/commit/b898caae94e9994a94a42b8740f7bbcfd0a868fe)
- Initial commit [`02745b0`](https://github.com/es-shims/math-intrinsics/commit/02745b03a62255af8a332771987b55d127538d9c)
- [New] add `constants/maxArrayLength`, `mod` [`b978178`](https://github.com/es-shims/math-intrinsics/commit/b978178a57685bd23ed1c7efe2137f3784f5fcc5)
- npm init [`a39fc57`](https://github.com/es-shims/math-intrinsics/commit/a39fc57e5639a645d0bd52a0dc56202480223be2)
- Only apps should have lockfiles [`9451580`](https://github.com/es-shims/math-intrinsics/commit/94515800fb34db4f3cc7e99290042d45609ac7bd)


---

<!-- source: archive/library/javascript/references/packages/mime/CHANGELOG--000330.md -->

## Imported source: archive/library/javascript/references/packages/mime/CHANGELOG--000330.md

# Changelog

## v1.6.0 (24/11/2017)
*No changelog for this release.*

---

## v2.0.4 (24/11/2017)
- [**closed**] Switch to mime-score module for resolving extension contention issues. [#182](https://github.com/broofa/node-mime/issues/182)
- [**closed**] Update mime-db to 1.31.0 in v1.x branch [#181](https://github.com/broofa/node-mime/issues/181)

---

## v1.5.0 (22/11/2017)
- [**closed**] need ES5 version ready in npm package [#179](https://github.com/broofa/node-mime/issues/179)
- [**closed**] mime-db no trace of iWork - pages / numbers / etc. [#178](https://github.com/broofa/node-mime/issues/178)
- [**closed**] How it works in brownser ? [#176](https://github.com/broofa/node-mime/issues/176)
- [**closed**] Missing `./Mime` [#175](https://github.com/broofa/node-mime/issues/175)
- [**closed**] Vulnerable Regular Expression [#167](https://github.com/broofa/node-mime/issues/167)

---

## v2.0.3 (25/09/2017)
*No changelog for this release.*

---

## v1.4.1 (25/09/2017)
- [**closed**] Issue when bundling with webpack [#172](https://github.com/broofa/node-mime/issues/172)

---

## v2.0.2 (15/09/2017)
- [**V2**] fs.readFileSync is not a function [#165](https://github.com/broofa/node-mime/issues/165)
- [**closed**] The extension for video/quicktime should map to .mov, not .qt [#164](https://github.com/broofa/node-mime/issues/164)
- [**V2**] [v2 Feedback request] Mime class API [#163](https://github.com/broofa/node-mime/issues/163)
- [**V2**] [v2 Feedback request] Resolving conflicts over extensions [#162](https://github.com/broofa/node-mime/issues/162)
- [**V2**] Allow callers to load module with official, full, or no defined types.  [#161](https://github.com/broofa/node-mime/issues/161)
- [**V2**] Use "facets" to resolve extension conflicts [#160](https://github.com/broofa/node-mime/issues/160)
- [**V2**] Remove fs and path dependencies [#152](https://github.com/broofa/node-mime/issues/152)
- [**V2**] Default content-type should not be application/octet-stream [#139](https://github.com/broofa/node-mime/issues/139)
- [**V2**] reset mime-types [#124](https://github.com/broofa/node-mime/issues/124)
- [**V2**] Extensionless paths should return null or false [#113](https://github.com/broofa/node-mime/issues/113)

---

## v2.0.1 (14/09/2017)
- [**closed**] Changelog for v2.0 does not mention breaking changes [#171](https://github.com/broofa/node-mime/issues/171)
- [**closed**] MIME breaking with 'class' declaration as it is without 'use strict mode' [#170](https://github.com/broofa/node-mime/issues/170)

---

## v2.0.0 (12/09/2017)
- [**closed**] woff and woff2 [#168](https://github.com/broofa/node-mime/issues/168)

---

## v1.4.0 (28/08/2017)
- [**closed**] support for ac3 voc files [#159](https://github.com/broofa/node-mime/issues/159)
- [**closed**] Help understanding change from application/xml to text/xml [#158](https://github.com/broofa/node-mime/issues/158)
- [**closed**] no longer able to override mimetype [#157](https://github.com/broofa/node-mime/issues/157)
- [**closed**] application/vnd.adobe.photoshop [#147](https://github.com/broofa/node-mime/issues/147)
- [**closed**] Directories should appear as something other than application/octet-stream [#135](https://github.com/broofa/node-mime/issues/135)
- [**closed**] requested features [#131](https://github.com/broofa/node-mime/issues/131)
- [**closed**] Make types.json loading optional? [#129](https://github.com/broofa/node-mime/issues/129)
- [**closed**] Cannot find module './types.json' [#120](https://github.com/broofa/node-mime/issues/120)
- [**V2**] .wav files show up as "audio/x-wav" instead of "audio/x-wave" [#118](https://github.com/broofa/node-mime/issues/118)
- [**closed**] Don't be a pain in the ass for node community [#108](https://github.com/broofa/node-mime/issues/108)
- [**closed**] don't make default_type global [#78](https://github.com/broofa/node-mime/issues/78)
- [**closed**] mime.extension() fails if the content-type is parameterized [#74](https://github.com/broofa/node-mime/issues/74)

---

## v1.3.6 (11/05/2017)
- [**closed**] .md should be text/markdown as of March 2016 [#154](https://github.com/broofa/node-mime/issues/154)
- [**closed**] Error while installing mime [#153](https://github.com/broofa/node-mime/issues/153)
- [**closed**] application/manifest+json [#149](https://github.com/broofa/node-mime/issues/149)
- [**closed**] Dynamic adaptive streaming over HTTP (DASH) file extension typo [#141](https://github.com/broofa/node-mime/issues/141)
- [**closed**] charsets image/png undefined [#140](https://github.com/broofa/node-mime/issues/140)
- [**closed**] Mime-db dependency out of date [#130](https://github.com/broofa/node-mime/issues/130)
- [**closed**] how to support plist？ [#126](https://github.com/broofa/node-mime/issues/126)
- [**closed**] how does .types file format look like? [#123](https://github.com/broofa/node-mime/issues/123)
- [**closed**] Feature: support for expanding MIME patterns [#121](https://github.com/broofa/node-mime/issues/121)
- [**closed**] DEBUG_MIME doesn't work [#117](https://github.com/broofa/node-mime/issues/117)

---

## v1.3.4 (06/02/2015)
*No changelog for this release.*

---

## v1.3.3 (06/02/2015)
*No changelog for this release.*

---

## v1.3.1 (05/02/2015)
- [**closed**] Consider adding support for Handlebars .hbs file ending [#111](https://github.com/broofa/node-mime/issues/111)
- [**closed**] Consider adding support for hjson. [#110](https://github.com/broofa/node-mime/issues/110)
- [**closed**] Add mime type for Opus audio files [#94](https://github.com/broofa/node-mime/issues/94)
- [**closed**] Consider making the `Requesting New Types` information more visible [#77](https://github.com/broofa/node-mime/issues/77)

---

## v1.3.0 (05/02/2015)
- [**closed**] Add common name? [#114](https://github.com/broofa/node-mime/issues/114)
- [**closed**] application/x-yaml [#104](https://github.com/broofa/node-mime/issues/104)
- [**closed**] Add mime type for WOFF file format 2.0 [#102](https://github.com/broofa/node-mime/issues/102)
- [**closed**] application/x-msi for .msi [#99](https://github.com/broofa/node-mime/issues/99)
- [**closed**] Add mimetype for gettext translation files [#98](https://github.com/broofa/node-mime/issues/98)
- [**closed**] collaborators [#88](https://github.com/broofa/node-mime/issues/88)
- [**closed**] getting errot in installation of mime module...any1 can help? [#87](https://github.com/broofa/node-mime/issues/87)
- [**closed**] should application/json's charset be utf8? [#86](https://github.com/broofa/node-mime/issues/86)
- [**closed**] Add "license" and "licenses" to package.json [#81](https://github.com/broofa/node-mime/issues/81)
- [**closed**] lookup with extension-less file on Windows returns wrong type [#68](https://github.com/broofa/node-mime/issues/68)

---

## v1.2.11 (15/08/2013)
- [**closed**] Update mime.types [#65](https://github.com/broofa/node-mime/issues/65)
- [**closed**] Publish a new version [#63](https://github.com/broofa/node-mime/issues/63)
- [**closed**] README should state upfront that "application/octet-stream" is default for unknown extension [#55](https://github.com/broofa/node-mime/issues/55)
- [**closed**] Suggested improvement to the charset API [#52](https://github.com/broofa/node-mime/issues/52)

---

## v1.2.10 (25/07/2013)
- [**closed**] Mime type for woff files should be application/font-woff and not application/x-font-woff [#62](https://github.com/broofa/node-mime/issues/62)
- [**closed**] node.types in conflict with mime.types [#51](https://github.com/broofa/node-mime/issues/51)

---

## v1.2.9 (17/01/2013)
- [**closed**] Please update "mime" NPM [#49](https://github.com/broofa/node-mime/issues/49)
- [**closed**] Please add semicolon [#46](https://github.com/broofa/node-mime/issues/46)
- [**closed**] parse full mime types [#43](https://github.com/broofa/node-mime/issues/43)

---

## v1.2.8 (10/01/2013)
- [**closed**] /js directory mime is application/javascript. Is it correct? [#47](https://github.com/broofa/node-mime/issues/47)
- [**closed**] Add mime types for lua code. [#45](https://github.com/broofa/node-mime/issues/45)

---

## v1.2.7 (19/10/2012)
- [**closed**] cannot install 1.2.7 via npm [#41](https://github.com/broofa/node-mime/issues/41)
- [**closed**] Transfer ownership to @broofa [#36](https://github.com/broofa/node-mime/issues/36)
- [**closed**] it's wrong to set charset to UTF-8 for text [#30](https://github.com/broofa/node-mime/issues/30)
- [**closed**] Allow multiple instances of MIME types container [#27](https://github.com/broofa/node-mime/issues/27)

---

## v1.2.5 (16/02/2012)
- [**closed**] When looking up a types, check hasOwnProperty [#23](https://github.com/broofa/node-mime/issues/23)
- [**closed**] Bump version to 1.2.2 [#18](https://github.com/broofa/node-mime/issues/18)
- [**closed**] No license [#16](https://github.com/broofa/node-mime/issues/16)
- [**closed**] Some types missing that are used by html5/css3 [#13](https://github.com/broofa/node-mime/issues/13)
- [**closed**] npm install fails for 1.2.1 [#12](https://github.com/broofa/node-mime/issues/12)
- [**closed**] image/pjpeg + image/x-png [#10](https://github.com/broofa/node-mime/issues/10)
- [**closed**] symlink [#8](https://github.com/broofa/node-mime/issues/8)
- [**closed**] gzip [#2](https://github.com/broofa/node-mime/issues/2)
- [**closed**] ALL CAPS filenames return incorrect mime type [#1](https://github.com/broofa/node-mime/issues/1)


---

<!-- source: archive/library/javascript/references/packages/object-inspect/CHANGELOG--000349.md -->

## Imported source: archive/library/javascript/references/packages/object-inspect/CHANGELOG--000349.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.13.4](https://github.com/inspect-js/object-inspect/compare/v1.13.3...v1.13.4) - 2025-02-04

### Commits

- [Fix] avoid being fooled by a `Symbol.toStringTag` [`fa5870d`](https://github.com/inspect-js/object-inspect/commit/fa5870da468a525d2f20193700f70752f506cbf7)
- [Tests] fix tests in node v6.0 - v6.4 [`2abfe1b`](https://github.com/inspect-js/object-inspect/commit/2abfe1bc3c69f9293c07c5cd65a9d7d87a628b84)
- [Dev Deps] update `es-value-fixtures`, `for-each`, `has-symbols` [`3edfb01`](https://github.com/inspect-js/object-inspect/commit/3edfb01cc8cce220fba0dfdfe2dc8bc955758cdd)

## [v1.13.3](https://github.com/inspect-js/object-inspect/compare/v1.13.2...v1.13.3) - 2024-11-09

### Commits

- [actions] split out node 10-20, and 20+ [`44395a8`](https://github.com/inspect-js/object-inspect/commit/44395a8fc1deda6718a5e125e86b9ffcaa1c7580)
- [Fix] `quoteStyle`: properly escape only the containing quotes [`5137f8f`](https://github.com/inspect-js/object-inspect/commit/5137f8f7bea69a7fc671bb683fd35f244f38fc52)
- [Refactor] clean up `quoteStyle` code [`450680c`](https://github.com/inspect-js/object-inspect/commit/450680cd50de4e689ee3b8e1d6db3a1bcf3fc18c)
- [Tests] add `quoteStyle` escaping tests [`e997c59`](https://github.com/inspect-js/object-inspect/commit/e997c595aeaea84fd98ca35d7e1c3b5ab3ae26e0)
- [Dev Deps] update `auto-changelog`, `es-value-fixtures`, `tape` [`d5a469c`](https://github.com/inspect-js/object-inspect/commit/d5a469c99ec07ccaeafc36ac4b36a93285086d48)
- [Tests] replace `aud` with `npm audit` [`fb7815f`](https://github.com/inspect-js/object-inspect/commit/fb7815f9b72cae277a04f65bbb0543f85b88be62)
- [Dev Deps] update `mock-property` [`11c817b`](https://github.com/inspect-js/object-inspect/commit/11c817bf10392aa017755962ba6bc89d731359ee)

## [v1.13.2](https://github.com/inspect-js/object-inspect/compare/v1.13.1...v1.13.2) - 2024-06-21

### Commits

- [readme] update badges [`8a51e6b`](https://github.com/inspect-js/object-inspect/commit/8a51e6bedaf389ec40cc4659e9df53e8543d176e)
- [Dev Deps] update `@ljharb/eslint-config`, `tape` [`ef05f58`](https://github.com/inspect-js/object-inspect/commit/ef05f58c9761a41416ab907299bf0fa79517014b)
- [Dev Deps] update `error-cause`, `has-tostringtag`, `tape` [`c0c6c26`](https://github.com/inspect-js/object-inspect/commit/c0c6c26c44cee6671f7c5d43d2b91d27c5c00d90)
- [Fix] Don't throw when `global` is not defined [`d4d0965`](https://github.com/inspect-js/object-inspect/commit/d4d096570f7dbd0e03266a96de11d05eb7b63e0f)
- [meta] add missing `engines.node` [`17a352a`](https://github.com/inspect-js/object-inspect/commit/17a352af6fe1ba6b70a19081674231eb1a50c940)
- [Dev Deps] update `globalthis` [`9c08884`](https://github.com/inspect-js/object-inspect/commit/9c08884aa662a149e2f11403f413927736b97da7)
- [Dev Deps] update `error-cause` [`6af352d`](https://github.com/inspect-js/object-inspect/commit/6af352d7c3929a4cc4c55768c27bf547a5e900f4)
- [Dev Deps] update `npmignore` [`94e617d`](https://github.com/inspect-js/object-inspect/commit/94e617d38831722562fa73dff4c895746861d267)
- [Dev Deps] update `mock-property` [`2ac24d7`](https://github.com/inspect-js/object-inspect/commit/2ac24d7e58cd388ad093c33249e413e05bbfd6c3)
- [Dev Deps] update `tape` [`46125e5`](https://github.com/inspect-js/object-inspect/commit/46125e58f1d1dcfb170ed3d1ea69da550ea8d77b)

## [v1.13.1](https://github.com/inspect-js/object-inspect/compare/v1.13.0...v1.13.1) - 2023-10-19

### Commits

- [Fix] in IE 8, global can !== window despite them being prototypes of each other [`30d0859`](https://github.com/inspect-js/object-inspect/commit/30d0859dc4606cf75c2410edcd5d5c6355f8d372)

## [v1.13.0](https://github.com/inspect-js/object-inspect/compare/v1.12.3...v1.13.0) - 2023-10-14

### Commits

- [New] add special handling for the global object [`431bab2`](https://github.com/inspect-js/object-inspect/commit/431bab21a490ee51d35395966a504501e8c685da)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`fd4f619`](https://github.com/inspect-js/object-inspect/commit/fd4f6193562b4b0e95dcf5c0201b4e8cbbc4f58d)
- [Dev Deps] update `mock-property`, `tape` [`b453f6c`](https://github.com/inspect-js/object-inspect/commit/b453f6ceeebf8a1b738a1029754092e0367a4134)
- [Dev Deps] update `error-cause` [`e8ffc57`](https://github.com/inspect-js/object-inspect/commit/e8ffc577d73b92bb6a4b00c44f14e3319e374888)
- [Dev Deps] update `tape` [`054b8b9`](https://github.com/inspect-js/object-inspect/commit/054b8b9b98633284cf989e582450ebfbbe53503c)
- [Dev Deps] temporarily remove `aud` due to breaking change in transitive deps [`2476845`](https://github.com/inspect-js/object-inspect/commit/2476845e0678dd290c541c81cd3dec8420782c52)
- [Dev Deps] pin `glob`, since v10.3.8+ requires a broken `jackspeak` [`383fa5e`](https://github.com/inspect-js/object-inspect/commit/383fa5eebc0afd705cc778a4b49d8e26452e49a8)
- [Dev Deps] pin `jackspeak` since 2.1.2+ depends on npm aliases, which kill the install process in npm &lt; 6 [`68c244c`](https://github.com/inspect-js/object-inspect/commit/68c244c5174cdd877e5dcb8ee90aa3f44b2f25be)

## [v1.12.3](https://github.com/inspect-js/object-inspect/compare/v1.12.2...v1.12.3) - 2023-01-12

### Commits

- [Fix] in eg FF 24, collections lack forEach [`75fc226`](https://github.com/inspect-js/object-inspect/commit/75fc22673c82d45f28322b1946bb0eb41b672b7f)
- [actions] update rebase action to use reusable workflow [`250a277`](https://github.com/inspect-js/object-inspect/commit/250a277a095e9dacc029ab8454dcfc15de549dcd)
- [Dev Deps] update `aud`, `es-value-fixtures`, `tape` [`66a19b3`](https://github.com/inspect-js/object-inspect/commit/66a19b3209ccc3c5ef4b34c3cb0160e65d1ce9d5)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `error-cause` [`c43d332`](https://github.com/inspect-js/object-inspect/commit/c43d3324b48384a16fd3dc444e5fc589d785bef3)
- [Tests] add `@pkgjs/support` to `postlint` [`e2618d2`](https://github.com/inspect-js/object-inspect/commit/e2618d22a7a3fa361b6629b53c1752fddc9c4d80)

## [v1.12.2](https://github.com/inspect-js/object-inspect/compare/v1.12.1...v1.12.2) - 2022-05-26

### Commits

- [Fix] use `util.inspect` for a custom inspection symbol method [`e243bf2`](https://github.com/inspect-js/object-inspect/commit/e243bf2eda6c4403ac6f1146fddb14d12e9646c1)
- [meta] add support info [`ca20ba3`](https://github.com/inspect-js/object-inspect/commit/ca20ba35713c17068ca912a86c542f5e8acb656c)
- [Fix] ignore `cause` in node v16.9 and v16.10 where it has a bug [`86aa553`](https://github.com/inspect-js/object-inspect/commit/86aa553a4a455562c2c56f1540f0bf857b9d314b)

## [v1.12.1](https://github.com/inspect-js/object-inspect/compare/v1.12.0...v1.12.1) - 2022-05-21

### Commits

- [Tests] use `mock-property` [`4ec8893`](https://github.com/inspect-js/object-inspect/commit/4ec8893ea9bfd28065ca3638cf6762424bf44352)
- [meta] use `npmignore` to autogenerate an npmignore file [`07f868c`](https://github.com/inspect-js/object-inspect/commit/07f868c10bd25a9d18686528339bb749c211fc9a)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `tape` [`b05244b`](https://github.com/inspect-js/object-inspect/commit/b05244b4f331e00c43b3151bc498041be77ccc91)
- [Dev Deps] update `@ljharb/eslint-config`, `error-cause`, `es-value-fixtures`, `functions-have-names`, `tape` [`d037398`](https://github.com/inspect-js/object-inspect/commit/d037398dcc5d531532e4c19c4a711ed677f579c1)
- [Fix] properly handle callable regexes in older engines [`848fe48`](https://github.com/inspect-js/object-inspect/commit/848fe48bd6dd0064ba781ee6f3c5e54a94144c37)

## [v1.12.0](https://github.com/inspect-js/object-inspect/compare/v1.11.1...v1.12.0) - 2021-12-18

### Commits

- [New] add `numericSeparator` boolean option [`2d2d537`](https://github.com/inspect-js/object-inspect/commit/2d2d537f5359a4300ce1c10241369f8024f89e11)
- [Robustness] cache more prototype methods [`191533d`](https://github.com/inspect-js/object-inspect/commit/191533da8aec98a05eadd73a5a6e979c9c8653e8)
- [New] ensure an Error’s `cause` is displayed [`53bc2ce`](https://github.com/inspect-js/object-inspect/commit/53bc2cee4e5a9cc4986f3cafa22c0685f340715e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config` [`bc164b6`](https://github.com/inspect-js/object-inspect/commit/bc164b6e2e7d36b263970f16f54de63048b84a36)
- [Robustness] cache `RegExp.prototype.test` [`a314ab8`](https://github.com/inspect-js/object-inspect/commit/a314ab8271b905cbabc594c82914d2485a8daf12)
- [meta] fix auto-changelog settings [`5ed0983`](https://github.com/inspect-js/object-inspect/commit/5ed0983be72f73e32e2559997517a95525c7e20d)

## [v1.11.1](https://github.com/inspect-js/object-inspect/compare/v1.11.0...v1.11.1) - 2021-12-05

### Commits

- [meta] add `auto-changelog` [`7dbdd22`](https://github.com/inspect-js/object-inspect/commit/7dbdd228401d6025d8b7391476d88aee9ea9bbdf)
- [actions] reuse common workflows [`c8823bc`](https://github.com/inspect-js/object-inspect/commit/c8823bc0a8790729680709d45fb6e652432e91aa)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `safe-publish-latest`, `tape` [`7532b12`](https://github.com/inspect-js/object-inspect/commit/7532b120598307497b712890f75af8056f6d37a6)
- [Refactor] use `has-tostringtag` to behave correctly in the presence of symbol shams [`94abb5d`](https://github.com/inspect-js/object-inspect/commit/94abb5d4e745bf33253942dea86b3e538d2ff6c6)
- [actions] update codecov uploader [`5ed5102`](https://github.com/inspect-js/object-inspect/commit/5ed51025267a00e53b1341357315490ac4eb0874)
- [Dev Deps] update `eslint`, `tape` [`37b2ad2`](https://github.com/inspect-js/object-inspect/commit/37b2ad26c08d94bfd01d5d07069a0b28ef4e2ad7)
- [meta] add `sideEffects` flag [`d341f90`](https://github.com/inspect-js/object-inspect/commit/d341f905ef8bffa6a694cda6ddc5ba343532cd4f)

## [v1.11.0](https://github.com/inspect-js/object-inspect/compare/v1.10.3...v1.11.0) - 2021-07-12

### Commits

- [New] `customInspect`: add `symbol` option, to mimic modern util.inspect behavior [`e973a6e`](https://github.com/inspect-js/object-inspect/commit/e973a6e21f8140c5837cf25e9d89bdde88dc3120)
- [Dev Deps] update `eslint` [`05f1cb3`](https://github.com/inspect-js/object-inspect/commit/05f1cb3cbcfe1f238e8b51cf9bc294305b7ed793)

## [v1.10.3](https://github.com/inspect-js/object-inspect/compare/v1.10.2...v1.10.3) - 2021-05-07

### Commits

- [Fix] handle core-js Symbol shams [`4acfc2c`](https://github.com/inspect-js/object-inspect/commit/4acfc2c4b503498759120eb517abad6d51c9c5d6)
- [readme] update badges [`95c323a`](https://github.com/inspect-js/object-inspect/commit/95c323ad909d6cbabb95dd6015c190ba6db9c1f2)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud` [`cb38f48`](https://github.com/inspect-js/object-inspect/commit/cb38f485de6ec7a95109b5a9bbd0a1deba2f6611)

## [v1.10.2](https://github.com/inspect-js/object-inspect/compare/v1.10.1...v1.10.2) - 2021-04-17

### Commits

- [Fix] use a robust check for a boxed Symbol [`87f12d6`](https://github.com/inspect-js/object-inspect/commit/87f12d6e69ce530be04659c81a4cd502943acac5)

## [v1.10.1](https://github.com/inspect-js/object-inspect/compare/v1.10.0...v1.10.1) - 2021-04-17

### Commits

- [Fix] use a robust check for a boxed bigint [`d5ca829`](https://github.com/inspect-js/object-inspect/commit/d5ca8298b6d2e5c7b9334a5b21b96ed95d225c91)

## [v1.10.0](https://github.com/inspect-js/object-inspect/compare/v1.9.0...v1.10.0) - 2021-04-17

### Commits

- [Tests] increase coverage [`d8abb8a`](https://github.com/inspect-js/object-inspect/commit/d8abb8a62c2f084919df994a433b346e0d87a227)
- [actions] use `node/install` instead of `node/run`; use `codecov` action [`4bfec2e`](https://github.com/inspect-js/object-inspect/commit/4bfec2e30aaef6ddef6cbb1448306f9f8b9520b7)
- [New] respect `Symbol.toStringTag` on objects [`799b58f`](https://github.com/inspect-js/object-inspect/commit/799b58f536a45e4484633a8e9daeb0330835f175)
- [Fix] do not allow Symbol.toStringTag to masquerade as builtins [`d6c5b37`](https://github.com/inspect-js/object-inspect/commit/d6c5b37d7e94427796b82432fb0c8964f033a6ab)
- [New] add `WeakRef` support [`b6d898e`](https://github.com/inspect-js/object-inspect/commit/b6d898ee21868c780a7ee66b28532b5b34ed7f09)
- [meta] do not publish github action workflow files [`918cdfc`](https://github.com/inspect-js/object-inspect/commit/918cdfc4b6fe83f559ff6ef04fe66201e3ff5cbd)
- [meta] create `FUNDING.yml` [`0bb5fc5`](https://github.com/inspect-js/object-inspect/commit/0bb5fc516dbcd2cd728bd89cee0b580acc5ce301)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `tape` [`22c8dc0`](https://github.com/inspect-js/object-inspect/commit/22c8dc0cac113d70f4781e49a950070923a671be)
- [meta] use `prepublishOnly` script for npm 7+ [`e52ee09`](https://github.com/inspect-js/object-inspect/commit/e52ee09e8050b8dbac94ef57f786675567728223)
- [Dev Deps] update `eslint` [`7c4e6fd`](https://github.com/inspect-js/object-inspect/commit/7c4e6fdedcd27cc980e13c9ad834d05a96f3d40c)

## [v1.9.0](https://github.com/inspect-js/object-inspect/compare/v1.8.0...v1.9.0) - 2020-11-30

### Commits

- [Tests] migrate tests to Github Actions [`d262251`](https://github.com/inspect-js/object-inspect/commit/d262251e13e16d3490b5473672f6b6d6ff86675d)
- [New] add enumerable own Symbols to plain object output [`ee60c03`](https://github.com/inspect-js/object-inspect/commit/ee60c033088cff9d33baa71e59a362a541b48284)
- [Tests] add passing tests [`01ac3e4`](https://github.com/inspect-js/object-inspect/commit/01ac3e4b5a30f97875a63dc9b1416b3bd626afc9)
- [actions] add "Require Allow Edits" action [`c2d7746`](https://github.com/inspect-js/object-inspect/commit/c2d774680cde4ca4af332d84d4121b26f798ba9e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `core-js` [`70058de`](https://github.com/inspect-js/object-inspect/commit/70058de1579fc54d1d15ed6c2dbe246637ce70ff)
- [Fix] hex characters in strings should be uppercased, to match node `assert` [`6ab8faa`](https://github.com/inspect-js/object-inspect/commit/6ab8faaa0abc08fe7a8e2afd8b39c6f1f0e00113)
- [Tests] run `nyc` on all tests [`4c47372`](https://github.com/inspect-js/object-inspect/commit/4c473727879ddc8e28b599202551ddaaf07b6210)
- [Tests] node 0.8 has an unpredictable property order; fix `groups` test by removing property [`f192069`](https://github.com/inspect-js/object-inspect/commit/f192069a978a3b60e6f0e0d45ac7df260ab9a778)
- [New] add enumerable properties to Function inspect result, per node’s `assert` [`fd38e1b`](https://github.com/inspect-js/object-inspect/commit/fd38e1bc3e2a1dc82091ce3e021917462eee64fc)
- [Tests] fix tests for node &lt; 10, due to regex match `groups` [`2ac6462`](https://github.com/inspect-js/object-inspect/commit/2ac6462cc4f72eaa0b63a8cfee9aabe3008b2330)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config` [`44b59e2`](https://github.com/inspect-js/object-inspect/commit/44b59e2676a7f825ef530dfd19dafb599e3b9456)
- [Robustness] cache `Symbol.prototype.toString` [`f3c2074`](https://github.com/inspect-js/object-inspect/commit/f3c2074d8f32faf8292587c07c9678ea931703dd)
- [Dev Deps] update `eslint` [`9411294`](https://github.com/inspect-js/object-inspect/commit/94112944b9245e3302e25453277876402d207e7f)
- [meta] `require-allow-edits` no longer requires an explicit github token [`36c0220`](https://github.com/inspect-js/object-inspect/commit/36c02205de3c2b0e84d53777c5c9fd54a36c48ab)
- [actions] update rebase checkout action to v2 [`55a39a6`](https://github.com/inspect-js/object-inspect/commit/55a39a64e944f19c6a7d8efddf3df27700f20d14)
- [actions] switch Automatic Rebase workflow to `pull_request_target` event [`f59fd3c`](https://github.com/inspect-js/object-inspect/commit/f59fd3cf406c3a7c7ece140904a80bbc6bacfcca)
- [Dev Deps] update `eslint` [`a492bec`](https://github.com/inspect-js/object-inspect/commit/a492becec644b0155c9c4bc1caf6f9fac11fb2c7)

## [v1.8.0](https://github.com/inspect-js/object-inspect/compare/v1.7.0...v1.8.0) - 2020-06-18

### Fixed

- [New] add `indent` option [`#27`](https://github.com/inspect-js/object-inspect/issues/27)

### Commits

- [Tests] add codecov [`4324cbb`](https://github.com/inspect-js/object-inspect/commit/4324cbb1a2bd7710822a4151ff373570db22453e)
- [New] add `maxStringLength` option [`b3995cb`](https://github.com/inspect-js/object-inspect/commit/b3995cb71e15b5ee127a3094c43994df9d973502)
- [New] add `customInspect` option, to disable custom inspect methods [`28b9179`](https://github.com/inspect-js/object-inspect/commit/28b9179ee802bb3b90810100c11637db90c2fb6d)
- [Tests] add Date and RegExp tests [`3b28eca`](https://github.com/inspect-js/object-inspect/commit/3b28eca57b0367aeadffac604ea09e8bdae7d97b)
- [actions] add automatic rebasing / merge commit blocking [`0d9c6c0`](https://github.com/inspect-js/object-inspect/commit/0d9c6c044e83475ff0bfffb9d35b149834c83a2e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `core-js`, `tape`; add `aud` [`7c204f2`](https://github.com/inspect-js/object-inspect/commit/7c204f22b9e41bc97147f4d32d4cb045b17769a6)
- [readme] fix repo URLs, remove testling [`34ca9a0`](https://github.com/inspect-js/object-inspect/commit/34ca9a0dabfe75bd311f806a326fadad029909a3)
- [Fix] when truncating a deep array, note it as `[Array]` instead of just `[Object]` [`f74c82d`](https://github.com/inspect-js/object-inspect/commit/f74c82dd0b35386445510deb250f34c41be3ec0e)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape` [`1a8a5ea`](https://github.com/inspect-js/object-inspect/commit/1a8a5ea069ea2bee89d77caedad83ffa23d35711)
- [Fix] do not be fooled by a function’s own `toString` method [`7cb5c65`](https://github.com/inspect-js/object-inspect/commit/7cb5c657a976f94715c19c10556a30f15bb7d5d7)
- [patch] indicate explicitly that anon functions are anonymous, to match node [`81ebdd4`](https://github.com/inspect-js/object-inspect/commit/81ebdd4215005144074bbdff3f6bafa01407910a)
- [Dev Deps] loosen the `core-js` dep [`e7472e8`](https://github.com/inspect-js/object-inspect/commit/e7472e8e242117670560bd995830c2a4d12080f5)
- [Dev Deps] update `tape` [`699827e`](https://github.com/inspect-js/object-inspect/commit/699827e6b37258b5203c33c78c009bf4b0e6a66d)
- [meta] add `safe-publish-latest` [`c5d2868`](https://github.com/inspect-js/object-inspect/commit/c5d2868d6eb33c472f37a20f89ceef2787046088)
- [Dev Deps] update `@ljharb/eslint-config` [`9199501`](https://github.com/inspect-js/object-inspect/commit/919950195d486114ccebacbdf9d74d7f382693b0)

## [v1.7.0](https://github.com/inspect-js/object-inspect/compare/v1.6.0...v1.7.0) - 2019-11-10

### Commits

- [Tests] use shared travis-ci configs [`19899ed`](https://github.com/inspect-js/object-inspect/commit/19899edbf31f4f8809acf745ce34ad1ce1bfa63b)
- [Tests] add linting [`a00f057`](https://github.com/inspect-js/object-inspect/commit/a00f057d917f66ea26dd37769c6b810ec4af97e8)
- [Tests] lint last file [`2698047`](https://github.com/inspect-js/object-inspect/commit/2698047b58af1e2e88061598ef37a75f228dddf6)
- [Tests] up to `node` `v12.7`, `v11.15`, `v10.16`, `v8.16`, `v6.17` [`589e87a`](https://github.com/inspect-js/object-inspect/commit/589e87a99cadcff4b600e6a303418e9d922836e8)
- [New] add support for `WeakMap` and `WeakSet` [`3ddb3e4`](https://github.com/inspect-js/object-inspect/commit/3ddb3e4e0c8287130c61a12e0ed9c104b1549306)
- [meta] clean up license so github can detect it properly [`27527bb`](https://github.com/inspect-js/object-inspect/commit/27527bb801520c9610c68cc3b55d6f20a2bee56d)
- [Tests] cover `util.inspect.custom` [`36d47b9`](https://github.com/inspect-js/object-inspect/commit/36d47b9c59056a57ef2f1491602c726359561800)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `core-js`, `tape` [`b614eaa`](https://github.com/inspect-js/object-inspect/commit/b614eaac901da0e5c69151f534671f990a94cace)
- [Tests] fix coverage thresholds [`7b7b176`](https://github.com/inspect-js/object-inspect/commit/7b7b176e15f8bd6e8b2f261ff5a493c2fe78d9c2)
- [Tests] bigint tests now can run on unflagged node [`063af31`](https://github.com/inspect-js/object-inspect/commit/063af31ce9cd13c202e3b67c07ba06dc9b7c0f81)
- [Refactor] add early bailout to `isMap` and `isSet` checks [`fc51047`](https://github.com/inspect-js/object-inspect/commit/fc5104714a3671d37e225813db79470d6335683b)
- [meta] add `funding` field [`7f9953a`](https://github.com/inspect-js/object-inspect/commit/7f9953a113eec7b064a6393cf9f90ba15f1d131b)
- [Tests] Fix invalid strict-mode syntax with hexadecimal [`a8b5425`](https://github.com/inspect-js/object-inspect/commit/a8b542503b4af1599a275209a1a99f5fdedb1ead)
- [Dev Deps] update `@ljharb/eslint-config` [`98df157`](https://github.com/inspect-js/object-inspect/commit/98df1577314d9188a3fc3f17fdcf2fba697ae1bd)
- add copyright to LICENSE [`bb69fd0`](https://github.com/inspect-js/object-inspect/commit/bb69fd017a062d299e44da1f9b2c7dcd67f621e6)
- [Tests] use `npx aud` in `posttest` [`4838353`](https://github.com/inspect-js/object-inspect/commit/4838353593974cf7f905b9ef04c03c094f0cdbe2)
- [Tests] move `0.6` to allowed failures, because it won‘t build on travis [`1bff32a`](https://github.com/inspect-js/object-inspect/commit/1bff32aa52e8aea687f0856b28ba754b3e43ebf7)

## [v1.6.0](https://github.com/inspect-js/object-inspect/compare/v1.5.0...v1.6.0) - 2018-05-02

### Commits

- [New] add support for boxed BigInt primitives [`356c66a`](https://github.com/inspect-js/object-inspect/commit/356c66a410e7aece7162c8319880a5ef647beaa9)
- [Tests] up to `node` `v10.0`, `v9.11`, `v8.11`, `v6.14`, `v4.9` [`c77b65b`](https://github.com/inspect-js/object-inspect/commit/c77b65bba593811b906b9ec57561c5cba92e2db3)
- [New] Add support for upcoming `BigInt` [`1ac548e`](https://github.com/inspect-js/object-inspect/commit/1ac548e4b27e26466c28c9a5e63e5d4e0591c31f)
- [Tests] run bigint tests in CI with --harmony-bigint flag [`d31b738`](https://github.com/inspect-js/object-inspect/commit/d31b73831880254b5c6cf5691cda9a149fbc5f04)
- [Dev Deps] update `core-js`, `tape` [`ff9eff6`](https://github.com/inspect-js/object-inspect/commit/ff9eff67113341ee1aaf80c1c22d683f43bfbccf)
- [Docs] fix example to use `safer-buffer` [`48cae12`](https://github.com/inspect-js/object-inspect/commit/48cae12a73ec6cacc955175bc56bbe6aee6a211f)

## [v1.5.0](https://github.com/inspect-js/object-inspect/compare/v1.4.1...v1.5.0) - 2017-12-25

### Commits

- [New] add `quoteStyle` option [`f5a72d2`](https://github.com/inspect-js/object-inspect/commit/f5a72d26edb3959b048f74c056ca7100a6b091e4)
- [Tests] add more test coverage [`30ebe4e`](https://github.com/inspect-js/object-inspect/commit/30ebe4e1fa943b99ecbb85be7614256d536e2759)
- [Tests] require 0.6 to pass [`99a008c`](https://github.com/inspect-js/object-inspect/commit/99a008ccace189a60fd7da18bf00e32c9572b980)

## [v1.4.1](https://github.com/inspect-js/object-inspect/compare/v1.4.0...v1.4.1) - 2017-12-19

### Commits

- [Tests] up to `node` `v9.3`, `v8.9`, `v6.12` [`6674476`](https://github.com/inspect-js/object-inspect/commit/6674476cc56acaac1bde96c84fed5ef631911906)
- [Fix] `inspect(Object(-0))` should be “Object(-0)”, not “Object(0)” [`d0a031f`](https://github.com/inspect-js/object-inspect/commit/d0a031f1cbb3024ee9982bfe364dd18a7e4d1bd3)

## [v1.4.0](https://github.com/inspect-js/object-inspect/compare/v1.3.0...v1.4.0) - 2017-10-24

### Commits

- [Tests] add `npm run coverage` [`3b48fb2`](https://github.com/inspect-js/object-inspect/commit/3b48fb25db037235eeb808f0b2830aad7aa36f70)
- [Tests] remove commented-out osx builds [`71e24db`](https://github.com/inspect-js/object-inspect/commit/71e24db8ad6ee3b9b381c5300b0475f2ba595a73)
- [New] add support for `util.inspect.custom`, in node only. [`20cca77`](https://github.com/inspect-js/object-inspect/commit/20cca7762d7e17f15b21a90793dff84acce155df)
- [Tests] up to `node` `v8.6`; use `nvm install-latest-npm` to ensure new npm doesn’t break old node [`252952d`](https://github.com/inspect-js/object-inspect/commit/252952d230d8065851dd3d4d5fe8398aae068529)
- [Tests] up to `node` `v8.8` [`4aa868d`](https://github.com/inspect-js/object-inspect/commit/4aa868d3a62914091d489dd6ec6eed194ee67cd3)
- [Dev Deps] update `core-js`, `tape` [`59483d1`](https://github.com/inspect-js/object-inspect/commit/59483d1df418f852f51fa0db7b24aa6b0209a27a)

## [v1.3.0](https://github.com/inspect-js/object-inspect/compare/v1.2.2...v1.3.0) - 2017-07-31

### Fixed

- [Fix] Map/Set: work around core-js bug &lt; v2.5.0 [`#9`](https://github.com/inspect-js/object-inspect/issues/9)

### Commits

- [New] add support for arrays with additional object keys [`0d19937`](https://github.com/inspect-js/object-inspect/commit/0d199374ee37959e51539616666f420ccb29acb9)
- [Tests] up to `node` `v8.2`, `v7.10`, `v6.11`; fix new npm breaking on older nodes [`e24784a`](https://github.com/inspect-js/object-inspect/commit/e24784a90c49117787157a12a63897c49cf89bbb)
- Only apps should have lockfiles [`c6faebc`](https://github.com/inspect-js/object-inspect/commit/c6faebcb2ee486a889a4a1c4d78c0776c7576185)
- [Dev Deps] update `tape` [`7345a0a`](https://github.com/inspect-js/object-inspect/commit/7345a0aeba7e91b888a079c10004d17696a7f586)

## [v1.2.2](https://github.com/inspect-js/object-inspect/compare/v1.2.1...v1.2.2) - 2017-03-24

### Commits

- [Tests] up to `node` `v7.7`, `v6.10`, `v4.8`; improve test matrix [`a2ddc15`](https://github.com/inspect-js/object-inspect/commit/a2ddc15a1f2c65af18076eea1c0eb9cbceb478a0)
- [Tests] up to `node` `v7.0`, `v6.9`, `v5.12`, `v4.6`, `io.js` `v3.3`; improve test matrix [`a48949f`](https://github.com/inspect-js/object-inspect/commit/a48949f6b574b2d4d2298109d8e8d0eb3e7a83e7)
- [Performance] check for primitive types as early as possible. [`3b8092a`](https://github.com/inspect-js/object-inspect/commit/3b8092a2a4deffd0575f94334f00194e2d48dad3)
- [Refactor] remove unneeded `else`s. [`7255034`](https://github.com/inspect-js/object-inspect/commit/725503402e08de4f96f6bf2d8edef44ac36f26b6)
- [Refactor] avoid recreating `lowbyte` function every time. [`81edd34`](https://github.com/inspect-js/object-inspect/commit/81edd3475bd15bdd18e84de7472033dcf5004aaa)
- [Fix] differentiate -0 from 0 [`521d345`](https://github.com/inspect-js/object-inspect/commit/521d3456b009da7bf1c5785c8a9df5a9f8718264)
- [Refactor] move object key gathering into separate function [`aca6265`](https://github.com/inspect-js/object-inspect/commit/aca626536eaeef697196c6e9db3e90e7e0355b6a)
- [Refactor] consolidate wrapping logic for boxed primitives into a function. [`4e440cd`](https://github.com/inspect-js/object-inspect/commit/4e440cd9065df04802a2a1dead03f48c353ca301)
- [Robustness] use `typeof` instead of comparing to literal `undefined` [`5ca6f60`](https://github.com/inspect-js/object-inspect/commit/5ca6f601937506daff8ed2fcf686363b55807b69)
- [Refactor] consolidate Map/Set notations. [`4e576e5`](https://github.com/inspect-js/object-inspect/commit/4e576e5d7ed2f9ec3fb7f37a0d16732eb10758a9)
- [Tests] ensure that this function remains anonymous, despite ES6 name inference. [`7540ae5`](https://github.com/inspect-js/object-inspect/commit/7540ae591278756db614fa4def55ca413150e1a3)
- [Refactor] explicitly coerce Error objects to strings. [`7f4ca84`](https://github.com/inspect-js/object-inspect/commit/7f4ca8424ee8dc2c0ca5a422d94f7fac40327261)
- [Refactor] split up `var` declarations for debuggability [`6f2c11e`](https://github.com/inspect-js/object-inspect/commit/6f2c11e6a85418586a00292dcec5e97683f89bc3)
- [Robustness] cache `Object.prototype.toString` [`df44a20`](https://github.com/inspect-js/object-inspect/commit/df44a20adfccf31529d60d1df2079bfc3c836e27)
- [Dev Deps] update `tape` [`3ec714e`](https://github.com/inspect-js/object-inspect/commit/3ec714eba57bc3f58a6eb4fca1376f49e70d300a)
- [Dev Deps] update `tape` [`beb72d9`](https://github.com/inspect-js/object-inspect/commit/beb72d969653747d7cde300393c28755375329b0)

## [v1.2.1](https://github.com/inspect-js/object-inspect/compare/v1.2.0...v1.2.1) - 2016-04-09

### Fixed

- [Fix] fix Boolean `false` object inspection. [`#7`](https://github.com/substack/object-inspect/pull/7)

## [v1.2.0](https://github.com/inspect-js/object-inspect/compare/v1.1.0...v1.2.0) - 2016-04-09

### Fixed

- [New] add support for inspecting String/Number/Boolean objects. [`#6`](https://github.com/inspect-js/object-inspect/issues/6)

### Commits

- [Dev Deps] update `tape` [`742caa2`](https://github.com/inspect-js/object-inspect/commit/742caa262cf7af4c815d4821c8bd0129c1446432)

## [v1.1.0](https://github.com/inspect-js/object-inspect/compare/1.0.2...v1.1.0) - 2015-12-14

### Merged

- [New] add ES6 Map/Set support. [`#4`](https://github.com/inspect-js/object-inspect/pull/4)

### Fixed

- [New] add ES6 Map/Set support. [`#3`](https://github.com/inspect-js/object-inspect/issues/3)

### Commits

- Update `travis.yml` to test on bunches of `iojs` and `node` versions. [`4c1fd65`](https://github.com/inspect-js/object-inspect/commit/4c1fd65cc3bd95307e854d114b90478324287fd2)
- [Dev Deps] update `tape` [`88a907e`](https://github.com/inspect-js/object-inspect/commit/88a907e33afbe408e4b5d6e4e42a33143f88848c)

## [1.0.2](https://github.com/inspect-js/object-inspect/compare/1.0.1...1.0.2) - 2015-08-07

### Commits

- [Fix] Cache `Object.prototype.hasOwnProperty` in case it's deleted later. [`1d0075d`](https://github.com/inspect-js/object-inspect/commit/1d0075d3091dc82246feeb1f9871cb2b8ed227b3)
- [Dev Deps] Update `tape` [`ca8d5d7`](https://github.com/inspect-js/object-inspect/commit/ca8d5d75635ddbf76f944e628267581e04958457)
- gitignore node_modules since this is a reusable modules. [`ed41407`](https://github.com/inspect-js/object-inspect/commit/ed41407811743ca530cdeb28f982beb96026af82)

## [1.0.1](https://github.com/inspect-js/object-inspect/compare/1.0.0...1.0.1) - 2015-07-19

### Commits

- Make `inspect` work with symbol primitives and objects, including in node 0.11 and 0.12. [`ddf1b94`](https://github.com/inspect-js/object-inspect/commit/ddf1b94475ab951f1e3bccdc0a48e9073cfbfef4)
- bump tape [`103d674`](https://github.com/inspect-js/object-inspect/commit/103d67496b504bdcfdd765d303a773f87ec106e2)
- use newer travis config [`d497276`](https://github.com/inspect-js/object-inspect/commit/d497276c1da14234bb5098a59cf20de75fbc316a)

## [1.0.0](https://github.com/inspect-js/object-inspect/compare/0.4.0...1.0.0) - 2014-08-05

### Commits

- error inspect works properly [`260a22d`](https://github.com/inspect-js/object-inspect/commit/260a22d134d3a8a482c67d52091c6040c34f4299)
- seen coverage [`57269e8`](https://github.com/inspect-js/object-inspect/commit/57269e8baa992a7439047f47325111fdcbcb8417)
- htmlelement instance coverage [`397ffe1`](https://github.com/inspect-js/object-inspect/commit/397ffe10a1980350868043ef9de65686d438979f)
- more element coverage [`6905cc2`](https://github.com/inspect-js/object-inspect/commit/6905cc2f7df35600177e613b0642b4df5efd3eca)
- failing test for type errors [`385b615`](https://github.com/inspect-js/object-inspect/commit/385b6152e49b51b68449a662f410b084ed7c601a)
- fn name coverage [`edc906d`](https://github.com/inspect-js/object-inspect/commit/edc906d40fca6b9194d304062c037ee8e398c4c2)
- server-side element test [`362d1d3`](https://github.com/inspect-js/object-inspect/commit/362d1d3e86f187651c29feeb8478110afada385b)
- custom inspect fn [`e89b0f6`](https://github.com/inspect-js/object-inspect/commit/e89b0f6fe6d5e03681282af83732a509160435a6)
- fixed browser test [`b530882`](https://github.com/inspect-js/object-inspect/commit/b5308824a1c8471c5617e394766a03a6977102a9)
- depth test, matches node [`1cfd9e0`](https://github.com/inspect-js/object-inspect/commit/1cfd9e0285a4ae1dff44101ad482915d9bf47e48)
- exercise hasOwnProperty path [`8d753fb`](https://github.com/inspect-js/object-inspect/commit/8d753fb362a534fa1106e4d80f2ee9bea06a66d9)
- more cases covered for errors [`c5c46a5`](https://github.com/inspect-js/object-inspect/commit/c5c46a569ec4606583497e8550f0d8c7ad39a4a4)
- \W obj key test case [`b0eceee`](https://github.com/inspect-js/object-inspect/commit/b0eceeea6e0eb94d686c1046e99b9e25e5005f75)
- coverage for explicit depth param [`e12b91c`](https://github.com/inspect-js/object-inspect/commit/e12b91cd59683362f3a0e80f46481a0211e26c15)

## [0.4.0](https://github.com/inspect-js/object-inspect/compare/0.3.1...0.4.0) - 2014-03-21

### Commits

- passing lowbyte interpolation test [`b847511`](https://github.com/inspect-js/object-inspect/commit/b8475114f5def7e7961c5353d48d3d8d9a520985)
- lowbyte test [`4a2b0e1`](https://github.com/inspect-js/object-inspect/commit/4a2b0e142667fc933f195472759385ac08f3946c)

## [0.3.1](https://github.com/inspect-js/object-inspect/compare/0.3.0...0.3.1) - 2014-03-04

### Commits

- sort keys [`a07b19c`](https://github.com/inspect-js/object-inspect/commit/a07b19cc3b1521a82d4fafb6368b7a9775428a05)

## [0.3.0](https://github.com/inspect-js/object-inspect/compare/0.2.0...0.3.0) - 2014-03-04

### Commits

- [] and {} instead of [ ] and { } [`654c44b`](https://github.com/inspect-js/object-inspect/commit/654c44b2865811f3519e57bb8526e0821caf5c6b)

## [0.2.0](https://github.com/inspect-js/object-inspect/compare/0.1.3...0.2.0) - 2014-03-04

### Commits

- failing holes test [`99cdfad`](https://github.com/inspect-js/object-inspect/commit/99cdfad03c6474740275a75636fe6ca86c77737a)
- regex already work [`e324033`](https://github.com/inspect-js/object-inspect/commit/e324033267025995ec97d32ed0a65737c99477a6)
- failing undef/null test [`1f88a00`](https://github.com/inspect-js/object-inspect/commit/1f88a00265d3209719dda8117b7e6360b4c20943)
- holes in the all example [`7d345f3`](https://github.com/inspect-js/object-inspect/commit/7d345f3676dcbe980cff89a4f6c243269ebbb709)
- check for .inspect(), fixes Buffer use-case [`c3f7546`](https://github.com/inspect-js/object-inspect/commit/c3f75466dbca125347d49847c05262c292f12b79)
- fixes for holes [`ce25f73`](https://github.com/inspect-js/object-inspect/commit/ce25f736683de4b92ff27dc5471218415e2d78d8)
- weird null behavior [`405c1ea`](https://github.com/inspect-js/object-inspect/commit/405c1ea72cd5a8cf3b498c3eaa903d01b9fbcab5)
- tape is actually a devDependency, upgrade [`703b0ce`](https://github.com/inspect-js/object-inspect/commit/703b0ce6c5817b4245a082564bccd877e0bb6990)
- put date in the example [`a342219`](https://github.com/inspect-js/object-inspect/commit/a3422190eeaa013215f46df2d0d37b48595ac058)
- passing the null test [`4ab737e`](https://github.com/inspect-js/object-inspect/commit/4ab737ebf862a75d247ebe51e79307a34d6380d4)

## [0.1.3](https://github.com/inspect-js/object-inspect/compare/0.1.1...0.1.3) - 2013-07-26

### Commits

- special isElement() check [`882768a`](https://github.com/inspect-js/object-inspect/commit/882768a54035d30747be9de1baf14e5aa0daa128)
- oh right old IEs don't have indexOf either [`36d1275`](https://github.com/inspect-js/object-inspect/commit/36d12756c38b08a74370b0bb696c809e529913a5)

## [0.1.1](https://github.com/inspect-js/object-inspect/compare/0.1.0...0.1.1) - 2013-07-26

### Commits

- tests! [`4422fd9`](https://github.com/inspect-js/object-inspect/commit/4422fd95532c2745aa6c4f786f35f1090be29998)
- fix for ie&lt;9, doesn't have hasOwnProperty [`6b7d611`](https://github.com/inspect-js/object-inspect/commit/6b7d61183050f6da801ea04473211da226482613)
- fix for all IEs: no f.name [`4e0c2f6`](https://github.com/inspect-js/object-inspect/commit/4e0c2f6dfd01c306d067d7163319acc97c94ee50)
- badges [`5ed0d88`](https://github.com/inspect-js/object-inspect/commit/5ed0d88e4e407f9cb327fa4a146c17921f9680f3)

## [0.1.0](https://github.com/inspect-js/object-inspect/compare/0.0.0...0.1.0) - 2013-07-26

### Commits

- [Function] for functions [`ad5c485`](https://github.com/inspect-js/object-inspect/commit/ad5c485098fc83352cb540a60b2548ca56820e0b)

## 0.0.0 - 2013-07-26

### Commits

- working browser example [`34be6b6`](https://github.com/inspect-js/object-inspect/commit/34be6b6548f9ce92bdc3c27572857ba0c4a1218d)
- package.json etc [`cad51f2`](https://github.com/inspect-js/object-inspect/commit/cad51f23fc6bcf1a456ed6abe16088256c2f632f)
- docs complete [`b80cce2`](https://github.com/inspect-js/object-inspect/commit/b80cce2490c4e7183a9ee11ea89071f0abec4446)
- circular example [`4b4a7b9`](https://github.com/inspect-js/object-inspect/commit/4b4a7b92209e4e6b4630976cb6bcd17d14165a59)
- string rep [`7afb479`](https://github.com/inspect-js/object-inspect/commit/7afb479baa798d27f09e0a178b72ea327f60f5c8)


---

<!-- source: archive/library/javascript/references/packages/qs/CHANGELOG--000290.md -->

## Imported source: archive/library/javascript/references/packages/qs/CHANGELOG--000290.md

## **6.13.0**
- [New] `parse`: add `strictDepth` option (#511)
- [Tests] use `npm audit` instead of `aud`

## **6.12.3**
- [Fix] `parse`: properly account for `strictNullHandling` when `allowEmptyArrays`
- [meta] fix changelog indentation

## **6.12.2**
- [Fix] `parse`: parse encoded square brackets (#506)
- [readme] add CII best practices badge

## **6.12.1**
- [Fix] `parse`: Disable `decodeDotInKeys` by default to restore previous behavior (#501)
- [Performance] `utils`: Optimize performance under large data volumes, reduce memory usage, and speed up processing (#502)
- [Refactor] `utils`: use `+=`
- [Tests] increase coverage

## **6.12.0**

- [New] `parse`/`stringify`: add `decodeDotInKeys`/`encodeDotKeys` options (#488)
- [New] `parse`: add `duplicates` option
- [New] `parse`/`stringify`: add `allowEmptyArrays` option to allow [] in object values (#487)
- [Refactor] `parse`/`stringify`: move allowDots config logic to its own variable
- [Refactor] `stringify`: move option-handling code into `normalizeStringifyOptions`
- [readme] update readme, add logos (#484)
- [readme] `stringify`: clarify default `arrayFormat` behavior
- [readme] fix line wrapping
- [readme] remove dead badges
- [Deps] update `side-channel`
- [meta] make the dist build 50% smaller
- [meta] add `sideEffects` flag
- [meta] run build in prepack, not prepublish
- [Tests] `parse`: remove useless tests; add coverage
- [Tests] `stringify`: increase coverage
- [Tests] use `mock-property`
- [Tests] `stringify`: improve coverage
- [Dev Deps] update `@ljharb/eslint-config `, `aud`, `has-override-mistake`, `has-property-descriptors`, `mock-property`, `npmignore`, `object-inspect`, `tape`
- [Dev Deps] pin `glob`, since v10.3.8+ requires a broken `jackspeak`
- [Dev Deps] pin `jackspeak` since 2.1.2+ depends on npm aliases, which kill the install process in npm < 6

## **6.11.2**
- [Fix] `parse`: Fix parsing when the global Object prototype is frozen (#473)
- [Tests] add passing test cases with empty keys (#473)

## **6.11.1**
- [Fix] `stringify`: encode comma values more consistently (#463)
- [readme] add usage of `filter` option for injecting custom serialization, i.e. of custom types (#447)
- [meta] remove extraneous code backticks (#457)
- [meta] fix changelog markdown
- [actions] update checkout action
- [actions] restrict action permissions
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `object-inspect`, `tape`

## **6.11.0**
- [New] [Fix] `stringify`: revert 0e903c0; add `commaRoundTrip` option (#442)
- [readme] fix version badge

## **6.10.5**
- [Fix] `stringify`: with `arrayFormat: comma`, properly include an explicit `[]` on a single-item array (#434)

## **6.10.4**
- [Fix] `stringify`: with `arrayFormat: comma`, include an explicit `[]` on a single-item array (#441)
- [meta] use `npmignore` to autogenerate an npmignore file
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `has-symbol`, `object-inspect`, `tape`

## **6.10.3**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [actions] reuse common workflows
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `object-inspect`, `tape`

## **6.10.2**
- [Fix] `stringify`: actually fix cyclic references (#426)
- [Fix] `stringify`: avoid encoding arrayformat comma when `encodeValuesOnly = true` (#424)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] add note and links for coercing primitive values (#408)
- [actions] update codecov uploader
- [actions] update workflows
- [Tests] clean up stringify tests slightly
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `object-inspect`, `safe-publish-latest`, `tape`

## **6.10.1**
- [Fix] `stringify`: avoid exception on repeated object values (#402)

## **6.10.0**
- [New] `stringify`: throw on cycles, instead of an infinite loop (#395, #394, #393)
- [New] `parse`: add `allowSparse` option for collapsing arrays with missing indices (#312)
- [meta] fix README.md (#399)
- [meta] only run `npm run dist` in publish, not install
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `has-symbols`, `tape`
- [Tests] fix tests on node v0.6
- [Tests] use `ljharb/actions/node/install` instead of `ljharb/actions/node/run`
- [Tests] Revert "[meta] ignore eclint transitive audit warning"

## **6.9.7**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] `stringify`: avoid encoding arrayformat comma when `encodeValuesOnly = true` (#424)
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] add note and links for coercing primitive values (#408)
- [Tests] clean up stringify tests slightly
- [meta] fix README.md (#399)
- Revert "[meta] ignore eclint transitive audit warning"
- [actions] backport actions from main
- [Dev Deps] backport updates from main

## **6.9.6**
- [Fix] restore `dist` dir; mistakenly removed in d4f6c32

## **6.9.5**
- [Fix] `stringify`: do not encode parens for RFC1738
- [Fix] `stringify`: fix arrayFormat comma with empty array/objects (#350)
- [Refactor] `format`: remove `util.assign` call
- [meta] add "Allow Edits" workflow; update rebase workflow
- [actions] switch Automatic Rebase workflow to `pull_request_target` event
- [Tests] `stringify`: add tests for #378
- [Tests] migrate tests to Github Actions
- [Tests] run `nyc` on all tests; use `tape` runner
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `browserify`, `mkdirp`, `object-inspect`, `tape`; add `aud`

## **6.9.4**
- [Fix] `stringify`: when `arrayFormat` is `comma`, respect `serializeDate` (#364)
- [Refactor] `stringify`: reduce branching (part of #350)
- [Refactor] move `maybeMap` to `utils`
- [Dev Deps] update `browserify`, `tape`

## **6.9.3**
- [Fix] proper comma parsing of URL-encoded commas (#361)
- [Fix] parses comma delimited array while having percent-encoded comma treated as normal text (#336)

## **6.9.2**
- [Fix] `parse`: Fix parsing array from object with `comma` true (#359)
- [Fix] `parse`: throw a TypeError instead of an Error for bad charset (#349)
- [meta] ignore eclint transitive audit warning
- [meta] fix indentation in package.json
- [meta] add tidelift marketing copy
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `object-inspect`, `has-symbols`, `tape`, `mkdirp`, `iconv-lite`
- [actions] add automatic rebasing / merge commit blocking

## **6.9.1**
- [Fix] `parse`: with comma true, handle field that holds an array of arrays (#335)
- [Fix] `parse`: with comma true, do not split non-string values (#334)
- [meta] add `funding` field
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`
- [Tests] use shared travis-ci config

## **6.9.0**
- [New] `parse`/`stringify`: Pass extra key/value argument to `decoder` (#333)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `evalmd`
- [Tests] `parse`: add passing `arrayFormat` tests
- [Tests] add `posttest` using `npx aud` to run `npm audit` without a lockfile
- [Tests] up to `node` `v12.10`, `v11.15`, `v10.16`, `v8.16`
- [Tests] `Buffer.from` in node v5.0-v5.9 and v4.0-v4.4 requires a TypedArray

## **6.8.3**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [Fix] `stringify`: avoid encoding arrayformat comma when `encodeValuesOnly = true` (#424)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Tests] clean up stringify tests slightly
- [Docs] add note and links for coercing primitive values (#408)
- [meta] fix README.md (#399)
- [actions] backport actions from main
- [Dev Deps] backport updates from main
- [Refactor] `stringify`: reduce branching
- [meta] do not publish workflow files

## **6.8.2**
- [Fix] proper comma parsing of URL-encoded commas (#361)
- [Fix] parses comma delimited array while having percent-encoded comma treated as normal text (#336)

## **6.8.1**
- [Fix] `parse`: Fix parsing array from object with `comma` true (#359)
- [Fix] `parse`: throw a TypeError instead of an Error for bad charset (#349)
- [Fix] `parse`: with comma true, handle field that holds an array of arrays (#335)
- [fix] `parse`: with comma true, do not split non-string values (#334)
- [meta] add tidelift marketing copy
- [meta] add `funding` field
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape`, `safe-publish-latest`, `evalmd`, `has-symbols`, `iconv-lite`, `mkdirp`, `object-inspect`
- [Tests] `parse`: add passing `arrayFormat` tests
- [Tests] use shared travis-ci configs
- [Tests] `Buffer.from` in node v5.0-v5.9 and v4.0-v4.4 requires a TypedArray
- [actions] add automatic rebasing / merge commit blocking

## **6.8.0**
- [New] add `depth=false` to preserve the original key; [Fix] `depth=0` should preserve the original key (#326)
- [New] [Fix] stringify symbols and bigints
- [Fix] ensure node 0.12 can stringify Symbols
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Refactor] `formats`: tiny bit of cleanup.
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `browserify`, `safe-publish-latest`, `iconv-lite`, `tape`
- [Tests] add tests for `depth=0` and `depth=false` behavior, both current and intuitive/intended (#326)
- [Tests] use `eclint` instead of `editorconfig-tools`
- [docs] readme: add security note
- [meta] add github sponsorship
- [meta] add FUNDING.yml
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause

## **6.7.3**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] `stringify`: avoid encoding arrayformat comma when `encodeValuesOnly = true` (#424)
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] add note and links for coercing primitive values (#408)
- [meta] fix README.md (#399)
- [meta] do not publish workflow files
- [actions] backport actions from main
- [Dev Deps] backport updates from main
- [Tests] use `nyc` for coverage
- [Tests] clean up stringify tests slightly

## **6.7.2**
- [Fix] proper comma parsing of URL-encoded commas (#361)
- [Fix] parses comma delimited array while having percent-encoded comma treated as normal text (#336)

## **6.7.1**
- [Fix] `parse`: Fix parsing array from object with `comma` true (#359)
- [Fix] `parse`: with comma true, handle field that holds an array of arrays (#335)
- [fix] `parse`: with comma true, do not split non-string values (#334)
- [Fix] `parse`: throw a TypeError instead of an Error for bad charset (#349)
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Refactor] `formats`: tiny bit of cleanup.
- readme: add security note
- [meta] add tidelift marketing copy
- [meta] add `funding` field
- [meta] add FUNDING.yml
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape`, `safe-publish-latest`, `evalmd`, `iconv-lite`, `mkdirp`, `object-inspect`, `browserify`
- [Tests] `parse`: add passing `arrayFormat` tests
- [Tests] use shared travis-ci configs
- [Tests] `Buffer.from` in node v5.0-v5.9 and v4.0-v4.4 requires a TypedArray
- [Tests] add tests for `depth=0` and `depth=false` behavior, both current and intuitive/intended
- [Tests] use `eclint` instead of `editorconfig-tools`
- [actions] add automatic rebasing / merge commit blocking

## **6.7.0**
- [New] `stringify`/`parse`: add `comma` as an `arrayFormat` option (#276, #219)
- [Fix] correctly parse nested arrays (#212)
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source, also with an array source
- [Robustness] `stringify`: cache `Object.prototype.hasOwnProperty`
- [Refactor] `utils`: `isBuffer`: small tweak; add tests
- [Refactor] use cached `Array.isArray`
- [Refactor] `parse`/`stringify`: make a function to normalize the options
- [Refactor] `utils`: reduce observable [[Get]]s
- [Refactor] `stringify`/`utils`: cache `Array.isArray`
- [Tests] always use `String(x)` over `x.toString()`
- [Tests] fix Buffer tests to work in node < 4.5 and node < 5.10
- [Tests] temporarily allow coverage to fail

## **6.6.1**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Fix] `utils.merge`: avoid a crash with a null target and an array source
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source
- [Fix] correctly parse nested arrays
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [Robustness] `stringify`: cache `Object.prototype.hasOwnProperty`
- [Refactor] `formats`: tiny bit of cleanup.
- [Refactor] `utils`: `isBuffer`: small tweak; add tests
- [Refactor]: `stringify`/`utils`: cache `Array.isArray`
- [Refactor] `utils`: reduce observable [[Get]]s
- [Refactor] use cached `Array.isArray`
- [Refactor] `parse`/`stringify`: make a function to normalize the options
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] Clarify the need for "arrayLimit" option
- [meta] fix README.md (#399)
- [meta] do not publish workflow files
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause
- [meta] add FUNDING.yml
- [meta] Fixes typo in CHANGELOG.md
- [actions] backport actions from main
- [Tests] fix Buffer tests to work in node < 4.5 and node < 5.10
- [Tests] always use `String(x)` over `x.toString()`
- [Dev Deps] backport from main

## **6.6.0**
- [New] Add support for iso-8859-1, utf8 "sentinel" and numeric entities (#268)
- [New] move two-value combine to a `utils` function (#189)
- [Fix] `stringify`: fix a crash with `strictNullHandling` and a custom `filter`/`serializeDate` (#279)
- [Fix] when `parseArrays` is false, properly handle keys ending in `[]` (#260)
- [Fix] `stringify`: do not crash in an obscure combo of `interpretNumericEntities`, a bad custom `decoder`, & `iso-8859-1`
- [Fix] `utils`: `merge`: fix crash when `source` is a truthy primitive & no options are provided
- [refactor] `stringify`: Avoid arr = arr.concat(...), push to the existing instance (#269)
- [Refactor] `parse`: only need to reassign the var once
- [Refactor] `parse`/`stringify`: clean up `charset` options checking; fix defaults
- [Refactor] add missing defaults
- [Refactor] `parse`: one less `concat` call
- [Refactor] `utils`: `compactQueue`: make it explicitly side-effecting
- [Dev Deps] update `browserify`, `eslint`, `@ljharb/eslint-config`, `iconv-lite`, `safe-publish-latest`, `tape`
- [Tests] up to `node` `v10.10`, `v9.11`, `v8.12`, `v6.14`, `v4.9`; pin included builds to LTS

## **6.5.3**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source
- [Fix] correctly parse nested arrays
- [Fix] `stringify`: fix a crash with `strictNullHandling` and a custom `filter`/`serializeDate` (#279)
- [Fix] `utils`: `merge`: fix crash when `source` is a truthy primitive & no options are provided
- [Fix] when `parseArrays` is false, properly handle keys ending in `[]`
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Fix] `utils.merge`: avoid a crash with a null target and an array source
- [Refactor] `utils`: reduce observable [[Get]]s
- [Refactor] use cached `Array.isArray`
- [Refactor] `stringify`: Avoid arr = arr.concat(...), push to the existing instance (#269)
- [Refactor] `parse`: only need to reassign the var once
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] Clean up license text so it’s properly detected as BSD-3-Clause
- [Docs] Clarify the need for "arrayLimit" option
- [meta] fix README.md (#399)
- [meta] add FUNDING.yml
- [actions] backport actions from main
- [Tests] always use `String(x)` over `x.toString()`
- [Tests] remove nonexistent tape option
- [Dev Deps] backport from main

## **6.5.2**
- [Fix] use `safer-buffer` instead of `Buffer` constructor
- [Refactor] utils: `module.exports` one thing, instead of mutating `exports` (#230)
- [Dev Deps] update `browserify`, `eslint`, `iconv-lite`, `safer-buffer`, `tape`, `browserify`

## **6.5.1**
- [Fix] Fix parsing & compacting very deep objects (#224)
- [Refactor] name utils functions
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape`
- [Tests] up to `node` `v8.4`; use `nvm install-latest-npm` so newer npm doesn’t break older node
- [Tests] Use precise dist for Node.js 0.6 runtime (#225)
- [Tests] make 0.6 required, now that it’s passing
- [Tests] on `node` `v8.2`; fix npm on node 0.6

## **6.5.0**
- [New] add `utils.assign`
- [New] pass default encoder/decoder to custom encoder/decoder functions (#206)
- [New] `parse`/`stringify`: add `ignoreQueryPrefix`/`addQueryPrefix` options, respectively (#213)
- [Fix] Handle stringifying empty objects with addQueryPrefix (#217)
- [Fix] do not mutate `options` argument (#207)
- [Refactor] `parse`: cache index to reuse in else statement (#182)
- [Docs] add various badges to readme (#208)
- [Dev Deps] update `eslint`, `browserify`, `iconv-lite`, `tape`
- [Tests] up to `node` `v8.1`, `v7.10`, `v6.11`; npm v4.6 breaks on node < v1; npm v5+ breaks on node < v4
- [Tests] add `editorconfig-tools`

## **6.4.1**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Fix] use `safer-buffer` instead of `Buffer` constructor
- [Fix] `utils.merge`: avoid a crash with a null target and an array source
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source
- [Fix] `stringify`: fix a crash with `strictNullHandling` and a custom `filter`/`serializeDate` (#279)
- [Fix] `utils`: `merge`: fix crash when `source` is a truthy primitive & no options are provided
- [Fix] when `parseArrays` is false, properly handle keys ending in `[]`
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [Refactor] use cached `Array.isArray`
- [Refactor] `stringify`: Avoid arr = arr.concat(...), push to the existing instance (#269)
- [readme] remove travis badge; add github actions/codecov badges; update URLs
- [Docs] Clarify the need for "arrayLimit" option
- [meta] fix README.md (#399)
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause
- [meta] add FUNDING.yml
- [actions] backport actions from main
- [Tests] remove nonexistent tape option
- [Dev Deps] backport from main

## **6.4.0**
- [New] `qs.stringify`: add `encodeValuesOnly` option
- [Fix] follow `allowPrototypes` option during merge (#201, #201)
- [Fix] support keys starting with brackets (#202, #200)
- [Fix] chmod a-x
- [Dev Deps] update `eslint`
- [Tests] up to `node` `v7.7`, `v6.10`,` v4.8`; disable osx builds since they block linux builds
- [eslint] reduce warnings

## **6.3.3**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] fix for an impossible situation: when the formatter is called with a non-string value
- [Fix] `utils.merge`: avoid a crash with a null target and an array source
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source
- [Fix] `stringify`: fix a crash with `strictNullHandling` and a custom `filter`/`serializeDate` (#279)
- [Fix] `utils`: `merge`: fix crash when `source` is a truthy primitive & no options are provided
- [Fix] when `parseArrays` is false, properly handle keys ending in `[]`
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [Refactor] use cached `Array.isArray`
- [Refactor] `stringify`: Avoid arr = arr.concat(...), push to the existing instance (#269)
- [Docs] Clarify the need for "arrayLimit" option
- [meta] fix README.md (#399)
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause
- [meta] add FUNDING.yml
- [actions] backport actions from main
- [Tests] use `safer-buffer` instead of `Buffer` constructor
- [Tests] remove nonexistent tape option
- [Dev Deps] backport from main

## **6.3.2**
- [Fix] follow `allowPrototypes` option during merge (#201, #200)
- [Dev Deps] update `eslint`
- [Fix] chmod a-x
- [Fix] support keys starting with brackets (#202, #200)
- [Tests] up to `node` `v7.7`, `v6.10`,` v4.8`; disable osx builds since they block linux builds

## **6.3.1**
- [Fix] ensure that `allowPrototypes: false` does not ever shadow Object.prototype properties (thanks, @snyk!)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `browserify`, `iconv-lite`, `qs-iconv`, `tape`
- [Tests] on all node minors; improve test matrix
- [Docs] document stringify option `allowDots` (#195)
- [Docs] add empty object and array values example (#195)
- [Docs] Fix minor inconsistency/typo (#192)
- [Docs] document stringify option `sort` (#191)
- [Refactor] `stringify`: throw faster with an invalid encoder
- [Refactor] remove unnecessary escapes (#184)
- Remove contributing.md, since `qs` is no longer part of `hapi` (#183)

## **6.3.0**
- [New] Add support for RFC 1738 (#174, #173)
- [New] `stringify`: Add `serializeDate` option to customize Date serialization (#159)
- [Fix] ensure `utils.merge` handles merging two arrays
- [Refactor] only constructors should be capitalized
- [Refactor] capitalized var names are for constructors only
- [Refactor] avoid using a sparse array
- [Robustness] `formats`: cache `String#replace`
- [Dev Deps] update `browserify`, `eslint`, `@ljharb/eslint-config`; add `safe-publish-latest`
- [Tests] up to `node` `v6.8`, `v4.6`; improve test matrix
- [Tests] flesh out arrayLimit/arrayFormat tests (#107)
- [Tests] skip Object.create tests when null objects are not available
- [Tests] Turn on eslint for test files (#175)

## **6.2.4**
- [Fix] `parse`: ignore `__proto__` keys (#428)
- [Fix] `utils.merge`: avoid a crash with a null target and an array source
- [Fix] `utils.merge`: avoid a crash with a null target and a truthy non-array source
- [Fix] `utils`: `merge`: fix crash when `source` is a truthy primitive & no options are provided
- [Fix] when `parseArrays` is false, properly handle keys ending in `[]`
- [Robustness] `stringify`: avoid relying on a global `undefined` (#427)
- [Refactor] use cached `Array.isArray`
- [Docs] Clarify the need for "arrayLimit" option
- [meta] fix README.md (#399)
- [meta] Clean up license text so it’s properly detected as BSD-3-Clause
- [meta] add FUNDING.yml
- [actions] backport actions from main
- [Tests] use `safer-buffer` instead of `Buffer` constructor
- [Tests] remove nonexistent tape option
- [Dev Deps] backport from main

## **6.2.3**
- [Fix] follow `allowPrototypes` option during merge (#201, #200)
- [Fix] chmod a-x
- [Fix] support keys starting with brackets (#202, #200)
- [Tests] up to `node` `v7.7`, `v6.10`,` v4.8`; disable osx builds since they block linux builds

## **6.2.2**
- [Fix] ensure that `allowPrototypes: false` does not ever shadow Object.prototype properties

## **6.2.1**
- [Fix] ensure `key[]=x&key[]&key[]=y` results in 3, not 2, values
- [Refactor] Be explicit and use `Object.prototype.hasOwnProperty.call`
- [Tests] remove `parallelshell` since it does not reliably report failures
- [Tests] up to `node` `v6.3`, `v5.12`
- [Dev Deps] update `tape`, `eslint`, `@ljharb/eslint-config`, `qs-iconv`

## [**6.2.0**](https://github.com/ljharb/qs/issues?milestone=36&state=closed)
- [New] pass Buffers to the encoder/decoder directly (#161)
- [New] add "encoder" and "decoder" options, for custom param encoding/decoding (#160)
- [Fix] fix compacting of nested sparse arrays (#150)

## **6.1.2**
- [Fix] follow `allowPrototypes` option during merge (#201, #200)
- [Fix] chmod a-x
- [Fix] support keys starting with brackets (#202, #200)
- [Tests] up to `node` `v7.7`, `v6.10`,` v4.8`; disable osx builds since they block linux builds

## **6.1.1**
- [Fix] ensure that `allowPrototypes: false` does not ever shadow Object.prototype properties

## [**6.1.0**](https://github.com/ljharb/qs/issues?milestone=35&state=closed)
- [New] allowDots option for `stringify` (#151)
- [Fix] "sort" option should work at a depth of 3 or more (#151)
- [Fix] Restore `dist` directory; will be removed in v7 (#148)

## **6.0.4**
- [Fix] follow `allowPrototypes` option during merge (#201, #200)
- [Fix] chmod a-x
- [Fix] support keys starting with brackets (#202, #200)
- [Tests] up to `node` `v7.7`, `v6.10`,` v4.8`; disable osx builds since they block linux builds

## **6.0.3**
- [Fix] ensure that `allowPrototypes: false` does not ever shadow Object.prototype properties
- [Fix] Restore `dist` directory; will be removed in v7 (#148)

## [**6.0.2**](https://github.com/ljharb/qs/issues?milestone=33&state=closed)
- Revert ES6 requirement and restore support for node down to v0.8.

## [**6.0.1**](https://github.com/ljharb/qs/issues?milestone=32&state=closed)
- [**#127**](https://github.com/ljharb/qs/pull/127) Fix engines definition in package.json

## [**6.0.0**](https://github.com/ljharb/qs/issues?milestone=31&state=closed)
- [**#124**](https://github.com/ljharb/qs/issues/124) Use ES6 and drop support for node < v4

## **5.2.1**
- [Fix] ensure `key[]=x&key[]&key[]=y` results in 3, not 2, values

## [**5.2.0**](https://github.com/ljharb/qs/issues?milestone=30&state=closed)
- [**#64**](https://github.com/ljharb/qs/issues/64) Add option to sort object keys in the query string

## [**5.1.0**](https://github.com/ljharb/qs/issues?milestone=29&state=closed)
- [**#117**](https://github.com/ljharb/qs/issues/117) make URI encoding stringified results optional
- [**#106**](https://github.com/ljharb/qs/issues/106) Add flag `skipNulls` to optionally skip null values in stringify

## [**5.0.0**](https://github.com/ljharb/qs/issues?milestone=28&state=closed)
- [**#114**](https://github.com/ljharb/qs/issues/114) default allowDots to false
- [**#100**](https://github.com/ljharb/qs/issues/100) include dist to npm

## [**4.0.0**](https://github.com/ljharb/qs/issues?milestone=26&state=closed)
- [**#98**](https://github.com/ljharb/qs/issues/98) make returning plain objects and allowing prototype overwriting properties optional

## [**3.1.0**](https://github.com/ljharb/qs/issues?milestone=24&state=closed)
- [**#89**](https://github.com/ljharb/qs/issues/89) Add option to disable "Transform dot notation to bracket notation"

## [**3.0.0**](https://github.com/ljharb/qs/issues?milestone=23&state=closed)
- [**#80**](https://github.com/ljharb/qs/issues/80) qs.parse silently drops properties
- [**#77**](https://github.com/ljharb/qs/issues/77) Perf boost
- [**#60**](https://github.com/ljharb/qs/issues/60) Add explicit option to disable array parsing
- [**#74**](https://github.com/ljharb/qs/issues/74) Bad parse when turning array into object
- [**#81**](https://github.com/ljharb/qs/issues/81) Add a `filter` option
- [**#68**](https://github.com/ljharb/qs/issues/68) Fixed issue with recursion and passing strings into objects.
- [**#66**](https://github.com/ljharb/qs/issues/66) Add mixed array and object dot notation support Closes: #47
- [**#76**](https://github.com/ljharb/qs/issues/76) RFC 3986
- [**#85**](https://github.com/ljharb/qs/issues/85) No equal sign
- [**#84**](https://github.com/ljharb/qs/issues/84) update license attribute

## [**2.4.1**](https://github.com/ljharb/qs/issues?milestone=20&state=closed)
- [**#73**](https://github.com/ljharb/qs/issues/73) Property 'hasOwnProperty' of object #<Object> is not a function

## [**2.4.0**](https://github.com/ljharb/qs/issues?milestone=19&state=closed)
- [**#70**](https://github.com/ljharb/qs/issues/70) Add arrayFormat option

## [**2.3.3**](https://github.com/ljharb/qs/issues?milestone=18&state=closed)
- [**#59**](https://github.com/ljharb/qs/issues/59) make sure array indexes are >= 0, closes #57
- [**#58**](https://github.com/ljharb/qs/issues/58) make qs usable for browser loader

## [**2.3.2**](https://github.com/ljharb/qs/issues?milestone=17&state=closed)
- [**#55**](https://github.com/ljharb/qs/issues/55) allow merging a string into an object

## [**2.3.1**](https://github.com/ljharb/qs/issues?milestone=16&state=closed)
- [**#52**](https://github.com/ljharb/qs/issues/52) Return "undefined" and "false" instead of throwing "TypeError".

## [**2.3.0**](https://github.com/ljharb/qs/issues?milestone=15&state=closed)
- [**#50**](https://github.com/ljharb/qs/issues/50) add option to omit array indices, closes #46

## [**2.2.5**](https://github.com/ljharb/qs/issues?milestone=14&state=closed)
- [**#39**](https://github.com/ljharb/qs/issues/39) Is there an alternative to Buffer.isBuffer?
- [**#49**](https://github.com/ljharb/qs/issues/49) refactor utils.merge, fixes #45
- [**#41**](https://github.com/ljharb/qs/issues/41) avoid browserifying Buffer, for #39

## [**2.2.4**](https://github.com/ljharb/qs/issues?milestone=13&state=closed)
- [**#38**](https://github.com/ljharb/qs/issues/38) how to handle object keys beginning with a number

## [**2.2.3**](https://github.com/ljharb/qs/issues?milestone=12&state=closed)
- [**#37**](https://github.com/ljharb/qs/issues/37) parser discards first empty value in array
- [**#36**](https://github.com/ljharb/qs/issues/36) Update to lab 4.x

## [**2.2.2**](https://github.com/ljharb/qs/issues?milestone=11&state=closed)
- [**#33**](https://github.com/ljharb/qs/issues/33) Error when plain object in a value
- [**#34**](https://github.com/ljharb/qs/issues/34) use Object.prototype.hasOwnProperty.call instead of obj.hasOwnProperty
- [**#24**](https://github.com/ljharb/qs/issues/24) Changelog? Semver?

## [**2.2.1**](https://github.com/ljharb/qs/issues?milestone=10&state=closed)
- [**#32**](https://github.com/ljharb/qs/issues/32) account for circular references properly, closes #31
- [**#31**](https://github.com/ljharb/qs/issues/31) qs.parse stackoverflow on circular objects

## [**2.2.0**](https://github.com/ljharb/qs/issues?milestone=9&state=closed)
- [**#26**](https://github.com/ljharb/qs/issues/26) Don't use Buffer global if it's not present
- [**#30**](https://github.com/ljharb/qs/issues/30) Bug when merging non-object values into arrays
- [**#29**](https://github.com/ljharb/qs/issues/29) Don't call Utils.clone at the top of Utils.merge
- [**#23**](https://github.com/ljharb/qs/issues/23) Ability to not limit parameters?

## [**2.1.0**](https://github.com/ljharb/qs/issues?milestone=8&state=closed)
- [**#22**](https://github.com/ljharb/qs/issues/22) Enable using a RegExp as delimiter

## [**2.0.0**](https://github.com/ljharb/qs/issues?milestone=7&state=closed)
- [**#18**](https://github.com/ljharb/qs/issues/18) Why is there arrayLimit?
- [**#20**](https://github.com/ljharb/qs/issues/20) Configurable parametersLimit
- [**#21**](https://github.com/ljharb/qs/issues/21) make all limits optional, for #18, for #20

## [**1.2.2**](https://github.com/ljharb/qs/issues?milestone=6&state=closed)
- [**#19**](https://github.com/ljharb/qs/issues/19) Don't overwrite null values

## [**1.2.1**](https://github.com/ljharb/qs/issues?milestone=5&state=closed)
- [**#16**](https://github.com/ljharb/qs/issues/16) ignore non-string delimiters
- [**#15**](https://github.com/ljharb/qs/issues/15) Close code block

## [**1.2.0**](https://github.com/ljharb/qs/issues?milestone=4&state=closed)
- [**#12**](https://github.com/ljharb/qs/issues/12) Add optional delim argument
- [**#13**](https://github.com/ljharb/qs/issues/13) fix #11: flattened keys in array are now correctly parsed

## [**1.1.0**](https://github.com/ljharb/qs/issues?milestone=3&state=closed)
- [**#7**](https://github.com/ljharb/qs/issues/7) Empty values of a POST array disappear after being submitted
- [**#9**](https://github.com/ljharb/qs/issues/9) Should not omit equals signs (=) when value is null
- [**#6**](https://github.com/ljharb/qs/issues/6) Minor grammar fix in README

## [**1.0.2**](https://github.com/ljharb/qs/issues?milestone=2&state=closed)
- [**#5**](https://github.com/ljharb/qs/issues/5) array holes incorrectly copied into object on large index


---

<!-- source: archive/library/javascript/references/packages/side-channel-list/CHANGELOG--000251.md -->

## Imported source: archive/library/javascript/references/packages/side-channel-list/CHANGELOG--000251.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v1.0.0 - 2024-12-10

### Commits

- Initial implementation, tests, readme, types [`5d6baee`](https://github.com/ljharb/side-channel-list/commit/5d6baee5c9054a1238007f5a1dfc109a7a816251)
- Initial commit [`3ae784c`](https://github.com/ljharb/side-channel-list/commit/3ae784c63a47895fbaeed2a91ab54a8029a7a100)
- npm init [`07055a4`](https://github.com/ljharb/side-channel-list/commit/07055a4d139895565b199dba5fe2479c1a1b9e28)
- Only apps should have lockfiles [`9573058`](https://github.com/ljharb/side-channel-list/commit/9573058a47494e2d68f8c6c77b5d7fbe441949c1)


---

<!-- source: archive/library/javascript/references/packages/side-channel-map/CHANGELOG--000269.md -->

## Imported source: archive/library/javascript/references/packages/side-channel-map/CHANGELOG--000269.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.1](https://github.com/ljharb/side-channel-map/compare/v1.0.0...v1.0.1) - 2024-12-10

### Commits

- [Deps] update `call-bound` [`6d05aaa`](https://github.com/ljharb/side-channel-map/commit/6d05aaa4ce5f2be4e7825df433d650696f0ba40f)
- [types] fix generics ordering [`11c0184`](https://github.com/ljharb/side-channel-map/commit/11c0184132ac11fdc16857e12682e148e5e9ee74)

## v1.0.0 - 2024-12-10

### Commits

- Initial implementation, tests, readme, types [`ad877b4`](https://github.com/ljharb/side-channel-map/commit/ad877b42926d46d63fff76a2bd01d2b4a01959a9)
- Initial commit [`28f8879`](https://github.com/ljharb/side-channel-map/commit/28f8879c512abe8fcf9b6a4dc7754a0287e5eba4)
- npm init [`2c9604e`](https://github.com/ljharb/side-channel-map/commit/2c9604e5aa40223e425ea7cea78f8a07697504bd)
- Only apps should have lockfiles [`5e7ba9c`](https://github.com/ljharb/side-channel-map/commit/5e7ba9cffe3ef42095815adc8ac1255b49bbadf5)


---

<!-- source: archive/library/javascript/references/packages/side-channel-weakmap/CHANGELOG--000392.md -->

## Imported source: archive/library/javascript/references/packages/side-channel-weakmap/CHANGELOG--000392.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.2](https://github.com/ljharb/side-channel-weakmap/compare/v1.0.1...v1.0.2) - 2024-12-10

### Commits

- [types] fix generics ordering [`1b62e94`](https://github.com/ljharb/side-channel-weakmap/commit/1b62e94a2ad6ed30b640ba73c4a2535836c67289)

## [v1.0.1](https://github.com/ljharb/side-channel-weakmap/compare/v1.0.0...v1.0.1) - 2024-12-10

### Commits

- [types] fix generics ordering [`08a4a5d`](https://github.com/ljharb/side-channel-weakmap/commit/08a4a5dbffedc3ebc79f1aaaf5a3dd6d2196dc1b)
- [Deps] update `side-channel-map` [`b53fe44`](https://github.com/ljharb/side-channel-weakmap/commit/b53fe447dfdd3a9aebedfd015b384eac17fce916)

## v1.0.0 - 2024-12-10

### Commits

- Initial implementation, tests, readme, types [`53c0fa4`](https://github.com/ljharb/side-channel-weakmap/commit/53c0fa4788435a006f58b9d7b43cb65989ecee49)
- Initial commit [`a157947`](https://github.com/ljharb/side-channel-weakmap/commit/a157947f26fcaf2c4a941d3a044e76bf67343532)
- npm init [`54dfc55`](https://github.com/ljharb/side-channel-weakmap/commit/54dfc55bafb16265910d5aad4e743c43aee5bbbb)
- Only apps should have lockfiles [`0ddd6c7`](https://github.com/ljharb/side-channel-weakmap/commit/0ddd6c7b07fe8ee04d67b2e9f7255af7ce62c07d)


---

<!-- source: archive/library/javascript/references/packages/side-channel/CHANGELOG--000305.md -->

## Imported source: archive/library/javascript/references/packages/side-channel/CHANGELOG--000305.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.1.0](https://github.com/ljharb/side-channel/compare/v1.0.6...v1.1.0) - 2024-12-11

### Commits

- [Refactor] extract implementations to `side-channel-weakmap`, `side-channel-map`, `side-channel-list` [`ada5955`](https://github.com/ljharb/side-channel/commit/ada595549a5c4c6c853756d598846b180941c6da)
- [New] add `channel.delete` [`c01d2d3`](https://github.com/ljharb/side-channel/commit/c01d2d3fd51dbb1ce6da72ad7916e61bd6172aad)
- [types] improve types [`0c54356`](https://github.com/ljharb/side-channel/commit/0c5435651417df41b8cc1a5f7cdce8bffae68cde)
- [readme] add content [`be24868`](https://github.com/ljharb/side-channel/commit/be248682ac294b0e22c883092c45985aa91c490a)
- [actions] split out node 10-20, and 20+ [`c4488e2`](https://github.com/ljharb/side-channel/commit/c4488e241ef3d49a19fe266ac830a2e644305911)
- [types] use shared tsconfig [`0e0d57c`](https://github.com/ljharb/side-channel/commit/0e0d57c2ff17c7b45c6cbd43ebcf553edc9e3adc)
- [Dev Deps] update `@ljharb/eslint-config`, `@ljharb/tsconfig`, `@types/get-intrinsic`, `@types/object-inspect`, `@types/tape`, `auto-changelog`, `tape` [`fb4f622`](https://github.com/ljharb/side-channel/commit/fb4f622e64a99a1e40b6e5cd7691674a9dc429e4)
- [Deps] update `call-bind`, `get-intrinsic`, `object-inspect` [`b78336b`](https://github.com/ljharb/side-channel/commit/b78336b886172d1b457d414ac9e28de8c5fecc78)
- [Tests] replace `aud` with `npm audit` [`ee3ab46`](https://github.com/ljharb/side-channel/commit/ee3ab4690d954311c35115651bcfd45edd205aa1)
- [Dev Deps] add missing peer dep [`c03e21a`](https://github.com/ljharb/side-channel/commit/c03e21a7def3b67cdc15ae22316884fefcb2f6a8)

## [v1.0.6](https://github.com/ljharb/side-channel/compare/v1.0.5...v1.0.6) - 2024-02-29

### Commits

- add types [`9beef66`](https://github.com/ljharb/side-channel/commit/9beef6643e6d717ea57bedabf86448123a7dd9e9)
- [meta] simplify `exports` [`4334cf9`](https://github.com/ljharb/side-channel/commit/4334cf9df654151504c383b62a2f9ebdc8d9d5ac)
- [Deps] update `call-bind` [`d6043c4`](https://github.com/ljharb/side-channel/commit/d6043c4d8f4d7be9037dd0f0419c7a2e0e39ec6a)
- [Dev Deps] update `tape` [`6aca376`](https://github.com/ljharb/side-channel/commit/6aca3761868dc8cd5ff7fd9799bf6b95e09a6eb0)

## [v1.0.5](https://github.com/ljharb/side-channel/compare/v1.0.4...v1.0.5) - 2024-02-06

### Commits

- [actions] reuse common workflows [`3d2e1ff`](https://github.com/ljharb/side-channel/commit/3d2e1ffd16dd6eaaf3e40ff57951f840d2d63c04)
- [meta] use `npmignore` to autogenerate an npmignore file [`04296ea`](https://github.com/ljharb/side-channel/commit/04296ea17d1544b0a5d20fd5bfb31aa4f6513eb9)
- [meta] add `.editorconfig`; add `eclint` [`130f0a6`](https://github.com/ljharb/side-channel/commit/130f0a6adbc04d385c7456a601d38344dce3d6a9)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `safe-publish-latest`, `tape` [`d480c2f`](https://github.com/ljharb/side-channel/commit/d480c2fbe757489ae9b4275491ffbcc3ac4725e9)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `tape` [`ecbe70e`](https://github.com/ljharb/side-channel/commit/ecbe70e53a418234081a77971fec1fdfae20c841)
- [actions] update rebase action [`75240b9`](https://github.com/ljharb/side-channel/commit/75240b9963b816e8846400d2287cb68f88c7fba7)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `npmignore`, `tape` [`ae8d281`](https://github.com/ljharb/side-channel/commit/ae8d281572430099109870fd9430d2ca3f320b8d)
- [Dev Deps] update `@ljharb/eslint-config`, `aud`, `tape` [`7125b88`](https://github.com/ljharb/side-channel/commit/7125b885fd0eacad4fee9b073b72d14065ece278)
- [Deps] update `call-bind`, `get-intrinsic`, `object-inspect` [`82577c9`](https://github.com/ljharb/side-channel/commit/82577c9796304519139a570f82a317211b5f3b86)
- [Deps] update `call-bind`, `get-intrinsic`, `object-inspect` [`550aadf`](https://github.com/ljharb/side-channel/commit/550aadf20475a6081fd70304cc54f77259a5c8a8)
- [Tests] increase coverage [`5130877`](https://github.com/ljharb/side-channel/commit/5130877a7b27c862e64e6d1c12a178b28808859d)
- [Deps] update `get-intrinsic`, `object-inspect` [`ba0194c`](https://github.com/ljharb/side-channel/commit/ba0194c505b1a8a0427be14cadd5b8a46d4d01b8)
- [meta] add missing `engines.node` [`985fd24`](https://github.com/ljharb/side-channel/commit/985fd249663cb06617a693a94fe08cad12f5cb70)
- [Refactor] use `es-errors`, so things that only need those do not need `get-intrinsic` [`40227a8`](https://github.com/ljharb/side-channel/commit/40227a87b01709ad2c0eebf87eb4223a800099b9)
- [Deps] update `get-intrinsic` [`a989b40`](https://github.com/ljharb/side-channel/commit/a989b4024958737ae7be9fbffdeff2078f33a0fd)
- [Deps] update `object-inspect` [`aec42d2`](https://github.com/ljharb/side-channel/commit/aec42d2ec541a31aaa02475692c87d489237d9a3)

## [v1.0.4](https://github.com/ljharb/side-channel/compare/v1.0.3...v1.0.4) - 2020-12-29

### Commits

- [Tests] migrate tests to Github Actions [`10909cb`](https://github.com/ljharb/side-channel/commit/10909cbf8ce9c0bf96f604cf13d7ffd5a22c2d40)
- [Refactor] Use a linked list rather than an array, and move accessed nodes to the beginning [`195613f`](https://github.com/ljharb/side-channel/commit/195613f28b5c1e6072ef0b61b5beebaf2b6a304e)
- [meta] do not publish github action workflow files [`290ec29`](https://github.com/ljharb/side-channel/commit/290ec29cd21a60585145b4a7237ec55228c52c27)
- [Tests] run `nyc` on all tests; use `tape` runner [`ea6d030`](https://github.com/ljharb/side-channel/commit/ea6d030ff3fe6be2eca39e859d644c51ecd88869)
- [actions] add "Allow Edits" workflow [`d464d8f`](https://github.com/ljharb/side-channel/commit/d464d8fe52b5eddf1504a0ed97f0941a90f32c15)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog` [`02daca8`](https://github.com/ljharb/side-channel/commit/02daca87c6809821c97be468d1afa2f5ef447383)
- [Refactor] use `call-bind` and `get-intrinsic` instead of `es-abstract` [`e09d481`](https://github.com/ljharb/side-channel/commit/e09d481528452ebafa5cdeae1af665c35aa2deee)
- [Deps] update `object.assign` [`ee83aa8`](https://github.com/ljharb/side-channel/commit/ee83aa81df313b5e46319a63adb05cf0c179079a)
- [actions] update rebase action to use checkout v2 [`7726b0b`](https://github.com/ljharb/side-channel/commit/7726b0b058b632fccea709f58960871defaaa9d7)

## [v1.0.3](https://github.com/ljharb/side-channel/compare/v1.0.2...v1.0.3) - 2020-08-23

### Commits

- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `aud`, `auto-changelog`, `tape` [`1f10561`](https://github.com/ljharb/side-channel/commit/1f105611ef3acf32dec8032ae5c0baa5e56bb868)
- [Deps] update `es-abstract`, `object-inspect` [`bc20159`](https://github.com/ljharb/side-channel/commit/bc201597949a505e37cef9eaf24c7010831e6f03)
- [Dev Deps] update `@ljharb/eslint-config`, `tape` [`b9b2b22`](https://github.com/ljharb/side-channel/commit/b9b2b225f9e0ea72a6ec2b89348f0bd690bc9ed1)
- [Dev Deps] update `eslint`, `@ljharb/eslint-config`, `tape` [`7055ab4`](https://github.com/ljharb/side-channel/commit/7055ab4de0860606efd2003674a74f1fe6ebc07e)
- [Dev Deps] update `auto-changelog`; add `aud` [`d278c37`](https://github.com/ljharb/side-channel/commit/d278c37d08227be4f84aa769fcd919e73feeba40)
- [actions] switch Automatic Rebase workflow to `pull_request_target` event [`3bcf982`](https://github.com/ljharb/side-channel/commit/3bcf982faa122745b39c33ce83d32fdf003741c6)
- [Tests] only audit prod deps [`18d01c4`](https://github.com/ljharb/side-channel/commit/18d01c4015b82a3d75044c4d5ba7917b2eac01ec)
- [Deps] update `es-abstract` [`6ab096d`](https://github.com/ljharb/side-channel/commit/6ab096d9de2b482cf5e0717e34e212f5b2b9bc9a)
- [Dev Deps] update `tape` [`9dc174c`](https://github.com/ljharb/side-channel/commit/9dc174cc651dfd300b4b72da936a0a7eda5f9452)
- [Deps] update `es-abstract` [`431d0f0`](https://github.com/ljharb/side-channel/commit/431d0f0ff11fbd2ae6f3115582a356d3a1cfce82)
- [Deps] update `es-abstract` [`49869fd`](https://github.com/ljharb/side-channel/commit/49869fd323bf4453f0ba515c0fb265cf5ab7b932)
- [meta] Add package.json to package's exports [`77d9cdc`](https://github.com/ljharb/side-channel/commit/77d9cdceb2a9e47700074f2ae0c0a202e7dac0d4)

## [v1.0.2](https://github.com/ljharb/side-channel/compare/v1.0.1...v1.0.2) - 2019-12-20

### Commits

- [Dev Deps] update `@ljharb/eslint-config`, `tape` [`4a526df`](https://github.com/ljharb/side-channel/commit/4a526df44e4701566ed001ec78546193f818b082)
- [Deps] update `es-abstract` [`d4f6e62`](https://github.com/ljharb/side-channel/commit/d4f6e629b6fb93a07415db7f30d3c90fd7f264fe)

## [v1.0.1](https://github.com/ljharb/side-channel/compare/v1.0.0...v1.0.1) - 2019-12-01

### Commits

- [Fix] add missing "exports" [`d212907`](https://github.com/ljharb/side-channel/commit/d2129073abf0701a5343bf28aa2145617604dc2e)

## v1.0.0 - 2019-12-01

### Commits

- Initial implementation [`dbebd3a`](https://github.com/ljharb/side-channel/commit/dbebd3a4b5ed64242f9a6810efe7c4214cd8cde4)
- Initial tests [`73bdefe`](https://github.com/ljharb/side-channel/commit/73bdefe568c9076cf8c0b8719bc2141aec0e19b8)
- Initial commit [`43c03e1`](https://github.com/ljharb/side-channel/commit/43c03e1c2849ec50a87b7a5cd76238a62b0b8770)
- npm init [`5c090a7`](https://github.com/ljharb/side-channel/commit/5c090a765d66a5527d9889b89aeff78dee91348c)
- [meta] add `auto-changelog` [`a5c4e56`](https://github.com/ljharb/side-channel/commit/a5c4e5675ec02d5eb4d84b4243aeea2a1d38fbec)
- [actions] add automatic rebasing / merge commit blocking [`bab1683`](https://github.com/ljharb/side-channel/commit/bab1683d8f9754b086e94397699fdc645e0d7077)
- [meta] add `funding` field; create FUNDING.yml [`63d7aea`](https://github.com/ljharb/side-channel/commit/63d7aeaf34f5650650ae97ca4b9fae685bd0937c)
- [Tests] add `npm run lint` [`46a5a81`](https://github.com/ljharb/side-channel/commit/46a5a81705cd2664f83df232c01dbbf2ee952885)
- Only apps should have lockfiles [`8b16b03`](https://github.com/ljharb/side-channel/commit/8b16b0305f00895d90c4e2e5773c854cfea0e448)
- [meta] add `safe-publish-latest` [`2f098ef`](https://github.com/ljharb/side-channel/commit/2f098ef092a39399cfe548b19a1fc03c2fd2f490)


---

<!-- source: archive/library/javascript/references/packages/v8-compile-cache/CHANGELOG--000303.md -->

## Imported source: archive/library/javascript/references/packages/v8-compile-cache/CHANGELOG--000303.md

# `v8-module-cache` Changelog

## 2021-03-05, Version 2.3.0

* Fix use require.main instead of module.parent [#34](https://github.com/zertosh/v8-compile-cache/pull/34).

## 2020-10-28, Version 2.2.0

* Added `V8_COMPILE_CACHE_CACHE_DIR` option [#23](https://github.com/zertosh/v8-compile-cache/pull/23).

## 2020-05-30, Version 2.1.1

* Stop using process.umask() [#28](https://github.com/zertosh/v8-compile-cache/pull/28).

## 2019-08-04, Version 2.1.0

* Fix Electron by calling the module wrapper with `Buffer` [#10](https://github.com/zertosh/v8-compile-cache/pull/10).

## 2019-05-10, Version 2.0.3

* Add `LICENSE` file [#19](https://github.com/zertosh/v8-compile-cache/pull/19).
* Add "repository" to `package.json` (see [eea336e](https://github.com/zertosh/v8-compile-cache/commit/eea336eaa8360f9ded9342b8aa928e56ac6a7529)).
* Support `require.resolve.paths` (added in Node v8.9.0) [#20](https://github.com/zertosh/v8-compile-cache/pull/20)/[#22](https://github.com/zertosh/v8-compile-cache/pull/22).

## 2018-08-06, Version 2.0.2

* Re-publish.

## 2018-08-06, Version 2.0.1

* Support `require.resolve` options (added in Node v8.9.0).

## 2018-04-30, Version 2.0.0

* Use `Buffer.alloc` instead of `new Buffer()`.
* Drop support for Node 5.x.

## 2018-01-23, Version 1.1.2

* Instead of checking for `process.versions.v8`, check that `script.cachedDataProduced` is `true` (rather than `null`/`undefined`) for support to be considered existent.

## 2018-01-23, Version 1.1.1

* Check for the existence of `process.versions.v8` before attaching hook (see [f8b0388](https://github.com/zertosh/v8-compile-cache/commit/f8b038848be94bc2c905880dd50447c73393f364)).

## 2017-03-27, Version 1.1.0

* Safer cache directory creation (see [bcb3b12](https://github.com/zertosh/v8-compile-cache/commit/bcb3b12c819ab0927ec4408e70f612a6d50a9617)).
  - The cache is now suffixed with the user's uid on POSIX systems (i.e. `/path/to/tmp/v8-compile-cache-1234`).

## 2017-02-21, Version 1.0.0

* Initial release.


---

<!-- source: archive/library/programming-languages/references/release-notes/agda/CHANGELOG--000180.md -->

## Imported source: archive/library/programming-languages/references/release-notes/agda/CHANGELOG--000180.md

Release notes for Agda version 2.9.0
====================================

Installation
------------

* Dropped support for GHC 8.8, 8.10, and 9.0.

* Agda supports GHC versions 9.2.8 to 9.12.2.

Pragmas and options
-------------------

* New option `--print-options` to print a simple list of all options.
  This list can e.g. be used to implement bash completion.

* New flag `--no-write-interfaces`

Warnings
--------

* `UselessPragma` warning instead of hard error `NeedOptionRewriting` when a
  `REWRITE` or `BUILTIN REWRITE` pragma is encountered but `--rewriting` is off.

* New warning `DivergentModalityInClause` when modality of a clause diverges
  from that of the function.  Example:
  ```agda
  A : Set₁
  @0 A = Set
  ```

* New warning `InvalidTacticAttribute` for misplaced `@(tactic ...)` attributes.
  This was silently accepted up to Agda 2.8.0 but raises now the new warning:
  ```agda
  postulate
    @(tactic not-in-scope) _ : Set
  ```

Syntax
------

Changes to the Agda syntax.

* Records can now be created using module-like syntax in place of curly braces
  and semicolons.

  ```agda
  p : Pair Nat Nat
  p = record where
    fst = 2
    snd = 3
  ```

  See [#4275](https://github.com/agda/agda/issues/4275) for the proposal.

* Modality annotations in aliases and let-bindings are now supported
  (PR [#7990]()).
  Example:
  ```agda
    split : {A B C : Set} (@0 p : A × B) (k : @0 A → @0 B → C) → C
    split p k = let @0 (x , y) = q in k x y
      where
      @0 q = p
  ```

* Postfix projections cannot be surrounded by parentheses anymore.
  E.g. these postfix projection applications are now illegal in expressions:
  ```agda
    r (.proj)
    r .(proj)
  ```

Language
--------

Changes to type checker and other components defining the Agda language.

Reflection
----------

Changes to the meta-programming facilities.

Library management
------------------


Interaction and emacs mode
--------------------------

* A normalization level can now also passed to command `Cmd_constraints`
  ("show constraints", `C-c C-=` in Emacs).
  In Emacs, the normalization level is given as usual by `C-u` prefixes.

  This interface change is **breaking** for frontends to `agda --interaction`
  such as the VSCode `agda-mode`, which need updating.

* Fixed an internal error in `Cmd_helper_function` (`C-c C-h` in Emacs)
  (Issue [#8103](https://github.com/agda/agda/issue/8103)).
  Changed the type of `Goal_HelperFunction` which might be **breaking**
  3rd-party interaction frontends.

* `NON_TERMINATING` functions now only reduce in `IgnoreAbstract` mode of
  commands `Cmd_compute(_toplevel)` (`C-u C-c C-n` in Emacs)
  regardless of whether invoked at toplevel or in a hole
  (Issue [#2410](https://github.com/agda/agda/issue/2410)).

Backends
--------

* New option `--ghc-trace` for GHC Backend to instrument code
  such that the Agda name of the function is printed to `stderr`
  whenever a function is entered.

Issues closed
-------------

For 2.9.0, the following issues were
[closed](https://github.com/agda/agda/issues?q=is%3Aissue+milestone%3A2.9.0+is%3Aclosed)
(see [bug tracker](https://github.com/agda/agda/issues)):

### Issues for closed for milestone 2.9.0

### PRs for closed for milestone 2.9.0


---

<!-- source: archive/library/racket-mud/references/changelogs/changelog--000469.org -->

## Imported source: archive/library/racket-mud/references/changelogs/changelog--000469.org

- [[http://gitlab.com/emsenn/racket-mud/commit/d957aa10ee6614da18378335157d162e7da973bf][view commit]] - new: docs: Add Flow & Changelog to Docs
- [[http://gitlab.com/emsenn/racket-mud/commit/e5d553ee4c751cefa7ee22f532f25868a0f0d711][view commit]] - new: docs: Add Engine Loop & Chat Events Diagrams
- [[http://gitlab.com/emsenn/racket-mud/commit/caeb20b09df6432e77f0dd624478895f12aaee88][view commit]] - new: docs: Add Engine Development Guide
- [[http://gitlab.com/emsenn/racket-mud/commit/c18d4ed5dbd9d24a0a132ec169191e4436a99f1c][view commit]] - fix: dev: Client Time-Out Doesn't Crash Server
- [[http://gitlab.com/emsenn/racket-mud/commit/a2e5fd06bc7b5ef48a0cc2a8674a1f29023ffd78][view commit]] - Handle TCP timeouts
- [[http://gitlab.com/emsenn/racket-mud/commit/ed0f935706aa9391188579611d65675191a0ef28][view commit]] - cleaning up
- [[http://gitlab.com/emsenn/racket-mud/commit/839cc4b4ee67b79eeda1794ff998489d7376e3f8][view commit]] - Merge branch 'lambdas-everywhere' into 'master'
- [[http://gitlab.com/emsenn/racket-mud/commit/a7ad5613d40b68b53662e3c080647c03563cf99d][view commit]] - Add talker logging
- [[http://gitlab.com/emsenn/racket-mud/commit/2bf66a43b6726cb63329c339045a38a09abb0dbc][view commit]] - Merge branch 'lambdas-everywhere' into 'master'
- [[http://gitlab.com/emsenn/racket-mud/commit/07d9e0fbd141ba1560edfb3cd43362fe3efff2eb][view commit]] - Remove redundant passing
- [[http://gitlab.com/emsenn/racket-mud/commit/eea28913b3414208d2a2842ba302c98457009eb3][view commit]] - Actually add license
- [[http://gitlab.com/emsenn/racket-mud/commit/014f118bcd7766178e7f49e7aee06390688c40ee][view commit]] - Add LICENSE
- [[http://gitlab.com/emsenn/racket-mud/commit/f45efd7dcb8da9db1473b1229577c5618d52f10d][view commit]] - Add more basic recipes & improve move command
- [[http://gitlab.com/emsenn/racket-mud/commit/caba6ea7772f029f56b04d6028cdf4c2e3052c9e][view commit]] - Add trivia command
- [[http://gitlab.com/emsenn/racket-mud/commit/e3d2c53c5dcca3f42b07bf1f070c01af885e665d][view commit]] - look at things
- [[http://gitlab.com/emsenn/racket-mud/commit/b9551d3aa3f7d4c059fdf4640916c011c8b252d2][view commit]] - Explode extant code
- [[http://gitlab.com/emsenn/racket-mud/commit/a62b20a2bd74d9612b39f9818c92775603b41f66][view commit]] - Add commands command
- [[http://gitlab.com/emsenn/racket-mud/commit/63afc6d8f8e71883b678bd71c8da362e6805a3e0][view commit]] - Adjust client's thing-name upon login
- [[http://gitlab.com/emsenn/racket-mud/commit/c4e2eabb98f4ee5c716ce6ad13a0949fe010752e][view commit]] - Basic talker service
- [[http://gitlab.com/emsenn/racket-mud/commit/961e60314749b5469fccd0f62bb7cde4edcdd1f3][view commit]] - Basic command argument parsing
- [[http://gitlab.com/emsenn/racket-mud/commit/6ffe2360f24ac521da8eaf602bf798ccf538be92][view commit]] - Implement basic user accounts/login
- [[http://gitlab.com/emsenn/racket-mud/commit/b221fd267abc2e08456a10730ee2d8c015b52db4][view commit]] - Flesh out Crossed Candles Inn
- [[http://gitlab.com/emsenn/racket-mud/commit/f7a2e2265f93d281aeb3902107fc4c4b6a368a6f][view commit]] - Add action ticker
- [[http://gitlab.com/emsenn/racket-mud/commit/58aa1271b3b50cdc1e459adf5ae2a5cd80f00da8][view commit]] - break the fever dream
- [[http://gitlab.com/emsenn/racket-mud/commit/518ac6b09898d9e2925ebcabf45ad8cfbb552ed0][view commit]] - Poking at more gameplay
- [[http://gitlab.com/emsenn/racket-mud/commit/b09e6193a515431949657b89e9f352f05893fa45][view commit]] - Add collect and inventory commands
- [[http://gitlab.com/emsenn/racket-mud/commit/4218478c89923ebf775a094c3468f85ed54ace48][view commit]] - Add Belcaer and other areas
- [[http://gitlab.com/emsenn/racket-mud/commit/b0f165a3aaa3aa3b3ae48ac84bc9431c585276cf][view commit]] - Segregate engine, RPG library, and Teraum code
- [[http://gitlab.com/emsenn/racket-mud/commit/a99e3bcd1e274adce318866c39ceb9063e9d21ea][view commit]] - Add actions quality
- [[http://gitlab.com/emsenn/racket-mud/commit/a71546ce3c181cf511fd8c71170b1d31e619322c][view commit]] - Add thing nouns, adjectives, and quality procedures
- [[http://gitlab.com/emsenn/racket-mud/commit/820f20a1eee9412bd30b3d20e7fb949e1436b870][view commit]] - Move around recipes and add some for Teraum
- [[http://gitlab.com/emsenn/racket-mud/commit/87c6287ee8b7714c167a47a8c656c8e6e8fbe30d][view commit]] - Add adjectives and nouns attributes to the thing struct
- [[http://gitlab.com/emsenn/racket-mud/commit/980b6e0bd062c69d0480224a57b71668eb484e13][view commit]] - Fix #9: engine fails to run if user-accounts file isn't valid date
- [[http://gitlab.com/emsenn/racket-mud/commit/ce0d3713a81090b59a3646ad4c023262faa4e3e2][view commit]] - Merge branch 'master' of https://gitlab.com/emsenn/racket-mud
- [[http://gitlab.com/emsenn/racket-mud/commit/265db6e3a2fabb724c10d2d22fad9e64d8c854c5][view commit]] - Removed documentation build
- [[http://gitlab.com/emsenn/racket-mud/commit/ede1134f0eb3326faae29b2d20d738c94005b2d2][view commit]] - Update README.md
- [[http://gitlab.com/emsenn/racket-mud/commit/284bfd5ea2d8e2f6351dc44cba550e0c7e650584][view commit]] - Add README.md
- [[http://gitlab.com/emsenn/racket-mud/commit/0ebb6301cec3ed833ee4ecdd7dd5d5589c97988f][view commit]] - Remove accidentally unremoved duplicate code
- [[http://gitlab.com/emsenn/racket-mud/commit/bf31ec213a92f98384a7b3ba2cfd436c46c91d1a][view commit]] - Move things to parent directory
- [[http://gitlab.com/emsenn/racket-mud/commit/a2d2d0055389a7df6985823a03363f29092f5ba1][view commit]] - Add move command
- [[http://gitlab.com/emsenn/racket-mud/commit/1642c700c08614ee8a2d2b6f44f4d28ed1d598e8][view commit]] - Refactor thing qualities
- [[http://gitlab.com/emsenn/racket-mud/commit/2c8514a79bece5ec5dc716276a066036ea744920][view commit]] - Possibly very broken commit
- [[http://gitlab.com/emsenn/racket-mud/commit/a983bf8844137363073e60f46f8c0bd260f808a5][view commit]] - refactor
- [[http://gitlab.com/emsenn/racket-mud/commit/65d970eeec285382097ba299b334e81e9ca864c8][view commit]] - Add sending & receiving text from MUDSocket connections
- [[http://gitlab.com/emsenn/racket-mud/commit/56635eac292d6e80bba57248e2d3733f631486e4][view commit]] - Add MUDSocket service draft & engine stop procedure
- [[http://gitlab.com/emsenn/racket-mud/commit/7dd5537166e6c009dcf15f1be4bbd5000856cc20][view commit]] - Extract dev code to mud/
- [[http://gitlab.com/emsenn/racket-mud/commit/f4f1a3c5e006a3128b345301ebfe3fa0e3bb85e9][view commit]] - First commit: dev of version 0.1.0


---

<!-- source: archive/library/rust/references/packages/bytes/CHANGELOG--000954.md -->

## Imported source: archive/library/rust/references/packages/bytes/CHANGELOG--000954.md

# 1.11.0 (November 14th, 2025)

- Bump MSRV to 1.57 (#788)

### Fixed

- fix: `BytesMut` only reuse if src has remaining (#803)
- Specialize `BytesMut::put::<Bytes>` (#793)
- Reserve capacity in `BytesMut::put` (#794)
- Change `BytesMut::remaining_mut` to use `isize::MAX` instead of `usize::MAX` (#795)

### Internal changes

- Guarantee address in `slice()` for empty slices. (#780)
- Rename `Vtable::to_*` -> `Vtable::into_*` (#776)
- Fix latest clippy warnings (#787)
- Ignore `BytesMut::freeze` doctest on wasm (#790)
- Move `drop_fn` of `from_owner` into vtable (#801)

# 1.10.1 (March 5th, 2025)

### Fixed

- Fix memory leak when using `to_vec` with `Bytes::from_owner` (#773)

# 1.10.0 (February 3rd, 2025)

### Added

- Add feature to support platforms without atomic CAS (#467)
- `try_get_*` methods for `Buf` trait (#753)
- Implement `Buf::chunks_vectored` for `Take` (#617)
- Implement `Buf::chunks_vectored` for `VecDeque<u8>` (#708)

### Fixed

- Remove incorrect guarantee for `chunks_vectored` (#754)
- Ensure that tests pass under `panic=abort` (#749)

# 1.9.0 (November 27, 2024)

### Added

- Add `Bytes::from_owner` to enable externally-allocated memory (#742)

### Documented

- Fix typo in Buf::chunk() comment (#744)

### Internal changes

- Replace BufMut::put with BufMut::put_slice in Writer impl (#745)
- Rename hex_impl! to fmt_impl! and reuse it for fmt::Debug (#743)

# 1.8.0 (October 21, 2024)

- Guarantee address in `split_off`/`split_to` for empty slices (#740)

# 1.7.2 (September 17, 2024)

### Fixed

- Fix default impl of `Buf::{get_int, get_int_le}` (#732)

### Documented

- Fix double spaces in comments and doc comments (#731)

### Internal changes

- Ensure BytesMut::advance reduces capacity (#728)

# 1.7.1 (August 1, 2024)

This release reverts the following change due to a regression:

- Reuse capacity when possible in `<BytesMut as Buf>::advance` impl (#698)

The revert can be found at #726.

# 1.7.0 (July 31, 2024)

### Added

- Add conversion from `Bytes` to `BytesMut` (#695, #710)
- Add reclaim method without additional allocation (#686)

### Documented

- Clarify how `BytesMut::zeroed` works (#714)
- Clarify the behavior of `Buf::chunk` (#717)

### Changed

- Change length condition of `BytesMut::truncate`
- Reuse capacity when possible in `<BytesMut as Buf>::advance` impl (#698)
- Improve `must_use` suggestion of `BytesMut::split` (#699)

### Internal changes

- Use `ManuallyDrop` instead of `mem::forget` (#678)
- Don't set `len` in `BytesMut::reserve` (#682)
- Optimize `Bytes::copy_to_bytes` (#688)
- Refactor `BytesMut::truncate` (#694)
- Refactor `BytesMut::resize` (#696)
- Reorder assertion in `Bytes::split_to`, `Bytes::split_off` (#689, #693)
- Use `offset_from` in more places (#705)
- Correct the wrong usage of `IntoIter` (#707)

# 1.6.1 (July 13, 2024)

This release fixes a bug where `Bytes::is_unique` returns incorrect values when
the `Bytes` originates from a shared `BytesMut`. (#718)

# 1.6.0 (March 22, 2024)

### Added

- Add `Bytes::is_unique` (#643)

### Documented

- Fix changelog typo (#628)
- Fix some spelling mistakes (#633)
- Typo fix (#637)
- Fix broken links (#639)
- Add security policy (#649)

### Internal changes

- Move comment to correct constant (#629)
- Various cleanup (#635)
- Simplify `UninitSlice::as_uninit_slice_mut()` logic (#644)
- Use `self.` instead of `Self::` (#642)
- `BytesMut`: Assert alignment of `Shared` (#652)
- Remove unnecessary namespace qualifier (#660)
- Remove an unnecessary else branch (#662)
- Remove unreachable else branch (#661)
- make parameter mut in `From<Vec>` (#667)
- Restore commented tests (#665)
- Use `sub` instead of `offset` (#668)
- Calculate original capacity only if necessary (#666)
- `set_vec_pos` does not need a second parameter (#672)
- `get_vec_pos`: use `&self` instead of `&mut self` (#670)
- Refactor `split_at`/`split_to` (#663)
- Use `Iterator` from the prelude (#673)
- `copy_to_bytes`: Add panic section to docs (#676)
- Remove redundant reserve call (#674)
- Use `ManuallyDrop` instead of `mem::forget` (#675)


# 1.5.0 (September 7, 2023)

### Added

- Add `UninitSlice::{new,uninit}` (#598, #599)
- Implement `BufMut` for `&mut [MaybeUninit<u8>]` (#597)

### Changed

- Mark `BytesMut::extend_from_slice` as inline (#595)

# 1.4.0 (January 31, 2023)

### Added

- Make `IntoIter` constructor public (#581)

### Fixed

- Avoid large reallocations when freezing `BytesMut` (#592)

### Documented

- Document which functions require `std` (#591)
- Fix duplicate "the the" typos (#585)

# 1.3.0 (November 20, 2022)

### Added

- Rename and expose `BytesMut::spare_capacity_mut` (#572)
- Implement native-endian get and put functions for `Buf` and `BufMut` (#576)

### Fixed

- Don't have important data in unused capacity when calling reserve (#563)

### Documented

- `Bytes::new` etc should return `Self` not `Bytes` (#568)

# 1.2.1 (July 30, 2022)

### Fixed

- Fix unbounded memory growth when using `reserve` (#560)

# 1.2.0 (July 19, 2022)

### Added

- Add `BytesMut::zeroed` (#517)
- Implement `Extend<Bytes>` for `BytesMut` (#527)
- Add conversion from `BytesMut` to `Vec<u8>` (#543, #554)
- Add conversion from `Bytes` to `Vec<u8>` (#547)
- Add `UninitSlice::as_uninit_slice_mut()` (#548)
- Add const to `Bytes::{len,is_empty}` (#514)

### Changed

- Reuse vector in `BytesMut::reserve` (#539, #544)

### Fixed

- Make miri happy (#515, #523, #542, #545, #553)
- Make tsan happy (#541)
- Fix `remaining_mut()` on chain (#488)
- Fix amortized asymptotics of `BytesMut` (#555)

### Documented

- Redraw layout diagram with box drawing characters (#539)
- Clarify `BytesMut::unsplit` docs (#535)

# 1.1.0 (August 25, 2021)

### Added

- `BufMut::put_bytes(self, val, cnt)` (#487)
- Implement `From<Box<[u8]>>` for `Bytes` (#504)

### Changed

- Override `put_slice` for `&mut [u8]` (#483)
- Panic on integer overflow in `Chain::remaining` (#482)
- Add inline tags to `UninitSlice` methods (#443)
- Override `copy_to_bytes` for Chain and Take (#481)
- Keep capacity when unsplit on empty other buf (#502)

### Documented

- Clarify `BufMut` allocation guarantees (#501)
- Clarify `BufMut::put_int` behavior (#486)
- Clarify actions of `clear` and `truncate`. (#508)

# 1.0.1 (January 11, 2021)

### Changed
- mark `Vec::put_slice` with `#[inline]` (#459)

### Fixed
- Fix deprecation warning (#457)
- use `Box::into_raw` instead of `mem::forget`-in-disguise (#458)

# 1.0.0 (December 22, 2020)

### Changed
- Rename `Buf`/`BufMut` methods `bytes()` and `bytes_mut()` to `chunk()` and `chunk_mut()` (#450)

### Removed
- remove unused Buf implementation. (#449)

# 0.6.0 (October 21, 2020)

API polish in preparation for a 1.0 release.

### Changed
- `BufMut` is now an `unsafe` trait (#432).
- `BufMut::bytes_mut()` returns `&mut UninitSlice`, a type owned by `bytes` to
  avoid undefined behavior (#433).
- `Buf::copy_to_bytes(len)` replaces `Buf::into_bytes()` (#439).
- `Buf`/`BufMut` utility methods are moved onto the trait and `*Ext` traits are
  removed (#431).

### Removed
- `BufMut::bytes_vectored_mut()` (#430).
- `new` methods on combinator types (#434).

# 0.5.6 (July 13, 2020)

- Improve `BytesMut` to reuse buffer when fully `advance`d.
- Mark `BytesMut::{as_mut, set_len}` with `#[inline]`.
- Relax synchronization when cloning in shared vtable of `Bytes`.
- Move `loom` to `dev-dependencies`.

# 0.5.5 (June 18, 2020)

### Added
- Allow using the `serde` feature in `no_std` environments (#385).

### Fix
- Fix `BufMut::advance_mut` to panic if advanced passed the capacity (#354)..
- Fix `BytesMut::freeze` ignoring amount previously `advance`d (#352).

# 0.5.4 (January 23, 2020)

### Added
- Make `Bytes::new` a `const fn`.
- Add `From<BytesMut>` for `Bytes`.

### Fix
- Fix reversed arguments in `PartialOrd` for `Bytes`.
- Fix `Bytes::truncate` losing original capacity when repr is an unshared `Vec`.
- Fix `Bytes::from(Vec)` when allocator gave `Vec` a pointer with LSB set.
- Fix panic in `Bytes::slice_ref` if argument is an empty slice.

# 0.5.3 (December 12, 2019)

### Added
- `must_use` attributes to `split`, `split_off`, and `split_to` methods (#337).

### Fix
- Potential freeing of a null pointer in `Bytes` when constructed with an empty `Vec<u8>` (#341, #342).
- Calling `Bytes::truncate` with a size large than the length will no longer clear the `Bytes` (#333).

# 0.5.2 (November 27, 2019)

### Added
- `Limit` methods `into_inner`, `get_ref`, `get_mut`, `limit`, and `set_limit` (#325).

# 0.5.1 (November 25, 2019)

### Fix
- Growth documentation for `BytesMut` (#321)

# 0.5.0 (November 25, 2019)

### Fix
- Potential overflow in `copy_to_slice`

### Changed
- Increased minimum supported Rust version to 1.39.
- `Bytes` is now a "trait object", allowing for custom allocation strategies (#298)
- `BytesMut` implicitly grows internal storage. `remaining_mut()` returns
  `usize::MAX` (#316).
- `BufMut::bytes_mut` returns `&mut [MaybeUninit<u8>]` to reflect the unknown
  initialization state (#305).
- `Buf` / `BufMut` implementations for `&[u8]` and `&mut [u8]`
  respectively (#261).
- Move `Buf` / `BufMut` "extra" functions to an extension trait (#306).
- `BufMutExt::limit` (#309).
- `Bytes::slice` takes a `RangeBounds` argument (#265).
- `Bytes::from_static` is now a `const fn` (#311).
- A multitude of smaller performance optimizations.

### Added
- `no_std` support (#281).
- `get_*`, `put_*`, `get_*_le`, and `put_*le` accessors for handling byte order.
- `BorrowMut` implementation for `BytesMut` (#185).

### Removed
- `IntoBuf` (#288).
- `Buf` implementation for `&str` (#301).
- `byteorder` dependency (#280).
- `iovec` dependency, use `std::IoSlice` instead (#263).
- optional `either` dependency (#315).
- optional `i128` feature -- now available on stable. (#276).

# 0.4.12 (March 6, 2019)

### Added
- Implement `FromIterator<&'a u8>` for `BytesMut`/`Bytes` (#244).
- Implement `Buf` for `VecDeque` (#249).

# 0.4.11 (November 17, 2018)

* Use raw pointers for potentially racy loads (#233).
* Implement `BufRead` for `buf::Reader` (#232).
* Documentation tweaks (#234).

# 0.4.10 (September 4, 2018)

* impl `Buf` and `BufMut` for `Either` (#225).
* Add `Bytes::slice_ref` (#208).

# 0.4.9 (July 12, 2018)

* Add 128 bit number support behind a feature flag (#209).
* Implement `IntoBuf` for `&mut [u8]`

# 0.4.8 (May 25, 2018)

* Fix panic in `BytesMut` `FromIterator` implementation.
* Bytes: Recycle space when reserving space in vec mode (#197).
* Bytes: Add resize fn (#203).

# 0.4.7 (April 27, 2018)

* Make `Buf` and `BufMut` usable as trait objects (#186).
* impl BorrowMut for BytesMut (#185).
* Improve accessor performance (#195).

# 0.4.6 (Janary 8, 2018)

* Implement FromIterator for Bytes/BytesMut (#148).
* Add `advance` fn to Bytes/BytesMut (#166).
* Add `unsplit` fn to `BytesMut` (#162, #173).
* Improvements to Bytes split fns (#92).

# 0.4.5 (August 12, 2017)

* Fix range bug in `Take::bytes`
* Misc performance improvements
* Add extra `PartialEq` implementations.
* Add `Bytes::with_capacity`
* Implement `AsMut[u8]` for `BytesMut`

# 0.4.4 (May 26, 2017)

* Add serde support behind feature flag
* Add `extend_from_slice` on `Bytes` and `BytesMut`
* Add `truncate` and `clear` on `Bytes`
* Misc additional std trait implementations
* Misc performance improvements

# 0.4.3 (April 30, 2017)

* Fix Vec::advance_mut bug
* Bump minimum Rust version to 1.15
* Misc performance tweaks

# 0.4.2 (April 5, 2017)

* Misc performance tweaks
* Improved `Debug` implementation for `Bytes`
* Avoid some incorrect assert panics

# 0.4.1 (March 15, 2017)

* Expose `buf` module and have most types available from there vs. root.
* Implement `IntoBuf` for `T: Buf`.
* Add `FromBuf` and `Buf::collect`.
* Add iterator adapter for `Buf`.
* Add scatter/gather support to `Buf` and `BufMut`.
* Add `Buf::chain`.
* Reduce allocations on repeated calls to `BytesMut::reserve`.
* Implement `Debug` for more types.
* Remove `Source` in favor of `IntoBuf`.
* Implement `Extend` for `BytesMut`.


# 0.4.0 (February 24, 2017)

* Initial release


---

<!-- source: archive/library/rust/references/packages/cc/CHANGELOG--001045.md -->

## Imported source: archive/library/rust/references/packages/cc/CHANGELOG--001045.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.47](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.46...cc-v1.2.47) - 2025-11-21

### Other

- add helenos linker identifications ([#1615](https://github.com/rust-lang/cc-rs/pull/1615))

## [1.2.46](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.45...cc-v1.2.46) - 2025-11-14

### Other

- Add Visual Studio 2026 support ([#1609](https://github.com/rust-lang/cc-rs/pull/1609))

## [1.2.45](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.44...cc-v1.2.45) - 2025-11-07

### Other

- Regenerate target info ([#1606](https://github.com/rust-lang/cc-rs/pull/1606))
- Use a default check for the "env" variable in apple_sdk_name ([#1605](https://github.com/rust-lang/cc-rs/pull/1605))

## [1.2.44](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.43...cc-v1.2.44) - 2025-10-31

### Other

- Fix debug assertion for env/abi mismatch ([#1604](https://github.com/rust-lang/cc-rs/pull/1604))
- Update CHANGELOG for version 1.2.43 ([#1602](https://github.com/rust-lang/cc-rs/pull/1602))
- Stop passing an invalid target to `llvm-mingw`'s cross-compilation wrappers ([#1495](https://github.com/rust-lang/cc-rs/pull/1495))

## [1.2.43](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.42...cc-v1.2.43) - 2025-10-24

### Other

- Mark `static_flag` and `shared_flag` as deprecated ([#1582](https://github.com/rust-lang/cc-rs/pull/1582))

## [1.2.42](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.41...cc-v1.2.42) - 2025-10-24

### Other

- Fix check-semver-checks ([#1600](https://github.com/rust-lang/cc-rs/pull/1600))
- minor improvement for docs ([#1598](https://github.com/rust-lang/cc-rs/pull/1598))
- Fix linker-plugin-lto: use `-flto=thin` ([#1594](https://github.com/rust-lang/cc-rs/pull/1594))
- Disable check-buildstd for armv7k-apple-watchos ([#1599](https://github.com/rust-lang/cc-rs/pull/1599))
- Add elf abi to ppc64 targets ([#1596](https://github.com/rust-lang/cc-rs/pull/1596))

## [1.2.41](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.40...cc-v1.2.41) - 2025-10-10

### Other

- Allow using VCToolsVersion to request a specific msvc version ([#1589](https://github.com/rust-lang/cc-rs/pull/1589))
- Regenerate target info ([#1592](https://github.com/rust-lang/cc-rs/pull/1592))
- Regenerate windows sys bindings ([#1591](https://github.com/rust-lang/cc-rs/pull/1591))
- Update windows-bindgen requirement from 0.64 to 0.65 ([#1590](https://github.com/rust-lang/cc-rs/pull/1590))
- Fix `get_base_archiver_variant` for clang-cl: use `--print-search-dirs` ([#1587](https://github.com/rust-lang/cc-rs/pull/1587))

## [1.2.40](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.39...cc-v1.2.40) - 2025-10-03

### Other

- Reorder changelog and remove duplicate Unreleased section ([#1579](https://github.com/rust-lang/cc-rs/pull/1579))
- Prefer clang if linker-plugin-lto specified ([#1573](https://github.com/rust-lang/cc-rs/pull/1573))
- Fix building for Mac Catalyst ([#1577](https://github.com/rust-lang/cc-rs/pull/1577))
- Improve ESP microcontroller targets ([#1574](https://github.com/rust-lang/cc-rs/pull/1574))

## [1.2.39](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.38...cc-v1.2.39) - 2025-09-26

### Other

- Fix cross compilation to xtensa-esp32s3-espidf ([#1569](https://github.com/rust-lang/cc-rs/pull/1569))
- Fix autodetect_wasi_compiler: support non utf-8 path ([#1568](https://github.com/rust-lang/cc-rs/pull/1568))
- Regenerate target info ([#1567](https://github.com/rust-lang/cc-rs/pull/1567))
- Fix rustcflags mapping: require -Clinker-plugin-lto for -flto ([#1564](https://github.com/rust-lang/cc-rs/pull/1564))
- Use `$WASI_SDK_PATH` on WASI targets by default ([#1562](https://github.com/rust-lang/cc-rs/pull/1562))
- Fix atomicity violations in concurrent cache operations ([#1559](https://github.com/rust-lang/cc-rs/pull/1559))

## [1.2.38](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.37...cc-v1.2.38) - 2025-09-19

### Other

- updated the following local packages: find-msvc-tools

## [1.2.37](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.36...cc-v1.2.37) - 2025-09-12

### Other

- Fix errmsg in RustcCodegenFlags::set_rustc_flag ([#1551](https://github.com/rust-lang/cc-rs/pull/1551))
- propagate stack protector to Linux C compilers ([#1550](https://github.com/rust-lang/cc-rs/pull/1550))
- Extract new fn `run_commands_in_parallel` ([#1549](https://github.com/rust-lang/cc-rs/pull/1549))

## [1.2.36](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.35...cc-v1.2.36) - 2025-09-05

### Other

- Regenerate windows sys bindings ([#1548](https://github.com/rust-lang/cc-rs/pull/1548))
- Update windows-bindgen requirement from 0.62 to 0.63 ([#1547](https://github.com/rust-lang/cc-rs/pull/1547))
- Add fn get_ucrt_dir for find-msvc-tools ([#1546](https://github.com/rust-lang/cc-rs/pull/1546))
- Regenerate target info ([#1544](https://github.com/rust-lang/cc-rs/pull/1544))
- fix publish.yml ([#1543](https://github.com/rust-lang/cc-rs/pull/1543))
- Replace periods with underscores as well when parsing env variables ([#1541](https://github.com/rust-lang/cc-rs/pull/1541))

## [1.2.35](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.34...cc-v1.2.35) - 2025-09-01

### Fixed

- fix building for aarch64-apple-visionos-sim on nightly ([#1534](https://github.com/rust-lang/cc-rs/pull/1534))
- fix tests apple_sdkroot_wrong ([#1530](https://github.com/rust-lang/cc-rs/pull/1530))

### Other

- Regenerate target info ([#1536](https://github.com/rust-lang/cc-rs/pull/1536))
- Optimize Tool::to_command ([#1535](https://github.com/rust-lang/cc-rs/pull/1535))
- Extract find-msvc-tools ([#1531](https://github.com/rust-lang/cc-rs/pull/1531))
- Add prefer_clang_cl_over_msvc ([#1516](https://github.com/rust-lang/cc-rs/pull/1516))

## [1.2.34](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.33...cc-v1.2.34) - 2025-08-22

### Fixed

- add `-mcpu=mvp` and `-mmutable-globals` for `wasm32v1-none` ([#1524](https://github.com/rust-lang/cc-rs/pull/1524))

### Other

- Optimize parse_version in find_tools.rs ([#1527](https://github.com/rust-lang/cc-rs/pull/1527))
- Fallback to manually searching for tool dir ([#1526](https://github.com/rust-lang/cc-rs/pull/1526))

## [1.2.33](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.32...cc-v1.2.33) - 2025-08-15

### Other

- Regenerate target info ([#1521](https://github.com/rust-lang/cc-rs/pull/1521))
- [win][arm64ec] Add testing for Arm64EC Windows ([#1512](https://github.com/rust-lang/cc-rs/pull/1512))
- Fix parsing of nigthly targets ([#1517](https://github.com/rust-lang/cc-rs/pull/1517))
- [win][arm64ec] Fix finding assembler and setting is_arm for Arm64EC ([#1511](https://github.com/rust-lang/cc-rs/pull/1511))

## [1.2.32](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.31...cc-v1.2.32) - 2025-08-08

### Fixed

- fix new clippy lint introduced in rust 1.89.0 ([#1509](https://github.com/rust-lang/cc-rs/pull/1509))

### Other

- clarify cargo default if no rerun emitted ([#1508](https://github.com/rust-lang/cc-rs/pull/1508))
- extract compile_objects_sequential ([#1507](https://github.com/rust-lang/cc-rs/pull/1507))
- Windows `find_tools`: add support for finding Clang ([#1506](https://github.com/rust-lang/cc-rs/pull/1506))
- Add m68k-unknown-linux-gnu cross-compile target ([#1505](https://github.com/rust-lang/cc-rs/pull/1505))

## [1.2.31](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.30...cc-v1.2.31) - 2025-08-01

### Other

- Add doc for using sccache/ccache etc ([#1502](https://github.com/rust-lang/cc-rs/pull/1502))
- ability to statically link against C++ stdlib ([#1497](https://github.com/rust-lang/cc-rs/pull/1497))
- Add instructions on using sccache ([#1503](https://github.com/rust-lang/cc-rs/pull/1503))
- Add support for recognizing some architectures supported by GCC, but not LLVM. ([#1500](https://github.com/rust-lang/cc-rs/pull/1500))

## [1.2.30](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.29...cc-v1.2.30) - 2025-07-18

### Other

- define _REENTRANT by default ([#1496](https://github.com/rust-lang/cc-rs/pull/1496))

## [1.2.29](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.28...cc-v1.2.29) - 2025-07-05

### Other

- Fix target parsing for powerpc ([#1490](https://github.com/rust-lang/cc-rs/pull/1490))

## [1.2.28](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.27...cc-v1.2.28) - 2025-07-04

### Other

- Recognize `mlibc` environment ([#1488](https://github.com/rust-lang/cc-rs/pull/1488))
- Fix clippy warnings about not using variables in `format!` strings ([#1489](https://github.com/rust-lang/cc-rs/pull/1489))

## [1.2.27](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.26...cc-v1.2.27) - 2025-06-13

### Other

- Regenerate windows sys bindings ([#1485](https://github.com/rust-lang/cc-rs/pull/1485))
- Update windows-bindgen requirement from 0.61 to 0.62 ([#1484](https://github.com/rust-lang/cc-rs/pull/1484))
- Regenerate target info ([#1483](https://github.com/rust-lang/cc-rs/pull/1483))

## [1.2.26](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.25...cc-v1.2.26) - 2025-06-06

### Other

- Also set `SDKROOT` when building apple platforms ([#1475](https://github.com/rust-lang/cc-rs/pull/1475))
- use windows 2022 in CI ([#1479](https://github.com/rust-lang/cc-rs/pull/1479))
- Detect -Wslash-u-filename warning on clang-cl ([#1477](https://github.com/rust-lang/cc-rs/pull/1477))

## [1.2.25](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.24...cc-v1.2.25) - 2025-05-30

### Other

- make `powerp64` use `powerpc64-linux-gnu` prefix ([#1474](https://github.com/rust-lang/cc-rs/pull/1474))

## [1.2.24](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.23...cc-v1.2.24) - 2025-05-23

### Other

- Regenerate windows sys bindings ([#1471](https://github.com/rust-lang/cc-rs/pull/1471))

## [1.2.23](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.22...cc-v1.2.23) - 2025-05-16

### Other

- support "vxworks" and "nto" OSes on `get_base_archiver_variant` ([#1456](https://github.com/rust-lang/cc-rs/pull/1456))

## [1.2.22](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.21...cc-v1.2.22) - 2025-05-09

### Other

- Add `flags` method to `cc::Build` for adding multiple flags ([#1466](https://github.com/rust-lang/cc-rs/pull/1466))

## [1.2.21](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.20...cc-v1.2.21) - 2025-05-02

### Other

- Fix wasm32-unknown-unknown by passing -c ([#1424](https://github.com/rust-lang/cc-rs/pull/1424))

## [1.2.20](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.19...cc-v1.2.20) - 2025-04-25

### Other

- Regenerate target info ([#1461](https://github.com/rust-lang/cc-rs/pull/1461))
- Fix parser.rs on latest rustc nightly ([#1459](https://github.com/rust-lang/cc-rs/pull/1459))

## [1.2.19](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.18...cc-v1.2.19) - 2025-04-11

### Other

- Fix musl compilation: Add musl as a prefix fallback ([#1455](https://github.com/rust-lang/cc-rs/pull/1455))

## [1.2.18](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.17...cc-v1.2.18) - 2025-04-04

### Other

- Regenerate target info ([#1450](https://github.com/rust-lang/cc-rs/pull/1450))
- Use `std::thread::available_parallelism` for determining the default number of jobs ([#1447](https://github.com/rust-lang/cc-rs/pull/1447))
- Fix mips64-openwrt-linux-musl parsing ([#1449](https://github.com/rust-lang/cc-rs/pull/1449))
- Use compiler prefix `x86_64-linux-musl` ([#1443](https://github.com/rust-lang/cc-rs/pull/1443))

## [1.2.17](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.16...cc-v1.2.17) - 2025-03-21

### Other

- Regenerate target info ([#1439](https://github.com/rust-lang/cc-rs/pull/1439))
- Regenerate windows sys bindings ([#1437](https://github.com/rust-lang/cc-rs/pull/1437))
- Fix wasm32-wali-linux-musl target parsing ([#1434](https://github.com/rust-lang/cc-rs/pull/1434))
- Parse `rustc` target names ([#1413](https://github.com/rust-lang/cc-rs/pull/1413))
- Regenerate target info ([#1429](https://github.com/rust-lang/cc-rs/pull/1429))
- Added base support for `wasm32-wali-linux-musl` target ([#1373](https://github.com/rust-lang/cc-rs/pull/1373))

## [1.2.16](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.15...cc-v1.2.16) - 2025-02-28

### Fixed

- force windows compiler to run in `out_dir` to prevent artifacts in cwd (#1415)

### Other

- use `/arch:SSE2` for `x86` target arch (#1425)
- Regenerate windows-sys binding ([#1422](https://github.com/rust-lang/cc-rs/pull/1422))
- Regenerate target info ([#1418](https://github.com/rust-lang/cc-rs/pull/1418))
- Add LIB var when compiling flag_check (#1417)
- Change flag ordering ([#1403](https://github.com/rust-lang/cc-rs/pull/1403))
- Fix archiver detection for musl cross compilation ([#1404](https://github.com/rust-lang/cc-rs/pull/1404))

## [1.2.15](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.14...cc-v1.2.15) - 2025-02-21

### Other

- Regenerate target info ([#1406](https://github.com/rust-lang/cc-rs/pull/1406))
- Always read from all `CFLAGS`-style flags ([#1401](https://github.com/rust-lang/cc-rs/pull/1401))
- Simplify the error output on failed `Command` invocation ([#1397](https://github.com/rust-lang/cc-rs/pull/1397))

## [1.2.14](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.13...cc-v1.2.14) - 2025-02-14

### Other

- Regenerate target info ([#1398](https://github.com/rust-lang/cc-rs/pull/1398))
- Add support for setting `-gdwarf-{version}` based on RUSTFLAGS ([#1395](https://github.com/rust-lang/cc-rs/pull/1395))
- Add support for alternative network stack io-sock on QNX 7.1 aarch64 and x86_64 ([#1312](https://github.com/rust-lang/cc-rs/pull/1312))

## [1.2.13](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.12...cc-v1.2.13) - 2025-02-08

### Other

- Fix cross-compiling for Apple platforms ([#1389](https://github.com/rust-lang/cc-rs/pull/1389))

## [1.2.12](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.11...cc-v1.2.12) - 2025-02-04

### Other

- Split impl Build ([#1382](https://github.com/rust-lang/cc-rs/pull/1382))
- Don't specify both `-target` and `-mtargetos=` on Apple targets ([#1384](https://github.com/rust-lang/cc-rs/pull/1384))

## [1.2.11](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.10...cc-v1.2.11) - 2025-01-31

### Other

- Fix more flag inheritance ([#1380](https://github.com/rust-lang/cc-rs/pull/1380))
- Include wrapper args. in `stdout` family heuristics to restore classifying `clang --driver-mode=cl` as `Msvc { clang_cl: true }` ([#1378](https://github.com/rust-lang/cc-rs/pull/1378))
- Constrain `-Clto` and `-Cembed-bitcode` flag inheritance to be `clang`-only ([#1379](https://github.com/rust-lang/cc-rs/pull/1379))
- Pass deployment target with `-m*-version-min=` ([#1339](https://github.com/rust-lang/cc-rs/pull/1339))
- Regenerate target info ([#1376](https://github.com/rust-lang/cc-rs/pull/1376))

## [1.2.10](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.9...cc-v1.2.10) - 2025-01-17

### Other

- Fix CC_FORCE_DISABLE=0 evaluating to true ([#1371](https://github.com/rust-lang/cc-rs/pull/1371))
- Regenerate target info ([#1369](https://github.com/rust-lang/cc-rs/pull/1369))
- Make hidden lifetimes explicit. ([#1366](https://github.com/rust-lang/cc-rs/pull/1366))

## [1.2.9](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.8...cc-v1.2.9) - 2025-01-12

### Other

- Don't pass inherited PGO flags to GNU compilers (#1363)
- Adjusted zig cc judgment and avoided zigbuild errors([#1360](https://github.com/rust-lang/cc-rs/pull/1360)) ([#1361](https://github.com/rust-lang/cc-rs/pull/1361))
- Fix compilation on macOS using clang and fix compilation using zig-cc ([#1364](https://github.com/rust-lang/cc-rs/pull/1364))

## [1.2.8](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.7...cc-v1.2.8) - 2025-01-11

### Other

- Add `is_like_clang_cl()` getter (#1357)
- Fix clippy error in lib.rs ([#1356](https://github.com/rust-lang/cc-rs/pull/1356))
- Regenerate target info ([#1352](https://github.com/rust-lang/cc-rs/pull/1352))
- Fix compiler family detection issue with clang-cl on macOS ([#1328](https://github.com/rust-lang/cc-rs/pull/1328))
- Update `windows-bindgen` dependency ([#1347](https://github.com/rust-lang/cc-rs/pull/1347))
- Fix clippy warnings ([#1346](https://github.com/rust-lang/cc-rs/pull/1346))

## [1.2.7](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.6...cc-v1.2.7) - 2025-01-03

### Other

- Regenerate target info ([#1342](https://github.com/rust-lang/cc-rs/pull/1342))
- Document new supported architecture names in windows::find
- Make is_flag_supported_inner take an &Tool ([#1337](https://github.com/rust-lang/cc-rs/pull/1337))
- Fix is_flag_supported on msvc ([#1336](https://github.com/rust-lang/cc-rs/pull/1336))
- Allow using Visual Studio target names in `find_tool` ([#1335](https://github.com/rust-lang/cc-rs/pull/1335))

## [1.2.6](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.5...cc-v1.2.6) - 2024-12-27

### Other

- Don't inherit the `/Oy` flag for 64-bit targets ([#1330](https://github.com/rust-lang/cc-rs/pull/1330))

## [1.2.5](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.4...cc-v1.2.5) - 2024-12-19

### Other

- Check linking when testing if compiler flags are supported ([#1322](https://github.com/rust-lang/cc-rs/pull/1322))

## [1.2.4](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.3...cc-v1.2.4) - 2024-12-13

### Other

- Add support for C/C++ compiler for Neutrino QNX: `qcc` ([#1319](https://github.com/rust-lang/cc-rs/pull/1319))
- use -maix64 instead of -m64 ([#1307](https://github.com/rust-lang/cc-rs/pull/1307))

## [1.2.3](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.2...cc-v1.2.3) - 2024-12-06

### Other

- Improve detection of environment when compiling from msbuild or msvc ([#1310](https://github.com/rust-lang/cc-rs/pull/1310))
- Better error message when failing on unknown targets ([#1313](https://github.com/rust-lang/cc-rs/pull/1313))
- Optimize RustcCodegenFlags ([#1305](https://github.com/rust-lang/cc-rs/pull/1305))

## [1.2.2](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.1...cc-v1.2.2) - 2024-11-29

### Other

- Inherit flags from rustc ([#1279](https://github.com/rust-lang/cc-rs/pull/1279))
- Add support for using sccache wrapper with cuda/nvcc ([#1304](https://github.com/rust-lang/cc-rs/pull/1304))
- Fix msvc stdout not shown on error ([#1303](https://github.com/rust-lang/cc-rs/pull/1303))
- Regenerate target info ([#1301](https://github.com/rust-lang/cc-rs/pull/1301))
- Fix compilation of C++ code for armv7-unknown-linux-gnueabihf ([#1298](https://github.com/rust-lang/cc-rs/pull/1298))
- Fetch target info from Cargo even if `Build::target` is manually set ([#1299](https://github.com/rust-lang/cc-rs/pull/1299))
- Fix two files with different extensions having the same object name ([#1295](https://github.com/rust-lang/cc-rs/pull/1295))
- Allow disabling cc's ability to compile via env var CC_FORCE_DISABLE ([#1292](https://github.com/rust-lang/cc-rs/pull/1292))
- Regenerate target info ([#1293](https://github.com/rust-lang/cc-rs/pull/1293))

## [1.2.1](https://github.com/rust-lang/cc-rs/compare/cc-v1.2.0...cc-v1.2.1) - 2024-11-14

### Other

- When invoking `cl -?`, set stdin to null ([#1288](https://github.com/rust-lang/cc-rs/pull/1288))

## [1.2.0](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.37...cc-v1.2.0) - 2024-11-11

### Added

- add i686-pc-windows-gnullvm prefix detection ([#1283](https://github.com/rust-lang/cc-rs/pull/1283))

### Other

- Allow only specifying the architecture ([#1285](https://github.com/rust-lang/cc-rs/pull/1285))
- Fix WASM vs. WASI options ([#1284](https://github.com/rust-lang/cc-rs/pull/1284))

## [1.1.37](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.36...cc-v1.1.37) - 2024-11-08

### Other

- Use relative directory for obj files hash ([#1270](https://github.com/rust-lang/cc-rs/pull/1270))
- Regenerate target info ([#1280](https://github.com/rust-lang/cc-rs/pull/1280))

## [1.1.36](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.35...cc-v1.1.36) - 2024-11-05

### Other

- Fix CUDA build with clang++. ([#1273](https://github.com/rust-lang/cc-rs/pull/1273))

## [1.1.35](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.34...cc-v1.1.35) - 2024-11-04

### Other

- Remove support for FRC ([#1268](https://github.com/rust-lang/cc-rs/pull/1268))
- Do not add -fPIC by default on UEFI targets ([#1263](https://github.com/rust-lang/cc-rs/pull/1263))
- Use -windows-gnu for all UEFI targets ([#1264](https://github.com/rust-lang/cc-rs/pull/1264))

## [1.1.34](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.33...cc-v1.1.34) - 2024-11-02

### Other

- Remove redundant flags ([#1256](https://github.com/rust-lang/cc-rs/pull/1256))

## [1.1.33](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.32...cc-v1.1.33) - 2024-11-02

### Other

- Reduce size of `cc::Build`  and size of generated targets ([#1257](https://github.com/rust-lang/cc-rs/pull/1257))

## [1.1.32](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.31...cc-v1.1.32) - 2024-11-02

### Other

- Use `rustc`'s knowledge of LLVM/Clang target triples ([#1252](https://github.com/rust-lang/cc-rs/pull/1252))
- Use Cargo's target information when possible ([#1225](https://github.com/rust-lang/cc-rs/pull/1225))

## [1.1.31](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.30...cc-v1.1.31) - 2024-10-19

### Other

- Add comment explaining why cc does not rebuild on env PATH change ([#1247](https://github.com/rust-lang/cc-rs/pull/1247))

## [1.1.30](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.29...cc-v1.1.30) - 2024-10-11

### Other

- Don't pass -fPIC by default on wasm ([#1245](https://github.com/rust-lang/cc-rs/pull/1245))

## [1.1.29](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.28...cc-v1.1.29) - 2024-10-11

### Other

- Regenerate target info ([#1243](https://github.com/rust-lang/cc-rs/pull/1243))

## [1.1.28](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.27...cc-v1.1.28) - 2024-10-06

### Other

- Environment variables: For one accepting boolean, treat "0", "false" and empty env as false ([#1238](https://github.com/rust-lang/cc-rs/pull/1238))

## [1.1.27](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.26...cc-v1.1.27) - 2024-10-06

### Other

- Revert "Use debug version of MSVC runtime library on debug ([#1231](https://github.com/rust-lang/cc-rs/pull/1231))" ([#1237](https://github.com/rust-lang/cc-rs/pull/1237))
- Disable `CC_ENABLE_DEBUG_OUTPUT` if it is set to "0" ([#1234](https://github.com/rust-lang/cc-rs/pull/1234))

## [1.1.26](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.25...cc-v1.1.26) - 2024-10-06

### Other

- Use debug version of MSVC runtime library on debug ([#1231](https://github.com/rust-lang/cc-rs/pull/1231))

## [1.1.25](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.24...cc-v1.1.25) - 2024-10-05

### Other

- Remove incorrect "lib" prefixes in CXXSTDLIB doc comments ([#1228](https://github.com/rust-lang/cc-rs/pull/1228))

## [1.1.24](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.23...cc-v1.1.24) - 2024-10-01

### Other

- Fix wasm32-wasip1-threads:  shared-memory disallowed due to not compiled with 'atomics' or 'bulk-memory' features ([#1221](https://github.com/rust-lang/cc-rs/pull/1221))
- Reduce the need for the host target triple ([#1224](https://github.com/rust-lang/cc-rs/pull/1224))
- Add auto cancellation for CI jobs ([#1222](https://github.com/rust-lang/cc-rs/pull/1222))

## [1.1.23](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.22...cc-v1.1.23) - 2024-09-30

### Other

- Update doc for detecting changes/upgrades of compilers ([#1218](https://github.com/rust-lang/cc-rs/pull/1218))

## [1.1.22](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.21...cc-v1.1.22) - 2024-09-27

### Other

- Don't rerun if PATH changes ([#1215](https://github.com/rust-lang/cc-rs/pull/1215))

## [1.1.21](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.20...cc-v1.1.21) - 2024-09-18

### Other

- disable pic for targets that end in `-none` ([#1212](https://github.com/rust-lang/cc-rs/pull/1212))

## [1.1.20](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.19...cc-v1.1.20) - 2024-09-17

### Other

- Add buildcache as known Rust and C/C++ compiler wrapper ([#1209](https://github.com/rust-lang/cc-rs/pull/1209))

## [1.1.19](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.18...cc-v1.1.19) - 2024-09-15

### Other

- Add support arm64e-apple-darwin ([#1207](https://github.com/rust-lang/cc-rs/pull/1207))

## [1.1.18](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.17...cc-v1.1.18) - 2024-09-07

### Other
- Fixed unsoundness in `StderrForwarder::forward_available` ([#1203](https://github.com/rust-lang/cc-rs/pull/1203))

## [1.1.17](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.16...cc-v1.1.17) - 2024-09-06

### Fixed
- fix finding toolchains when invoked by msbuild ([#1201](https://github.com/rust-lang/cc-rs/pull/1201))

## [1.1.16](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.15...cc-v1.1.16) - 2024-09-04

### Other
- Treat VxWorks wr-cc as a Gnu compiler ([#1198](https://github.com/rust-lang/cc-rs/pull/1198))

## [1.1.15](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.14...cc-v1.1.15) - 2024-08-26

### Other
- Add -mfloat-abi=hard as a default argument when using any arm/thumb-none-eabihf target ([#1194](https://github.com/rust-lang/cc-rs/pull/1194))

## [1.1.14](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.13...cc-v1.1.14) - 2024-08-23

### Other
- allow finding tools from path if VisualStudioDir is set

## [1.1.13](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.12...cc-v1.1.13) - 2024-08-16

### Other
- Fix detect family: should detect emscripten as clang, closes [#1185](https://github.com/rust-lang/cc-rs/pull/1185) ([#1186](https://github.com/rust-lang/cc-rs/pull/1186))

## [1.1.12](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.11...cc-v1.1.12) - 2024-08-15

### Other
- improve docs ([#1183](https://github.com/rust-lang/cc-rs/pull/1183))

## [1.1.11](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.10...cc-v1.1.11) - 2024-08-14

### Other
- Add support for parsing shell encoded `*FLAGS` ([#1181](https://github.com/rust-lang/cc-rs/pull/1181))
- Replace vector of tuples with BTreeMap which already is sorted and free of duplicates ([#1177](https://github.com/rust-lang/cc-rs/pull/1177))

## [1.1.10](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.9...cc-v1.1.10) - 2024-08-11

### Other
- Remap Windows targets triples to their LLVM counterparts ([#1176](https://github.com/rust-lang/cc-rs/pull/1176))

## [1.1.9](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.8...cc-v1.1.9) - 2024-08-11

### Other
- Add custom CC wrapper to the wrapper whitelist ([#1175](https://github.com/rust-lang/cc-rs/pull/1175))

## [1.1.8](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.7...cc-v1.1.8) - 2024-08-06

### Other
- Fix broken link in docs.rs ([#1173](https://github.com/rust-lang/cc-rs/pull/1173))

## [1.1.7](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.6...cc-v1.1.7) - 2024-07-29

### Other
- add `.objects` ([#1166](https://github.com/rust-lang/cc-rs/pull/1166))

## [1.1.6](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.5...cc-v1.1.6) - 2024-07-19

### Other
- Clippy fixes ([#1163](https://github.com/rust-lang/cc-rs/pull/1163))

## [1.1.5](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.4...cc-v1.1.5) - 2024-07-15

### Other
- Fix cyclic compilation: Use vendored once_cell ([#1154](https://github.com/rust-lang/cc-rs/pull/1154))

## [1.1.4](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.3...cc-v1.1.4) - 2024-07-14

### Other
- Support compiling on wasm targets (Supersede [#1068](https://github.com/rust-lang/cc-rs/pull/1068)) ([#1160](https://github.com/rust-lang/cc-rs/pull/1160))

## [1.1.3](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.2...cc-v1.1.3) - 2024-07-14

### Other
- Reduce msrv to 1.63 ([#1158](https://github.com/rust-lang/cc-rs/pull/1158))
- Revert "Use raw-dylib for windows-sys ([#1137](https://github.com/rust-lang/cc-rs/pull/1137))" ([#1157](https://github.com/rust-lang/cc-rs/pull/1157))
- Fix typos ([#1152](https://github.com/rust-lang/cc-rs/pull/1152))
- Fix `doc_lazy_continuation` lints ([#1153](https://github.com/rust-lang/cc-rs/pull/1153))

## [1.1.2](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.1...cc-v1.1.2) - 2024-07-12

### Other
- Add empty `jobserver` feature. ([#1150](https://github.com/rust-lang/cc-rs/pull/1150))

## [1.1.1](https://github.com/rust-lang/cc-rs/compare/cc-v1.1.0...cc-v1.1.1) - 2024-07-12

### Other
- Fix is_flag_supported not respecting emit_rerun_if_env_changed ([#1147](https://github.com/rust-lang/cc-rs/pull/1147)) ([#1148](https://github.com/rust-lang/cc-rs/pull/1148))

## [1.1.0](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.106...cc-v1.1.0) - 2024-07-08

### Added
- add cargo_output to eliminate last vestiges of stdout pollution ([#1141](https://github.com/rust-lang/cc-rs/pull/1141))

## [1.0.106](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.105...cc-v1.0.106) - 2024-07-08

### Other
- Drop support for Visual Studio 12 (2013) ([#1046](https://github.com/rust-lang/cc-rs/pull/1046))
- Use raw-dylib for windows-sys ([#1137](https://github.com/rust-lang/cc-rs/pull/1137))
- Bump msrv to 1.67 ([#1143](https://github.com/rust-lang/cc-rs/pull/1143))
- Bump msrv to 1.65 ([#1140](https://github.com/rust-lang/cc-rs/pull/1140))
- Fix clippy warnings ([#1138](https://github.com/rust-lang/cc-rs/pull/1138))

## [1.0.105](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.104...cc-v1.0.105) - 2024-07-07

### Other
- Regenerate windows sys bindings ([#1132](https://github.com/rust-lang/cc-rs/pull/1132))
- Fix generate-windows-sys-bindings ([#1133](https://github.com/rust-lang/cc-rs/pull/1133))
- Fix gen-windows-sys-binding ([#1130](https://github.com/rust-lang/cc-rs/pull/1130))
- Fix gen-windows-sys-binding ([#1127](https://github.com/rust-lang/cc-rs/pull/1127))
- Update windows-bindgen requirement from 0.57 to 0.58 ([#1123](https://github.com/rust-lang/cc-rs/pull/1123))

## [1.0.104](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.103...cc-v1.0.104) - 2024-07-01

### Other
- Fixed link break about compile-time-requirements ([#1118](https://github.com/rust-lang/cc-rs/pull/1118))

## [1.0.103](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.102...cc-v1.0.103) - 2024-06-30

### Other
- Fix compilation for wasm: env WASI_SYSROOT should be optional ([#1114](https://github.com/rust-lang/cc-rs/pull/1114))

## [1.0.102](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.101...cc-v1.0.102) - 2024-06-29

### Other
- Fix invalid wasi targets compatibility ([#1105](https://github.com/rust-lang/cc-rs/pull/1105))
- Speedup regenerate-target-info and regenerate-windows-sys ([#1110](https://github.com/rust-lang/cc-rs/pull/1110))

## [1.0.101](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.100...cc-v1.0.101) - 2024-06-25

### Other
- Use `Build::getenv` instead of `env::var*` in anywhere that makes sense ([#1103](https://github.com/rust-lang/cc-rs/pull/1103))

## [1.0.100](https://github.com/rust-lang/cc-rs/compare/cc-v1.0.99...cc-v1.0.100) - 2024-06-23

### Other
- Update publish.yml to use release-plz ([#1101](https://github.com/rust-lang/cc-rs/pull/1101))
- Accept `OsStr` instead of `str` for flags ([#1100](https://github.com/rust-lang/cc-rs/pull/1100))
- Use `dep:` syntax to avoid implicit features. ([#1099](https://github.com/rust-lang/cc-rs/pull/1099))
- Minor clippy fixes. ([#1098](https://github.com/rust-lang/cc-rs/pull/1098))
- Fix WASI compilation for C++ ([#1083](https://github.com/rust-lang/cc-rs/pull/1083))
- Regenerate windows sys bindings ([#1096](https://github.com/rust-lang/cc-rs/pull/1096))
- Rename regenerate-windows-sys to regenerate-windows-sys.yml ([#1095](https://github.com/rust-lang/cc-rs/pull/1095))
- Create regenerate-windows-sys.yml ([#1094](https://github.com/rust-lang/cc-rs/pull/1094))
- Update windows-bindgen requirement from 0.56 to 0.57 ([#1091](https://github.com/rust-lang/cc-rs/pull/1091))
- Eagerly close tempfile to fix [#1082](https://github.com/rust-lang/cc-rs/pull/1082) ([#1087](https://github.com/rust-lang/cc-rs/pull/1087))
- Output msvc.exe in the output directory ([#1090](https://github.com/rust-lang/cc-rs/pull/1090))
- Fix clippy warnings on Windows ([#1088](https://github.com/rust-lang/cc-rs/pull/1088))
- Don't try to free DLL on drop ([#1089](https://github.com/rust-lang/cc-rs/pull/1089))
- Fix panic safety issue in StderrForwarder ([#1079](https://github.com/rust-lang/cc-rs/pull/1079))


---

<!-- source: archive/library/rust/references/packages/cfg-if/CHANGELOG--000949.md -->

## Imported source: archive/library/rust/references/packages/cfg-if/CHANGELOG--000949.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.4](https://github.com/rust-lang/cfg-if/compare/v1.0.3...v1.0.4) - 2025-10-15

- Support `cfg(true)` and `cfg(false)` ([#99](https://github.com/rust-lang/cfg-if/pull/99))
- Set and test a MSRV of 1.32
- Have a single top-level rule

## [1.0.3](https://github.com/rust-lang/cfg-if/compare/v1.0.2...v1.0.3) - 2025-08-19

- Revert "Remove `@__identity` rule."

## [1.0.2](https://github.com/rust-lang/cfg-if/compare/v1.0.1...v1.0.2) - 2025-08-19

- Remove `@__identity` rule.

## [1.0.1](https://github.com/rust-lang/cfg-if/compare/v1.0.0...v1.0.1) - 2025-06-09

- Remove `compiler-builtins` from `rustc-dep-of-std` dependencies
- Remove redundant configuration from Cargo.toml
- More readable formatting and identifier names. ([#39](https://github.com/rust-lang/cfg-if/pull/39))
- Add expanded example to readme ([#38](https://github.com/rust-lang/cfg-if/pull/38))


---

<!-- source: archive/library/rust/references/packages/displaydoc/CHANGELOG--001002.md -->

## Imported source: archive/library/rust/references/packages/displaydoc/CHANGELOG--001002.md

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- next-header -->

## [Unreleased] - ReleaseDate

# [0.2.5] - 2024-06-20

# Changed
 - Don't name the output of the const block to work around `non_local_definitions` error (#47)
 - Reference the `core` crate correctly to avoid clashes with modules named `core` (#45)
 - Explicitly list MSRV in Cargo.toml (#51)
 - Bump edition to 2021 (#51)

# [0.2.4] - 2022-05-02

## Added
- Updated `syn` dependency to 2.0
- Support for empty enums
- Implicitly require fmt::Display on all type parameters unless overridden

## Changed
- Bumped MSRV to 1.56

# [0.2.3] - 2021-07-16
## Added
- Added `#[displaydoc("..")]` attribute for overriding a doc comment

# [0.2.2] - 2021-07-01
## Added
- Added prefix feature to use the doc comment from an enum and prepend it
  before the error message from each variant.

# [0.2.1] - 2021-03-26
## Added
- Added opt in support for ignoring extra doc attributes

# [0.2.0] - 2021-03-16
## Changed

- (BREAKING) disallow multiple `doc` attributes in display impl
  [https://github.com/yaahc/displaydoc/pull/22]. Allowing and ignoring extra
  doc attributes made it too easy to accidentally create a broken display
  implementation with missing context without realizing it, this change turns
  that into a hard error and directs users towards block comments if multiple
  lines are needed.

<!-- next-url -->
[Unreleased]: https://github.com/yaahc/displaydoc/compare/v0.2.4...HEAD
[0.2.4]: https://github.com/yaahc/displaydoc/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/yaahc/displaydoc/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/yaahc/displaydoc/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/yaahc/displaydoc/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/yaahc/displaydoc/releases/tag/v0.2.0


---

<!-- source: archive/library/rust/references/packages/find-msvc-tools/CHANGELOG--000942.md -->

## Imported source: archive/library/rust/references/packages/find-msvc-tools/CHANGELOG--000942.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.5](https://github.com/rust-lang/cc-rs/compare/find-msvc-tools-v0.1.4...find-msvc-tools-v0.1.5) - 2025-11-14

### Other

- Add Visual Studio 2026 support ([#1609](https://github.com/rust-lang/cc-rs/pull/1609))

## [0.1.4](https://github.com/rust-lang/cc-rs/compare/find-msvc-tools-v0.1.3...find-msvc-tools-v0.1.4) - 2025-10-10

### Other

- Allow using VCToolsVersion to request a specific msvc version ([#1589](https://github.com/rust-lang/cc-rs/pull/1589))
- Regenerate windows sys bindings ([#1591](https://github.com/rust-lang/cc-rs/pull/1591))

## [0.1.3](https://github.com/rust-lang/cc-rs/compare/find-msvc-tools-v0.1.2...find-msvc-tools-v0.1.3) - 2025-10-03

### Other

- Regenerate windows sys bindings ([#1572](https://github.com/rust-lang/cc-rs/pull/1572))

## [0.1.2](https://github.com/rust-lang/cc-rs/compare/find-msvc-tools-v0.1.1...find-msvc-tools-v0.1.2) - 2025-09-19

### Other

- [win] Search the Windows SDK for tools as well ([#1553](https://github.com/rust-lang/cc-rs/pull/1553))

## [0.1.1](https://github.com/rust-lang/cc-rs/compare/find-msvc-tools-v0.1.0...find-msvc-tools-v0.1.1) - 2025-09-05

### Other

- Regenerate windows sys bindings ([#1548](https://github.com/rust-lang/cc-rs/pull/1548))
- Add fn get_ucrt_dir for find-msvc-tools ([#1546](https://github.com/rust-lang/cc-rs/pull/1546))


---

<!-- source: archive/library/rust/references/packages/getrandom/CHANGELOG--001032.md -->

## Imported source: archive/library/rust/references/packages/getrandom/CHANGELOG--001032.md

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.16] - 2025-04-22
### Added
- Cygwin support (backport of [#626]) [#654]

[#626]: https://github.com/rust-random/getrandom/pull/626
[#654]: https://github.com/rust-random/getrandom/pull/654

## [0.2.15] - 2024-05-06
### Added
- Apple visionOS support [#410]

### Changed
- Use `libc::getrandom` on DragonflyBSD, FreeBSD, illumos, and Solaris [#411] [#416] [#417] [#420]
- Unify `libc::getentropy`-based implementations [#418]

[#410]: https://github.com/rust-random/getrandom/pull/410
[#411]: https://github.com/rust-random/getrandom/pull/411
[#416]: https://github.com/rust-random/getrandom/pull/416
[#417]: https://github.com/rust-random/getrandom/pull/417
[#418]: https://github.com/rust-random/getrandom/pull/418
[#420]: https://github.com/rust-random/getrandom/pull/420

## [0.2.14] - 2024-04-08
### Fixed
- Enable `/dev/urandom` fallback for MUSL-based Linux targets [#408]

[#408]: https://github.com/rust-random/getrandom/pull/408

## [0.2.13] - 2024-04-06
### Added
- `linux_disable_fallback` crate feature to disable `/dev/urandom`-based fallback on Linux and
  Android targets. Enabling this feature bumps minimum supported Linux kernel version to 3.17 and
  Android API level to 23 (Marshmallow). [#396]

### Changed
- Disable `/dev/urandom` fallback for Linux targets outside of the following `target_arch`es:
  `aarch64`, `arm`, `powerpc`, `powerpc64`, `s390x`, `x86`, `x86_64` [#396]
- Do not catch `EPERM` error code on Android while checking availability of
  the `getrandom` syscall [#396]

[#396]: https://github.com/rust-random/getrandom/pull/396

## [0.2.12] - 2024-01-09
### Fixed
- Custom backend for targets without atomics [#385]

### Changed
- Improve robustness of the Hermit backend and `sys_fill_exact` [#386]
- Raise minimum supported Apple OS versions to macOS 10.12 and iOS 10 [#388]

### Added
- Document platform support policy [#387]

[#385]: https://github.com/rust-random/getrandom/pull/385
[#386]: https://github.com/rust-random/getrandom/pull/386
[#387]: https://github.com/rust-random/getrandom/pull/387
[#388]: https://github.com/rust-random/getrandom/pull/388

## [0.2.11] - 2023-11-08
### Added
- GNU/Hurd support [#370]

### Changed
- Renamed `__getrandom_internal` to `__GETRANDOM_INTERNAL`  [#369]
- Updated link to Hermit docs [#374]

[#369]: https://github.com/rust-random/getrandom/pull/369
[#370]: https://github.com/rust-random/getrandom/pull/370
[#374]: https://github.com/rust-random/getrandom/pull/374

## [0.2.10] - 2023-06-06
### Added
- Support for PS Vita (`armv7-sony-vita-newlibeabihf`) [#359]

### Changed
- Use getentropy from libc on Emscripten targets [#362]

[#359]: https://github.com/rust-random/getrandom/pull/359
[#362]: https://github.com/rust-random/getrandom/pull/362

## [0.2.9] - 2023-04-06
### Added
- AIX support [#282]
- `getrandom_uninit` function [#291]
- `wasm64-unknown-unknown` support [#303]
- tvOS and watchOS support [#317]
- QNX/nto support [#325]
- Support for `getrandom` syscall on NetBSD ≥ 10.0 [#331]
- `RtlGenRandom` fallback for non-UWP Windows [#337]

### Breaking Changes
- Update MSRV to 1.36 [#291]

### Fixed
- Solaris/OpenBSD/Dragonfly build [#301]

### Changed
- Update MSRV to 1.36 [#291]
- Use getentropy on Emscripten [#307]
- Solaris: consistantly use `/dev/random` source [#310]
- Move 3ds selection above rdrand/js/custom fallback [#312]
- Remove buffer zeroing from Node.js implementation [#315]
- Use `open` instead of `open64` [#326]
- Remove #cfg from bsd_arandom.rs [#332]
- Hermit: use `sys_read_entropy` syscall [#333]
- Eliminate potential panic in sys_fill_exact [#334]
- rdrand: Remove checking for 0 and !0 and instead check CPU family and do a self-test [#335]
- Move `__getrandom_custom` definition into a const block [#344]
- Switch the custom backend to Rust ABI [#347]

[#282]: https://github.com/rust-random/getrandom/pull/282
[#291]: https://github.com/rust-random/getrandom/pull/291
[#301]: https://github.com/rust-random/getrandom/pull/301
[#303]: https://github.com/rust-random/getrandom/pull/303
[#307]: https://github.com/rust-random/getrandom/pull/307
[#310]: https://github.com/rust-random/getrandom/pull/310
[#312]: https://github.com/rust-random/getrandom/pull/312
[#315]: https://github.com/rust-random/getrandom/pull/315
[#317]: https://github.com/rust-random/getrandom/pull/317
[#325]: https://github.com/rust-random/getrandom/pull/325
[#326]: https://github.com/rust-random/getrandom/pull/326
[#331]: https://github.com/rust-random/getrandom/pull/331
[#332]: https://github.com/rust-random/getrandom/pull/332
[#333]: https://github.com/rust-random/getrandom/pull/333
[#334]: https://github.com/rust-random/getrandom/pull/334
[#335]: https://github.com/rust-random/getrandom/pull/335
[#337]: https://github.com/rust-random/getrandom/pull/337
[#344]: https://github.com/rust-random/getrandom/pull/344
[#347]: https://github.com/rust-random/getrandom/pull/347

## [0.2.8] - 2022-10-20
### Changed
- The [Web Cryptography API] will now be preferred on `wasm32-unknown-unknown`
  when using the `"js"` feature, even on Node.js [#284] [#295]

### Added
- Added benchmarks to track buffer initialization cost [#272]

### Fixed
- Use `$crate` in `register_custom_getrandom!` [#270]

### Documentation
- Add information about enabling `"js"` feature [#280]
- Fix link to `wasm-bindgen` [#278]
- Document the varied implementations for underlying randomness sources [#276]

[Web Cryptography API]: https://developer.mozilla.org/en-US/docs/Web/API/Web_Crypto_API
[#284]: https://github.com/rust-random/getrandom/pull/284
[#295]: https://github.com/rust-random/getrandom/pull/295
[#272]: https://github.com/rust-random/getrandom/pull/272
[#270]: https://github.com/rust-random/getrandom/pull/270
[#280]: https://github.com/rust-random/getrandom/pull/280
[#278]: https://github.com/rust-random/getrandom/pull/278
[#276]: https://github.com/rust-random/getrandom/pull/276

## [0.2.7] - 2022-06-14
### Changed
- Update `wasi` dependency to `0.11` [#253]

### Fixed
- Use `AtomicPtr` instead of `AtomicUsize` for Strict Provenance compatibility. [#263]

### Documentation
- Add comments explaining use of fallback mechanisms [#257] [#260]

[#263]: https://github.com/rust-random/getrandom/pull/263
[#260]: https://github.com/rust-random/getrandom/pull/260
[#253]: https://github.com/rust-random/getrandom/pull/253
[#257]: https://github.com/rust-random/getrandom/pull/257

## [0.2.6] - 2022-03-28
### Added
- Nintendo 3DS (`armv6k-nintendo-3ds`) support [#248]

### Changed
- Retry `open` when interrupted [#252]

[#248]: https://github.com/rust-random/getrandom/pull/248
[#252]: https://github.com/rust-random/getrandom/pull/252

## [0.2.5] - 2022-02-22
### Added
- ESP-IDF targets (`*‑espidf`) support [#245]

### Fixed
- Webpack warning caused by dynamic require [#234]
- Error checking on iOS for `SecRandomCopyBytes` [#244]

[#234]: https://github.com/rust-random/getrandom/pull/234
[#244]: https://github.com/rust-random/getrandom/pull/244
[#245]: https://github.com/rust-random/getrandom/pull/245

## [0.2.4] - 2021-12-13
### Changed
- Use explicit imports in the `js` backend [#220]
- Use `/dev/urandom` on Redox instead of `rand:` [#222]
- Use `NonZeroU32::new_unchecked` to convert wasi error [#233]

### Added
- SOLID targets (`*-kmc-solid_*`) support [#235]
- Limited Hermit (`x86_64-unknown-hermit`) support [#236]

[#220]: https://github.com/rust-random/getrandom/pull/220
[#222]: https://github.com/rust-random/getrandom/pull/222
[#233]: https://github.com/rust-random/getrandom/pull/233
[#235]: https://github.com/rust-random/getrandom/pull/235
[#236]: https://github.com/rust-random/getrandom/pull/236

## [0.2.3] - 2021-04-10
### Changed
- Replace build.rs with link attributes. [#205]
- Add support for getrandom syscall on DragonFly BSD. [#210]
- Improve Node.js detection. [#215]

[#205]: https://github.com/rust-random/getrandom/pull/205
[#210]: https://github.com/rust-random/getrandom/pull/210
[#215]: https://github.com/rust-random/getrandom/pull/215

## [0.2.2] - 2021-01-19
### Changed
- Forward `rustc-dep-of-std` to dependencies. [#198]
- Highlight feature-dependent functionality in documentation using the `doc_cfg` feature. [#200]

[#198]: https://github.com/rust-random/getrandom/pull/198
[#200]: https://github.com/rust-random/getrandom/pull/200

## [0.2.1] - 2021-01-03
### Changed
- Update `cfg-if` to v1.0. [#166]
- Update `wasi` to v0.10. [#167]

### Fixed
- Multithreaded WASM support. [#165]

### Removed
- Windows XP support. [#177]
- Direct `stdweb` support. [#178]
- CloudABI support. [#184]

[#165]: https://github.com/rust-random/getrandom/pull/165
[#166]: https://github.com/rust-random/getrandom/pull/166
[#167]: https://github.com/rust-random/getrandom/pull/167
[#177]: https://github.com/rust-random/getrandom/pull/177
[#178]: https://github.com/rust-random/getrandom/pull/178
[#184]: https://github.com/rust-random/getrandom/pull/184

## [0.2.0] - 2020-09-10
### Features for using getrandom on unsupported targets

The following (off by default) Cargo features have been added:
- `"rdrand"` - use the RDRAND instruction on `no_std` `x86`/`x86_64` targets [#133]
- `"js"` - use JavaScript calls on `wasm32-unknown-unknown` [#149]
  - Replaces the `stdweb` and `wasm-bindgen` features (which are removed)
- `"custom"` - allows a user to specify a custom implementation [#109]

### Breaking Changes
- Unsupported targets no longer compile [#107]
- Change/Add `Error` constants [#120]
- Only impl `std` traits when the `"std"` Cargo feature is specified [#106]
- Remove official support for Hermit, L4Re, and UEFI [#133]
- Remove optional `"log"` dependency [#131]
- Update minimum supported Linux kernel to 2.6.32 [#153]
- Update MSRV to 1.34 [#159]

[#106]: https://github.com/rust-random/getrandom/pull/106
[#107]: https://github.com/rust-random/getrandom/pull/107
[#109]: https://github.com/rust-random/getrandom/pull/109
[#120]: https://github.com/rust-random/getrandom/pull/120
[#131]: https://github.com/rust-random/getrandom/pull/131
[#133]: https://github.com/rust-random/getrandom/pull/133
[#149]: https://github.com/rust-random/getrandom/pull/149
[#153]: https://github.com/rust-random/getrandom/pull/153
[#159]: https://github.com/rust-random/getrandom/pull/159

## [0.1.16] - 2020-12-31
### Changed
- Update `cfg-if` to v1.0. [#173]
- Implement `std::error::Error` for the `Error` type on additional targets. [#169]

### Fixed
- Multithreaded WASM support. [#171]

[#173]: https://github.com/rust-random/getrandom/pull/173
[#171]: https://github.com/rust-random/getrandom/pull/171
[#169]: https://github.com/rust-random/getrandom/pull/169

## [0.1.15] - 2020-09-10
### Changed
- Added support for Internet Explorer 11 [#139]
- Fix Webpack require warning with `wasm-bindgen` [#137]

[#137]: https://github.com/rust-random/getrandom/pull/137
[#139]: https://github.com/rust-random/getrandom/pull/139

## [0.1.14] - 2020-01-07
### Changed
- Remove use of spin-locks in the `use_file` module. [#125]
- Update `wasi` to v0.9. [#126]
- Do not read errno value on DragonFlyBSD to fix compilation failure. [#129]

[#125]: https://github.com/rust-random/getrandom/pull/125
[#126]: https://github.com/rust-random/getrandom/pull/126
[#129]: https://github.com/rust-random/getrandom/pull/129

## [0.1.13] - 2019-08-25
### Added
- VxWorks targets support. [#86]

### Changed
- If zero-length slice is passed to the `getrandom` function, always return
`Ok(())` immediately without doing any calls to the underlying operating
system. [#104]
- Use the `kern.arandom` sysctl on NetBSD. [#115]

### Fixed
- Bump `cfg-if` minimum version from 0.1.0 to 0.1.2. [#112]
- Typos and bad doc links. [#117]

[#86]: https://github.com/rust-random/getrandom/pull/86
[#104]: https://github.com/rust-random/getrandom/pull/104
[#112]: https://github.com/rust-random/getrandom/pull/112
[#115]: https://github.com/rust-random/getrandom/pull/115
[#117]: https://github.com/rust-random/getrandom/pull/117

## [0.1.12] - 2019-08-18
### Changed
- Update wasi dependency from v0.5 to v0.7. [#100]

[#100]: https://github.com/rust-random/getrandom/pull/100

## [0.1.11] - 2019-08-25
### Fixed
- Implement `std`-dependent traits for selected targets even if `std`
feature is disabled. (backward compatibility with v0.1.8) [#96]

[#96]: https://github.com/rust-random/getrandom/pull/96

## [0.1.10] - 2019-08-18 [YANKED]
### Changed
- Use the dummy implementation on `wasm32-unknown-unknown` even with the
disabled `dummy` feature. [#90]

### Fixed
- Fix CSP error for `wasm-bindgen`. [#92]

[#90]: https://github.com/rust-random/getrandom/pull/90
[#92]: https://github.com/rust-random/getrandom/pull/92

## [0.1.9] - 2019-08-14 [YANKED]
### Changed
- Remove `std` dependency for opening and reading files. [#58]
- Use `wasi` instead of `libc` on WASI target. [#64]
- By default emit a compile-time error when built for an unsupported target.
This behaviour can be disabled by using the `dummy` feature. [#71]

### Added
- Add support for UWP targets. [#69]
- Add unstable `rustc-dep-of-std` feature. [#78]

[#58]: https://github.com/rust-random/getrandom/pull/58
[#64]: https://github.com/rust-random/getrandom/pull/64
[#69]: https://github.com/rust-random/getrandom/pull/69
[#71]: https://github.com/rust-random/getrandom/pull/71
[#78]: https://github.com/rust-random/getrandom/pull/78

## [0.1.8] - 2019-07-29
### Changed
- Explicitly specify types to arguments of 'libc::syscall'. [#74]

[#74]: https://github.com/rust-random/getrandom/pull/74

## [0.1.7] - 2019-07-29
### Added
- Support for hermit and l4re. [#61]
- `Error::raw_os_error` method, `Error::INTERNAL_START` and
`Error::CUSTOM_START` constants. Use `libc` for retrieving OS error descriptions. [#54]

### Changed
- Remove `lazy_static` dependency and use custom structures for lock-free
initialization. [#51] [#52]
- Try `getrandom()` first on FreeBSD. [#57]

### Removed
-  Bitrig support. [#56]

### Deprecated
- `Error::UNKNOWN`, `Error::UNAVAILABLE`. [#54]

[#51]: https://github.com/rust-random/getrandom/pull/51
[#52]: https://github.com/rust-random/getrandom/pull/52
[#54]: https://github.com/rust-random/getrandom/pull/54
[#56]: https://github.com/rust-random/getrandom/pull/56
[#57]: https://github.com/rust-random/getrandom/pull/57
[#61]: https://github.com/rust-random/getrandom/pull/61

## [0.1.6] - 2019-06-30
### Changed
- Minor change of RDRAND AMD bug handling. [#48]

[#48]: https://github.com/rust-random/getrandom/pull/48

## [0.1.5] - 2019-06-29
### Fixed
- Use shared `File` instead of shared file descriptor. [#44]
- Workaround for RDRAND hardware bug present on some AMD CPUs. [#43]

### Changed
- Try `getentropy` and then fallback to `/dev/random` on macOS. [#38]

[#38]: https://github.com/rust-random/getrandom/issues/38
[#43]: https://github.com/rust-random/getrandom/pull/43
[#44]: https://github.com/rust-random/getrandom/issues/44

## [0.1.4] - 2019-06-28
### Added
- Add support for `x86_64-unknown-uefi` target by using RDRAND with CPUID
feature detection. [#30]

### Fixed
- Fix long buffer issues on Windows and Linux. [#31] [#32]
- Check `EPERM` in addition to `ENOSYS` on Linux. [#37]

### Changed
- Improve efficiency by sharing file descriptor across threads. [#13]
- Remove `cloudabi`, `winapi`, and `fuchsia-cprng` dependencies. [#40]
- Improve RDRAND implementation. [#24]
- Don't block during syscall detection on Linux. [#26]
- Increase consistency with libc implementation on FreeBSD. [#36]
- Apply `rustfmt`. [#39]

[#30]: https://github.com/rust-random/getrandom/pull/30
[#13]: https://github.com/rust-random/getrandom/issues/13
[#40]: https://github.com/rust-random/getrandom/pull/40
[#26]: https://github.com/rust-random/getrandom/pull/26
[#24]: https://github.com/rust-random/getrandom/pull/24
[#39]: https://github.com/rust-random/getrandom/pull/39
[#36]: https://github.com/rust-random/getrandom/pull/36
[#31]: https://github.com/rust-random/getrandom/issues/31
[#32]: https://github.com/rust-random/getrandom/issues/32
[#37]: https://github.com/rust-random/getrandom/issues/37

## [0.1.3] - 2019-05-15
- Update for `wasm32-unknown-wasi` being renamed to `wasm32-wasi`, and for
  WASI being categorized as an OS.

## [0.1.2] - 2019-04-06
- Add support for `wasm32-unknown-wasi` target.

## [0.1.1] - 2019-04-05
- Enable std functionality for CloudABI by default.

## [0.1.0] - 2019-03-23
Publish initial implementation.

## [0.0.0] - 2019-01-19
Publish an empty template library.

[0.2.16]: https://github.com/rust-random/getrandom/compare/v0.2.15...v0.2.16
[0.2.15]: https://github.com/rust-random/getrandom/compare/v0.2.14...v0.2.15
[0.2.14]: https://github.com/rust-random/getrandom/compare/v0.2.13...v0.2.14
[0.2.13]: https://github.com/rust-random/getrandom/compare/v0.2.12...v0.2.13
[0.2.12]: https://github.com/rust-random/getrandom/compare/v0.2.11...v0.2.12
[0.2.11]: https://github.com/rust-random/getrandom/compare/v0.2.10...v0.2.11
[0.2.10]: https://github.com/rust-random/getrandom/compare/v0.2.9...v0.2.10
[0.2.9]: https://github.com/rust-random/getrandom/compare/v0.2.8...v0.2.9
[0.2.8]: https://github.com/rust-random/getrandom/compare/v0.2.7...v0.2.8
[0.2.7]: https://github.com/rust-random/getrandom/compare/v0.2.6...v0.2.7
[0.2.6]: https://github.com/rust-random/getrandom/compare/v0.2.5...v0.2.6
[0.2.5]: https://github.com/rust-random/getrandom/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/rust-random/getrandom/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/rust-random/getrandom/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/rust-random/getrandom/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/rust-random/getrandom/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/rust-random/getrandom/compare/v0.1.15...v0.2.0
[0.1.16]: https://github.com/rust-random/getrandom/compare/v0.1.15...v0.1.16
[0.1.15]: https://github.com/rust-random/getrandom/compare/v0.1.14...v0.1.15
[0.1.14]: https://github.com/rust-random/getrandom/compare/v0.1.13...v0.1.14
[0.1.13]: https://github.com/rust-random/getrandom/compare/v0.1.12...v0.1.13
[0.1.12]: https://github.com/rust-random/getrandom/compare/v0.1.11...v0.1.12
[0.1.11]: https://github.com/rust-random/getrandom/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/rust-random/getrandom/compare/v0.1.9...v0.1.10
[0.1.9]: https://github.com/rust-random/getrandom/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/rust-random/getrandom/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/rust-random/getrandom/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/rust-random/getrandom/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/rust-random/getrandom/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/rust-random/getrandom/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/rust-random/getrandom/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/rust-random/getrandom/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/rust-random/getrandom/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/rust-random/getrandom/compare/v0.0.0...v0.1.0
[0.0.0]: https://github.com/rust-random/getrandom/releases/tag/v0.0.0


---

<!-- source: archive/library/rust/references/packages/h2/CHANGELOG--001017.md -->

## Imported source: archive/library/rust/references/packages/h2/CHANGELOG--001017.md

# 0.3.27 (July 11, 2025)

* Fix notifying wakers when detecting local stream errors.

# 0.3.26 (April 3, 2024)

* Limit number of CONTINUATION frames for misbehaving connections.

# 0.3.25 (March 15, 2024)

* Improve performance decoding many headers.

# 0.3.24 (January 17, 2024)

* Limit error resets for misbehaving connections.

# 0.3.23 (January 10, 2024)

* Backport fix from 0.4.1 for stream capacity assignment.

# 0.3.22 (November 15, 2023)

* Add `header_table_size(usize)` option to client and server builders.
* Improve throughput when vectored IO is not available.
* Update indexmap to 2.

# 0.3.21 (August 21, 2023)

* Fix opening of new streams over peer's max concurrent limit.
* Fix `RecvStream` to return data even if it has received a `CANCEL` stream error.
* Update MSRV to 1.63.

# 0.3.20 (June 26, 2023)

* Fix panic if a server received a request with a `:status` pseudo header in the 1xx range.
* Fix panic if a reset stream had pending push promises that were more than allowed.
* Fix potential flow control overflow by subtraction, instead returning a connection error.

# 0.3.19 (May 12, 2023)

* Fix counting reset streams when triggered by a GOAWAY.
* Send `too_many_resets` in opaque debug data of GOAWAY when too many resets received.

# 0.3.18 (April 17, 2023)

* Fix panic because of opposite check in `is_remote_local()`.

# 0.3.17 (April 13, 2023)

* Add `Error::is_library()` method to check if the originated inside `h2`.
* Add `max_pending_accept_reset_streams(usize)` option to client and server
  builders.
* Fix theoretical memory growth when receiving too many HEADERS and then
  RST_STREAM frames faster than an application can accept them off the queue.
  (CVE-2023-26964)

# 0.3.16 (February 27, 2023)

* Set `Protocol` extension on requests when received Extended CONNECT requests.
* Remove `B: Unpin + 'static` bound requiremented of bufs
* Fix releasing of frames when stream is finished, reducing memory usage.
* Fix panic when trying to send data and connection window is available, but stream window is not.
* Fix spurious wakeups when stream capacity is not available.

# 0.3.15 (October 21, 2022)

* Remove `B: Buf` bound on `SendStream`'s parameter
* add accessor for `StreamId` u32

# 0.3.14 (August 16, 2022)

* Add `Error::is_reset` function.
* Bump MSRV to Rust 1.56.
* Return `RST_STREAM(NO_ERROR)` when the server early responds.

# 0.3.13 (March 31, 2022)

* Update private internal `tokio-util` dependency.

# 0.3.12 (March 9, 2022)

* Avoid time operations that can panic (#599)
* Bump MSRV to Rust 1.49 (#606)
* Fix header decoding error when a header name is contained at a continuation
  header boundary (#589)
* Remove I/O type names from handshake `tracing` spans (#608)

# 0.3.11 (January 26, 2022)

* Make `SendStream::poll_capacity` never return `Ok(Some(0))` (#596)
* Fix panic when receiving already reset push promise (#597)

# 0.3.10 (January 6, 2022)

* Add `Error::is_go_away()` and `Error::is_remote()` methods.
* Fix panic if receiving malformed PUSH_PROMISE with stream ID of 0.

# 0.3.9 (December 9, 2021)

* Fix hang related to new `max_send_buffer_size`.

# 0.3.8 (December 8, 2021)

* Add "extended CONNECT support". Adds `h2::ext::Protocol`, which is used for request and response extensions to connect new protocols over an HTTP/2 stream.
* Add `max_send_buffer_size` options to client and server builders, and a default of ~400MB. This acts like a high-water mark for the `poll_capacity()` method.
* Fix panic if receiving malformed HEADERS with stream ID of 0.

# 0.3.7 (October 22, 2021)

* Fix panic if server sends a malformed frame on a stream client was about to open.
* Fix server to treat `:status` in a request as a stream error instead of connection error.

# 0.3.6 (September 30, 2021)

* Fix regression of `h2::Error` that were created via `From<h2::Reason>` not returning their reason code in `Error::reason()`.

# 0.3.5 (September 29, 2021)

* Fix sending of very large headers. Previously when a single header was too big to fit in a single `HEADERS` frame, an error was returned. Now it is broken up and sent correctly.
* Fix buffered data field to be a bigger integer size.
* Refactor error format to include what initiated the error (remote, local, or user), if it was a stream or connection-level error, and any received debug data.

# 0.3.4 (August 20, 2021)

* Fix panic when encoding header size update over a certain size.
* Fix `SendRequest` to wake up connection when dropped.
* Fix potential hang if `RecvStream` is placed in the request or response `extensions`.
* Stop calling `Instant::now` if zero reset streams are configured.

# 0.3.3 (April 29, 2021)

* Fix client being able to make `CONNECT` requests without a `:path`.
* Expose `RecvStream::poll_data`.
* Fix some docs.

# 0.3.2 (March 24, 2021)

* Fix incorrect handling of received 1xx responses on the client when the request body is still streaming.

# 0.3.1 (February 26, 2021)

* Add `Connection::max_concurrent_recv_streams()` getter.
* Add `Connection::max_concurrent_send_streams()` getter.
* Fix client to ignore receipt of 1xx headers frames.
* Fix incorrect calculation of pseudo header lengths when determining if a received header is too big.
* Reduce monomorphized code size of internal code.

# 0.3.0 (December 23, 2020)

* Update to Tokio v1 and Bytes v1.
* Disable `tracing`'s `log` feature. (It can still be enabled by a user in their own `Cargo.toml`.)

# 0.2.7 (October 22, 2020)

* Fix stream ref count when sending a push promise
* Fix receiving empty DATA frames in response to a HEAD request
* Fix handling of client disabling SERVER_PUSH

# 0.2.6 (July 13, 2020)

* Integrate `tracing` directly where `log` was used. (For 0.2.x, `log`s are still emitted by default.)

# 0.2.5 (May 6, 2020)

* Fix rare debug assert failure in store shutdown.

# 0.2.4 (March 30, 2020)

* Fix when receiving `SETTINGS_HEADER_TABLE_SIZE` setting.

# 0.2.3 (March 25, 2020)

* Fix server being able to accept `CONNECT` requests without `:scheme` or `:path`.
* Fix receiving a GOAWAY frame from updating the recv max ID, it should only update max send ID.

# 0.2.2 (March 3, 2020)

* Reduce size of `FlowControl` and `RecvStream`.

# 0.2.1 (December 6, 2019)

* Relax `Unpin` bounds on the send `Buf` generic.

# 0.2.0 (December 3, 2019)

* Add `server::Connection::set_initial_window_size` and `client::Connection::set_initial_window_size` which can adjust the `INITIAL_WINDOW_SIZE` setting on an existing connection (#421).
* Update to `http` v0.2.
* Update to `tokio` v0.2.
* Change `unstable-stream` feature to `stream`.
* Change `ReserveCapacity` to `FlowControl` (#423).
* Remove `From<io::Error>` for `Error`.

# 0.2.0-alpha.3 (October 1, 2019)

* Update to futures `0.3.0-alpha.19`.
* Update to tokio `0.2.0-alpha.6`.

# 0.2.0-alpha.2 (September 20, 2019)

* Add server support for `PUSH_PROMISE`s (#327).
* Update to tokio `0.2.0-alpha.5`.
* Change `stream` feature to `unstable-stream`.

# 0.2.0-alpha.1 (August 30, 2019)

* Update from `futures` 0.1 to `std::future::Future`.
* Update `AsyncRead`/`AsyncWrite` to `tokio-io` 0.2 alpha.
* Change `Stream` implementations to be optional, default disabled. Specific async and poll functions are now inherent, and `Stream` can be re-enabled with the `stream` cargo feature.

# 0.1.25 (June 28, 2019)

* Fix to send a `RST_STREAM` instead of `GOAWAY` if receiving a frame on a previously closed stream.
* Fix receiving trailers without an end-stream flag to be a stream error instead of connection error.

# 0.1.24 (June 17, 2019)

* Fix server wrongly rejecting requests that don't have an `:authority` header (#372).

# 0.1.23 (June 4, 2019)

* Fix leaking of received DATA frames if the `RecvStream` is never polled (#368).

# 0.1.22 (June 3, 2019)

* Fix rare panic when remote sends `RST_STREAM` or `GOAWAY` for a stream pending window capacity (#364).

# 0.1.21 (May 30, 2019)

* Fix write loop when a header didn't fit in write buffer.

# 0.1.20 (May 16, 2019)

* Fix lifetime conflict for older compilers.

# 0.1.19 (May 15, 2019)

* Fix rare crash if `CONTINUATION` frame resumed in the middle of headers with the same name.
* Fix HPACK encoder using an old evicted index for repeated header names.

# 0.1.18 (April 9, 2019)

* Fix `server::Connection::abrupt_shutdown` to no longer return the same error the user sent (#352).

# 0.1.17 (March 12, 2019)

* Add user PING support (#346).
* Fix notifying a `RecvStream` task if locally sending a reset.
* Fix connections "hanging" when all handles are dropped but some streams had been reset.

# 0.1.16 (January 24, 2019)

* Log header values when malformed (#342).

# 0.1.15 (January 12, 2019)

* Fix race condition bug related to shutting down the client (#338).

# 0.1.14 (December 5, 2018)

* Fix closed streams to always return window capacity to the connection (#334).
* Fix locking when `Debug` printing an `OpaqueStreamRef` (#333).
* Fix inverted split for DATA frame padding (#330).
* Reduce `Debug` noise for `Frame` (#329).

# 0.1.13 (October 16, 2018)

* Add client support for Push Promises (#314).
* Expose `io::Error` from `h2::Error` (#311)
* Misc bug fixes (#304, #309, #319, #313, #320).

# 0.1.12 (August 8, 2018)

* Fix initial send window size (#301).
* Fix panic when calling `reserve_capacity` after connection has been closed (#302).
* Fix handling of incoming `SETTINGS_INITIAL_WINDOW_SIZE`. (#299)

# 0.1.11 (July 31, 2018)

* Add `stream_id` accessors to public API types (#292).
* Fix potential panic when dropping clients (#295).
* Fix busy loop when shutting down server (#296).

# 0.1.10 (June 15, 2018)

* Fix potential panic in `SendRequest::poll_ready()` (#281).
* Fix infinite loop on reset connection during prefix (#285).

# 0.1.9 (May 31, 2018)

* Add `poll_reset` to `SendResponse` and `SendStream` (#279).

# 0.1.8 (May 23, 2018)

* Fix client bug when max streams is reached. (#277)

# 0.1.7 (May 14, 2018)

* Misc bug fixes (#266, #273, #261, #275).

# 0.1.6 (April 24, 2018)

* Misc bug fixes related to stream management (#258, #260, #262).

# 0.1.5 (April 6, 2018)

* Fix the `last_stream_id` sent during graceful GOAWAY (#254).

# 0.1.4 (April 5, 2018)

* Add `initial_connection_window_size` to client and server `Builder`s (#249).
* Add `graceful_shutdown` and `abrupt_shutdown` to `server::Connection`,
  deprecating `close_connection` (#250).

# 0.1.3 (March 28, 2018)

* Allow configuring max streams before the peer's settings frame is
  received (#242).
* Fix HPACK decoding bug with regards to large literals (#244).
* Fix state transition bug triggered by receiving a RST_STREAM frame (#247).

# 0.1.2 (March 13, 2018)

* Fix another bug relating to resetting connections and reaching
  max concurrency (#238).

# 0.1.1 (March 8, 2018)

* When streams are dropped, close the connection (#222).
* Notify send tasks on connection error (#231).
* Fix bug relating to resetting connections and reaching max concurrency (#235).
* Normalize HTTP request path to satisfy HTTP/2.0 specification (#228).
* Update internal dependencies.

# 0.1.0 (Jan 12, 2018)

* Initial release


---

<!-- source: archive/library/rust/references/packages/h2/CHANGELOG--001061.md -->

## Imported source: archive/library/rust/references/packages/h2/CHANGELOG--001061.md

# 1.2.0

* Adds `bytes` module to support operating directly on byte strings.

# 1.1.0

* Adds the `std` feature (enabled by default)
* Disabling the `std` feature makes the crate work in `#![no_std]` mode, assuming presence of the `alloc` crate

# 1.0.0

* Adds the `join` convenience function.
* Fixes parsing of `'\\n'` to match the behavior of bash/Zsh/Python `shlex`. The result was previously `\n`, now it is `\\n`.

# 0.1.1

* Adds handling of `#` comments.

# 0.1.0

This is the initial release.


---

<!-- source: archive/library/rust/references/packages/hashbrown/CHANGELOG--000939.md -->

## Imported source: archive/library/rust/references/packages/hashbrown/CHANGELOG--000939.md

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.16.1](https://github.com/rust-lang/hashbrown/compare/v0.16.0...v0.16.1) - 2025-11-20

### Added

- Added `HashTable` methods related to the raw bucket index (#657)
- Added `VacantEntryRef::insert_with_key` (#579)

### Changed

- Removed specialization for `Copy` types (#662)
- The `get_many_mut` family of methods have been renamed to `get_disjoint_mut`
  to match the standard library. The old names are still present for now, but
  deprecated. (#648)
- Recognize and use over-sized allocations when using custom allocators. (#523)
- Depend on `serde_core` instead of `serde`. (#649)
- Optimized `collect` on rayon parallel iterators. (#652) 

## [0.16.0](https://github.com/rust-lang/hashbrown/compare/v0.15.5...v0.16.0) - 2025-08-28

### Changed

- Bump foldhash, the default hasher, to 0.2.0.
- Replaced `DefaultHashBuilder` with a newtype wrapper around `foldhash` instead
  of re-exporting it directly.

## [0.15.5](https://github.com/rust-lang/hashbrown/compare/v0.15.4...v0.15.5) - 2025-08-07

### Added

- Added `Entry::or_default_entry` and `Entry::or_insert_entry`.

### Changed

- Re-implemented likely/unlikely with `#[cold]`

## [0.15.4](https://github.com/rust-lang/hashbrown/compare/v0.15.3...v0.15.4) - 2025-06-05

### Changed

- Removed optional dependency on compiler-builtins. This only affects building as part of `std`.

## [0.15.3](https://github.com/rust-lang/hashbrown/compare/v0.15.2...v0.15.3) - 2025-04-29

### Added

- SIMD implementation for LoongArch (#592, requires nightly)

### Changed

- Optimized insertion path by avoiding an unnecessary `match_empty` (#607)
- Increased minimum table size for small types (#615)
- Dropped FnMut trait bounds from `ExtractIf` data structures (#616)
- Relaxed constraint in `hash_map::EntryRef` insertion methods `K: From<&Q>` to &Q: `Into<K>` (#611)
- Added allocator template argument for `rustc_iter` (#605)
- The `allocator-api2/nightly` feature is no longer enabled by `hashbrown/nightly` (#606)

## [v0.15.2] - 2024-11-14

### Added

- Marked `const fn` constructors as `rustc_const_stable_indirect` when built as
  part of the standard library. (#586)

## [v0.15.1] - 2024-11-03

This release removes the `borsh` feature introduced in 0.15.0 because it was
found to be incorrectly implemented. Users should use the `hashbrown` feature of
the `borsh` crate instead which provides the same trait implementations.

## ~~[v0.15.0] - 2024-10-01~~

This release was _yanked_ due to a broken implementation of the `borsh` feature.

This update contains breaking changes that remove the `raw` API with the hope of
centralising on the `HashTable` API in the future. You can follow the discussion
and progress in #545 to discuss features you think should be added to this API
that were previously only possible on the `raw` API.

### Added

- Added `borsh` feature with `BorshSerialize` and `BorshDeserialize` impls. (#525)
- Added `Assign` impls for `HashSet` operators. (#529)
- Added `Default` impls for iterator types. (#542)
- Added `HashTable::iter_hash{,_mut}` methods. (#549)
- Added `Hash{Table,Map,Set}::allocation_size` methods. (#553)
- Implemented `Debug` and `FusedIterator` for all `HashTable` iterators. (#561)
- Specialized `Iterator::fold` for all `HashTable` iterators. (#561)

### Changed

- Changed `hash_set::VacantEntry::insert` to return `OccupiedEntry`. (#495)
- Improved`hash_set::Difference::size_hint` lower-bound. (#530)
- Improved `HashSet::is_disjoint` performance. (#531)
- `equivalent` feature is now enabled by default. (#532)
- `HashSet` operators now return a set with the same allocator. (#529)
- Changed the default hasher to foldhash. (#563)
- `ahash` feature has been renamed to `default-hasher`. (#533)
- Entry API has been reworked and several methods have been renamed. (#535)
- `Hash{Map,Set}::insert_unique_unchecked` is now unsafe. (#556)
- The signature of `get_many_mut` and related methods was changed. (#562)

### Fixed

* Fixed typos, stray backticks in docs. (#558, #560)

### Removed

- Raw entry API is now under `raw-entry` feature, to be eventually removed. (#534, #555)
- Raw table API has been made private and the `raw` feature is removed;
  in the future, all code should be using the `HashTable` API instead. (#531, #546)
- `rykv` feature was removed; this is now provided by the `rykv` crate instead. (#554)
- `HashSet::get_or_insert_owned` was removed in favor of `get_or_insert_with`. (#555)

## [v0.14.5] - 2024-04-28

### Fixed

- Fixed index calculation in panic guard of `clone_from_impl`. (#511)

## ~~[v0.14.4] - 2024-03-19~~

This release was _yanked_ due to a breaking change.

## [v0.14.3] - 2023-11-26

### Added

- Specialized `fold` implementation of iterators. (#480)

### Fixed

- Avoid using unstable `ptr::invalid_mut` on nightly. (#481)

## [v0.14.2] - 2023-10-19

### Added

- `HashTable` type which provides a low-level but safe API with explicit hashing. (#466)

### Fixed

- Disabled the use of NEON instructions on big-endian ARM. (#475)
- Disabled the use of NEON instructions on Miri. (#476)

## [v0.14.1] - 2023-09-28

### Added

- Allow serializing `HashMap`s that use a custom allocator. (#449)

### Changed

- Use the `Equivalent` trait from the `equivalent` crate. (#442)
- Slightly improved performance of table resizing. (#451)
- Relaxed MSRV to 1.63.0. (#457)
- Removed `Clone` requirement from custom allocators. (#468)

### Fixed

- Fixed custom allocators being leaked in some situations. (#439, #465)

## [v0.14.0] - 2023-06-01

### Added

- Support for `allocator-api2` crate
  for interfacing with custom allocators on stable. (#417)
- Optimized implementation for ARM using NEON instructions. (#430)
- Support for rkyv serialization. (#432)
- `Equivalent` trait to look up values without `Borrow`. (#345)
- `Hash{Map,Set}::raw_table_mut` is added which returns a mutable reference. (#404)
- Fast path for `clear` on empty tables. (#428)

### Changed

- Optimized insertion to only perform a single lookup. (#277)
- `DrainFilter` (`drain_filter`) has been renamed to `ExtractIf` and no longer drops remaining
  elements when the iterator is dropped. #(374)
- Bumped MSRV to 1.64.0. (#431)
- `{Map,Set}::raw_table` now returns an immutable reference. (#404)
- `VacantEntry` and `OccupiedEntry` now use the default hasher if none is
  specified in generics. (#389)
- `RawTable::data_start` now returns a `NonNull` to match `RawTable::data_end`. (#387)
- `RawIter::{reflect_insert, reflect_remove}` are now unsafe. (#429)
- `RawTable::find_potential` is renamed to `find_or_find_insert_slot` and returns an `InsertSlot`. (#429)
- `RawTable::remove` now also returns an `InsertSlot`. (#429)
- `InsertSlot` can be used to insert an element with `RawTable::insert_in_slot`. (#429)
- `RawIterHash` no longer has a lifetime tied to that of the `RawTable`. (#427)
- The trait bounds of `HashSet::raw_table` have been relaxed to not require `Eq + Hash`. (#423)
- `EntryRef::and_replace_entry_with` and `OccupiedEntryRef::replace_entry_with`
  were changed to give a `&K` instead of a `&Q` to the closure.

### Removed

- Support for `bumpalo` as an allocator with custom wrapper.
  Use `allocator-api2` feature in `bumpalo` to use it as an allocator
  for `hashbrown` collections. (#417)

## [v0.13.2] - 2023-01-12

### Fixed

- Added `#[inline(always)]` to `find_inner`. (#375)
- Fixed `RawTable::allocation_info` for empty tables. (#376)

## [v0.13.1] - 2022-11-10

### Added

- Added `Equivalent` trait to customize key lookups. (#350)
- Added support for 16-bit targets. (#368)
- Added `RawTable::allocation_info` which provides information about the memory
  usage of a table. (#371)

### Changed

- Bumped MSRV to 1.61.0.
- Upgraded to `ahash` 0.8. (#357)
- Make `with_hasher_in` const. (#355)
- The following methods have been removed from the `RawTable` API in favor of
  safer alternatives:
  - `RawTable::erase_no_drop` => Use `RawTable::erase` or `RawTable::remove` instead.
  - `Bucket::read` => Use `RawTable::remove` instead.
  - `Bucket::drop` => Use `RawTable::erase` instead.
  - `Bucket::write` => Use `Bucket::as_mut` instead.

### Fixed

- Ensure that `HashMap` allocations don't exceed `isize::MAX`. (#362)
- Fixed issue with field retagging in scopeguard. (#359)

## [v0.12.3] - 2022-07-17

### Fixed

- Fixed double-drop in `RawTable::clone_from`. (#348)

## [v0.12.2] - 2022-07-09

### Added

- Added `Entry` API for `HashSet`. (#342)
- Added `Extend<&'a (K, V)> for HashMap<K, V, S, A>`. (#340)
- Added length-based short-circuiting for hash table iteration. (#338)
- Added a function to access the `RawTable` of a `HashMap`. (#335)

### Changed

- Edited `do_alloc` to reduce LLVM IR generated. (#341)

## [v0.12.1] - 2022-05-02

### Fixed

- Fixed underflow in `RawIterRange::size_hint`. (#325)
- Fixed the implementation of `Debug` for `ValuesMut` and `IntoValues`. (#325)

## [v0.12.0] - 2022-01-17

### Added

- Added `From<[T; N]>` and `From<[(K, V); N]>` for `HashSet` and `HashMap` respectively. (#297)
- Added an `allocator()` getter to HashMap and HashSet. (#257)
- Added `insert_unique_unchecked` to `HashMap` and `HashSet`. (#293)
- Added `into_keys` and `into_values` to HashMap. (#295)
- Implement `From<array>` on `HashSet` and `HashMap`. (#298)
- Added `entry_ref` API to `HashMap`. (#201)

### Changed

- Bumped minimum Rust version to 1.56.1 and edition to 2021.
- Use u64 for the GroupWord on WebAssembly. (#271)
- Optimized `find`. (#279)
- Made rehashing and resizing less generic to reduce compilation time. (#282)
- Inlined small functions. (#283)
- Use `BuildHasher::hash_one` when `feature = "nightly"` is enabled. (#292)
- Relaxed the bounds on `Debug` for `HashSet`. (#296)
- Rename `get_each_mut` to `get_many_mut` and align API with the stdlib. (#291)
- Don't hash the key when searching in an empty table. (#305)

### Fixed

- Guard against allocations exceeding isize::MAX. (#268)
- Made `RawTable::insert_no_grow` unsafe. (#254)
- Inline `static_empty`. (#280)
- Fixed trait bounds on Send/Sync impls. (#303)

## [v0.11.2] - 2021-03-25

### Fixed

- Added missing allocator type parameter to `HashMap`'s and `HashSet`'s `Clone` impls. (#252)

## [v0.11.1] - 2021-03-20

### Fixed

- Added missing `pub` modifier to `BumpWrapper`. (#251)

## [v0.11.0] - 2021-03-14

### Added
- Added safe `try_insert_no_grow` method to `RawTable`. (#229)
- Added support for `bumpalo` as an allocator without the `nightly` feature. (#231)
- Implemented `Default` for `RawTable`. (#237)
- Added new safe methods `RawTable::get_each_mut`, `HashMap::get_each_mut`, and
  `HashMap::get_each_key_value_mut`. (#239)
- Added `From<HashMap<T, ()>>` for `HashSet<T>`. (#235)
- Added `try_insert` method to `HashMap`. (#247)

### Changed
- The minimum Rust version has been bumped to 1.49.0. (#230)
- Significantly improved compilation times by reducing the amount of generated IR. (#205)

### Removed
- We no longer re-export the unstable allocator items from the standard library, nor the stable shims approximating the same. (#227)
- Removed hasher specialization support from `aHash`, which was resulting in inconsistent hashes being generated for a key. (#248)

### Fixed
- Fixed union length comparison. (#228)

## ~~[v0.10.0] - 2021-01-16~~

This release was _yanked_ due to inconsistent hashes being generated with the `nightly` feature. (#248)

### Changed
- Parametrized `RawTable`, `HashSet` and `HashMap` over an allocator. (#133)
- Improved branch prediction hints on stable. (#209)
- Optimized hashing of primitive types with AHash using specialization. (#207)
- Only instantiate `RawTable`'s reserve functions once per key-value. (#204)

## [v0.9.1] - 2020-09-28

### Added
- Added safe methods to `RawTable` (#202):
  - `get`: `find` and `as_ref`
  - `get_mut`: `find` and `as_mut`
  - `insert_entry`: `insert` and `as_mut`
  - `remove_entry`: `find` and `remove`
  - `erase_entry`: `find` and `erase`

### Changed
- Removed `from_key_hashed_nocheck`'s `Q: Hash`. (#200)
- Made `RawTable::drain` safe. (#201)

## [v0.9.0] - 2020-09-03

### Fixed
- `drain_filter` now removes and yields items that do match the predicate,
  rather than items that don't.  This is a **breaking change** to match the
  behavior of the `drain_filter` methods in `std`. (#187)

### Added
- Added `replace_entry_with` to `OccupiedEntry`, and `and_replace_entry_with` to `Entry`. (#190)
- Implemented `FusedIterator` and `size_hint` for `DrainFilter`. (#188)

### Changed
- The minimum Rust version has been bumped to 1.36 (due to `crossbeam` dependency). (#193)
- Updated `ahash` dependency to 0.4. (#198)
- `HashMap::with_hasher` and `HashSet::with_hasher` are now `const fn`. (#195)
- Removed `T: Hash + Eq` and `S: BuildHasher` bounds on `HashSet::new`,
  `with_capacity`, `with_hasher`, and `with_capacity_and_hasher`.  (#185)

## [v0.8.2] - 2020-08-08

### Changed
- Avoid closures to improve compile times. (#183)
- Do not iterate to drop if empty. (#182)

## [v0.8.1] - 2020-07-16

### Added
- Added `erase` and `remove` to `RawTable`. (#171)
- Added `try_with_capacity` to `RawTable`. (#174)
- Added methods that allow re-using a `RawIter` for `RawDrain`,
  `RawIntoIter`, and `RawParIter`. (#175)
- Added `reflect_remove` and `reflect_insert` to `RawIter`. (#175)
- Added a `drain_filter` function to `HashSet`. (#179)

### Changed
- Deprecated `RawTable::erase_no_drop` in favor of `erase` and `remove`. (#176)
- `insert_no_grow` is now exposed under the `"raw"` feature. (#180)

## [v0.8.0] - 2020-06-18

### Fixed
- Marked `RawTable::par_iter` as `unsafe`. (#157)

### Changed
- Reduced the size of `HashMap`. (#159)
- No longer create tables with a capacity of 1 element. (#162)
- Removed `K: Eq + Hash` bounds on `retain`. (#163)
- Pulled in `HashMap` changes from rust-lang/rust (#164):
  - `extend_one` support on nightly.
  - `CollectionAllocErr` renamed to `TryReserveError`.
  - Added `HashSet::get_or_insert_owned`.
  - `Default` for `HashSet` no longer requires `T: Eq + Hash` and `S: BuildHasher`.

## [v0.7.2] - 2020-04-27

### Added
- Added `or_insert_with_key` to `Entry`. (#152)

### Fixed
- Partially reverted `Clone` optimization which was unsound. (#154)

### Changed
- Disabled use of `const-random` by default, which prevented reproducible builds. (#155)
- Optimized `repeat` function. (#150)
- Use `NonNull` for buckets, which improves codegen for iterators. (#148)

## [v0.7.1] - 2020-03-16

### Added
- Added `HashMap::get_key_value_mut`. (#145)

### Changed
- Optimized `Clone` implementation. (#146)

## [v0.7.0] - 2020-01-31

### Added
- Added a `drain_filter` function to `HashMap`. (#135)

### Changed
- Updated `ahash` dependency to 0.3. (#141)
- Optimized set union and intersection. (#130)
- `raw_entry` can now be used without requiring `S: BuildHasher`. (#123)
- `RawTable::bucket_index` can now be used under the `raw` feature. (#128)

## [v0.6.3] - 2019-10-31

### Added
- Added an `ahash-compile-time-rng` feature (enabled by default) which allows disabling the
  `compile-time-rng` feature in `ahash` to work around a Cargo bug. (#125)

## [v0.6.2] - 2019-10-23

### Added
- Added an `inline-more` feature (enabled by default) which allows choosing a tradeoff between
  runtime performance and compilation time. (#119)

## [v0.6.1] - 2019-10-04

### Added
- Added `Entry::insert` and `RawEntryMut::insert`. (#118)

### Changed
- `Group::static_empty` was changed from a `const` to a `static` (#116).

## [v0.6.0] - 2019-08-13

### Fixed
- Fixed AHash accidentally depending on `std`. (#110)

### Changed
- The minimum Rust version has been bumped to 1.32 (due to `rand` dependency).

## ~~[v0.5.1] - 2019-08-04~~

This release was _yanked_ due to a breaking change for users of `no-default-features`.

### Added
- The experimental and unsafe `RawTable` API is available under the "raw" feature. (#108)
- Added entry-like methods for `HashSet`. (#98)

### Changed
- Changed the default hasher from FxHash to AHash. (#97)
- `hashbrown` is now fully `no_std` on recent Rust versions (1.36+). (#96)

### Fixed
- We now avoid growing the table during insertions when it wasn't necessary. (#106)
- `RawOccupiedEntryMut` now properly implements `Send` and `Sync`. (#100)
- Relaxed `lazy_static` version. (#92)

## [v0.5.0] - 2019-06-12

### Fixed
- Resize with a more conservative amount of space after deletions. (#86)

### Changed
- Exposed the Layout of the failed allocation in CollectionAllocErr::AllocErr. (#89)

## [v0.4.0] - 2019-05-30

### Fixed
- Fixed `Send` trait bounds on `IterMut` not matching the libstd one. (#82)

## [v0.3.1] - 2019-05-30

### Fixed
- Fixed incorrect use of slice in unsafe code. (#80)

## [v0.3.0] - 2019-04-23

### Changed
- Changed shrink_to to not panic if min_capacity < capacity. (#67)

### Fixed
- Worked around emscripten bug emscripten-core/emscripten-fastcomp#258. (#66)

## [v0.2.2] - 2019-04-16

### Fixed
- Inlined non-nightly lowest_set_bit_nonzero. (#64)
- Fixed build on latest nightly. (#65)

## [v0.2.1] - 2019-04-14

### Changed
- Use for_each in map Extend and FromIterator. (#58)
- Improved worst-case performance of HashSet.is_subset. (#61)

### Fixed
- Removed incorrect debug_assert. (#60)

## [v0.2.0] - 2019-03-31

### Changed
- The code has been updated to Rust 2018 edition. This means that the minimum
  Rust version has been bumped to 1.31 (2018 edition).

### Added
- Added `insert_with_hasher` to the raw_entry API to allow `K: !(Hash + Eq)`. (#54)
- Added support for using hashbrown as the hash table implementation in libstd. (#46)

### Fixed
- Fixed cargo build with minimal-versions. (#45)
- Fixed `#[may_dangle]` attributes to match the libstd `HashMap`. (#46)
- ZST keys and values are now handled properly. (#46)

## [v0.1.8] - 2019-01-14

### Added
- Rayon parallel iterator support (#37)
- `raw_entry` support (#31)
- `#[may_dangle]` on nightly (#31)
- `try_reserve` support (#31)

### Fixed
- Fixed variance on `IterMut`. (#31)

## [v0.1.7] - 2018-12-05

### Fixed
- Fixed non-SSE version of convert_special_to_empty_and_full_to_deleted. (#32)
- Fixed overflow in rehash_in_place. (#33)

## [v0.1.6] - 2018-11-17

### Fixed
- Fixed compile error on nightly. (#29)

## [v0.1.5] - 2018-11-08

### Fixed
- Fixed subtraction overflow in generic::Group::match_byte. (#28)

## [v0.1.4] - 2018-11-04

### Fixed
- Fixed a bug in the `erase_no_drop` implementation. (#26)

## [v0.1.3] - 2018-11-01

### Added
- Serde support. (#14)

### Fixed
- Make the compiler inline functions more aggressively. (#20)

## [v0.1.2] - 2018-10-31

### Fixed
- `clear` segfaults when called on an empty table. (#13)

## [v0.1.1] - 2018-10-30

### Fixed
- `erase_no_drop` optimization not triggering in the SSE2 implementation. (#3)
- Missing `Send` and `Sync` for hash map and iterator types. (#7)
- Bug when inserting into a table smaller than the group width. (#5)

## v0.1.0 - 2018-10-29

- Initial release

[Unreleased]: https://github.com/rust-lang/hashbrown/compare/v0.15.2...HEAD
[v0.15.2]: https://github.com/rust-lang/hashbrown/compare/v0.15.1...v0.15.2
[v0.15.1]: https://github.com/rust-lang/hashbrown/compare/v0.15.0...v0.15.1
[v0.15.0]: https://github.com/rust-lang/hashbrown/compare/v0.14.5...v0.15.0
[v0.14.5]: https://github.com/rust-lang/hashbrown/compare/v0.14.4...v0.14.5
[v0.14.4]: https://github.com/rust-lang/hashbrown/compare/v0.14.3...v0.14.4
[v0.14.3]: https://github.com/rust-lang/hashbrown/compare/v0.14.2...v0.14.3
[v0.14.2]: https://github.com/rust-lang/hashbrown/compare/v0.14.1...v0.14.2
[v0.14.1]: https://github.com/rust-lang/hashbrown/compare/v0.14.0...v0.14.1
[v0.14.0]: https://github.com/rust-lang/hashbrown/compare/v0.13.2...v0.14.0
[v0.13.2]: https://github.com/rust-lang/hashbrown/compare/v0.13.1...v0.13.2
[v0.13.1]: https://github.com/rust-lang/hashbrown/compare/v0.12.3...v0.13.1
[v0.12.3]: https://github.com/rust-lang/hashbrown/compare/v0.12.2...v0.12.3
[v0.12.2]: https://github.com/rust-lang/hashbrown/compare/v0.12.1...v0.12.2
[v0.12.1]: https://github.com/rust-lang/hashbrown/compare/v0.12.0...v0.12.1
[v0.12.0]: https://github.com/rust-lang/hashbrown/compare/v0.11.2...v0.12.0
[v0.11.2]: https://github.com/rust-lang/hashbrown/compare/v0.11.1...v0.11.2
[v0.11.1]: https://github.com/rust-lang/hashbrown/compare/v0.11.0...v0.11.1
[v0.11.0]: https://github.com/rust-lang/hashbrown/compare/v0.10.0...v0.11.0
[v0.10.0]: https://github.com/rust-lang/hashbrown/compare/v0.9.1...v0.10.0
[v0.9.1]: https://github.com/rust-lang/hashbrown/compare/v0.9.0...v0.9.1
[v0.9.0]: https://github.com/rust-lang/hashbrown/compare/v0.8.2...v0.9.0
[v0.8.2]: https://github.com/rust-lang/hashbrown/compare/v0.8.1...v0.8.2
[v0.8.1]: https://github.com/rust-lang/hashbrown/compare/v0.8.0...v0.8.1
[v0.8.0]: https://github.com/rust-lang/hashbrown/compare/v0.7.2...v0.8.0
[v0.7.2]: https://github.com/rust-lang/hashbrown/compare/v0.7.1...v0.7.2
[v0.7.1]: https://github.com/rust-lang/hashbrown/compare/v0.7.0...v0.7.1
[v0.7.0]: https://github.com/rust-lang/hashbrown/compare/v0.6.3...v0.7.0
[v0.6.3]: https://github.com/rust-lang/hashbrown/compare/v0.6.2...v0.6.3
[v0.6.2]: https://github.com/rust-lang/hashbrown/compare/v0.6.1...v0.6.2
[v0.6.1]: https://github.com/rust-lang/hashbrown/compare/v0.6.0...v0.6.1
[v0.6.0]: https://github.com/rust-lang/hashbrown/compare/v0.5.1...v0.6.0
[v0.5.1]: https://github.com/rust-lang/hashbrown/compare/v0.5.0...v0.5.1
[v0.5.0]: https://github.com/rust-lang/hashbrown/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/rust-lang/hashbrown/compare/v0.3.1...v0.4.0
[v0.3.1]: https://github.com/rust-lang/hashbrown/compare/v0.3.0...v0.3.1
[v0.3.0]: https://github.com/rust-lang/hashbrown/compare/v0.2.2...v0.3.0
[v0.2.2]: https://github.com/rust-lang/hashbrown/compare/v0.2.1...v0.2.2
[v0.2.1]: https://github.com/rust-lang/hashbrown/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/rust-lang/hashbrown/compare/v0.1.8...v0.2.0
[v0.1.8]: https://github.com/rust-lang/hashbrown/compare/v0.1.7...v0.1.8
[v0.1.7]: https://github.com/rust-lang/hashbrown/compare/v0.1.6...v0.1.7
[v0.1.6]: https://github.com/rust-lang/hashbrown/compare/v0.1.5...v0.1.6
[v0.1.5]: https://github.com/rust-lang/hashbrown/compare/v0.1.4...v0.1.5
[v0.1.4]: https://github.com/rust-lang/hashbrown/compare/v0.1.3...v0.1.4
[v0.1.3]: https://github.com/rust-lang/hashbrown/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/rust-lang/hashbrown/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/rust-lang/hashbrown/compare/v0.1.0...v0.1.1


---

<!-- source: archive/library/rust/references/packages/http-body/CHANGELOG--001028.md -->

## Imported source: archive/library/rust/references/packages/http-body/CHANGELOG--001028.md

# 0.4.6 (December 8, 2023)

- Add `Collect` combinator (backported from http-body-util).

# 0.4.5 (May 20, 2022)

- Add `String` impl for `Body`.
- Add `Limited` body implementation.

# 0.4.4 (October 22, 2021)

- Add `UnsyncBoxBody` and `Body::boxed_unsync`.

# 0.4.3 (August 8, 2021)

- Implement `Default` for `BoxBody`.

# 0.4.2 (May 8, 2021)

- Correctly override `Body::size_hint` and `Body::is_end_stream` for `Empty`.
- Add `Full` which is a body that consists of a single chunk.

# 0.4.1 (March 18, 2021)

- Add combinators to `Body`:
  - `map_data`: Change the `Data` chunks produced by the body.
  - `map_err`: Change the `Error`s produced by the body.
  - `boxed`: Convert the `Body` into a boxed trait object.
- Add `Empty`.

# 0.4.0 (December 23, 2020)

- Update `bytes` to v1.0.

# 0.3.1 (December 13, 2019)

- Implement `Body` for `http::Request<impl Body>` and `http::Response<impl Body>`.

# 0.3.0 (December 4, 2019)

- Rename `next` combinator to `data`.

# 0.2.0 (December 3, 2019)

- Update `http` to v0.2.
- Update `bytes` to v0.5.

# 0.2.0-alpha.3 (October 1, 2019)

- Fix `Body` to be object-safe.

# 0.2.0-alpha.2 (October 1, 2019)

- Add `next` and `trailers` combinator methods.

# 0.2.0-alpha.1 (August 20, 2019)

- Update to use `Pin` in `poll_data` and `poll_trailers`.

# 0.1.0 (May 7, 2019)

- Initial release


---

<!-- source: archive/library/rust/references/packages/http/CHANGELOG--000958.md -->

## Imported source: archive/library/rust/references/packages/http/CHANGELOG--000958.md

# 0.2.12 (March 4, 2024)

* Add methods to allow trying to allocate in the `HeaderMap`, returning an error if oversize instead of panicking.
* Fix `HeaderName::from_lowercase` that could allow NUL bytes in some cases.

# 0.2.11 (November 13, 2023)

* Fix MIRI error in `header::Iter`.

# 0.2.10 (November 10, 2023)

* Fix parsing of `Authority` to handle square brackets in incorrect order.
* Fix `HeaderMap::with_capacity()` to handle arithmetic overflow.

# 0.2.9 (February 17, 2023)

* Add `HeaderName` constants for `cache-status` and `cdn-cache-control`.
* Implement `Hash` for `PathAndQuery`.
* Re-export `HeaderName` at crate root.

# 0.2.8 (June 6, 2022)

* Fix internal usage of uninitialized memory to use `MaybeUninit` inside `HeaderName`.

# 0.2.7 (April 28, 2022)

* MSRV bumped to `1.49`.
* Add `extend()` method to `Extensions`.
* Add `From<Authority>` and `From<PathAndQuery>` impls for `Uri`.
* Make `HeaderName::from_static` a `const fn`.

# 0.2.6 (December 30, 2021)

* Upgrade internal `itoa` dependency to 1.0.

# 0.2.5 (September 21, 2021)

* Add `is_empty()` and `len()` methods to `Extensions`.
* Add `version_ref()` method to `request::Builder`.
* Implement `TryFrom<Vec<u8>>` and `TryFrom<String>` for `Authority`, `Uri`, `PathAndQuery`, and `HeaderName`.
* Make `HeaderValue::from_static` a `const fn`.

# 0.2.4 (April 4, 2021)

* Fix `Uri` parsing to allow `{`, `"`, and `}` in paths.

# 0.2.3 (January 7, 2021)

* Upgrade internal (private) `bytes` dependency to 1.0.

# 0.2.2 (December 14, 2020)

* Fix (potential double) panic of (`HeaderMap`) `OccupiedEntry::remove_entry` and
  `remove_entry_mult` when multiple values are present. ([#446], [#449] dekellum)
* Safety audits of (priv) `ByteStr` and refactor of `Authority` ([#408], [#414] sbosnick)
* Fix `HeaderName` to error instead of panic when input is too long ([#432] [#433] acfoltzer)
* Allow `StatusCode` to encode values 100-999 without error. Use of the
  unclassified range 600-999 remains discouraged. ([#144], [#438], [#443] quininer dekellum)
* Add `String` and `&String` fallible conversions to `PathAndQuery` ([#450] mkindahl)
* Fix `Authority` (and `Uri`) to error instead of panic on unbalanced brackets
  ([#435], [#445] aeryz)

# 0.2.1 (March 25, 2020)

* Add `extensions_ref` and `extensions_mut` to `request::Builder` and `response::Builder`.

# 0.2.0 (December 2, 2019)

* Add `Version::HTTP_3` constant.
* Add `HeaderValue::from_maybe_shared`, `HeaderValue::from_maybe_shared_unchecked`, `Uri::from_maybe_shared`, `Authority::from_maybe_shared`, and `PathAndQuery::from_maybe_shared`.
* Change `request::Builder`, `response::Builder`, and `uri::Builder` to use by-value methods instead of by-ref.
* Change from `HttpTryFrom` trait to `std::convert::TryFrom`.
* Change `HeaderMap::entry` to no longer return a `Result`.
* Change `HeaderMap::drain` iterator to match the behavior of `IntoIter`.
* Change `Authority::port` to return an `Option<Port>` instead of `Option<u16>`.
* Change `Uri::scheme` to return `Option<&Scheme>` instead of `Option<&str>`.
* Change `Uri::authority` to return `Option<&Authority>` instead of `Option<&str>`.
* Remove `InvalidUriBytes`, `InvalidHeaderNameBytes`, and `InvalidHeaderValueBytes` error types.
* Remove `HeaderValue::from_shared`, `HeaderValue::from_shared_unchecked`, `Uri::from_shared`, `Authority::from_shared`, `Scheme::from_shared`, and `PathAndQuery::from_shared`.
* Remove `Authority::port_part`.
* Remove `Uri::scheme_part` and `Uri::authority_part`.

# 0.1.20 (November 26, 2019)

* Fix possible double-free if `header::Drain` iterator is `std::mem::forgot`en (#357).
* Fix possible data race if multiple `header::ValueDrain`s are iterated on different threads (#362).
* Fix `HeaderMap::reserve` capacity overflows (#360).
* Fix parsing long authority-form `Uri`s (#351).

# 0.1.19 (October 15, 2019)

* Allow `%` in IPv6 addresses in `Uri` (#343).

# 0.1.18 (July 26, 2019)

* Fix compilation of `HeaderName` parsing on WASM targets (#324).
* Implement `HttpTryFrom<HashMap>` for `HeaderMap` (#326).
* Export `http::header::HeaderValue` as `http::HeaderValue`.

# 0.1.17 (April 5, 2019)

* Add `Error::inner_ref()` to view the kind of error (#303)
* Add `headers_ref()` and `headers_mut()` methods to `request::Builder` and `response::Builder` (#293)

# 0.1.16 (February 19, 2019)

* Fix `Uri` to permit more characters in the `path` (#296)

# 0.1.15 (January 22, 2019)

* Fix `Uri::host()` to include brackets of IPv6 literals (#292)
* Add `scheme_str` and `port_u16` methods to `Uri` (#287)
* Add `method_ref`, `uri_ref`, and `headers_ref` to `request::Builder` (#284)

# 0.1.14 (November 21, 2018)

* Add `Port` struct (#252, #255, #265)
* Introduce `Uri` builder (#219)
* Empty `Method` no longer considered valid (#262)
* Fix `Uri` equality when terminating question mark is present (#270)
* Allow % character in userinfo (#269)
* Support additional tokens for header names (#271)
* Export `http::headers::{IterMut, ValuesMut}` (#278)

# 0.1.13 (September 14, 2018)

* impl `fmt::Display` for `HeaderName` (#249)
* Fix `uri::Authority` parsing when there is no host after an `@` (#248)
* Fix `Uri` parsing to allow more characters in query strings (#247)

# 0.1.12 (September 7, 2018)

* Fix `HeaderValue` parsing to allow HTABs (#244)

# 0.1.11 (September 5, 2018)

* Add `From<&Self>` for `HeaderValue`, `Method`, and `StatusCode` (#238)
* Add `Uri::from_static` (#240)

# 0.1.10 (August 8, 2018)

* `impl HttpTryFrom<String>` for HeaderValue (#236)

# 0.1.9 (August 7, 2018)

* Fix double percent encoding (#233)
* Add additional HttpTryFrom impls (#234)

# 0.1.8 (July 23, 2018)

* Add fuller set of `PartialEq` for `Method` (#221)
* Reduce size of `HeaderMap` by using `Box<[Entry]>` instea of `Vec` (#224)
* Reduce size of `Extensions` by storing as `Option<Box<AnyMap>>` (#227)
* Implement `Iterator::size_hint` for most iterators in `header` (#226)

# 0.1.7 (June 22, 2018)

* Add `From<uN> for HeaderValue` for most integer types (#218).
* Add `Uri::into_parts()` inherent method (same as `Parts::from(uri)`) (#214).
* Fix converting `Uri`s in authority-form to `Parts` and then back into `Uri` (#216).
* Fix `Authority` parsing to reject multiple port sections (#215).
* Fix parsing 1 character authority-form `Uri`s into illegal forms (#220).

# 0.1.6 (June 13, 2018)

* Add `HeaderName::from_static()` constructor (#195).
* Add `Authority::from_static()` constructor (#186).
* Implement `From<HeaderName>` for `HeaderValue` (#184).
* Fix duplicate keys when iterating over `header::Keys` (#201).

# 0.1.5 (February 28, 2018)

* Add websocket handshake related header constants (#162).
* Parsing `Authority` with an empty string now returns an error (#164).
* Implement `PartialEq<u16>` for `StatusCode` (#153).
* Implement `HttpTryFrom<&Uri>` for `Uri` (#165).
* Implement `FromStr` for `Method` (#167).
* Implement `HttpTryFrom<String>` for `Uri` (#171).
* Add `into_body` fns to `Request` and `Response` (#172).
* Fix `Request::options` (#177).

# 0.1.4 (January 4, 2018)

* Add PathAndQuery::from_static (#148).
* Impl PartialOrd / PartialEq for Authority and PathAndQuery (#150).
* Add `map` fn to `Request` and `Response` (#151).

# 0.1.3 (December 11, 2017)

* Add `Scheme` associated consts for common protos.

# 0.1.2 (November 29, 2017)

* Add Uri accessor for scheme part.
* Fix Uri parsing bug (#134)

# 0.1.1 (October 9, 2017)

* Provide Uri accessors for parts (#129)
* Add Request builder helpers. (#123)
* Misc performance improvements (#126)

# 0.1.0 (September 8, 2017)

* Initial release.

[#144]: https://github.com/hyperium/http/issues/144
[#408]: https://github.com/hyperium/http/pull/408
[#414]: https://github.com/hyperium/http/pull/414
[#432]: https://github.com/hyperium/http/issues/432
[#433]: https://github.com/hyperium/http/pull/433
[#438]: https://github.com/hyperium/http/pull/438
[#443]: https://github.com/hyperium/http/pull/443
[#446]: https://github.com/hyperium/http/issues/446
[#449]: https://github.com/hyperium/http/pull/449
[#450]: https://github.com/hyperium/http/pull/450
[#435]: https://github.com/hyperium/http/issues/435
[#445]: https://github.com/hyperium/http/pull/445


---

<!-- source: archive/library/rust/references/packages/iana-time-zone/CHANGELOG--000999.md -->

## Imported source: archive/library/rust/references/packages/iana-time-zone/CHANGELOG--000999.md

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.64] - 2025-09-12
### Changed
- Bump maximum allowed windows-core version to 0.62 (from 0.61).

## [0.1.63] - 2025-03-31
### Changes
- Bump MSRV (minimum supported rust version) to 1.62 ([#131](https://github.com/strawlab/iana-time-zone/pull/131))
- Bump `windows-core` to `0.56-0.61` range ([#131](https://github.com/strawlab/iana-time-zone/pull/131), [#133](https://github.com/strawlab/iana-time-zone/pull/133))

## [0.1.62] - 2025-03-24
### Changed
- Bump MSRV (minimum supported rust version) to 1.61 ([#157](https://github.com/strawlab/iana-time-zone/pull/157))
- Update to rust edition 2021 ([#161](https://github.com/strawlab/iana-time-zone/pull/161))
- Address high and medium severity zizmor findings ([#163](https://github.com/strawlab/iana-time-zone/pull/163))

### Added
- Added support for tvOS, watchOS and visionOS ([#146](https://github.com/strawlab/iana-time-zone/pull/146)).
- implement OpenHarmony support ([#150](https://github.com/strawlab/iana-time-zone/pull/150))

## [0.1.61] - 2024-09-16
### Changed

- Depend on wasm-bindgen 0.2.89 or higher ([#134](https://github.com/strawlab/iana-time-zone/pull/134))
- Do not use wasm_bindgen in wasm32-unknown-emscripten environment ([#130](https://github.com/strawlab/iana-time-zone/pull/130))

## [0.1.60] - 2024-02-03
### Changed
- correct `windows-core` dependency version ([#127](https://github.com/strawlab/iana-time-zone/pull/127))

## [0.1.59] - 2023-12-30
### Changed
- update `windows` dependency ([#125](https://github.com/strawlab/iana-time-zone/pull/125))

## [0.1.58] - 2023-10-17
### Added
- use windows-core with embedded bindings via windows-bindgen ([#117](https://github.com/strawlab/iana-time-zone/pull/117))
- implement GNU Hurd support ([#121](https://github.com/strawlab/iana-time-zone/pull/121))
- implement AIX support ([#57](https://github.com/strawlab/iana-time-zone/pull/57))

## [0.1.57] - 2023-06-07
### Added
- implement OpenWRT support ([#109](https://github.com/strawlab/iana-time-zone/pull/109))

## [0.1.56] - 2023-04-03
### Changed
- update `windows` dependency ([#102](https://github.com/strawlab/iana-time-zone/pull/102))

## [0.1.55] - 2023-03-30
### Changed
- update `windows` dependency ([#101](https://github.com/strawlab/iana-time-zone/pull/101))

## [0.1.54] - 2023-03-21
### Changed
- replace `winapi` dependency with `windows` ([#97](https://github.com/strawlab/iana-time-zone/pull/97))
- bump msrv to 1.48 ([#91](https://github.com/strawlab/iana-time-zone/pull/91))

## [0.1.53] - 2022-10-28
### Fixed
- remove lint causing breakage on rust 1.45-1.51 ([#84](https://github.com/strawlab/iana-time-zone/pull/84))

## [0.1.52] - 2022-10-28
### Fixed
- fix for NixOS ([#81](https://github.com/strawlab/iana-time-zone/pull/81))

### Changed
- allow building the haiku crate on other hosts([#75](https://github.com/strawlab/iana-time-zone/pull/75))
- various improvements in continuous integration and source quality
  ([#76](https://github.com/strawlab/iana-time-zone/pull/76)),
  ([#77](https://github.com/strawlab/iana-time-zone/pull/77)),
  ([#78](https://github.com/strawlab/iana-time-zone/pull/78)),
  ([#81](https://github.com/strawlab/iana-time-zone/pull/81))

## [0.1.51] - 2022-10-08
### Changed
- bump MSRV to 1.38 ([#70](https://github.com/strawlab/iana-time-zone/pull/70))
- Refactor Android property key CStr construction to add tests ([#69](https://github.com/strawlab/iana-time-zone/pull/69))
- Refactor MacOS implementation a lot ([#67](https://github.com/strawlab/iana-time-zone/pull/67))

### Added
- Implement for Haiku ([#66](https://github.com/strawlab/iana-time-zone/pull/66))

### Fixed
- Fix spelling of 'initialized' in sync::Once statics ([#63](https://github.com/strawlab/iana-time-zone/pull/63))

## [0.1.50] - 2022-09-23
### Fixed
- Reduce MSRV for Android again ([#62](https://github.com/strawlab/iana-time-zone/pull/62))

## [0.1.49] - 2022-09-22
### Changed
- `once_cell` dependency is not needed ([#61](https://github.com/strawlab/iana-time-zone/pull/61))

## [0.1.48] - 2022-09-12
### Changed
- Downgrade requirements for WASM dependencies ([#58](https://github.com/strawlab/iana-time-zone/pull/58))
- Reduce MSRV for Tier 1 platforms to 1.31 ([#59](https://github.com/strawlab/iana-time-zone/pull/59))

## [0.1.47] - 2022-08-30
### Changed
- Update `android_system_properties` to v0.1.5 to run 9786% faster (YMMV) ([#56](https://github.com/strawlab/iana-time-zone/pull/56))

## [0.1.46] - 2022-08-18
### Added
- Implement for Solaris ([#55](https://github.com/strawlab/iana-time-zone/pull/55))

## [0.1.45] - 2022-08-16
### Fixed
- Fix potential use after free in MacOS / iOS ([#54](https://github.com/strawlab/iana-time-zone/pull/54), [RUSTSEC-2022-0049](https://rustsec.org/advisories/RUSTSEC-2022-0049.html))
- Fix typos in README ([#53](https://github.com/strawlab/iana-time-zone/pull/53))

## [0.1.44] - 2022-08-11
### Fixed
- "/etc/localtime" may be relative link ([#49](https://github.com/strawlab/iana-time-zone/pull/49))

## [0.1.43] - 2022-08-11
### Changed
- Use `core-foundation-sys` instead of `core-foundation` ([#50](https://github.com/strawlab/iana-time-zone/pull/50))

## [0.1.42] - 2022-08-10
### Fixed
- Fix implementation for Redhat based distros ([#48](https://github.com/strawlab/iana-time-zone/pull/48))

## [0.1.41] - 2022-08-02
### Added
- Add `fallback` feature ([#46](https://github.com/strawlab/iana-time-zone/pull/46))

## [0.1.40] - 2022-07-29
### Added
- Implement for Android ([#45](https://github.com/strawlab/iana-time-zone/pull/45))

## [0.1.38] - 2022-07-27
### Added
- Implement illumos ([#44](https://github.com/strawlab/iana-time-zone/pull/44))
### Changed
- Update examples in README

## [0.1.37] - 2022-07-23
### Added
- Support iOS ([#41](https://github.com/strawlab/iana-time-zone/pull/41))
### Changed
- Implement `std::err::source()`, format `IoError` ([#42](https://github.com/strawlab/iana-time-zone/pull/42))

## [0.1.36] - 2022-07-21
### Fixed
- Fail to compile for WASI ([#40](https://github.com/strawlab/iana-time-zone/pull/40))

## [0.1.35] - 2022-06-29
### Added
- Implement for FreeBSD, NetBSD, OpenBSD and Dragonfly ([#39](https://github.com/strawlab/iana-time-zone/pull/39))

## [0.1.34] - 2022-06-29
### Added
- Implement for wasm32 ([#38](https://github.com/strawlab/iana-time-zone/pull/38))

## [0.1.33] - 2022-04-15
### Changed
- Use `winapi` crate instead of `windows` crate ([#35](https://github.com/strawlab/iana-time-zone/pull/35))

## [0.1.32] - 2022-04-06
### Changed
- Update `windows` requirement from 0.34 to 0.35 ([#34](https://github.com/strawlab/iana-time-zone/pull/34))

## [0.1.31] - 2022-03-16
### Changed
- Update `windows` requirement from 0.33 to 0.34 ([#33](https://github.com/strawlab/iana-time-zone/pull/33))

## [0.1.30] - 2022-02-28
### Changed
- Fewer string allocations ([#32](https://github.com/strawlab/iana-time-zone/pull/32))

## [0.1.29] - 2022-02-25
### Changed
- Update `windows` requirement from 0.32 to 0.33 ([#31](https://github.com/strawlab/iana-time-zone/pull/31))

## [0.1.28] - 2022-02-04
### Changed
- Update `windows` requirement from 0.30 to 0.32 ([#30](https://github.com/strawlab/iana-time-zone/pull/30))

## [0.1.27] - 2022-01-14
### Changed
- Update `windows` requirement from 0.29 to 0.30 ([#29](https://github.com/strawlab/iana-time-zone/pull/29))

## [0.1.26] - 2021-12-23
### Changed
- Update `windows` requirement from 0.28 to 0.29 ([#28](https://github.com/strawlab/iana-time-zone/pull/28))

## [0.1.25] - 2021-11-18
### Changed
- Update `windows` requirement from 0.27 to 0.28 ([#27](https://github.com/strawlab/iana-time-zone/pull/27))

## [0.1.24] - 2021-11-16
### Changed
- Update `windows` requirement from 0.26 to 0.27 ([#26](https://github.com/strawlab/iana-time-zone/pull/26))

## [0.1.23] - 2021-11-12
### Changed
- Update `windows` requirement from 0.25 to 0.26 ([#25](https://github.com/strawlab/iana-time-zone/pull/25))

## [0.1.22] - 2021-11-08
### Changed
- Update `windows` requirement from 0.24 to 0.25 ([#24](https://github.com/strawlab/iana-time-zone/pull/24))

## [0.1.21] - 2021-11-02
### Changed
- Update `windows` requirement from 0.23 to 0.24 ([#23](https://github.com/strawlab/iana-time-zone/pull/23))

## [0.1.20] - 2021-10-29
### Changed
- Update `windows` requirement from 0.21 to 0.23 ([#22](https://github.com/strawlab/iana-time-zone/pull/22))

## [0.1.19] - 2021-09-27
### Changed
- Update `windows` requirement from 0.19 to 0.21 ([#18](https://github.com/strawlab/iana-time-zone/pull/18), [#20](https://github.com/strawlab/iana-time-zone/pull/20))
- Update `chrono-tz` requirement from 0.5 to 0.6 ([#19](https://github.com/strawlab/iana-time-zone/pull/19))

## [0.1.18] - 2021-08-23
### Changed
- Update `windows` requirement from 0.18 to 0.19 ([#17](https://github.com/strawlab/iana-time-zone/pull/17))

## [0.1.16] - 2021-07-26
### Changed
- Update `windows` requirement from 0.17 to 0.18 ([#16](https://github.com/strawlab/iana-time-zone/pull/16))

## [0.1.15] - 2021-07-08
### Changed
- Update `windows` requirement from 0.14 to 0.17 ([#15](https://github.com/strawlab/iana-time-zone/pull/15))

## [0.1.14] - 2021-07-07
### Changed
- Update `windows` requirement from 0.13 to 0.14 ([#14](https://github.com/strawlab/iana-time-zone/pull/14))

## [0.1.13] - 2021-06-28
### Changed
- Update `windows` requirement from 0.12 to 0.13 ([#13](https://github.com/strawlab/iana-time-zone/pull/13))

## [0.1.12] - 2021-06-28
### Changed
- Update `windows` requirement from 0.11 to 0.12 ([#12](https://github.com/strawlab/iana-time-zone/pull/12))

## [0.1.11] - 2021-06-12
### Changed
- Update `windows` requirement from 0.10 to 0.11 ([#11](https://github.com/strawlab/iana-time-zone/pull/11))

## [0.1.10] - 2021-05-13
### Changed
- Update `windows` requirement from 0.9 to 0.10 ([#10](https://github.com/strawlab/iana-time-zone/pull/10))

## [0.1.9] - 2021-04-28
### Changed
- Update `windows` requirement from 0.8 to 0.9 ([#8](https://github.com/strawlab/iana-time-zone/pull/8))

## [0.1.8] - 2021-04-13
### Changed
- Update `windows` requirement from 0.7 to 0.8 ([#7](https://github.com/strawlab/iana-time-zone/pull/7))

## [0.1.7] - 2021-03-30
### Changed
- Update `windows` requirement from 0.6 to 0.7 ([#6](https://github.com/strawlab/iana-time-zone/pull/6))

## [0.1.6] - 2021-03-24
### Changed
- Update `windows` requirement from 0.5 to 0.6 ([#5](https://github.com/strawlab/iana-time-zone/pull/5))

## [0.1.5] - 2021-03-20
### Changed
- Update `windows` requirement from 0.4 to 0.5 ([#4](https://github.com/strawlab/iana-time-zone/pull/4))

## [0.1.4] - 2021-03-11
### Changed
- Update `windows` requirement from 0.3 to 0.4 ([#3](https://github.com/strawlab/iana-time-zone/pull/3))

## [0.1.3] - 2021-02-22
### Changed
- Use `windows` crate instead of `winrt`

## [0.1.2] - 2020-10-09
### Changed
- Update `core-foundation` requirement from 0.7 to 0.9 ([#1](https://github.com/strawlab/iana-time-zone/pull/1))

## [0.1.1] - 2020-06-27
### Changed
- Update `core-foundation` requirement from 0.5 to 0.7

## [0.1.0] - 2020-06-27
### Added
- Implement for Linux, Windows, MacOS

[0.1.63]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.63
[0.1.62]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.62
[0.1.61]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.61
[0.1.60]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.60
[0.1.59]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.59
[0.1.58]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.58
[0.1.57]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.57
[0.1.56]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.56
[0.1.55]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.55
[0.1.54]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.54
[0.1.53]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.53
[0.1.52]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.52
[0.1.51]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.51
[0.1.50]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.50
[0.1.49]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.49
[0.1.48]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.48
[0.1.47]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.47
[0.1.46]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.46
[0.1.45]: https://github.com/strawlab/iana-time-zone/releases/tag/v0.1.45
[0.1.44]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.44
[0.1.43]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.43
[0.1.42]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.42
[0.1.41]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.41
[0.1.40]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.40
[0.1.39]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.39
[0.1.38]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.38
[0.1.37]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.37
[0.1.36]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.36
[0.1.35]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.35
[0.1.34]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.34
[0.1.33]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.33
[0.1.32]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.32
[0.1.31]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.31
[0.1.30]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.30
[0.1.29]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.29
[0.1.28]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.28
[0.1.27]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.27
[0.1.26]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.26
[0.1.25]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.25
[0.1.24]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.24
[0.1.23]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.23
[0.1.22]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.22
[0.1.21]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.21
[0.1.20]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.20
[0.1.19]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.19
[0.1.18]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.18
[0.1.17]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.17
[0.1.16]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.16
[0.1.15]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.15
[0.1.14]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.14
[0.1.13]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.13
[0.1.12]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.12
[0.1.11]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.11
[0.1.10]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.10
[0.1.9]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.9
[0.1.8]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.8
[0.1.7]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.7
[0.1.6]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.6
[0.1.5]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.5
[0.1.4]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.4
[0.1.3]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.3
[0.1.2]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.2
[0.1.1]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.1
[0.1.0]: https://github.com/strawlab/iana-time-zone/releases/tag/0.1.0


---

<!-- source: archive/library/rust/references/packages/libc/CHANGELOG--000993.md -->

## Imported source: archive/library/rust/references/packages/libc/CHANGELOG--000993.md

# Changelog

## [0.2.177](https://github.com/rust-lang/libc/compare/0.2.176...0.2.177) - 2025-10-09

### Added

- Apple: Add `TIOCGETA`, `TIOCSETA`, `TIOCSETAW`, `TIOCSETAF` constants ([#4736](https://github.com/rust-lang/libc/pull/4736))
- Apple: Add `pthread_cond_timedwait_relative_np` ([#4719](https://github.com/rust-lang/libc/pull/4719))
- BSDs: Add `_CS_PATH` constant ([#4738](https://github.com/rust-lang/libc/pull/4738))
- Linux-like: Add `SIGEMT` for mips* and sparc* architectures ([#4730](https://github.com/rust-lang/libc/pull/4730))
- OpenBSD: Add `elf_aux_info` ([#4729](https://github.com/rust-lang/libc/pull/4729))
- Redox: Add more sysconf constants ([#4728](https://github.com/rust-lang/libc/pull/4728))
- Windows: Add `wcsnlen` ([#4721](https://github.com/rust-lang/libc/pull/4721))

### Changed

- WASIP2: Invert conditional to include p2 APIs ([#4733](https://github.com/rust-lang/libc/pull/4733))

## [0.2.176](https://github.com/rust-lang/libc/compare/0.2.175...0.2.176) - 2025-09-23

### Support

- The default FreeBSD version has been raised from 11 to 12. This matches `rustc` since 1.78. ([#2406](https://github.com/rust-lang/libc/pull/2406))
- `Debug` is now always implemented, rather than being gated behind the `extra_traits` feature. ([#4624](https://github.com/rust-lang/libc/pull/4624))

### Added

- AIX: Restore some non-POSIX functions guarded by the `_KERNEL` macro. ([#4607](https://github.com/rust-lang/libc/pull/4607))
- FreeBSD 14: Add `st_fileref` to `struct stat` ([#4642](https://github.com/rust-lang/libc/pull/4642))
- Haiku: Add the `accept4` POSIX call ([#4586](https://github.com/rust-lang/libc/pull/4586))
- Introduce a wrapper for representing padding ([#4632](https://github.com/rust-lang/libc/pull/4632))
- Linux: Add `EM_RISCV` ([#4659](https://github.com/rust-lang/libc/pull/4659))
- Linux: Add `MS_NOSYMFOLLOW` ([#4389](https://github.com/rust-lang/libc/pull/4389))
- Linux: Add `backtrace_symbols(_fd)` ([#4668](https://github.com/rust-lang/libc/pull/4668))
- Linux: Add missing `SOL_PACKET` optnames ([#4669](https://github.com/rust-lang/libc/pull/4669))
- Musl s390x: Add `SYS_mseal` ([#4549](https://github.com/rust-lang/libc/pull/4549))
- NuttX: Add `__errno` ([#4687](https://github.com/rust-lang/libc/pull/4687))
- Redox: Add `dirfd`, `VDISABLE`, and resource consts ([#4660](https://github.com/rust-lang/libc/pull/4660))
- Redox: Add more `resource.h`, `fcntl.h` constants ([#4666](https://github.com/rust-lang/libc/pull/4666))
- Redox: Enable `strftime` and `mkostemp[s]` ([#4629](https://github.com/rust-lang/libc/pull/4629))
- Unix, Windows: Add `qsort_r` (Unix), and `qsort(_s)` (Windows) ([#4677](https://github.com/rust-lang/libc/pull/4677))
- Unix: Add `dlvsym` for Linux-gnu, FreeBSD, and NetBSD ([#4671](https://github.com/rust-lang/libc/pull/4671))
- Unix: Add `sigqueue` ([#4620](https://github.com/rust-lang/libc/pull/4620))

### Changed

- FreeBSD 15: Mark `kinfo_proc` as non-exhaustive ([#4553](https://github.com/rust-lang/libc/pull/4553))
- FreeBSD: Set the ELF symbol version for `readdir_r` ([#4694](https://github.com/rust-lang/libc/pull/4694))
- Linux: Correct the config for whether or not `epoll_event` is packed ([#4639](https://github.com/rust-lang/libc/pull/4639))
- Tests: Replace the old `ctest` with the much more reliable new implementation ([#4655](https://github.com/rust-lang/libc/pull/4655) and many related PRs)

### Fixed

- AIX: Fix the type of the 4th arguement of `getgrnam_r` ([#4656](https://github.com/rust-lang/libc/pull/4656
- FreeBSD: Limit `P_IDLEPROC` to FreeBSD 15 ([#4640](https://github.com/rust-lang/libc/pull/4640))
- FreeBSD: Limit `mcontext_t::mc_tlsbase` to FreeBSD 15 ([#4640](https://github.com/rust-lang/libc/pull/464))
- FreeBSD: Update gating of `mcontext_t.mc_tlsbase` ([#4703](https://github.com/rust-lang/libc/pull/4703))
- Musl s390x: Correct the definition of `statfs[64]` ([#4549](https://github.com/rust-lang/libc/pull/4549))
- Musl s390x: Make `fpreg_t` a union ([#4549](https://github.com/rust-lang/libc/pull/4549))
- Redox: Fix the types of `gid_t` and `uid_t` ([#4689](https://github.com/rust-lang/libc/pull/4689))
- Redox: Fix the value of `MAP_FIXED` ([#4684](https://github.com/rust-lang/libc/pull/4684))

### Deprecated

- Apple: Correct the `deprecated` attribute for `iconv` ([`a97a0b53`](https://github.com/rust-lang/libc/commit/a97a0b53fb7faf5f99cd720ab12b1b8a5bf9f950))
- FreeBSD: Deprecate `TIOCMGDTRWAIT` and `TIOCMSDTRWAIT` ([#4685](https://github.com/rust-lang/libc/pull/4685))

### Removed

- FreeBSD: Remove `JAIL_{GET,SET}_MASK`, `_MC_FLAG_MASK` ([#4691](https://github.com/rust-lang/libc/pull/4691))

## [0.2.175](https://github.com/rust-lang/libc/compare/0.2.174...0.2.175) - 2025-08-10

### Added

- AIX: Add `getpeereid` ([#4524](https://github.com/rust-lang/libc/pull/4524))
- AIX: Add `struct ld_info` and friends ([#4578](https://github.com/rust-lang/libc/pull/4578))
- AIX: Retore `struct winsize` ([#4577](https://github.com/rust-lang/libc/pull/4577))
- Android: Add UDP socket option constants ([#4619](https://github.com/rust-lang/libc/pull/4619))
- Android: Add `CLONE_CLEAR_SIGHAND` and `CLONE_INTO_CGROUP` ([#4502](https://github.com/rust-lang/libc/pull/4502))
- Android: Add more `prctl` constants ([#4531](https://github.com/rust-lang/libc/pull/4531))
- FreeBSD Add further TCP stack-related constants ([#4196](https://github.com/rust-lang/libc/pull/4196))
- FreeBSD x86-64: Add `mcontext_t.mc_tlsbase ` ([#4503](https://github.com/rust-lang/libc/pull/4503))
- FreeBSD15: Add `kinfo_proc.ki_uerrmsg` ([#4552](https://github.com/rust-lang/libc/pull/4552))
- FreeBSD: Add `in_conninfo` ([#4482](https://github.com/rust-lang/libc/pull/4482))
- FreeBSD: Add `xinpgen` and related types ([#4482](https://github.com/rust-lang/libc/pull/4482))
- FreeBSD: Add `xktls_session` ([#4482](https://github.com/rust-lang/libc/pull/4482))
- Haiku: Add functionality from `libbsd` ([#4221](https://github.com/rust-lang/libc/pull/4221))
- Linux: Add `SECBIT_*` ([#4480](https://github.com/rust-lang/libc/pull/4480))
- NetBSD, OpenBSD: Export `ioctl` request generator macros ([#4460](https://github.com/rust-lang/libc/pull/4460))
- NetBSD: Add `ptsname_r` ([#4608](https://github.com/rust-lang/libc/pull/4608))
- RISCV32: Add time-related syscalls ([#4612](https://github.com/rust-lang/libc/pull/4612))
- Solarish: Add `strftime*` ([#4453](https://github.com/rust-lang/libc/pull/4453))
- linux: Add `EXEC_RESTRICT_*` and `EXEC_DENY_*` ([#4545](https://github.com/rust-lang/libc/pull/4545))

### Changed

- AIX: Add `const` to signatures to be consistent with other platforms ([#4563](https://github.com/rust-lang/libc/pull/4563))

### Fixed

- AIX: Fix the type of `struct statvfs.f_fsid` ([#4576](https://github.com/rust-lang/libc/pull/4576))
- AIX: Fix the type of constants for the `ioctl` `request` argument ([#4582](https://github.com/rust-lang/libc/pull/4582))
- AIX: Fix the types of `stat{,64}.st_*tim` ([#4597](https://github.com/rust-lang/libc/pull/4597))
- AIX: Use unique `errno` values ([#4507](https://github.com/rust-lang/libc/pull/4507))
- Build: Fix an incorrect `target_os` -> `target_arch` check ([#4550](https://github.com/rust-lang/libc/pull/4550))
- FreeBSD: Fix the type of `xktls_session_onedir.ifnet` ([#4552](https://github.com/rust-lang/libc/pull/4552))
- Mips64 musl: Fix the type of `nlink_t` ([#4509](https://github.com/rust-lang/libc/pull/4509))
- Mips64 musl: Use a special MIPS definition of `stack_t` ([#4528](https://github.com/rust-lang/libc/pull/4528))
- Mips64: Fix `SI_TIMER`, `SI_MESGQ` and `SI_ASYNCIO` definitions ([#4529](https://github.com/rust-lang/libc/pull/4529))
- Musl Mips64: Swap the order of `si_errno` and `si_code` in `siginfo_t` ([#4530](https://github.com/rust-lang/libc/pull/4530))
- Musl Mips64: Use a special MIPS definition of `statfs` ([#4527](https://github.com/rust-lang/libc/pull/4527))
- Musl: Fix the definition of `fanotify_event_metadata` ([#4510](https://github.com/rust-lang/libc/pull/4510))
- NetBSD: Correct `enum fae_action` to be `#[repr(C)]` ([#60a8cfd5](https://github.com/rust-lang/libc/commit/60a8cfd564f83164d45b9533ff7a0d7371878f2a))
- PSP: Correct `char` -> `c_char` ([eaab4fc3](https://github.com/rust-lang/libc/commit/eaab4fc3f05dc646a953d4fd5ba46dfa1f8bd6f6))
- PowerPC musl: Fix `termios` definitions ([#4518](https://github.com/rust-lang/libc/pull/4518))
- PowerPC musl: Fix the definition of `EDEADLK` ([#4517](https://github.com/rust-lang/libc/pull/4517))
- PowerPC musl: Fix the definition of `NCCS` ([#4513](https://github.com/rust-lang/libc/pull/4513))
- PowerPC musl: Fix the definitions of `MAP_LOCKED` and `MAP_NORESERVE` ([#4516](https://github.com/rust-lang/libc/pull/4516))
- PowerPC64 musl: Fix the definition of `shmid_ds` ([#4519](https://github.com/rust-lang/libc/pull/4519))

### Deprecated

- Linux: `MAP_32BIT` is only defined on x86 on non-x86 architectures ([#4511](https://github.com/rust-lang/libc/pull/4511))

### Removed

- AIX: Remove duplicate constant definitions `FIND` and `ENTER` ([#4588](https://github.com/rust-lang/libc/pull/4588))
- s390x musl: Remove `O_FSYNC` ([#4515](https://github.com/rust-lang/libc/pull/4515))
- s390x musl: Remove `RTLD_DEEPBIND` ([#4515](https://github.com/rust-lang/libc/pull/4515))


## [0.2.174](https://github.com/rust-lang/libc/compare/0.2.173...0.2.174) - 2025-06-17

### Added

- Linux: Make `pidfd_info` fields pub ([#4487](https://github.com/rust-lang/libc/pull/4487))

### Fixed

- Gnu x32: Add missing `timespec.tv_nsec` ([#4497](https://github.com/rust-lang/libc/pull/4497))
- NuttX: Use `nlink_t` type for `st_nlink` in `struct stat` definition ([#4483](https://github.com/rust-lang/libc/pull/4483))

### Other

- Allow new `unpredictable_function_pointer_comparisons` lints ([#4489](https://github.com/rust-lang/libc/pull/4489))
- OpenBSD: Fix some clippy warnings to use `pointer::cast`. ([#4490](https://github.com/rust-lang/libc/pull/4490))
- Remove unessecary semicolons from definitions of `CMSG_NXTHDR`. ([#4492](https://github.com/rust-lang/libc/pull/4492))


## [0.2.173](https://github.com/rust-lang/libc/compare/0.2.172...0.2.173) - 2025-06-09

### Added

- AIX: Add an AIX triple to Cargo.toml for doc ([#4475](https://github.com/rust-lang/libc/pull/4475))
- FreeBSD: Add the `SO_SPLICE` socket option support for FreeBSD >= 14.2 ([#4451](https://github.com/rust-lang/libc/pull/4451))
- Linux GNU: Prepare for supporting `_TIME_BITS=64` ([#4433](https://github.com/rust-lang/libc/pull/4433))
- Linux: Add constant PACKET_IGNORE_OUTGOING ([#4319](https://github.com/rust-lang/libc/pull/4319))
- Linux: Add constants and types for `nsfs` ioctls ([#4436](https://github.com/rust-lang/libc/pull/4436))
- Linux: Add constants for Memory-Deny-Write-Execute `prctls` ([#4400](https://github.com/rust-lang/libc/pull/4400))
- Linux: Add constants from `linux/cn_proc.h` and `linux/connector.h` ([#4434](https://github.com/rust-lang/libc/pull/4434))
- Linux: Add new flags for `pwritev2` and `preadv2` ([#4452](https://github.com/rust-lang/libc/pull/4452))
- Linux: Add pid_type enum values ([#4403](https://github.com/rust-lang/libc/pull/4403))
- Linux: Update pidfd constants and types (Linux 6.9-6.15) ([#4402](https://github.com/rust-lang/libc/pull/4402))
- Loongarch64 musl: Define the `MADV_SOFT_OFFLINE` constant ([#4448](https://github.com/rust-lang/libc/pull/4448))
- Musl: Add new fields since 1.2.0/1.2.2 to `struct tcp_info` ([#4443](https://github.com/rust-lang/libc/pull/4443))
- Musl: Prepare for supporting v1.2.3 ([#4443](https://github.com/rust-lang/libc/pull/4443))
- NuttX: Add `arc4random` and `arc4random_buf` ([#4464](https://github.com/rust-lang/libc/pull/4464))
- RISC-V Musl: Add `MADV_SOFT_OFFLINE` definition ([#4447](https://github.com/rust-lang/libc/pull/4447))
- Redox: Define SCM_RIGHTS ([#4440](https://github.com/rust-lang/libc/pull/4440))
- VxWorks: Add missing UTIME defines and TASK_RENAME_LENGTH ([#4407](https://github.com/rust-lang/libc/pull/4407))
- Windows: Add more `time.h` functions ([#4427](https://github.com/rust-lang/libc/pull/4427))

### Changed

- Redox: Update `SA_` constants. ([#4426](https://github.com/rust-lang/libc/pull/4426))
- Redox: make `CMSG_ALIGN`, `CMSG_LEN`, and `CMSG_SPACE` const functions ([#4441](https://github.com/rust-lang/libc/pull/4441))

### Fixed

- AIX: Enable libc-test and fix definitions/declarations. ([#4450](https://github.com/rust-lang/libc/pull/4450))
- Emscripten: Fix querying emcc on windows (use emcc.bat) ([#4248](https://github.com/rust-lang/libc/pull/4248))
- Hurd: Fix build from missing `fpos_t` ([#4472](https://github.com/rust-lang/libc/pull/4472))
- Loongarch64 Musl: Fix the `struct ipc_perm` bindings ([#4384](https://github.com/rust-lang/libc/pull/4384))
- Musl: Fix the `O_LARGEFILE` constant value. ([#4443](https://github.com/rust-lang/libc/pull/4443))

## [0.2.172](https://github.com/rust-lang/libc/compare/0.2.171...0.2.172) - 2025-04-14

### Added

- Android: Add `getauxval` for 32-bit targets ([#4338](https://github.com/rust-lang/libc/pull/4338))
- Android: Add `if_tun.h` ioctls ([#4379](https://github.com/rust-lang/libc/pull/4379))
- Android: Define `SO_BINDTOIFINDEX` ([#4391](https://github.com/rust-lang/libc/pull/4391))
- Cygwin: Add `posix_spawn_file_actions_add[f]chdir[_np]` ([#4387](https://github.com/rust-lang/libc/pull/4387))
- Cygwin: Add new socket options ([#4350](https://github.com/rust-lang/libc/pull/4350))
- Cygwin: Add statfs & fcntl ([#4321](https://github.com/rust-lang/libc/pull/4321))
- FreeBSD: Add `filedesc` and `fdescenttbl` ([#4327](https://github.com/rust-lang/libc/pull/4327))
- Glibc: Add unstable support for _FILE_OFFSET_BITS=64 ([#4345](https://github.com/rust-lang/libc/pull/4345))
- Hermit: Add `AF_UNSPEC` ([#4344](https://github.com/rust-lang/libc/pull/4344))
- Hermit: Add `AF_VSOCK` ([#4344](https://github.com/rust-lang/libc/pull/4344))
- Illumos, NetBSD: Add `timerfd` APIs ([#4333](https://github.com/rust-lang/libc/pull/4333))
- Linux: Add `_IO`, `_IOW`, `_IOR`, `_IOWR` to the exported API ([#4325](https://github.com/rust-lang/libc/pull/4325))
- Linux: Add `tcp_info` to uClibc bindings ([#4347](https://github.com/rust-lang/libc/pull/4347))
- Linux: Add further BPF program flags ([#4356](https://github.com/rust-lang/libc/pull/4356))
- Linux: Add missing INPUT_PROP_XXX flags from `input-event-codes.h` ([#4326](https://github.com/rust-lang/libc/pull/4326))
- Linux: Add missing TLS bindings ([#4296](https://github.com/rust-lang/libc/pull/4296))
- Linux: Add more constants from `seccomp.h` ([#4330](https://github.com/rust-lang/libc/pull/4330))
- Linux: Add more glibc `ptrace_sud_config` and related `PTRACE_*ET_SYSCALL_USER_DISPATCH_CONFIG`. ([#4386](https://github.com/rust-lang/libc/pull/4386))
- Linux: Add new netlink flags ([#4288](https://github.com/rust-lang/libc/pull/4288))
- Linux: Define ioctl codes on more architectures ([#4382](https://github.com/rust-lang/libc/pull/4382))
- Linux: Add missing `pthread_attr_setstack` ([#4349](https://github.com/rust-lang/libc/pull/4349))
- Musl: Add missing `utmpx` API ([#4332](https://github.com/rust-lang/libc/pull/4332))
- Musl: Enable `getrandom` on all platforms ([#4346](https://github.com/rust-lang/libc/pull/4346))
- NuttX: Add more signal constants ([#4353](https://github.com/rust-lang/libc/pull/4353))
- QNX: Add QNX 7.1-iosock and 8.0 to list of additional cfgs ([#4169](https://github.com/rust-lang/libc/pull/4169))
- QNX: Add support for alternative Neutrino network stack `io-sock` ([#4169](https://github.com/rust-lang/libc/pull/4169))
- Redox: Add more `sys/socket.h` and `sys/uio.h` definitions ([#4388](https://github.com/rust-lang/libc/pull/4388))
- Solaris: Temporarily define `O_DIRECT` and `SIGINFO` ([#4348](https://github.com/rust-lang/libc/pull/4348))
- Solarish: Add `secure_getenv` ([#4342](https://github.com/rust-lang/libc/pull/4342))
- VxWorks: Add missing `d_type` member to `dirent` ([#4352](https://github.com/rust-lang/libc/pull/4352))
- VxWorks: Add missing signal-related constsants ([#4352](https://github.com/rust-lang/libc/pull/4352))
- VxWorks: Add more error codes ([#4337](https://github.com/rust-lang/libc/pull/4337))

### Deprecated

- FreeBSD: Deprecate `TCP_PCAP_OUT` and `TCP_PCAP_IN` ([#4381](https://github.com/rust-lang/libc/pull/4381))

### Fixed

- Cygwin: Fix member types of `statfs` ([#4324](https://github.com/rust-lang/libc/pull/4324))
- Cygwin: Fix tests  ([#4357](https://github.com/rust-lang/libc/pull/4357))
- Hermit: Make `AF_INET = 3` ([#4344](https://github.com/rust-lang/libc/pull/4344))
- Musl: Fix the syscall table on RISC-V-32 ([#4335](https://github.com/rust-lang/libc/pull/4335))
- Musl: Fix the value of `SA_ONSTACK` on RISC-V-32 ([#4335](https://github.com/rust-lang/libc/pull/4335))
- VxWorks: Fix a typo in the `waitpid` parameter name ([#4334](https://github.com/rust-lang/libc/pull/4334))

### Removed

- Musl: Remove `O_FSYNC` on RISC-V-32 (use `O_SYNC` instead) ([#4335](https://github.com/rust-lang/libc/pull/4335))
- Musl: Remove `RTLD_DEEPBIND` on RISC-V-32 ([#4335](https://github.com/rust-lang/libc/pull/4335))

### Other

- CI: Add matrix env variables to the environment ([#4345](https://github.com/rust-lang/libc/pull/4345))
- CI: Always deny warnings ([#4363](https://github.com/rust-lang/libc/pull/4363))
- CI: Always upload successfully created artifacts ([#4345](https://github.com/rust-lang/libc/pull/4345))
- CI: Install musl from source for loongarch64 ([#4320](https://github.com/rust-lang/libc/pull/4320))
- CI: Revert "Also skip `MFD_EXEC` and `MFD_NOEXEC_SEAL` on sparc64" ([#]())
- CI: Use `$PWD` instead of `$(pwd)` in run-docker ([#4345](https://github.com/rust-lang/libc/pull/4345))
- Solarish: Restrict `openpty` and `forkpty` polyfills to Illumos, replace Solaris implementation with bindings ([#4329](https://github.com/rust-lang/libc/pull/4329))
- Testing: Ensure the makedev test does not emit unused errors ([#4363](https://github.com/rust-lang/libc/pull/4363))

## [0.2.171](https://github.com/rust-lang/libc/compare/0.2.170...0.2.171) - 2025-03-11

### Added

- Android: Add `if_nameindex`/`if_freenameindex` support ([#4247](https://github.com/rust-lang/libc/pull/4247))
- Apple: Add missing proc types and constants ([#4310](https://github.com/rust-lang/libc/pull/4310))
- BSD: Add `devname` ([#4285](https://github.com/rust-lang/libc/pull/4285))
- Cygwin: Add PTY and group API ([#4309](https://github.com/rust-lang/libc/pull/4309))
- Cygwin: Add support ([#4279](https://github.com/rust-lang/libc/pull/4279))
- FreeBSD: Make `spawn.h` interfaces available on all FreeBSD-like systems ([#4294](https://github.com/rust-lang/libc/pull/4294))
- Linux: Add `AF_XDP` structs for all Linux environments ([#4163](https://github.com/rust-lang/libc/pull/4163))
- Linux: Add SysV semaphore constants ([#4286](https://github.com/rust-lang/libc/pull/4286))
- Linux: Add `F_SEAL_EXEC` ([#4316](https://github.com/rust-lang/libc/pull/4316))
- Linux: Add `SO_PREFER_BUSY_POLL` and `SO_BUSY_POLL_BUDGET` ([#3917](https://github.com/rust-lang/libc/pull/3917))
- Linux: Add `devmem` structs ([#4299](https://github.com/rust-lang/libc/pull/4299))
- Linux: Add socket constants up to `SO_DEVMEM_DONTNEED` ([#4299](https://github.com/rust-lang/libc/pull/4299))
- NetBSD, OpenBSD, DragonflyBSD: Add `closefrom` ([#4290](https://github.com/rust-lang/libc/pull/4290))
- NuttX: Add `pw_passwd` field to `passwd` ([#4222](https://github.com/rust-lang/libc/pull/4222))
- Solarish: define `IP_BOUND_IF` and `IPV6_BOUND_IF` ([#4287](https://github.com/rust-lang/libc/pull/4287))
- Wali: Add bindings for `wasm32-wali-linux-musl` target ([#4244](https://github.com/rust-lang/libc/pull/4244))

### Changed

- AIX: Use `sa_sigaction` instead of a union ([#4250](https://github.com/rust-lang/libc/pull/4250))
- Make `msqid_ds.__msg_cbytes` public ([#4301](https://github.com/rust-lang/libc/pull/4301))
- Unix: Make all `major`, `minor`, `makedev` into `const fn` ([#4208](https://github.com/rust-lang/libc/pull/4208))

### Deprecated

- Linux: Deprecate obsolete packet filter interfaces ([#4267](https://github.com/rust-lang/libc/pull/4267))

### Fixed

- Cygwin: Fix strerror_r ([#4308](https://github.com/rust-lang/libc/pull/4308))
- Cygwin: Fix usage of f! ([#4308](https://github.com/rust-lang/libc/pull/4308))
- Hermit: Make `stat::st_size` signed ([#4298](https://github.com/rust-lang/libc/pull/4298))
- Linux: Correct values for `SI_TIMER`, `SI_MESGQ`, `SI_ASYNCIO` ([#4292](https://github.com/rust-lang/libc/pull/4292))
- NuttX: Update `tm_zone` and `d_name` fields to use `c_char` type ([#4222](https://github.com/rust-lang/libc/pull/4222))
- Xous: Include the prelude to define `c_int` ([#4304](https://github.com/rust-lang/libc/pull/4304))

### Other

- Add labels to FIXMEs ([#4231](https://github.com/rust-lang/libc/pull/4231), [#4232](https://github.com/rust-lang/libc/pull/4232), [#4234](https://github.com/rust-lang/libc/pull/4234), [#4235](https://github.com/rust-lang/libc/pull/4235), [#4236](https://github.com/rust-lang/libc/pull/4236))
- CI: Fix "cannot find libc" error on Sparc64 ([#4317](https://github.com/rust-lang/libc/pull/4317))
- CI: Fix "cannot find libc" error on s390x ([#4317](https://github.com/rust-lang/libc/pull/4317))
- CI: Pass `--no-self-update` to `rustup update` ([#4306](https://github.com/rust-lang/libc/pull/4306))
- CI: Remove tests for the `i586-pc-windows-msvc` target ([#4311](https://github.com/rust-lang/libc/pull/4311))
- CI: Remove the `check_cfg` job ([#4322](https://github.com/rust-lang/libc/pull/4312))
- Change the range syntax that is giving `ctest` problems ([#4311](https://github.com/rust-lang/libc/pull/4311))
- Linux: Split out the stat struct for gnu/b32/mips ([#4276](https://github.com/rust-lang/libc/pull/4276))

### Removed

- NuttX: Remove `pthread_set_name_np` ([#4251](https://github.com/rust-lang/libc/pull/4251))

## [0.2.170](https://github.com/rust-lang/libc/compare/0.2.169...0.2.170) - 2025-02-23

### Added

- Android: Declare `setdomainname` and `getdomainname` <https://github.com/rust-lang/libc/pull/4212>
- FreeBSD: Add `evdev` structures <https://github.com/rust-lang/libc/pull/3756>
- FreeBSD: Add the new `st_filerev` field to `stat32` ([#4254](https://github.com/rust-lang/libc/pull/4254))
- Linux: Add `SI_*`` and `TRAP_*`` signal codes <https://github.com/rust-lang/libc/pull/4225>
- Linux: Add experimental configuration to enable 64-bit time in kernel APIs, set by `RUST_LIBC_UNSTABLE_LINUX_TIME_BITS64`. <https://github.com/rust-lang/libc/pull/4148>
- Linux: Add recent socket timestamping flags <https://github.com/rust-lang/libc/pull/4273>
- Linux: Added new CANFD_FDF flag for the flags field of canfd_frame <https://github.com/rust-lang/libc/pull/4223>
- Musl: add CLONE_NEWTIME <https://github.com/rust-lang/libc/pull/4226>
- Solarish: add the posix_spawn family of functions <https://github.com/rust-lang/libc/pull/4259>

### Deprecated

- Linux: deprecate kernel modules syscalls <https://github.com/rust-lang/libc/pull/4228>

### Changed

- Emscripten: Assume version is at least 3.1.42 <https://github.com/rust-lang/libc/pull/4243>

### Fixed

- BSD: Correct the definition of `WEXITSTATUS` <https://github.com/rust-lang/libc/pull/4213>
- Hurd: Fix CMSG_DATA on 64bit systems ([#4240](https://github.com/rust-lang/libc/pull/424))
- NetBSD: fix `getmntinfo` ([#4265](https://github.com/rust-lang/libc/pull/4265)
- VxWorks: Fix the size of `time_t` <https://github.com/rust-lang/libc/pull/426>

### Other

- Add labels to FIXMEs <https://github.com/rust-lang/libc/pull/4230>, <https://github.com/rust-lang/libc/pull/4229>, <https://github.com/rust-lang/libc/pull/4237>
- CI: Bump FreeBSD CI to 13.4 and 14.2 <https://github.com/rust-lang/libc/pull/4260>
- Copy definitions from core::ffi and centralize them <https://github.com/rust-lang/libc/pull/4256>
- Define c_char at top-level and remove per-target c_char definitions <https://github.com/rust-lang/libc/pull/4202>
- Port style.rs to syn and add tests for the style checker <https://github.com/rust-lang/libc/pull/4220>

## [0.2.169](https://github.com/rust-lang/libc/compare/0.2.168...0.2.169) - 2024-12-18

### Added

- FreeBSD: add more socket TCP stack constants <https://github.com/rust-lang/libc/pull/4193>
- Fuchsia: add a `sockaddr_vm` definition <https://github.com/rust-lang/libc/pull/4194>

### Fixed

**Breaking**: [rust-lang/rust#132975](https://github.com/rust-lang/rust/pull/132975) corrected the signedness of `core::ffi::c_char` on various Tier 2 and Tier 3 platforms (mostly Arm and RISC-V) to match Clang. This release contains the corresponding changes to `libc`, including the following specific pull requests:

- ESP-IDF: Replace arch-conditional `c_char` with a reexport <https://github.com/rust-lang/libc/pull/4195>
- Fix `c_char` on various targets <https://github.com/rust-lang/libc/pull/4199>
- Mirror `c_char` configuration from `rust-lang/rust` <https://github.com/rust-lang/libc/pull/4198>

### Cleanup

- Do not re-export `c_void` in target-specific code <https://github.com/rust-lang/libc/pull/4200>

## [0.2.168](https://github.com/rust-lang/libc/compare/0.2.167...0.2.168) - 2024-12-09

### Added

- Linux: Add new process flags ([#4174](https://github.com/rust-lang/libc/pull/4174))
- Linux: Make `IFA_*` constants available on all Linux targets <https://github.com/rust-lang/libc/pull/4185>
- Linux: add `MAP_DROPPABLE` <https://github.com/rust-lang/libc/pull/4173>
- Solaris, Illumos: add `SIGRTMIN` and `SIGRTMAX` <https://github.com/rust-lang/libc/pull/4171>
- Unix, Linux: adding POSIX `memccpy` and `mempcpy` GNU extension <https://github.com/rust-lang/libc/pull/4186.

### Deprecated

- FreeBSD: Deprecate the CAP_UNUSED* and CAP_ALL* constants ([#4183](https://github.com/rust-lang/libc/pull/4183))

### Fixed

- Make the `Debug` implementation for unions opaque ([#4176](https://github.com/rust-lang/libc/pull/4176))

### Other

- Allow the `unpredictable_function_pointer_comparisons` lint where needed <https://github.com/rust-lang/libc/pull/4177>
- CI: Upload artifacts created by libc-test <https://github.com/rust-lang/libc/pull/4180>
- CI: Use workflow commands to group output by target <https://github.com/rust-lang/libc/pull/4179>
- CI: add caching <https://github.com/rust-lang/libc/pull/4183>

## [0.2.167](https://github.com/rust-lang/libc/compare/0.2.166...0.2.167) - 2024-11-28

### Added

- Solarish: add `st_fstype` to `stat` <https://github.com/rust-lang/libc/pull/4145>
- Trusty: Add `intptr_t` and `uintptr_t` ([#4161](https://github.com/rust-lang/libc/pull/4161))

### Fixed

- Fix the build with `rustc-dep-of-std` <https://github.com/rust-lang/libc/pull/4158>
- Wasi: Add back unsafe block for `clockid_t` static variables ([#4157](https://github.com/rust-lang/libc/pull/4157))

### Cleanup

- Create an internal prelude <https://github.com/rust-lang/libc/pull/4161>
- Fix `unused_qualifications`<https://github.com/rust-lang/libc/pull/4132>

### Other

- CI: Check various FreeBSD versions ([#4159](https://github.com/rust-lang/libc/pull/4159))
- CI: add a timeout for all jobs <https://github.com/rust-lang/libc/pull/4164>
- CI: verify MSRV for `wasm32-wasi` <https://github.com/rust-lang/libc/pull/4157>
- Migrate to the 2021 edition <https://github.com/rust-lang/libc/pull/4132>

### Removed

- Remove one unused import after the edition 2021 bump

## [0.2.166](https://github.com/rust-lang/libc/compare/0.2.165...0.2.166) - 2024-11-26

### Fixed

This release resolves two cases of unintentional breakage from the previous release:

- Revert removal of array size hacks [#4150](https://github.com/rust-lang/libc/pull/4150)
- Ensure `const extern` functions are always enabled [#4151](https://github.com/rust-lang/libc/pull/4151)

## [0.2.165](https://github.com/rust-lang/libc/compare/0.2.164...0.2.165) - 2024-11-25

### Added

- Android: add `mkostemp`, `mkostemps` <https://github.com/rust-lang/libc/pull/3601>
- Android: add a few API 30 calls <https://github.com/rust-lang/libc/pull/3604>
- Android: add missing syscall constants <https://github.com/rust-lang/libc/pull/3558>
- Apple: add `in6_ifreq` <https://github.com/rust-lang/libc/pull/3617>
- Apple: add missing `sysctl` net types <https://github.com/rust-lang/libc/pull/4022> (before release: remove `if_family_id` ([#4137](https://github.com/rust-lang/libc/pulls/4137)))
- Freebsd: add `kcmp` call support <https://github.com/rust-lang/libc/pull/3746>
- Hurd: add `MAP_32BIT` and `MAP_EXCL` <https://github.com/rust-lang/libc/pull/4127>
- Hurd: add `domainname` field to `utsname` ([#4089](https://github.com/rust-lang/libc/pulls/4089))
- Linux GNU: add `f_flags` to struct `statfs` for arm, mips, powerpc and x86 <https://github.com/rust-lang/libc/pull/3663>
- Linux GNU: add `malloc_stats` <https://github.com/rust-lang/libc/pull/3596>
- Linux: add ELF relocation-related structs <https://github.com/rust-lang/libc/pull/3583>
- Linux: add `ptp_*` structs <https://github.com/rust-lang/libc/pull/4113>
- Linux: add `ptp_clock_caps` <https://github.com/rust-lang/libc/pull/4128>
- Linux: add `ptp_pin_function` and most `PTP_` constants <https://github.com/rust-lang/libc/pull/4114>
- Linux: add missing AF_XDP structs & constants <https://github.com/rust-lang/libc/pull/3956>
- Linux: add missing netfilter consts ([#3734](https://github.com/rust-lang/libc/pulls/3734))
- Linux: add struct and constants for the `mount_setattr` syscall <https://github.com/rust-lang/libc/pull/4046>
- Linux: add wireless API <https://github.com/rust-lang/libc/pull/3441>
- Linux: expose the `len8_dlc` field of `can_frame` <https://github.com/rust-lang/libc/pull/3357>
- Musl: add `utmpx` API <https://github.com/rust-lang/libc/pull/3213>
- Musl: add missing syscall constants <https://github.com/rust-lang/libc/pull/4028>
- NetBSD: add `mcontext`-related data for RISCV64 <https://github.com/rust-lang/libc/pull/3468>
- Redox: add new `netinet` constants <https://github.com/rust-lang/libc/pull/3586>)
- Solarish: add `_POSIX_VDISABLE` ([#4103](https://github.com/rust-lang/libc/pulls/4103))
- Tests: Add a test that the `const extern fn` macro works <https://github.com/rust-lang/libc/pull/4134>
- Tests: Add test of primitive types against `std` <https://github.com/rust-lang/libc/pull/3616>
- Unix: Add `htonl`, `htons`, `ntohl`, `ntohs` <https://github.com/rust-lang/libc/pull/3669>
- Unix: add `aligned_alloc` <https://github.com/rust-lang/libc/pull/3843>
- Windows: add `aligned_realloc` <https://github.com/rust-lang/libc/pull/3592>

### Fixed

- **breaking** Hurd: fix `MAP_HASSEMAPHORE` name ([#4127](https://github.com/rust-lang/libc/pulls/4127))
- **breaking** ulibc Mips: fix `SA_*` mismatched types ([#3211](https://github.com/rust-lang/libc/pulls/3211))
- Aix: fix an enum FFI safety warning <https://github.com/rust-lang/libc/pull/3644>
- Haiku: fix some typos ([#3664](https://github.com/rust-lang/libc/pulls/3664))
- Tests: fix `Elf{32,64}_Relr`-related tests <https://github.com/rust-lang/libc/pull/3647>
- Tests: fix libc-tests for `loongarch64-linux-musl`
- Tests: fix some clippy warnings <https://github.com/rust-lang/libc/pull/3855>
- Tests: fix tests on `riscv64gc-unknown-freebsd` <https://github.com/rust-lang/libc/pull/4129>

### Deprecated

- Apple: deprecate `iconv_open` <https://github.com/rust-lang/libc/commit/25e022a22eca3634166ef472b748c297e60fcf7f>
- Apple: deprecate `mach_task_self` <https://github.com/rust-lang/libc/pull/4095>
- Apple: update `mach` deprecation notices for things that were removed in `main` <https://github.com/rust-lang/libc/pull/4097>

### Cleanup

- Adjust the `f!` macro to be more flexible <https://github.com/rust-lang/libc/pull/4107>
- Aix: remove duplicate constants <https://github.com/rust-lang/libc/pull/3643>
- CI: make scripts more uniform <https://github.com/rust-lang/libc/pull/4042>
- Drop the `libc_align` conditional <https://github.com/rust-lang/libc/commit/b5b553d0ee7de0d4781432a9a9a0a6445dd7f34f>
- Drop the `libc_cfg_target_vendor` conditional <https://github.com/rust-lang/libc/pull/4060>
- Drop the `libc_const_size_of` conditional <https://github.com/rust-lang/libc/commit/5a43dd2754366f99b3a83881b30246ce0e51833c>
- Drop the `libc_core_cvoid` conditional <https://github.com/rust-lang/libc/pull/4060>
- Drop the `libc_int128` conditional <https://github.com/rust-lang/libc/pull/4060>
- Drop the `libc_non_exhaustive` conditional <https://github.com/rust-lang/libc/pull/4060>
- Drop the `libc_packedN` conditional <https://github.com/rust-lang/libc/pull/4060>
- Drop the `libc_priv_mod_use` conditional <https://github.com/rust-lang/libc/commit/19c59376d11b015009fb9b04f233a30a1bf50a91>
- Drop the `libc_union` conditional <https://github.com/rust-lang/libc/commit/b9e4d8012f612dfe24147da3e69522763f92b6e3>
- Drop the `long_array` conditional <https://github.com/rust-lang/libc/pull/4096>
- Drop the `ptr_addr_of` conditional <https://github.com/rust-lang/libc/pull/4065>
- Drop warnings about deprecated cargo features <https://github.com/rust-lang/libc/pull/4060>
- Eliminate uses of `struct_formatter` <https://github.com/rust-lang/libc/pull/4074>
- Fix a few other array size hacks <https://github.com/rust-lang/libc/commit/d63be8b69b0736753213f5d933767866a5801ee7>
- Glibc: remove redundant definitions ([#3261](https://github.com/rust-lang/libc/pulls/3261))
- Musl: remove redundant definitions ([#3261](https://github.com/rust-lang/libc/pulls/3261))
- Musl: unify definitions of `siginfo_t` ([#3261](https://github.com/rust-lang/libc/pulls/3261))
- Musl: unify definitions of statfs and statfs64 ([#3261](https://github.com/rust-lang/libc/pulls/3261))
- Musl: unify definitions of statvfs and statvfs64 ([#3261](https://github.com/rust-lang/libc/pulls/3261))
- Musl: unify statx definitions ([#3978](https://github.com/rust-lang/libc/pulls/3978))
- Remove array size hacks for Rust < 1.47 <https://github.com/rust-lang/libc/commit/27ee6fe02ca0848b2af3cd747536264e4c7b697d>
- Remove repetitive words <https://github.com/rust-lang/libc/commit/77de375891285e18a81616f7dceda6d52732eed6>
- Use #[derive] for Copy/Clone in s! and friends <https://github.com/rust-lang/libc/pull/4038>
- Use some tricks to format macro bodies <https://github.com/rust-lang/libc/pull/4107>

### Other

- Apply formatting to macro bodies <https://github.com/rust-lang/libc/pull/4107>
- Bump libc-test to Rust 2021 Edition <https://github.com/rust-lang/libc/pull/3905>
- CI: Add a check that semver files don't contain duplicate entries <https://github.com/rust-lang/libc/pull/4087>
- CI: Add `fanotify_event_info_fid` to FAM-exempt types <https://github.com/rust-lang/libc/pull/4038>
- CI: Allow rustfmt to organize imports ([#4136](https://github.com/rust-lang/libc/pulls/4136))
- CI: Always run rustfmt <https://github.com/rust-lang/libc/pull/4120>
- CI: Change 32-bit Docker images to use EOL repos <https://github.com/rust-lang/libc/pull/4120>
- CI: Change 64-bit Docker images to ubuntu:24.10 <https://github.com/rust-lang/libc/pull/4120>
- CI: Disable the check for >1 s! invocation <https://github.com/rust-lang/libc/pull/4107>
- CI: Ensure build channels get run even if FILTER is unset <https://github.com/rust-lang/libc/pull/4125>
- CI: Ensure there is a fallback for no_std <https://github.com/rust-lang/libc/pull/4125>
- CI: Fix cases where unset variables cause errors <https://github.com/rust-lang/libc/pull/4108>
- CI: Naming adjustments and cleanup <https://github.com/rust-lang/libc/pull/4124>
- CI: Only invoke rustup if running in CI <https://github.com/rust-lang/libc/pull/4107>
- CI: Remove the logic to handle old rust versions <https://github.com/rust-lang/libc/pull/4068>
- CI: Set -u (error on unset) in all script files <https://github.com/rust-lang/libc/pull/4108>
- CI: add support for `loongarch64-unknown-linux-musl` <https://github.com/rust-lang/libc/pull/4092>
- CI: make `aarch64-apple-darwin` not a nightly-only target <https://github.com/rust-lang/libc/pull/4068>
- CI: run shellcheck on all scripts <https://github.com/rust-lang/libc/pull/4042>
- CI: update musl headers to Linux 6.6 <https://github.com/rust-lang/libc/pull/3921>
- CI: use qemu-sparc64 to run sparc64 tests <https://github.com/rust-lang/libc/pull/4133>
- Drop the `libc_const_extern_fn` conditional <https://github.com/rust-lang/libc/commit/674cc1f47f605038ef1aa2cce8e8bc9dac128276>
- Drop the `libc_underscore_const_names` conditional <https://github.com/rust-lang/libc/commit/f0febd5e2e50b38e05259d3afad3c9783711bcf0>
- Explicitly set the edition to 2015 <https://github.com/rust-lang/libc/pull/4058>
- Introduce a `git-blame-ignore-revs` file <https://github.com/rust-lang/libc/pull/4107>
- Tests: Ignore fields as required on Ubuntu 24.10 <https://github.com/rust-lang/libc/pull/4120>
- Tests: skip `ATF_*` constants for OpenBSD <https://github.com/rust-lang/libc/pull/4088>
- Triagebot: Add an autolabel for CI <https://github.com/rust-lang/libc/pull/4052>

## [0.2.164](https://github.com/rust-lang/libc/compare/0.2.163...0.2.164) - 2024-11-16

### MSRV

This release increases the MSRV of `libc` to 1.63.

### Other

- CI: remove tests with rust < 1.63 <https://github.com/rust-lang/libc/pull/4051>
- MSRV: document the MSRV of the stable channel to be 1.63 <https://github.com/rust-lang/libc/pull/4040>
- MacOS: move ifconf to s_no_extra_traits <https://github.com/rust-lang/libc/pull/4051>

## [0.2.163](https://github.com/rust-lang/libc/compare/0.2.162...0.2.163) - 2024-11-16

### Added

- Aix: add more `dlopen` flags <https://github.com/rust-lang/libc/pull/4044>
- Android: add group calls <https://github.com/rust-lang/libc/pull/3499>
- FreeBSD: add `TCP_FUNCTION_BLK` and `TCP_FUNCTION_ALIAS` <https://github.com/rust-lang/libc/pull/4047>
- Linux: add `confstr` <https://github.com/rust-lang/libc/pull/3612>
- Solarish: add `aio` <https://github.com/rust-lang/libc/pull/4033>
- Solarish: add `arc4random*` <https://github.com/rust-lang/libc/pull/3944>

### Changed

- Emscripten: upgrade emsdk to 3.1.68 <https://github.com/rust-lang/libc/pull/3962>
- Hurd: use more standard types <https://github.com/rust-lang/libc/pull/3733>
- Hurd: use the standard `ssize_t = isize` <https://github.com/rust-lang/libc/pull/4029>
- Solaris: fix `confstr` and `ucontext_t` <https://github.com/rust-lang/libc/pull/4035>

### Other

- CI: add Solaris <https://github.com/rust-lang/libc/pull/4035>
- CI: add `i686-unknown-freebsd` <https://github.com/rust-lang/libc/pull/3997>
- CI: ensure that calls to `sort` do not depend on locale <https://github.com/rust-lang/libc/pull/4026>
- Specify `rust-version` in `Cargo.toml` <https://github.com/rust-lang/libc/pull/4041>

## [0.2.162](https://github.com/rust-lang/libc/compare/0.2.161...0.2.162) - 2024-11-07

### Added

- Android: fix the alignment of `uc_mcontext` on arm64 <https://github.com/rust-lang/libc/pull/3894>
- Apple: add `host_cpu_load_info` <https://github.com/rust-lang/libc/pull/3916>
- ESP-IDF: add a time flag <https://github.com/rust-lang/libc/pull/3993>
- FreeBSD: add the `CLOSE_RANGE_CLOEXEC` flag<https://github.com/rust-lang/libc/pull/3996>
- FreeBSD: fix test errors regarding `__gregset_t` <https://github.com/rust-lang/libc/pull/3995>
- FreeBSD: fix tests on x86 FreeBSD 15 <https://github.com/rust-lang/libc/pull/3948>
- FreeBSD: make `ucontext_t` and `mcontext_t` available on all architectures  <https://github.com/rust-lang/libc/pull/3848>
- Haiku: add `getentropy` <https://github.com/rust-lang/libc/pull/3991>
- Illumos: add `syncfs` <https://github.com/rust-lang/libc/pull/3990>
- Illumos: add some recently-added constants <https://github.com/rust-lang/libc/pull/3999>
- Linux: add `ioctl` flags <https://github.com/rust-lang/libc/pull/3960>
- Linux: add epoll busy polling parameters <https://github.com/rust-lang/libc/pull/3922>
- NuttX: add `pthread_[get/set]name_np` <https://github.com/rust-lang/libc/pull/4003>
- RTEMS: add `arc4random_buf` <https://github.com/rust-lang/libc/pull/3989>
- Trusty OS: add initial support <https://github.com/rust-lang/libc/pull/3942>
- WASIp2: expand socket support <https://github.com/rust-lang/libc/pull/3981>

### Fixed

- Emscripten: don't pass `-lc` <https://github.com/rust-lang/libc/pull/4002>
- Hurd: change `st_fsid` field to `st_dev` <https://github.com/rust-lang/libc/pull/3785>
- Hurd: fix the definition of `utsname` <https://github.com/rust-lang/libc/pull/3992>
- Illumos/Solaris: fix `FNM_CASEFOLD` definition <https://github.com/rust-lang/libc/pull/4004>
- Solaris: fix all tests <https://github.com/rust-lang/libc/pull/3864>

### Other

- CI: Add loongarch64 <https://github.com/rust-lang/libc/pull/4000>
- CI: Check that semver files are sorted <https://github.com/rust-lang/libc/pull/4018>
- CI: Re-enable the FreeBSD 15 job <https://github.com/rust-lang/libc/pull/3988>
- Clean up imports and `extern crate` usage <https://github.com/rust-lang/libc/pull/3897>
- Convert `mode_t` constants to octal <https://github.com/rust-lang/libc/pull/3634>
- Remove the `wasm32-wasi` target that has been deleted upstream <https://github.com/rust-lang/libc/pull/4013>

## [0.2.161](https://github.com/rust-lang/libc/compare/0.2.160...0.2.161) - 2024-10-17

### Fixed

- OpenBSD: fix `FNM_PATHNAME` and `FNM_NOESCAPE` values <https://github.com/rust-lang/libc/pull/3983>

## [0.2.160](https://github.com/rust-lang/libc/compare/0.2.159...0.2.160) - 2024-10-17

### Added

- Android: add `PR_GET_NAME` and `PR_SET_NAME` <https://github.com/rust-lang/libc/pull/3941>
- Apple: add `F_TRANSFEREXTENTS` <https://github.com/rust-lang/libc/pull/3925>
- Apple: add `mach_error_string` <https://github.com/rust-lang/libc/pull/3913>
- Apple: add additional `pthread` APIs <https://github.com/rust-lang/libc/pull/3846>
- Apple: add the `LOCAL_PEERTOKEN` socket option <https://github.com/rust-lang/libc/pull/3929>
- BSD: add `RTF_*`, `RTA_*`, `RTAX_*`, and `RTM_*` definitions <https://github.com/rust-lang/libc/pull/3714>
- Emscripten: add `AT_EACCESS` <https://github.com/rust-lang/libc/pull/3911>
- Emscripten: add `getgrgid`, `getgrnam`, `getgrnam_r` and `getgrgid_r` <https://github.com/rust-lang/libc/pull/3912>
- Emscripten: add `getpwnam_r` and `getpwuid_r` <https://github.com/rust-lang/libc/pull/3906>
- FreeBSD: add `POLLRDHUP` <https://github.com/rust-lang/libc/pull/3936>
- Haiku: add `arc4random` <https://github.com/rust-lang/libc/pull/3945>
- Illumos: add `ptsname_r` <https://github.com/rust-lang/libc/pull/3867>
- Linux: add `fanotify` interfaces <https://github.com/rust-lang/libc/pull/3695>
- Linux: add `tcp_info` <https://github.com/rust-lang/libc/pull/3480>
- Linux: add additional AF_PACKET options <https://github.com/rust-lang/libc/pull/3540>
- Linux: make Elf constants always available <https://github.com/rust-lang/libc/pull/3938>
- Musl x86: add `iopl` and `ioperm` <https://github.com/rust-lang/libc/pull/3720>
- Musl: add `posix_spawn` chdir functions <https://github.com/rust-lang/libc/pull/3949>
- Musl: add `utmpx.h` constants <https://github.com/rust-lang/libc/pull/3908>
- NetBSD: add `sysctlnametomib`, `CLOCK_THREAD_CPUTIME_ID` and `CLOCK_PROCESS_CPUTIME_ID` <https://github.com/rust-lang/libc/pull/3927>
- Nuttx: initial support <https://github.com/rust-lang/libc/pull/3909>
- RTEMS: add `getentropy` <https://github.com/rust-lang/libc/pull/3973>
- RTEMS: initial support <https://github.com/rust-lang/libc/pull/3866>
- Solarish: add `POLLRDHUP`, `POSIX_FADV_*`, `O_RSYNC`, and `posix_fallocate` <https://github.com/rust-lang/libc/pull/3936>
- Unix: add `fnmatch.h` <https://github.com/rust-lang/libc/pull/3937>
- VxWorks: add riscv64 support <https://github.com/rust-lang/libc/pull/3935>
- VxWorks: update constants related to the scheduler  <https://github.com/rust-lang/libc/pull/3963>

### Changed

- Redox: change `ino_t` to be `c_ulonglong` <https://github.com/rust-lang/libc/pull/3919>

### Fixed

- ESP-IDF: fix mismatched constants and structs <https://github.com/rust-lang/libc/pull/3920>
- FreeBSD: fix `struct stat` on FreeBSD 12+ <https://github.com/rust-lang/libc/pull/3946>

### Other

- CI: Fix CI for FreeBSD 15 <https://github.com/rust-lang/libc/pull/3950>
- Docs: link to `windows-sys` <https://github.com/rust-lang/libc/pull/3915>

## [0.2.159](https://github.com/rust-lang/libc/compare/0.2.158...0.2.159) - 2024-09-24

### Added

- Android: add more `AT_*` constants in <https://github.com/rust-lang/libc/pull/3779>
- Apple: add missing `NOTE_*` constants in <https://github.com/rust-lang/libc/pull/3883>
- Hermit: add missing error numbers in <https://github.com/rust-lang/libc/pull/3858>
- Hurd: add `__timeval` for 64-bit support in <https://github.com/rust-lang/libc/pull/3786>
- Linux: add `epoll_pwait2` in <https://github.com/rust-lang/libc/pull/3868>
- Linux: add `mq_notify` in <https://github.com/rust-lang/libc/pull/3849>
- Linux: add missing `NFT_CT_*` constants in <https://github.com/rust-lang/libc/pull/3844>
- Linux: add the `fchmodat2` syscall in <https://github.com/rust-lang/libc/pull/3588>
- Linux: add the `mseal` syscall in <https://github.com/rust-lang/libc/pull/3798>
- OpenBSD: add `sendmmsg` and `recvmmsg` in <https://github.com/rust-lang/libc/pull/3831>
- Unix: add `IN6ADDR_ANY_INIT` and `IN6ADDR_LOOPBACK_INIT` in <https://github.com/rust-lang/libc/pull/3693>
- VxWorks: add `S_ISVTX` in <https://github.com/rust-lang/libc/pull/3768>
- VxWorks: add `vxCpuLib` and `taskLib` functions <https://github.com/rust-lang/libc/pull/3861>
- WASIp2: add definitions for `std::net` support in <https://github.com/rust-lang/libc/pull/3892>

### Fixed

- Correctly handle version checks when `clippy-driver` is used <https://github.com/rust-lang/libc/pull/3893>

### Changed

- EspIdf: change signal constants to c_int in <https://github.com/rust-lang/libc/pull/3895>
- HorizonOS: update network definitions in <https://github.com/rust-lang/libc/pull/3863>
- Linux: combine `ioctl` APIs in <https://github.com/rust-lang/libc/pull/3722>
- WASI: enable CI testing in <https://github.com/rust-lang/libc/pull/3869>
- WASIp2: enable CI testing in <https://github.com/rust-lang/libc/pull/3870>

## [0.2.158](https://github.com/rust-lang/libc/compare/0.2.157...0.2.158) - 2024-08-19

### Other
- WASI: fix missing `Iterator` with `rustc-dep-of-std` in <https://github.com/rust-lang/libc/pull/3856#event-13924913068>

## [0.2.157](https://github.com/rust-lang/libc/compare/0.2.156...0.2.157) - 2024-08-17

### Added

- Apple: add `_NSGetArgv`, `_NSGetArgc` and `_NSGetProgname` in <https://github.com/rust-lang/libc/pull/3702>
- Build: add `RUSTC_WRAPPER` support in <https://github.com/rust-lang/libc/pull/3845>
- FreeBSD: add `execvpe` support from 14.1 release in <https://github.com/rust-lang/libc/pull/3745>
- Fuchsia: add `SO_BINDTOIFINDEX`
- Linux: add `klogctl` in <https://github.com/rust-lang/libc/pull/3777>
- MacOS: add `fcntl` OFD commands in <https://github.com/rust-lang/libc/pull/3563>
- NetBSD: add `_lwp_park` in <https://github.com/rust-lang/libc/pull/3721>
- Solaris: add missing networking support in <https://github.com/rust-lang/libc/pull/3717>
- Unix: add `pthread_equal` in <https://github.com/rust-lang/libc/pull/3773>
- WASI: add `select`, `FD_SET`, `FD_ZERO`, `FD_ISSET ` in <https://github.com/rust-lang/libc/pull/3681>

### Fixed
- TEEOS: fix octal notation for `O_*` constants in <https://github.com/rust-lang/libc/pull/3841>

### Changed
- FreeBSD: always use freebsd12 when `rustc_dep_of_std` is set in <https://github.com/rust-lang/libc/pull/3723>

## [0.2.156](https://github.com/rust-lang/libc/compare/v0.2.155...v0.2.156) - 2024-08-15

### Added
- Apple: add `F_ALLOCATEPERSIST` in <https://github.com/rust-lang/libc/pull/3712>
- Apple: add `os_sync_wait_on_address` and related definitions in <https://github.com/rust-lang/libc/pull/3769>
- BSD: generalise `IPV6_DONTFRAG` to all BSD targets in <https://github.com/rust-lang/libc/pull/3716>
- FreeBSD/DragonFly: add `IP_RECVTTL`/`IPV6_RECVHOPLIMIT` in <https://github.com/rust-lang/libc/pull/3751>
- Hurd: add `XATTR_CREATE`, `XATTR_REPLACE` in <https://github.com/rust-lang/libc/pull/3739>
- Linux GNU: `confstr` API and `_CS_*` in <https://github.com/rust-lang/libc/pull/3771>
- Linux musl: add `preadv2` and `pwritev2` (1.2.5 min.) in <https://github.com/rust-lang/libc/pull/3762>
- VxWorks: add the constant `SOMAXCONN` in <https://github.com/rust-lang/libc/pull/3761>
- VxWorks: add a few errnoLib related constants in <https://github.com/rust-lang/libc/pull/3780>

### Fixed
- Solaris/illumos: Change `ifa_flags` type to u64 in <https://github.com/rust-lang/libc/pull/3729>
- QNX 7.0: Disable `libregex` in <https://github.com/rust-lang/libc/pull/3775>

### Changed
- QNX NTO: update platform support in <https://github.com/rust-lang/libc/pull/3815>
- `addr_of!(EXTERN_STATIC)` is now considered safe in <https://github.com/rust-lang/libc/pull/3776>

### Removed
- Apple: remove `rmx_state` in <https://github.com/rust-lang/libc/pull/3776>

### Other
- Update or remove CI tests that have been failing


---

<!-- source: archive/library/rust/references/packages/log/CHANGELOG--001015.md -->

## Imported source: archive/library/rust/references/packages/log/CHANGELOG--001015.md

# Change Log

## [Unreleased]

## [0.4.28] - 2025-09-02

## What's Changed
* ci: drop really old trick and ensure MSRV for all feature combo by @tisonkun in https://github.com/rust-lang/log/pull/676
* Chore: delete compare_exchange method for AtomicUsize on platforms without atomics  by @HaoliangXu in https://github.com/rust-lang/log/pull/690
* Add `increment_severity()` and `decrement_severity()` methods for `Level` and `LevelFilter` by @nebkor in https://github.com/rust-lang/log/pull/692

## New Contributors
* @xixishidibei made their first contribution in https://github.com/rust-lang/log/pull/677
* @ZylosLumen made their first contribution in https://github.com/rust-lang/log/pull/688
* @HaoliangXu made their first contribution in https://github.com/rust-lang/log/pull/690
* @nebkor made their first contribution in https://github.com/rust-lang/log/pull/692

**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.27...0.4.28

### Notable Changes
* MSRV is bumped to 1.61.0 in https://github.com/rust-lang/log/pull/676

## [0.4.27] - 2025-03-24

### What's Changed
* A few minor lint fixes by @nyurik in https://github.com/rust-lang/log/pull/671
* Enable clippy support for format-like macros by @nyurik in https://github.com/rust-lang/log/pull/665
* Add an optional logger param by @tisonkun in https://github.com/rust-lang/log/pull/664
* Pass global logger by value, supplied logger by ref by @KodrAus in https://github.com/rust-lang/log/pull/673


**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.26...0.4.27


## [0.4.26] - 2025-02-18

### What's Changed
* Derive `Clone` for `kv::Value` by @SpriteOvO in https://github.com/rust-lang/log/pull/668
* Add `spdlog-rs` link to crate doc by @SpriteOvO in https://github.com/rust-lang/log/pull/669


**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.25...0.4.26

## [0.4.25] - 2025-01-14

### What's Changed
* Revert loosening of kv cargo features by @KodrAus in https://github.com/rust-lang/log/pull/662


**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.24...0.4.25

## [0.4.24] - 2025-01-11

### What's Changed
* Fix up kv feature activation by @KodrAus in https://github.com/rust-lang/log/pull/659


**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.23...0.4.24

## [0.4.23] - 2025-01-10 (yanked)

### What's Changed
* Fix some typos by @Kleinmarb in https://github.com/rust-lang/log/pull/637
* Add logforth to implementation by @tisonkun in https://github.com/rust-lang/log/pull/638
* Add `spdlog-rs` link to README by @SpriteOvO in https://github.com/rust-lang/log/pull/639
* Add correct lifetime to kv::Value::to_borrowed_str by @stevenroose in https://github.com/rust-lang/log/pull/643
* docs: Add logforth as an impl by @tisonkun in https://github.com/rust-lang/log/pull/642
* Add clang_log implementation by @DDAN-17 in https://github.com/rust-lang/log/pull/646
* Bind lifetimes of &str returned from Key by the lifetime of 'k rather than the lifetime of the Key struct by @gbbosak in https://github.com/rust-lang/log/pull/648
* Fix up key lifetimes and add method to try get a borrowed key by @KodrAus in https://github.com/rust-lang/log/pull/653
* Add Ftail implementation by @tjardoo in https://github.com/rust-lang/log/pull/652

### New Contributors
* @Kleinmarb made their first contribution in https://github.com/rust-lang/log/pull/637
* @tisonkun made their first contribution in https://github.com/rust-lang/log/pull/638
* @SpriteOvO made their first contribution in https://github.com/rust-lang/log/pull/639
* @stevenroose made their first contribution in https://github.com/rust-lang/log/pull/643
* @DDAN-17 made their first contribution in https://github.com/rust-lang/log/pull/646
* @gbbosak made their first contribution in https://github.com/rust-lang/log/pull/648
* @tjardoo made their first contribution in https://github.com/rust-lang/log/pull/652

**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.22...0.4.23

## [0.4.22] - 2024-06-27

### What's Changed
* Add some clarifications to the library docs by @KodrAus in https://github.com/rust-lang/log/pull/620
* Add links to `colog` crate by @chrivers in https://github.com/rust-lang/log/pull/621
* adding line_number test + updating some testing infrastructure by @DIvkov575 in https://github.com/rust-lang/log/pull/619
* Clarify the actual set of functions that can race in _racy variants by @KodrAus in https://github.com/rust-lang/log/pull/623
* Replace deprecated std::sync::atomic::spin_loop_hint() by @Catamantaloedis in https://github.com/rust-lang/log/pull/625
* Check usage of max_level features by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/627
* Remove unneeded import by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/628
* Loosen orderings for logger initialization in https://github.com/rust-lang/log/pull/632. Originally by @pwoolcoc in https://github.com/rust-lang/log/pull/599
* Use Location::caller() for file and line info in https://github.com/rust-lang/log/pull/633. Originally by @Cassy343 in https://github.com/rust-lang/log/pull/520

### New Contributors
* @chrivers made their first contribution in https://github.com/rust-lang/log/pull/621
* @DIvkov575 made their first contribution in https://github.com/rust-lang/log/pull/619
* @Catamantaloedis made their first contribution in https://github.com/rust-lang/log/pull/625

**Full Changelog**: https://github.com/rust-lang/log/compare/0.4.21...0.4.22

## [0.4.21] - 2024-02-27

### What's Changed
* Minor clippy nits by @nyurik in https://github.com/rust-lang/log/pull/578
* Simplify Display impl by @nyurik in https://github.com/rust-lang/log/pull/579
* Set all crates to 2021 edition by @nyurik in https://github.com/rust-lang/log/pull/580
* Various changes based on review by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/583
* Fix typo in file_static() method doc by @dimo414 in https://github.com/rust-lang/log/pull/590
* Specialize empty key value pairs by @EFanZh in https://github.com/rust-lang/log/pull/576
* Fix incorrect lifetime in Value::to_str() by @peterjoel in https://github.com/rust-lang/log/pull/587
* Remove some API of the key-value feature by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/585
* Add logcontrol-log and log-reload by @swsnr in https://github.com/rust-lang/log/pull/595
* Add Serialization section to kv::Value docs by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/593
* Rename Value::to_str to to_cow_str by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/592
* Clarify documentation and simplify initialization of `STATIC_MAX_LEVEL` by @ptosi in https://github.com/rust-lang/log/pull/594
* Update docs to 2021 edition, test by @nyurik in https://github.com/rust-lang/log/pull/577
* Add "alterable_logger" link to README.md by @brummer-simon in https://github.com/rust-lang/log/pull/589
* Normalize line ending by @EFanZh in https://github.com/rust-lang/log/pull/602
* Remove `ok_or` in favor of `Option::ok_or` by @AngelicosPhosphoros in https://github.com/rust-lang/log/pull/607
* Use `Acquire` ordering for initialization check by @AngelicosPhosphoros in https://github.com/rust-lang/log/pull/610
* Get structured logging API ready for stabilization by @KodrAus in https://github.com/rust-lang/log/pull/613

### New Contributors
* @nyurik made their first contribution in https://github.com/rust-lang/log/pull/578
* @dimo414 made their first contribution in https://github.com/rust-lang/log/pull/590
* @peterjoel made their first contribution in https://github.com/rust-lang/log/pull/587
* @ptosi made their first contribution in https://github.com/rust-lang/log/pull/594
* @brummer-simon made their first contribution in https://github.com/rust-lang/log/pull/589
* @AngelicosPhosphoros made their first contribution in https://github.com/rust-lang/log/pull/607

## [0.4.20] - 2023-07-11

* Remove rustversion dev-dependency by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/568
* Remove `local_inner_macros` usage by @EFanZh in https://github.com/rust-lang/log/pull/570

## [0.4.19] - 2023-06-10

* Use target_has_atomic instead of the old atomic_cas cfg by @GuillaumeGomez in https://github.com/rust-lang/log/pull/555
* Put MSRV into Cargo.toml by @est31 in https://github.com/rust-lang/log/pull/557

## [0.4.18] - 2023-05-28

* fix Markdown links (again) by @hellow554 in https://github.com/rust-lang/log/pull/513
* add cargo doc to workflow by @hellow554 in https://github.com/rust-lang/log/pull/515
* Apply Clippy lints by @hellow554 in https://github.com/rust-lang/log/pull/516
* Replace ad-hoc eq_ignore_ascii_case with slice::eq_ignore_ascii_case by @glandium in https://github.com/rust-lang/log/pull/519
* fix up windows targets by @KodrAus in https://github.com/rust-lang/log/pull/528
* typo fix by @jiangying000 in https://github.com/rust-lang/log/pull/529
* Remove dependency on cfg_if by @EriKWDev in https://github.com/rust-lang/log/pull/536
* GitHub Workflows security hardening by @sashashura in https://github.com/rust-lang/log/pull/538
* Fix build status badge by @atouchet in https://github.com/rust-lang/log/pull/539
* Add call_logger to the documentation by @a1ecbr0wn in https://github.com/rust-lang/log/pull/547
* Use stable internals for key-value API by @KodrAus in https://github.com/rust-lang/log/pull/550
* Change wording of list of implementations by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/553
* Add std-logger to list of implementations by @Thomasdezeeuw in https://github.com/rust-lang/log/pull/554
* Add `set_max_level_racy` and gate `set_max_level` by @djkoloski in https://github.com/rust-lang/log/pull/544
* [doc] src/lib.rs : prefix an unused variable with an underscore by @OccupyMars2025 in https://github.com/rust-lang/log/pull/561
* [doc] src/macros.rs :  correct  grammar errors of an example in lib documentation by @OccupyMars2025 in https://github.com/rust-lang/log/pull/562

## [0.4.17] - 2022-04-29

* Update `kv_unstable` internal dependencies.

## [0.4.16] - 2022-03-22

* Fix a conflict with unqualified `Option` use in macros.

## [0.4.15] - 2022-02-23

* Silence a warning about the deprecated `spin_loop_hint`.
* Relax ordering in the atomic `set_max_level` call.
* Add thumbv4t-none-eabi to targets that don't support atomics
* Allow levels to be iterated over.
* Implement `Log` on some common wrapper types.
* Improvements to test coverage.
* Improvements to documentation.
* Add key-value support to the `log!` macros.
* Tighten `kv_unstable` internal dependencies, so they don't bump past their current alpha.
* Add a simple visit API to `kv_unstable`.
* Support `NonZero*` integers as values in structured logging
* Support static strings as keys in structured logging

## [0.4.14] - 2021-01-27

* Remove the `__private_api_log_lit` special case.
* Fixed incorrect combination of `kv_unstable` and `std` features causing compile failures.
* Remove unstable `Value::to_*` conversions that were incorrectly using `as`.
* Rename unstable `Value::to_error` to `Value::to_borrowed_error`.

## [0.4.13] - 2021-01-11

* This is the same as `0.4.11`, except with a `kv_unstable_std` feature added to aid migrating current dependents to `0.4.14` (which was originally going to be `0.4.13` until it was decided to create a patch from `0.4.11` to minimize disruption).

## [0.4.12] - 2020-12-24

### New

* Support platforms without atomics by racing instead of failing to compile
* Implement `Log` for `Box<T: Log>`
* Update `cfg-if` to `1.0`
* Internal reworks of the structured logging API. Removed the `Fill` API
and added `source::as_map` and `source::as_list` to easily serialize a `Source`
as either a map of `{key: value, ..}` or as a list of `[(key, value), ..]`.

### Fixed

* Fixed deserialization of `LevelFilter` to use their `u64` index variants

## [0.4.11] - 2020-07-09

### New

* Support coercing structured values into concrete types.
* Reference the `win_dbg_logger` in the readme.

### Fixed

* Updates a few deprecated items used internally.
* Fixed issues in docs and expands sections.
* Show the correct build badge in the readme.
* Fix up a possible inference breakage with structured value errors.
* Respect formatting flags in structured value formatting.

## [0.4.10] - 2019-12-16 (yanked)

### Fixed

* Fixed the `log!` macros, so they work in expression context (this regressed in `0.4.9`, which has been yanked).

## [0.4.9] - 2019-12-12 (yanked)

### Minimum Supported Rust Version

This release bumps the minimum compiler version to `1.31.0`. This was mainly needed for `cfg-if`,
but between `1.16.0` and `1.31.0` there are a lot of language and library improvements we now
take advantage of.

### New

* Unstable support for capturing key-value pairs in a record using the `log!` macros

### Improved

* Better documentation for max level filters.
* Internal updates to line up with bumped MSRV

## [0.4.8] - 2019-07-28

### New

* Support attempting to get `Record` fields as static strings.

## [0.4.7] - 2019-07-06

### New

* Support for embedded environments with thread-unsafe initialization.
* Initial unstable support for capturing structured data under the `kv_unstable`
feature gate. This new API doesn't affect existing users and may change in future
patches (so those changes may not appear in the changelog until it stabilizes).

### Improved

* Docs for using `log` with the 2018 edition.
* Error messages for macros missing arguments.

## [0.4.6] - 2018-10-27

### Improved

* Support 2018-style macro import for the `log_enabled!` macro.

## [0.4.5] - 2018-09-03

### Improved

* Make `log`'s internal helper macros less likely to conflict with user-defined
  macros.

## [0.4.4] - 2018-08-17

### Improved

* Support 2018-style imports of the log macros.

## [0.4.3] - 2018-06-29

### Improved

* More code generation improvements.

## [0.4.2] - 2018-06-05

### Improved

* Log invocations now generate less code.

### Fixed

* Example Logger implementations now properly set the max log level.

## [0.4.1] - 2017-12-30

### Fixed

* Some doc links were fixed.

## [0.4.0] - 2017-12-24

The changes in this release include cleanup of some obscure functionality and a more robust public
API designed to support bridges to other logging systems, and provide more flexibility to new
features in the future.

### Compatibility

Vast portions of the Rust ecosystem use the 0.3.x release series of log, and we don't want to force
the community to go through the pain of upgrading every crate to 0.4.x at the exact same time. Along
with 0.4.0, we've published a new 0.3.9 release which acts as a "shim" over 0.4.0. This will allow
crates using either version to coexist without losing messages from one side or the other.

There is one caveat - a log message generated by a crate using 0.4.x but consumed by a logging
implementation using 0.3.x will not have a file name or module path. Applications affected by this
can upgrade their logging implementations to one using 0.4.x to avoid losing this information. The
other direction does not lose any information, fortunately!

**TL;DR** Libraries should feel comfortable upgrading to 0.4.0 without treating that as a breaking
change. Applications may need to update their logging implementation (e.g. env-logger) to a newer
version using log 0.4.x to avoid losing module and file information.

### New

* The crate is now `no_std` by default.
* `Level` and `LevelFilter` now implement `Serialize` and `Deserialize` when the `serde` feature is
    enabled.
* The `Record` and `Metadata` types can now be constructed by third-party code via a builder API.
* The `logger` free function returns a reference to the logger implementation. This, along with the
    ability to construct `Record`s, makes it possible to bridge from another logging framework to
    this one without digging into the private internals of the crate. The standard `error!` `warn!`,
    etc., macros now exclusively use the public API of the crate rather than "secret" internal APIs.
* `Log::flush` has been added to allow crates to tell the logging implementation to ensure that all
    "in flight" log events have been persisted. This can be used, for example, just before an
    application exits to ensure that asynchronous log sinks finish their work.

### Removed

* The `shutdown` and `shutdown_raw` functions have been removed. Supporting shutdown significantly
    complicated the implementation and imposed a performance cost on each logging operation.
* The `log_panics` function and its associated `nightly` Cargo feature have been removed. Use the
    [log-panics](https://crates.io/crates/log-panics) instead.

### Changed

* The `Log` prefix has been removed from type names. For example, `LogLevelFilter` is now
    `LevelFilter`, and `LogRecord` is now `Record`.
* The `MaxLogLevelFilter` object has been removed in favor of a `set_max_level` free function.
* The `set_logger` free functions have been restructured. The logger is now directly passed to the
    functions rather than a closure which returns the logger. `set_logger` now takes a `&'static
    Log` and is usable in `no_std` contexts in place of the old `set_logger_raw`. `set_boxed_logger`
    is a convenience function which takes a `Box<Log>` but otherwise acts like `set_logger`. It
    requires the `std` feature.
* The `file` and `module_path` values in `Record` no longer have the `'static` lifetime to support
    integration with other logging frameworks that don't provide a `'static` lifetime for the
    equivalent values.
* The `file`, `line`, and `module_path` values in `Record` are now `Option`s to support integration
    with other logging frameworks that don't provide those values.

### In the Future

* We're looking to add support for *structured* logging - the inclusion of extra key-value pairs of
    information in a log event in addition to the normal string message. This should be able to be
    added in a backwards compatible manner to the 0.4.x series when the design is worked out.

## Older

Look at the [release tags] for information about older releases.

[Unreleased]: https://github.com/rust-lang-nursery/log/compare/0.4.28...HEAD
[0.4.28]: https://github.com/rust-lang/log/compare/0.4.27...0.4.28
[0.4.27]: https://github.com/rust-lang/log/compare/0.4.26...0.4.27
[0.4.26]: https://github.com/rust-lang/log/compare/0.4.25...0.4.26
[0.4.25]: https://github.com/rust-lang/log/compare/0.4.24...0.4.25
[0.4.24]: https://github.com/rust-lang/log/compare/0.4.23...0.4.24
[0.4.23]: https://github.com/rust-lang/log/compare/0.4.22...0.4.23
[0.4.22]: https://github.com/rust-lang/log/compare/0.4.21...0.4.22
[0.4.21]: https://github.com/rust-lang/log/compare/0.4.20...0.4.21
[0.4.20]: https://github.com/rust-lang-nursery/log/compare/0.4.19...0.4.20
[0.4.19]: https://github.com/rust-lang-nursery/log/compare/0.4.18...0.4.19
[0.4.18]: https://github.com/rust-lang-nursery/log/compare/0.4.17...0.4.18
[0.4.17]: https://github.com/rust-lang-nursery/log/compare/0.4.16...0.4.17
[0.4.16]: https://github.com/rust-lang-nursery/log/compare/0.4.15...0.4.16
[0.4.15]: https://github.com/rust-lang-nursery/log/compare/0.4.13...0.4.15
[0.4.14]: https://github.com/rust-lang-nursery/log/compare/0.4.13...0.4.14
[0.4.13]: https://github.com/rust-lang-nursery/log/compare/0.4.11...0.4.13
[0.4.12]: https://github.com/rust-lang-nursery/log/compare/0.4.11...0.4.12
[0.4.11]: https://github.com/rust-lang-nursery/log/compare/0.4.10...0.4.11
[0.4.10]: https://github.com/rust-lang-nursery/log/compare/0.4.9...0.4.10
[0.4.9]: https://github.com/rust-lang-nursery/log/compare/0.4.8...0.4.9
[0.4.8]: https://github.com/rust-lang-nursery/log/compare/0.4.7...0.4.8
[0.4.7]: https://github.com/rust-lang-nursery/log/compare/0.4.6...0.4.7
[0.4.6]: https://github.com/rust-lang-nursery/log/compare/0.4.5...0.4.6
[0.4.5]: https://github.com/rust-lang-nursery/log/compare/0.4.4...0.4.5
[0.4.4]: https://github.com/rust-lang-nursery/log/compare/0.4.3...0.4.4
[0.4.3]: https://github.com/rust-lang-nursery/log/compare/0.4.2...0.4.3
[0.4.2]: https://github.com/rust-lang-nursery/log/compare/0.4.1...0.4.2
[0.4.1]: https://github.com/rust-lang-nursery/log/compare/0.4.0...0.4.1
[0.4.0]: https://github.com/rust-lang-nursery/log/compare/0.3.8...0.4.0
[release tags]: https://github.com/rust-lang-nursery/log/releases


---

<!-- source: archive/library/rust/references/packages/log/CHANGELOG--001059.md -->

## Imported source: archive/library/rust/references/packages/log/CHANGELOG--001059.md

# 0.4.11 (August 8, 2025)

* Fix `Slab::get_disjoint_mut` out of bounds (#152)

# 0.4.10 (June 15, 2025)

* Add `Slab::get_disjoint_mut` (#149)
* Drop build script and `autocfg` dependency (#150)
* Fix redundant import warning in no_std builds (#143)
* Fix `clippy::needless_lifetimes` warning (#147)
* Internal CI improvements (#141, #146)

# 0.4.9 (August 22, 2023)

* Avoid reallocations in `Slab::clone_from` (#137)

# 0.4.8 (January 20, 2023)

* Fixed documentation about overflow (#124)
* Document panic in `get2_mut` (#131)
* Refactoring (#129, #132)

# 0.4.7 (July 19, 2022)

* Use `#[track_caller]` on Rust 1.46+ (#119)
* Make `Slab::new` const on Rust 1.39+ (#119)

# 0.4.6 (April 2, 2022)

* Add `Slab::vacant_key` (#114)
* Fix stacked borrows violation in `Slab::get2_unchecked_mut` (#115)

# 0.4.5 (October 13, 2021)

* Add alternate debug output for listing items in the slab (#108)
* Fix typo in debug output of IntoIter (#109)
* Impl 'Clone' for 'Iter' (#110)

# 0.4.4 (August 06, 2021)

* Fix panic in `FromIterator` impl (#102)
* Fix compatibility with older clippy versions (#104)
* Add `try_remove` method (#89)
* Implement `ExactSizeIterator` and `FusedIterator` for iterators (#92)

# 0.4.3 (April 20, 2021)

* Add no_std support for Rust 1.36 and above (#71).
* Add `get2_mut` and `get2_unchecked_mut` methods (#65).
* Make `shrink_to_fit()` remove trailing vacant entries (#62).
* Implement `FromIterator<(usize, T)>` (#62).
* Implement `IntoIterator<Item = (usize, T)>` (#62).
* Provide `size_hint()` of the iterators (#62).
* Make all iterators reversible (#62).
* Add `key_of()` method (#61)
* Add `compact()` method (#60)
* Add support for serde (#85)

# 0.4.2 (January 11, 2019)

* Add `Slab::drain` (#56).

# 0.4.1 (July 15, 2018)

* Improve `reserve` and `reserve_exact` (#37).
* Implement `Default` for `Slab` (#43).


---

<!-- source: archive/library/rust/references/packages/mio/CHANGELOG--001024.md -->

## Imported source: archive/library/rust/references/packages/mio/CHANGELOG--001024.md

# 1.1.0

MSRV was increased to 1.71 to support windows-sys v0.61.

* Changed the backlog passed to listen to match the standard library, this
  should effect most users but see the pr for details
  (https://github.com/tokio-rs/mio/pull/1896).
* Fixed an issue where `TcpStream::peek` returned `WouldBlock` the events would
  stop working correctly
  (https://github.com/tokio-rs/mio/pull/1895).
* Added support for cygwin
  (https://github.com/tokio-rs/mio/pull/1871).
* Make `Event` `Send` and `Sync` on platforms using kqueue
  (https://github.com/tokio-rs/mio/pull/1906).
* Fixed an issue where it would reach `unreachable!` code in `NamedPipe`
  (https://github.com/tokio-rs/mio/pull/1903).
* Updated windows-sys to 0.60 and 0.61
  (https://github.com/tokio-rs/mio/pull/1891
  and https://github.com/tokio-rs/mio/pull/1901).

# 1.0.4

* Update windows-sys to 0.59
  (https://github.com/tokio-rs/mio/pull/1857).
* Fix build failure of uds tests on Android
  (https://github.com/tokio-rs/mio/pull/1847).
* Fix set nonblocking socket on AIX
  (https://github.com/tokio-rs/mio/pull/1867).
* Emit a better error when using mio on WASM
  (https://github.com/tokio-rs/mio/pull/1856).

# 1.0.3

* Implement more I/O safety traits
  (https://github.com/tokio-rs/mio/pull/1831).
* Remove hermit-abi dependency, now using libc
  (https://github.com/tokio-rs/mio/pull/1830).
* Use `poll(2)` implementation on AIX, removing the need for using
  `mio_unsupported_force_poll_poll`
  (https://github.com/tokio-rs/mio/pull/1833).

# 1.0.2

* Work around eventfd bug on illumos
  (https://github.com/tokio-rs/mio/pull/1826).
* Fix dead code warning on Hermit when building with `--no-default-features
  --features os-ext`
  (https://github.com/tokio-rs/mio/pull/1828).

# 1.0.1

* Added Fuchsia support
  (https://github.com/tokio-rs/mio/pull/1811).
* Added GNU/Hurd support
  (https://github.com/tokio-rs/mio/pull/1816).
* Fixed an issue where accepting on a UDS socket without sometime pass an address
  with a NULL byte to SocketAddr::from_pathname
  (https://github.com/tokio-rs/mio/pull/1817).
* Internal cleanups that should make the `cfg` situations easier to follow
  (https://github.com/tokio-rs/mio/pull/1812,
  https://github.com/tokio-rs/mio/pull/1813).

# 1.0

With v1 Mio is able to bump its MSRV to 1.70, allowing us to implement I/O
safety traits (https://github.com/rust-lang/rust/issues/87074) and replace
`SocketAddr` with the version found in the standard library.

## Added

* Implement `AsFd` for`TcpListener`, `TcpStream`, `UdpSocket`, `UnixDatagram`,
  `UnixListener`, `UnixStream`, `pipe::Receiver` and `pipe::Sender`
  (https://github.com/tokio-rs/mio/pull/1749, https://github.com/tokio-rs/mio/pull/1797).
* Implement `From` for `TcpListener`, `TcpStream`, `UdpSocket`, `UnixDatagram`,
  `UnixListener`, and `UnixStream` for their standard library counterpart
  (https://github.com/tokio-rs/mio/pull/1767).
* Add support for abstract namespaces on Android
  (https://github.com/tokio-rs/mio/pull/1749).
* Add support for QNX OS
  (https://github.com/tokio-rs/mio/pull/1766,
  https://github.com/tokio-rs/mio/pull/1800).
* Add support for Apple visionOS
  (https://github.com/tokio-rs/mio/pull/1795).
* Support for Haiku
  (https://github.com/tokio-rs/mio/pull/1807).

## Removed

* The `SocketAddr` type is removed in favour of `std::os::unix::net::SocketAddr`
  (https://github.com/tokio-rs/mio/pull/1760). All methods on Mio's version
  should exist on the version in the standard library.

## Changes

* MSRV was updated to 1.74, updating to Rust edition edition
  (https://github.com/tokio-rs/mio/pull/1733).
* `UnixDatagram::{local_addr,peer_addr,bind_addr,recv_from}`,
  `UnixListener::{local_addr,bind_addr,accept}` and
  `UnixStream::{local_addr,peer_addr,connect_addr}` return and/or use
  `std::os::unix::net::SocketAddr` instead of Mio's own `SocketAddr` type
  (https://github.com/tokio-rs/mio/pull/1760).
* Use `OwnedFd` internally for `Poll` where possible
  (https://github.com/tokio-rs/mio/pull/1749).
* Support ESP-IDF and Hermit without cfg flags
  (https://github.com/tokio-rs/mio/pull/1789,
  https://github.com/tokio-rs/mio/pull/1802,
  https://github.com/tokio-rs/mio/pull/1802).
* Updated windows-sys to v0.52
  (https://github.com/tokio-rs/mio/pull/1668).

# 0.8.11

* Fix receiving IOCP events after deregistering a Windows named pipe
  (https://github.com/tokio-rs/mio/pull/1760, backport pr:
  https://github.com/tokio-rs/mio/pull/1761).

# 0.8.10

## Added

* Solaris support
  (https://github.com/tokio-rs/mio/pull/1724).

# 0.8.9

## Added

* ESP-IDF framework support
  (https://github.com/tokio-rs/mio/pull/1692).
* AIX operating system support
  (https://github.com/tokio-rs/mio/pull/1704).
* Vita support
  (https://github.com/tokio-rs/mio/pull/1721).
* `{UnixListener,UnixStream}:bind_addr`
  (https://github.com/tokio-rs/mio/pull/1630).
* `mio_unsupported_force_poll_poll` and `mio_unsupported_force_waker_pipe`
  **unsupported** configuration flags to force a specific poll or waker
  implementation
  (https://github.com/tokio-rs/mio/pull/1684,
  https://github.com/tokio-rs/mio/pull/1685,
  https://github.com/tokio-rs/mio/pull/1692).

## Fixed

* The `pipe(2)` based waker (swapped file descriptors)
  (https://github.com/tokio-rs/mio/pull/1722).
* The duplicate waker check to work correctly with cloned `Registry`s.
  (https://github.com/tokio-rs/mio/pull/1706).

# 0.8.8

## Fixed

* Fix compilation on WASI (https://github.com/tokio-rs/mio/pull/1676).

# 0.8.7

## Added

* Add/fix support for tvOS and watchOS, Mio should now build for tvOS and
  watchOS, but we don't have a CI setup yet
  (https://github.com/tokio-rs/mio/pull/1658).

## Changed

* Made the `log` dependency optional behind the `log` feature flag (enabled by
  default). Users that disabled Mio's default features will now not see any
  logging from Mio, enabling the `log` feature will fix that. This was done in
  response to the `log` crate increasing it's MSRV to v1.60, see
  https://github.com/rust-lang/log/pull/552
  (https://github.com/tokio-rs/mio/pull/1673).
* Update windows-sys dependency to v0.48
  (https://github.com/tokio-rs/mio/pull/1663).

## Fixed

* Fix overflow in `Poll::poll` when using `Duration::MAX` as timeout
  (https://github.com/tokio-rs/mio/pull/1657).

# 0.8.6

## Added

* `Interest::PRIORITY` on Linux and Android, to trigger `Event::is_priority`
  (https://github.com/tokio-rs/mio/pull/1647).

## Changed

* Updated windows-sys to 0.45
  (https://github.com/tokio-rs/mio/pull/1644).
* We started testing with sanitizers on the CI
  (https://github.com/tokio-rs/mio/pull/1648).

## Fixed

* A number of potential fd leaks when setup resulted in an error right after
  creation (https://github.com/tokio-rs/mio/pull/1636).
* Less truncating for timeout values in `Poll::poll`
  (https://github.com/tokio-rs/mio/pull/1642).

# 0.8.5

## Changed

* Updated `windows-sys` to 0.42.0
  (https://github.com/tokio-rs/mio/pull/1624).
* Officially document Wine as not supported, some people claimed it worked,
  other claims it doesn't, but nobody stepped up to fix the problem
  (https://github.com/tokio-rs/mio/pull/1596).
* Switch to GitHub Actions
  (https://github.com/tokio-rs/mio/pull/1598, https://github.com/tokio-rs/mio/pull/1601).
* Documented the current Poll::poll time behaviour
  (https://github.com/tokio-rs/mio/pull/1603).

## Fixed

* Timeout less than one millisecond becoming zero millsiconds
  (https://github.com/tokio-rs/mio/pull/1615, https://github.com/tokio-rs/mio/pull/1616)
* Undefined reference to `epoll\_create1` on Android API level < 21.
  (https://github.com/tokio-rs/mio/pull/1590).

# 0.8.4

## Added

* Support `Registery::try_clone` on `wasm32-wasi`
  (https://github.com/tokio-rs/mio/pull/1576).
* Add docs about polling without registering event sources
  (https://github.com/tokio-rs/mio/pull/1585).

# 0.8.3

## Changed

* Replace `winapi` dependency with `windows-sys`.
  (https://github.com/tokio-rs/mio/pull/1556).
* Future proofed the kevent ABI for FreeBSD
  (https://github.com/tokio-rs/mio/pull/1572).

## Fixed

* Improved support for Redox, making it possible to run on stable Rust
  (https://github.com/tokio-rs/mio/pull/1555).
* Don't ignore EAGAIN in UDS connect call
  (https://github.com/tokio-rs/mio/pull/1564).
* Documentation of `TcpStream::connect`
  (https://github.com/tokio-rs/mio/pull/1565).

# 0.8.2

## Added

* Experimental support for Redox.

# 0.8.1

## Added

* Add `try_io` method to all I/O types (#1551). This execute a user defined I/O
  closure while updating Mio's internal state ensuring that the I/O type
  receives more events if it hits a WouldBlock error. This is added to the
  following types:
   * `TcpStream`
   * `UdpSocket`
   * `UnixDatagram`
   * `UnixStream`
   * `unix::pipe::Sender`
   * `unix::pipe::Receiver`
* Basic, experimental support for `wasm32-wasi` target (#1549). Note that a lot
  of time type are still missing, e.g. the `Waker`, and may never be possible to
  implement.

# 0.8.0

## Removed

* Deprecated features (https://github.com/tokio-rs/mio/commit/105f8f2afb57b01ddea716a0aa9720f226c520e3):
  * extra-docs (always enabled)
  * tcp (replaced with "net" feature).
  * udp (replaced with "net" feature).
  * uds (replaced with "net" feature).
  * pipe (replaced with "os-ext" feature).
  * os-util (replaced with "os-ext" feature).
* `TcpSocket` type
  (https://github.com/tokio-rs/mio/commit/02e9be41f27daf822575444fdd2b3067433a5996).
  The socket2 crate provides all the functionality and more.
* Support for Solaris, it never really worked anyway
  (https://github.com/tokio-rs/mio/pull/1528).

## Changes

* Update minimum Rustc version (MSVR) to 1.46.0
  (https://github.com/tokio-rs/mio/commit/5c577efecd23750a9a3e0f6ad080ab98f14a255d).

## Added

* `UdpSocket::peer_addr`
  (https://github.com/tokio-rs/mio/commit/5fc104d08e0e74c8a19247f7cba0f058699fc438).

# 0.7.14

## Fixes

* Remove use unsound internal macro (#1519).

## Added

* `sys::unix::SocketAddr::as_abstract_namespace()` (#1520).

# 0.7.13

## Fixes

* Fix `Registry::try_clone` invalid usage of `F_DUPFD_CLOEXEC` (#1497,
  https://github.com/tokio-rs/mio/commit/2883f5c1f35bf1a59682c5ffc4afe6b97d7d6e68).

# 0.7.12 (yanked)

## Fixes

* Set `FD_CLOEXEC` when calling `Registry::try_clone`
  (https://github.com/tokio-rs/mio/commit/d1617b567ff6bc669d71e367d22e0e93ff7e2e24 for epoll and
  (https://github.com/tokio-rs/mio/commit/b367a05e408ca90a26383c3aa16d8a16f019dc59 for kqueue).

# 0.7.11

## Fixes

* Fix missing feature of winapi.
  (https://github.com/tokio-rs/mio/commit/a7e61db9e3c2b929ef1a33532bfcc22045d163ce).

# 0.7.10

## Fixes

* Fix an instance of not doc(cfg(.*))
  (https://github.com/tokio-rs/mio/commit/25e8f911357c740034f10a170dfa4ea1b28234ce).

# 0.7.9

## Fixes

* Fix error handling in `NamedPipe::write`
  (https://github.com/tokio-rs/mio/commit/aec872be9732e5c6685100674278be27f54a271b).
* Use `accept(2)` on x86 Android instead of `accept4(2)`
  (https://github.com/tokio-rs/mio/commit/6f86b925d3e48f30905d5cfa54348acf3f1fa036,
  https://github.com/tokio-rs/mio/commit/8d5414880ab82178305ac1d2c16d715e58633d3e).
* Improve error message when opening AFD device
  (https://github.com/tokio-rs/mio/commit/139f7c4422321eb4a17b14ae2c296fddd19a8804).

# 0.7.8

## Fixes

* Fix `TcpStream::set_linger` on macOS
  (https://github.com/tokio-rs/mio/commit/175773ce02e85977db81224c782c8d140aba8543).
* Fix compilation on DragonFlyBSD
  (https://github.com/tokio-rs/mio/commit/b51af46b28871f8dd3233b490ee62237ffed6a26).

# 0.7.7

## Added

* `UdpSocket::only_v6`
  (https://github.com/tokio-rs/mio/commit/0101e05a800f17fb88f4315d9b9fe0f08cca6e57).
* `Clone` implementation for `Event`
  (https://github.com/tokio-rs/mio/commit/26540ebbae89df6d4d08465c56f715d8f2addfc3).
* `AsRawFd` implementation for `Registry`
  (https://github.com/tokio-rs/mio/commit/f70daa72da0042b1880256164774c3286d315a02).
* `Read` and `Write` implementation for `&unix::pipe::Sender` and `Receiver`,
  that is on the reference to them, an implementation existed on the types
  themselves already
  (https://github.com/tokio-rs/mio/commit/1be481dcbbcb6906364008b5d61e7f53cddc3eb3).

## Fixes

* Underflow in `SocketAddr::address`
  (https://github.com/tokio-rs/mio/commit/6d3fa69240cd4bb95e9d34605c660c30245a18bd).
* Android build with the net feature enabled, but with os-poll disabled
  (https://github.com/tokio-rs/mio/commit/49d8fd33e026ad6e2c055d05d6667180ba2af7be).
* Solaris build with the net feature enabled, but with os-poll disabled
  (https://github.com/tokio-rs/mio/commit/a6e025e9d9511639ec106ebedc0dd312bdc9be12).
* Ensure that `Waker::wake` works on illumos systems with poor `pipe(2)` and
  `epoll(2)` interaction using `EPOLLET`
  (https://github.com/tokio-rs/mio/commit/943d4249dcc17cd8b4d2250c4fa19116097248fa).
* Fix `unix::pipe` on illumos
  (https://github.com/tokio-rs/mio/commit/0db49f6d5caf54b12176821363d154384357e70a).

# 0.7.6

## Added

* `net` feature, replaces `tcp`, `udp` and `uds` features
  (https://github.com/tokio-rs/mio/commit/a301ba520a8479b459c4acdcefa4a7c5eea818c7).
* `os-ext` feature, replaces `os-util` and `pipe` features
  (https://github.com/tokio-rs/mio/commit/f5017fae8a3d3bb4b4cada25b01a2d76a406badc).
* Added keepalive support to `TcpSocket`
  (https://github.com/tokio-rs/mio/commit/290c43a96662d54ab7c4b8814e5a9f9a9e523fda).
* `TcpSocket::set_{send, recv}_buffer_size`
  (https://github.com/tokio-rs/mio/commit/40c4af79bf5b32b8fbdbf6f2e5c16290e1d3d406).
* `TcpSocket::get_linger`
  (https://github.com/tokio-rs/mio/commit/13e82ced655bbb6e2729226e485a7de9f2c2ccd9).
* Implement `IntoRawFd` for `TcpSocket`
  (https://github.com/tokio-rs/mio/commit/50548ed45d0b2c98f1f2e003e210d14195284ef4).

## Deprecated

* The `tcp`, `udp` and `uds` features, replaced by a new `net` feature.
  (https://github.com/tokio-rs/mio/commit/a301ba520a8479b459c4acdcefa4a7c5eea818c7).
* The `extra-docs` feature, now enabled by default.
  (https://github.com/tokio-rs/mio/commit/25731e8688a2d91c5c700674a2c2d3841240ece1).
* The `os-util` and `pipe` features, replaced by a new `os-ext` feature.
  (https://github.com/tokio-rs/mio/commit/f5017fae8a3d3bb4b4cada25b01a2d76a406badc).

## Fixes

* Incorrect assumption of the layout of `std::net::SocketAddr`. Previously Mio
  would assume that `SocketAddrV{4,6}` had the same layout as
  `libc::sockaddr_in(6)`, however this is not guaranteed by the standard
  library.
  (https://github.com/tokio-rs/mio/commit/152e0751f0be1c9b0cbd6778645b76bcb0eba93c).
* Also bumped the miow dependency to version 0.3.6 to solve the same problem as
  above.

# 0.7.5

## Added

* `TcpSocket::get_localaddr()` retrieves local address
  (https://github.com/tokio-rs/mio/commit/b41a022b2242eef1969c70c8ba93e04c528dba47).
* `TcpSocket::set_reuseport()` & `TcpSocket::get_reuseport()` configures and reads `SO_REUSEPORT`
  (https://github.com/tokio-rs/mio/commit/183bbe409ab69cbf9db41d0263b41ec86202d9a0).
* `unix:pipe()` a wrapper around pipe(2) sys call
  (https://github.com/tokio-rs/mio/commit/2b7c0967a7362303946deb3d4ca2ae507af6c72d).
* Add a check that a single Waker is active per Poll instance (only in debug mode)
  (https://github.com/tokio-rs/mio/commit/f4874f28b32efcf4841691884c65a89734d96a56).
* Added `Interest:remove()`
  (https://github.com/tokio-rs/mio/commit/b8639c3d9ac07bb7e2e27685680c8a6510fa1357).

# 0.7.4

## Fixes

* lost "socket closed" events on windows
  (https://github.com/tokio-rs/mio/commit/50c299aca56c4a26e5ed20c283007239fbe6a7a7).

## Added

* `TcpSocket::set_linger()` configures SO_LINGER
  (https://github.com/tokio-rs/mio/commit/3b4096565c1a879f651b8f8282ecdcbdbd5c92d3).

# 0.7.3

## Added

* `TcpSocket` for configuring a TCP socket before connecting or listening
  (https://github.com/tokio-rs/mio/commit/5b09e60d0f64419b989bda88c86a3147334a03b3).

# 0.7.2

## Added

* Windows named pipe support.
  (https://github.com/tokio-rs/mio/commit/52e8c2220e87696d20f13561402bcaabba4136ed).

# 0.7.1

## Reduced support for 32-bit Apple targets

In January 2020 Rust reduced its support for 32-bit Apple targets
(https://blog.rust-lang.org/2020/01/03/reducing-support-for-32-bit-apple-targets.html).
Starting with v0.7.1 Mio will do the same as we're no longer checking 32 bit
iOS/macOS on our CI.

## Added

* Support for illumos
  (https://github.com/tokio-rs/mio/commit/976f2354d0e8fbbb64fba3bf017d7131f9c369a0).
* Report `epoll(2)`'s `EPOLLERR` event as `Event::is_write_closed` if it's the
  only event
  (https://github.com/tokio-rs/mio/commit/0c77b5712d675eeb9bd43928b5dd7d22b2c7ac0c).
* Optimised event::Iter::{size_hint, count}
  (https://github.com/tokio-rs/mio/commit/40df934a11b05233a7796c4de19a4ee06bc4e03e).

## Fixed

* Work around Linux kernel < 2.6.37 bug on 32-bits making timeouts longer then
  ~30 minutes effectively infinite
  (https://github.com/tokio-rs/mio/commit/d555991f5ee81f6c1eec0fe481557d3d5b8d5ff4).
* Set `SO_NOSIGPIPE` on all sockets (not just UDP) on for Apple targets
  (https://github.com/tokio-rs/mio/commit/b8bbdcb0d3236f4c4acb257996d42a88dc9987d9).
* Properly handle `POLL_ABORT` on Windows
  (https://github.com/tokio-rs/mio/commit/a98da62b3ed1eeed1770aaca12f46d647e4fa749).
* Improved error handling around failing `SIO_BASE_HANDLE` calls on Windows
  (https://github.com/tokio-rs/mio/commit/b15fc18458a79ef8a51f73effa92548650f4e5dc).

## Changed

* On NetBSD we now use `accept4(2)`
  (https://github.com/tokio-rs/mio/commit/4e306addc7144f2e02a7e8397c220b179a006a19).
* The package uploaded to crates.io should be slightly smaller
  (https://github.com/tokio-rs/mio/commit/eef8d3b9500bc0db957cd1ac68ee128ebc68351f).

## Removed

* Dependency on `lazy_static` on Windows
  (https://github.com/tokio-rs/mio/commit/57e4c2a8ac153bc7bb87829e22cf0a21e3927e8a).

# 0.7.0

Version 0.7 of Mio contains various major changes compared to version 0.6.
Overall a large number of API changes have been made to reduce the complexity of
the implementation and remove overhead where possible.

Please refer to the [blog post about
0.7-alpha.1](https://tokio.rs/blog/2019-12-mio-v0.7-alpha.1/) for additional
information.

## Added

* `Interest` structure that replaces `Ready` in registering event sources.
* `Registry` structure that separates the registering and polling functionality.
* `Waker` structure that allows another thread to wake a thread polling `Poll`.
* Unix Domain Socket (UDS) types: `UnixDatagram`, `UnixListener` and
  `UnixStream`.

## Removed

* All code deprecated in 0.6 was removed in 0.7.
* Support for Fuchsia was removed as the code was unmaintained.
* Support for Bitrig was removed, rustc dropped support for it also.
* `UnixReady` was merged into `Ready`.
* Custom user-space readiness queue was removed, this includes the public
  `Registration` and `SetReadiness` types.
* `PollOpt` was removed and all registrations use edge-triggers. See the upgrade
  guide on how to process event using edge-triggers.
* The network types (types in the `net` module) now support only the same API as
  found in the standard library, various methods on the types were removed.
* `TcpStream` now supports vectored I/O.
* `Poll::poll_interruptible` was removed. Instead `Poll::poll` will now return
  an error if one occurs.
* `From<usize>` is removed from `Token`, the internal field is still public, so
  `Token(my_token)` can still be used.

## Changed

* Various documentation improvements were made around correct usage of `Poll`
  and registered event sources. It is recommended to reread the documentation of
  at least `event::Source` and `Poll`.
* Mio now uses Rust 2018 and rustfmt for all code.
* `Event` was changed to be a wrapper around the OS event. This means it can be
  significantly larger on some OSs.
* `Ready` was removed and replaced with various `is_*` methods on `Event`. For
  example instead checking for readable readiness using
  `Event::ready().is_readable()`, you would call `Event::is_readable()`.
* `Ready::is_hup` was removed in favour of `Event::is_read_closed` and
  `Event::is_write_closed`.
* The Iterator implementation of `Events` was changed to return `&Event`.
* `Evented` was renamed to `event::Source` and now takes mutable reference to
  the source.
* Minimum supported Rust version was increased to 1.39.
* By default Mio now uses a shim implementation. To enable the full
  implementation, that uses the OS, enable the `os-oll` feature. To enable the
  network types use `tcp`, `udp` and/or `uds`. For more documentation on the
  features see the `feature` module in the API documentation (requires the
  `extra-docs` feature).
* The entire Windows implementation was rewritten.
* Various optimisation were made to reduce the number of system calls in
  creating and using sockets, e.g. making use of `accept4(2)`.
* The `fmt::Debug` implementation of `Events` is now actually useful as it
  prints all `Event`s.

# 0.6.23 (Dec 01, 2020)

### Changed
- **MSRV**: Increased the MSRV from 1.18.0 (Jun 8, 2017) to 1.31.0 (Dec 6,
  2018)
  (https://github.com/tokio-rs/mio/commit/4879e0d32ddfd98e762fc87240e594a3ad8fca30).

### Fixed
- Work around Linux kernel < 2.6.37 bug on 32-bits making timeouts longer then
  ~30 minutes effectively infinite
  (https://github.com/tokio-rs/mio/commit/e7cba59950e9c9fa6194e29b5b1e72029e3df455).
- Update miow and net2 dependencies to get rid of invalid memory layout assumption
  (https://github.com/tokio-rs/mio/commit/13f02ac0a86d7c0c0001e5ff8960a0b4340d075c).

# 0.6.22 (May 01, 2020)

### Added
- Add support for illumos target (#1294)

# 0.6.21 (November 27, 2019)

### Fixed
- remove `=` dependency on `cfg-if`.

# 0.6.20 (November 21, 2019)

### Fixed
- Use default IOCP concurrency value (#1161).
- setting FD_CLOEXEC in pipe (#1095).

# 0.6.19 (May 28, 2018)

### Fixed
- Do not trigger HUP events on kqueue platforms (#958).

# 0.6.18 (May 24, 2018)

### Fixed
- Fix compilation on kqueue platforms with 32bit C long (#948).

# 0.6.17 (May 15, 2018)

### Fixed
- Don't report `RDHUP` as `HUP` (#939)
- Fix lazycell related compilation issues.
- Fix EPOLLPRI conflicting with READABLE
- Abort process on ref count overflows

### Added
- Define PRI on all targets

# 0.6.16 (September 5, 2018)

* Add EPOLLPRI readiness to UnixReady on supported platforms (#867)
* Reduce spurious awaken calls (#875)

# 0.6.15 (July 3, 2018)

* Implement `Evented` for containers (#840).
* Fix android-aarch64 build (#850).

# 0.6.14 (March 8, 2018)

* Add `Poll::poll_interruptible` (#811)
* Add `Ready::all` and `usize` conversions (#825)

# 0.6.13 (February 5, 2018)

* Fix build on DragonFlyBSD.
* Add `TcpListener::from_std` that does not require the socket addr.
* Deprecate `TcpListener::from_listener` in favor of from_std.

# 0.6.12 (January 5, 2018)

* Add `TcpStream::peek` function (#773).
* Raise minimum Rust version to 1.18.0.
* `Poll`: retry select() when interrupted by a signal (#742).
* Deprecate `Events` index access (#713).
* Add `Events::clear` (#782).
* Add support for `lio_listio` (#780).

# 0.6.11 (October 25, 2017)

* Allow register to take empty interest (#640).
* Fix bug with TCP errors on windows (#725).
* Add TcpListener::accept_std (#733).
* Update IoVec to fix soundness bug -- includes behavior change. (#747).
* Minimum Rust version is now 1.14.0.
* Fix Android x86_64 build.
* Misc API & doc polish.

# 0.6.10 (July 27, 2017)

* Experimental support for Fuchsia
* Add `only_v6` option for UDP sockets
* Fix build on NetBSD
* Minimum Rust version is now 1.13.0
* Assignment operators (e.g. `|=`) are now implemented for `Ready`

# 0.6.9 (June 7, 2017)

* More socket options are exposed through the TCP types, brought in through the
  `net2` crate.

# 0.6.8 (May 26, 2017)

* Support Fuchia
* POSIX AIO support
* Fix memory leak caused by Register::new2
* Windows: fix handling failed TCP connections
* Fix build on aarch64-linux-android
* Fix usage of `O_CLOEXEC` with `SETFL`

# 0.6.7 (April 27, 2017)

* Ignore EPIPE coming out of `kevent`
* Timer thread should exit when timer is dropped.

# 0.6.6 (March 22, 2017)

* Add send(), recv() and connect() to UDPSocket.
* Fix bug in custom readiness queue
* Move net types into `net` module

# 0.6.5 (March 14, 2017)

* Misc improvements to kqueue bindings
* Add official support for iOS, Android, BSD
* Reimplement custom readiness queue
* `Poll` is now `Sync`
* Officially deprecate non-core functionality (timers, channel, etc...)
* `Registration` now implements `Evented`
* Fix bug around error conditions with `connect` on windows.
* Use iovec crate for scatter / gather operations
* Only support readable and writable readiness on all platforms
* Expose additional readiness in a platform specific capacity

# 0.6.4 (January 24, 2017)

* Fix compilation on musl
* Add `TcpStream::from_stream` which converts a std TCP stream to Mio.

# 0.6.3 (January 22, 2017)

* Implement readv/writev for `TcpStream`, allowing vectored reads/writes to
  work across platforms
* Remove `nix` dependency
* Implement `Display` and `Error` for some channel error types.
* Optimize TCP on Windows through `SetFileCompletionNotificationModes`

# 0.6.2 (December 18, 2016)

* Allow registration of custom handles on Windows (like `EventedFd` on Unix)
* Send only one byte for the awakener on Unix instead of four
* Fix a bug in the timer implementation which caused an infinite loop

# 0.6.1 (October 30, 2016)

* Update dependency of `libc` to 0.2.16
* Fix channel `dec` logic
* Fix a timer bug around timeout cancellation
* Don't allocate buffers for TCP reads on Windows
* Touched up documentation in a few places
* Fix an infinite looping timer thread on OSX
* Fix compile on 32-bit OSX
* Fix compile on FreeBSD

# 0.6.0 (September 2, 2016)

* Shift primary API towards `Poll`
* `EventLoop` and types to `deprecated` mod. All contents of the
  `deprecated` mod will be removed by Mio 1.0.
* Increase minimum supported Rust version to 1.9.0
* Deprecate unix domain socket implementation in favor of using a
  version external to Mio. For example: https://github.com/alexcrichton/mio-uds.
* Remove various types now included in `std`
* Updated TCP & UDP APIs to match the versions in `std`
* Enable implementing `Evented` for any type via `Registration`
* Rename `IoEvent` -> `Event`
* Access `Event` data via functions vs. public fields.
* Expose `Events` as a public type that is passed into `Poll`
* Use `std::time::Duration` for all APIs that require a time duration.
* Polled events are now retrieved via `Events` type.
* Implement `std::error::Error` for `TimerError`
* Relax `Send` bound on notify messages.
* Remove `Clone` impl for `Timeout` (future proof)
* Remove `mio::prelude`
* Remove `mio::util`
* Remove dependency on bytes

# 0.5.0 (December 3, 2015)

* Windows support (#239)
* NetBSD support (#306)
* Android support (#295)
* Don't re-export bytes types
* Renamed `EventLoop::register_opt` to `EventLoop::register` (#257)
* `EventLoopConfig` is now a builder instead of having public struct fields. It
  is also no longer `Copy`. (#259)
* `TcpSocket` is no longer exported in the public API (#262)
* Integrate with net2. (#262)
* `TcpListener` now returns the remote peer address from `accept` as well (#275)
* The `UdpSocket::{send_to, recv_from}` methods are no longer generic over `Buf`
  or `MutBuf` but instead take slices directly. The return types have also been
  updated to return the number of bytes transferred. (#260)
* Fix bug with kqueue where an error on registration prevented the
  changelist from getting flushed (#276)
* Support sending/receiving FDs over UNIX sockets (#291)
* Mio's socket types are permanently associated with an EventLoop (#308)
* Reduce unnecessary poll wakeups (#314)


# 0.4.1 (July 21, 2015)

* [BUGFIX] Fix notify channel concurrency bug (#216)

# 0.4.0 (July 16, 2015)

* [BUGFIX] EventLoop::register requests all events, not just readable.
* [BUGFIX] Attempting to send a message to a shutdown event loop fails correctly.
* [FEATURE] Expose TCP shutdown
* [IMPROVEMENT] Coalesce readable & writable into `ready` event (#184)
* [IMPROVEMENT] Rename TryRead & TryWrite function names to avoid conflict with std.
* [IMPROVEMENT] Provide TCP and UDP types in Mio (path to windows #155)
* [IMPROVEMENT] Use clock_ticks crate instead of time (path to windows #155)
* [IMPROVEMENT] Move unix specific features into mio::unix module
* [IMPROVEMENT] TcpListener sets SO_REUSEADDR by default


---

<!-- source: archive/library/rust/references/packages/mio/CHANGELOG--001064.md -->

## Imported source: archive/library/rust/references/packages/mio/CHANGELOG--001064.md

# 0.3.2

- **all**: new functions const when possible ([#760])
- **documentation**: Clarify subtlety around cloning and readiness in the `Service` docs. ([#622])
- **documentation**: service: Call inner.poll_ready() in docs when cloning inner ([#679])

[#760]: https://github.com/tower-rs/tower/pull/760
[#622]: https://github.com/tower-rs/tower/pull/662
[#679]: https://github.com/tower-rs/tower/pull/679

# 0.3.1 (November 29, 2019)

- Improve example in `Service` docs. ([#510])

[#510]: https://github.com/tower-rs/tower/pull/510

# 0.3.0 (November 29, 2019)

- Update to `futures 0.3`.
- Update documentation for `std::future::Future`.

# 0.3.0-alpha.2 (September 30, 2019)

- Documentation fixes.

# 0.3.0-alpha.1 (Aug 20, 2019)

* Switch to `std::future::Future`

# 0.2.0 (Dec 12, 2018)

* Change `Service`'s `Request` associated type to be a generic instead.
  * Before:

    ```rust
    impl Service for Client {
        type Request = HttpRequest;
        type Response = HttpResponse;
        // ...
    }
    ```
  * After:

    ```rust
    impl Service<HttpRequest> for Client {
        type Response = HttpResponse;
        // ...
    }
    ```
* Remove `NewService`, use `tower_util::MakeService` instead.
* Remove `Service::ready` and `Ready`, use `tower_util::ServiceExt` instead.

# 0.1.0 (Aug 9, 2018)

* Initial release


---

<!-- source: archive/library/rust/references/packages/once-cell/CHANGELOG--000983.md -->

## Imported source: archive/library/rust/references/packages/once-cell/CHANGELOG--000983.md

# Changelog

## 1.21.3

- Outline more initialization in `race`: [#284](https://github.com/matklad/once_cell/pull/284),
  [#285](https://github.com/matklad/once_cell/pull/285).

## 1.21.2
- Relax success ordering from AcqRel to Release in `race`: [#278](https://github.com/matklad/once_cell/pull/278).

## 1.21.1
- Reduce MSRV to 1.65: [#277](https://github.com/matklad/once_cell/pull/277).

## 1.21.0

- Outline initialization in `race`: [#273](https://github.com/matklad/once_cell/pull/273).
- Add `OnceNonZereUsize::get_unchecked`: [#274](https://github.com/matklad/once_cell/pull/274).
- Add `OnceBox::clone` and `OnceBox::with_value`: [#275](https://github.com/matklad/once_cell/pull/275).
- Increase MSRV to 1.70

## 1.20.2

- Remove `portable_atomic` from Cargo.lock if it is not, in fact, used: [#267](https://github.com/matklad/once_cell/pull/267)
  This is a work-around for this cargo bug: https://github.com/rust-lang/cargo/issues/10801.

## 1.20.1

- Allow using `race` module using just `portable_atomic`, without `critical_section` and provide
  better error messages on targets without atomic CAS instruction,
  [#265](https://github.com/matklad/once_cell/pull/265).

## 1.19.0

- Use `portable-atomic` instead of `atomic-polyfill`, [#251](https://github.com/matklad/once_cell/pull/251).

## 1.18.0

- `MSRV` is updated to 1.60.0 to take advantage of `dep:` syntax for cargo features,
  removing "implementation details" from publicly visible surface.

## 1.17.2

- Avoid unnecessary synchronization in `Lazy::{force,deref}_mut()`, [#231](https://github.com/matklad/once_cell/pull/231).

## 1.17.1

- Make `OnceRef` implementation compliant with [strict provenance](https://github.com/rust-lang/rust/issues/95228).

## 1.17.0

- Add `race::OnceRef` for storing a `&'a T`.

## 1.16.0

- Add `no_std` implementation based on `critical-section`,
  [#195](https://github.com/matklad/once_cell/pull/195).
- Deprecate `atomic-polyfill` feature (use the new `critical-section` instead)

## 1.15.0

- Increase minimal supported Rust version to 1.56.0.
- Implement `UnwindSafe` even if the `std` feature is disabled.

## 1.14.0

- Add extension to `unsync` and `sync` `Lazy` mut API:
  - `force_mut`
  - `get_mut`


## 1.13.1

- Make implementation compliant with [strict provenance](https://github.com/rust-lang/rust/issues/95228).
- Upgrade `atomic-polyfill` to `1.0`

## 1.13.0

- Add `Lazy::get`, similar to `OnceCell::get`.

## 1.12.1

- Remove incorrect `debug_assert`.

## 1.12.0

- Add `OnceCell::wait`, a blocking variant of `get`.

## 1.11.0

- Add `OnceCell::with_value` to create initialized `OnceCell` in `const` context.
- Improve `Clone` implementation for `OnceCell`.
- Rewrite `parking_lot` version on top of `parking_lot_core`, for even smaller cells!

## 1.10.0

- upgrade `parking_lot` to `0.12.0` (note that this bumps MSRV with `parking_lot` feature enabled to `1.49.0`).

## 1.9.0

- Added an `atomic-polyfill` optional dependency to compile `race` on platforms without atomics

## 1.8.0

- Add `try_insert` API -- a version of `set` that returns a reference.

## 1.7.2

- Improve code size when using parking_lot feature.

## 1.7.1

- Fix `race::OnceBox<T>` to also impl `Default` even if `T` doesn't impl `Default`.

## 1.7.0

- Hide the `race` module behind (default) `race` feature.
  Turns out that adding `race` by default was a breaking change on some platforms without atomics.
  In this release, we make the module opt-out.
  Technically, this is a breaking change for those who use `race` with `no_default_features`.
  Given that the `race` module itself only several days old, the breakage is deemed acceptable.

## 1.6.0

- Add `Lazy::into_value`
- Stabilize `once_cell::race` module for "first one wins" no_std-compatible initialization flavor.
- Migrate from deprecated `compare_and_swap` to `compare_exchange`.

## 1.5.2

- `OnceBox` API uses `Box<T>`.
  This a breaking change to unstable API.

## 1.5.1

- MSRV is increased to `1.36.0`.
- document `once_cell::race` module.
- introduce `alloc` feature for `OnceBox`.
- fix `OnceBox::set`.

## 1.5.0

- add new `once_cell::race` module for "first one wins" no_std-compatible initialization flavor.
  The API is provisional, subject to change and is gated by the `unstable` cargo feature.

## 1.4.1

- upgrade `parking_lot` to `0.11.0`
- make `sync::OnceCell<T>` pass https://doc.rust-lang.org/nomicon/dropck.html#an-escape-hatch[dropck] with `parking_lot` feature enabled.
  This fixes a (minor) semver-incompatible changed introduced in `1.4.0`

## 1.4.0

- upgrade `parking_lot` to `0.10` (note that this bumps MSRV with `parking_lot` feature enabled to `1.36.0`).
- add `OnceCell::take`.
- upgrade crossbeam utils (private dependency) to `0.7`.

## 1.3.1

- remove unnecessary `F: fmt::Debug` bound from `impl fmt::Debug for Lazy<T, F>`.

## 1.3.0

- `Lazy<T>` now implements `DerefMut`.
- update implementation according to the latest changes in `std`.

## 1.2.0

- add `sync::OnceCell::get_unchecked`.

## 1.1.0

- implement `Default` for `Lazy`: it creates an empty `Lazy<T>` which is initialized with `T::default` on first access.
- add `OnceCell::get_mut`.

## 1.0.2

- actually add `#![no_std]` attribute if std feature is not enabled.

## 1.0.1

- fix unsoundness in `Lazy<T>` if the initializing function panics. Thanks [@xfix](https://github.com/xfix)!
- implement `RefUnwindSafe` for `Lazy`.
- share more code between `std` and `parking_lot` implementations.
- add F.A.Q section to the docs.

## 1.0.0

- remove `parking_lot` from the list of default features.
- add `std` default feature. Without `std`, only `unsync` module is supported.
- implement `Eq` for `OnceCell`.
- fix wrong `Sync` bound on `sync::Lazy`.
- run the whole test suite with miri.

## 0.2.7

- New implementation of `sync::OnceCell` if `parking_lot` feature is disabled.
  It now employs a hand-rolled variant of `std::sync::Once`.
- `sync::OnceCell::get_or_try_init` works without `parking_lot` as well!
- document the effects of `parking_lot` feature: same performance but smaller types.

## 0.2.6

- Updated `Lazy`'s `Deref` impl to requires only `FnOnce` instead of `Fn`

## 0.2.5

- `Lazy` requires only `FnOnce` instead of `Fn`

## 0.2.4

- nicer `fmt::Debug` implementation

## 0.2.3

- update `parking_lot` to `0.9.0`
- fix stacked borrows violation in `unsync::OnceCell::get`
- implement `Clone` for `sync::OnceCell<T> where T: Clone`

## 0.2.2

- add `OnceCell::into_inner` which consumes a cell and returns an option

## 0.2.1

- implement `sync::OnceCell::get_or_try_init` if `parking_lot` feature is enabled
- switch internal `unsafe` implementation of `sync::OnceCell` from `Once` to `Mutex`
- `sync::OnceCell::get_or_init` is twice as fast if cell is already initialized
- implement `std::panic::RefUnwindSafe` and `std::panic::UnwindSafe` for `OnceCell`
- better document behavior around panics

## 0.2.0

- MSRV is now 1.31.1
- `Lazy::new` and `OnceCell::new` are now const-fns
- `unsync_lazy` and `sync_lazy` macros are removed

## 0.1.8

- update crossbeam-utils to 0.6
- enable bors-ng

## 0.1.7

- cells implement `PartialEq` and `From`
- MSRV is down to 1.24.1
- update `parking_lot` to `0.7.1`

## 0.1.6

- `unsync::OnceCell<T>` is `Clone` if `T` is `Clone`.

## 0.1.5

- No changelog until this point :(


---

<!-- source: archive/library/rust/references/packages/pin-project-lite/CHANGELOG--001037.md -->

## Imported source: archive/library/rust/references/packages/pin-project-lite/CHANGELOG--001037.md

# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org).

Releases may yanked if there is a security bug, a soundness bug, or a regression.

<!--
Note: In this file, do not use the hard wrap in the middle of a sentence for compatibility with GitHub comment style markdown rendering.
-->

## [Unreleased]

## [0.2.16] - 2025-01-06

- Suppress `clippy::absolute_paths`, `clippy::min_ident_chars`, and `clippy::single_char_lifetime_names` lints in generated code.

## [0.2.15] - 2024-10-24

- Work around an issue on negative_impls that allows unsound overlapping `Unpin` implementations. ([#84](https://github.com/taiki-e/pin-project-lite/pull/84))

## [0.2.14] - 2024-03-29

- Document `PinnedDrop`. ([#83](https://github.com/taiki-e/pin-project-lite/pull/83), thanks @jbr)

## [0.2.13] - 2023-08-25

- Allow attributes in impl and method of `PinnedDrop` implementation.

## [0.2.12] - 2023-08-09

- Work around an issue where the projected types/methods appear in the documentation as if they were part of the public API if the visibility is not correctly parsed due to the rustc bug. See [#77](https://github.com/taiki-e/pin-project-lite/issues/77#issuecomment-1671540180) for details.

## [0.2.11] - 2023-08-06

- Add support for `#[project(!Unpin)]`. This is equivalent to pin-project's [!Unpin](https://docs.rs/pin-project/latest/pin_project/attr.pin_project.html#unpin) option. ([#76](https://github.com/taiki-e/pin-project-lite/pull/76), thanks @matheus-consoli)

## [0.2.10] - 2023-07-02

- Inline project methods. ([#74](https://github.com/taiki-e/pin-project-lite/pull/74), thanks @EFanZh)

## [0.2.9] - 2022-04-26

- Improve compile time of `pin_project!` calls. ([#71](https://github.com/taiki-e/pin-project-lite/pull/71), thanks @nnethercote)

## [0.2.8] - 2021-12-31

- Fix handling of trailing commas in `PinnedDrop` impl. ([#64](https://github.com/taiki-e/pin-project-lite/pull/64), thanks @Michael-J-Ward)

## [0.2.7] - 2021-06-26

- [Support custom Drop implementation.](https://github.com/taiki-e/pin-project-lite/pull/25) See [#25](https://github.com/taiki-e/pin-project-lite/pull/25) for details.

## [0.2.6] - 2021-03-04

- Support item attributes in any order. ([#57](https://github.com/taiki-e/pin-project-lite/pull/57), thanks @SabrinaJewson)

## [0.2.5] - 2021-03-02

- [Prepare for removal of `safe_packed_borrows` lint.](https://github.com/taiki-e/pin-project-lite/pull/55) See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

## [0.2.4] - 2021-01-11

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- Add `project_replace`. ([#43](https://github.com/taiki-e/pin-project-lite/pull/43), thanks @Marwes)

## [0.2.3] - 2021-01-09

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Suppress `clippy::unknown_clippy_lints` lint in generated code.](https://github.com/taiki-e/pin-project-lite/pull/47)

## [0.2.2] - 2021-01-09

**Note:** This release has been yanked.** See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Suppress `clippy::ref_option_ref` lint in generated code.](https://github.com/taiki-e/pin-project-lite/pull/45)

## [0.2.1] - 2021-01-05

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- Exclude unneeded files from crates.io.

## [0.2.0] - 2020-11-13

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [`pin_project!` macro now supports enums.](https://github.com/taiki-e/pin-project-lite/pull/28)

  To use `pin_project!` on enums, you need to name the projection type returned from the method.

  ```rust
  use pin_project_lite::pin_project;
  use std::pin::Pin;

  pin_project! {
      #[project = EnumProj]
      enum Enum<T, U> {
          Variant { #[pin] pinned: T, unpinned: U },
      }
  }

  impl<T, U> Enum<T, U> {
      fn method(self: Pin<&mut Self>) {
          match self.project() {
              EnumProj::Variant { pinned, unpinned } => {
                  let _: Pin<&mut T> = pinned;
                  let _: &mut U = unpinned;
              }
          }
      }
  }
  ```

- [Support naming the projection types.](https://github.com/taiki-e/pin-project-lite/pull/28)

  By passing an attribute with the same name as the method, you can name the projection type returned from the method:

  ```rust
  use pin_project_lite::pin_project;
  use std::pin::Pin;

  pin_project! {
      #[project = StructProj]
      struct Struct<T> {
          #[pin]
          field: T,
      }
  }

  fn func<T>(x: Pin<&mut Struct<T>>) {
      let StructProj { field } = x.project();
      let _: Pin<&mut T> = field;
  }
  ```

## [0.1.12] - 2021-03-02

- [Prepare for removal of `safe_packed_borrows` lint.](https://github.com/taiki-e/pin-project-lite/pull/55) See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

## [0.1.11] - 2020-10-20

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- Suppress `clippy::redundant_pub_crate` lint in generated code.

- Documentation improvements.

## [0.1.10] - 2020-10-01

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- Suppress `drop_bounds` lint, which will be added to rustc in the future. See [taiki-e/pin-project#272](https://github.com/taiki-e/pin-project/issues/272) for more details.

## [0.1.9] - 2020-09-29

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Fix trailing comma support in generics.](https://github.com/taiki-e/pin-project-lite/pull/32)

## [0.1.8] - 2020-09-26

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Fix compatibility of generated code with `forbid(future_incompatible)`.](https://github.com/taiki-e/pin-project-lite/pull/30)

  Note: This does not guarantee compatibility with `forbid(future_incompatible)` in the future.
  If rustc adds a new lint, we may not be able to keep this.

## [0.1.7] - 2020-06-04

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Support `?Sized` bounds in where clauses.](https://github.com/taiki-e/pin-project-lite/pull/22)

- [Fix lifetime inference error when an associated type is used in fields.](https://github.com/taiki-e/pin-project-lite/pull/20)

- Suppress `clippy::used_underscore_binding` lint in generated code.

- Documentation improvements.

## [0.1.6] - 2020-05-31

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Support lifetime bounds in where clauses.](https://github.com/taiki-e/pin-project-lite/pull/18)

- Documentation improvements.

## [0.1.5] - 2020-05-07

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Support overwriting the name of `core` crate.](https://github.com/taiki-e/pin-project-lite/pull/14)

## [0.1.4] - 2020-01-20

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Support ?Sized bounds in generic parameters.](https://github.com/taiki-e/pin-project-lite/pull/9)

## [0.1.3] - 2020-01-20

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [Support lifetime bounds in generic parameters.](https://github.com/taiki-e/pin-project-lite/pull/7)

## [0.1.2] - 2020-01-05

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- Support recognizing default generic parameters. ([#6](https://github.com/taiki-e/pin-project-lite/pull/6), thanks @kennytm)

## [0.1.1] - 2019-11-15

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

- [`pin_project!` macro now determines the visibility of the projection type/method is based on the original type.](https://github.com/taiki-e/pin-project-lite/pull/5)

## [0.1.0] - 2019-10-22

**Note:** This release has been yanked. See [#55](https://github.com/taiki-e/pin-project-lite/pull/55) for details.

Initial release

[Unreleased]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.16...HEAD
[0.2.16]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.15...v0.2.16
[0.2.15]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.14...v0.2.15
[0.2.14]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.13...v0.2.14
[0.2.13]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.12...v0.2.13
[0.2.12]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.11...v0.2.12
[0.2.11]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.10...v0.2.11
[0.2.10]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.9...v0.2.10
[0.2.9]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.8...v0.2.9
[0.2.8]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.7...v0.2.8
[0.2.7]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.6...v0.2.7
[0.2.6]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.5...v0.2.6
[0.2.5]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/taiki-e/pin-project-lite/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.11...v0.2.0
[0.1.12]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.11...v0.1.12
[0.1.11]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.9...v0.1.10
[0.1.9]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/taiki-e/pin-project-lite/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/taiki-e/pin-project-lite/releases/tag/v0.1.0


---

<!-- source: archive/library/rust/references/packages/reqwest/CHANGELOG--001007.md -->

## Imported source: archive/library/rust/references/packages/reqwest/CHANGELOG--001007.md

## v0.11.27

- Add `hickory-dns` feature, deprecating `trust-dns`.
- (wasm) Fix `Form::text()` to not set octet-stream for plain text fields.

## v0.11.26

- Revert `system-configuration` upgrade, which broke MSRV on macOS.

## v0.11.25

- Fix `Certificate::from_pem_bundle()` parsing.
- Fix Apple linker errors from detecting system proxies.

## v0.11.24

- Add `Certificate::from_pem_bundle()` to add a bundle.
- Add `http3_prior_knowledge()` to blocking client builder.
- Remove `Sync` bounds requirement for `Body::wrap_stream()`.
- Fix HTTP/2 to retry `REFUSED_STREAM` requests.
- Fix instances of converting `Url` to `Uri` that could panic.

## v0.11.23

- Add `Proxy::custom_http_auth(val)` for setting the raw `Proxy-Authorization` header when connecting to proxies.
- Fix redirect to reject locations that are not `http://` or `https://`.
- Fix setting `nodelay` when TLS is enabled but URL is HTTP.
- (wasm) Add `ClientBuilder::user_agent(val)`.
- (wasm) add `multipart::Form::headers(headers)`.

## v0.11.22

- Fix compilation on Windows when `trust-dns` is enabled.

## v0.11.21

- Add automatically detecting macOS proxy settings.
- Add `ClientBuilder::tls_info(bool)`, which will put `tls::TlsInfo` into the response extensions.
- Fix trust-dns resolver from possible hangs.
- Fix connect timeout to be split among multiple IP addresses.

## v0.11.20

- Fix `deflate` decompression back to using zlib, as outlined in the spec.

## v0.11.19

- Add `ClientBuilder::http1_ignore_invalid_headers_in_responses()` option.
- Add `ClientBuilder::http1_allow_spaces_after_header_name_in_responses()` option.
- Add support for `ALL_PROXY` environment variable.
- Add support for `use_preconfigured_tls` when combined with HTTP/3.
- Fix `deflate` decompression from using the zlib decoder.
- Fix `Response::{text, text_with_charset}()` to strip BOM characters.
- Fix a panic when HTTP/3 is used if UDP isn't able to connect.
- Fix some dependencies for HTTP/3.
- Increase MSRV to 1.63.

## v0.11.18

- Fix `RequestBuilder::json()` method from overriding a previously set `content-type` header. An existing value will be left in place.
- Upgrade internal dependencies for rustls and compression.

## v0.11.17

- Upgrade internal dependencies of Experimental HTTP/3 to use quinn v0.9
- (wasm) Fix blob url support

## v0.11.16

- Chore: set MSRV in `Cargo.toml`.
- Docs: fix build on docs.rs

## v0.11.15

- Add `RequestBuilder` methods to split and reconstruct from its parts.
- Add experimental HTTP/3 support.
- Fix `connection_verbose` to log `write_vectored` calls.
- (wasm) Make requests actually cancel if the future is dropped.

## v0.11.14

- Adds `Proxy::no_proxy(url)` that works like the NO_PROXY environment variable.
- Adds `multipart::Part::headers(headers)` method to add custom headers.
- (wasm) Add `Response::bytes_stream()`.
- Perf: several internal optimizations reducing copies and memory allocations.

## v0.11.13

- Add `ClientBuilder::dns_resolver()` option for custom DNS resolvers.
- Add `ClientBuilder::tls_sni(bool)` option to enable or disable TLS Server Name Indication.
- Add `Identity::from_pkcs8_pem()` constructor when using `native-tls`.
- Fix `redirect::Policy::limited(0)` from following any redirects.

## v0.11.12

- Add `ClientBuilder::resolve_to_addrs()` which allows a slice of IP addresses to be specified for a single host.
- Add `Response::upgrade()` to await whether the server agrees to an HTTP upgrade.

## v0.11.11

- Add HTTP/2 keep-alive configuration methods on `ClientBuilder`.
- Add `ClientBuilder::http1_allow_obsolete_multiline_headers_in_responses()`.
- Add `impl Service<Request>` for `Client` and `&'_ Client`.
- (wasm) Add `RequestBuilder::basic_auth()`.
- Fix `RequestBuilder::header` to not override `sensitive` if user explicitly set on a `HeaderValue`.
- Fix rustls parsing of elliptic curve private keys.
- Fix Proxy URL parsing of some invalid targets.

## v0.11.10

- Add `Error::url()` to access the URL of an error.
- Add `Response::extensions()` to access the `http::Extensions` of a response.
- Fix `rustls-native-certs` to log an error instead of panicking when loading an invalid system certificate.
- Fix passing Basic Authorization header to proxies.

## v0.11.9

- Add `ClientBuilder::http09_responses(bool)` option to allow receiving HTTP/0.9 responses.
- Fix HTTP/2 to retry requests interrupted by an HTTP/2 graceful shutdown.
- Fix proxy loading from environment variables to ignore empty values.

## v0.11.8

- Update internal webpki-roots dependency.

## v0.11.7

- Add `blocking::ClientBuilder::resolve()` option, matching the async builder.
- Implement `From<tokio::fs::File>` for `Body`.
- Fix `blocking` request-scoped timeout applying to bodies as well.
- (wasm) Fix request bodies using multipart vs formdata.
- Update internal `rustls` to 0.20.

## v0.11.6

- (wasm) Fix request bodies more.

## v0.11.5

- Add `ClientBuilder::http1_only()` method.
- Add `tls::Version` type, and `ClientBuilder::min_tls_version()` and `ClientBuilder::max_tls_version()` methods.
- Implement `TryFrom<Request>` for `http::Request`.
- Implement `Clone` for `Identity`.
- Fix `NO_PROXY`environment variable parsing to more closely match curl's. Comma-separated entries are now trimmed for whitespace, and `*` is allowed to match everything.
- Fix redirection to respect `https_only` option.
- (wasm) Add `Body::as_bytes()` method.
- (wasm) Fix sometimes wrong conversation of bytes into a `JsValue`.
- (wasm) Avoid dependency on serde-serialize feature.

## v0.11.4

- Add `ClientBuilder::resolve()` option to override DNS resolution for specific domains.
- Add `native-tls-alpn` Cargo feature to use ALPN with the native-tls backend.
- Add `ClientBuilder::deflate()` option and `deflate` Cargo feature to support decoding response bodies using deflate.
- Add `RequestBuilder::version()` to allow setting the HTTP version of a request.
- Fix allowing "invalid" certificates with the `rustls-tls` backend, when the server uses TLS v1.2 or v1.3.
- (wasm) Add `try_clone` to `Request` and `RequestBuilder`

## v0.11.3

- Add `impl From<hyper::Body> for reqwest::Body`.
- (wasm) Add credentials mode methods to `RequestBuilder`.

## v0.11.2

- Add `CookieStore` trait to customize the type that stores and retrieves cookies for a session.
- Add `cookie::Jar` as a default `CookieStore`, easing creating some session cookies before creating the `Client`.
- Add `ClientBuilder::http2_adaptive_window()` option to configure an adaptive HTTP2 flow control behavior.
- Add `ClientBuilder::http2_max_frame_size()` option to adjust the maximum HTTP2 frame size that can be received.
- Implement `IntoUrl` for `String`, making it more convenient to create requests with `format!`.

## v0.11.1

- Add `ClientBuilder::tls_built_in_root_certs()` option to disable built-in root certificates.
- Fix `rustls-tls` glue to more often support ALPN to upgrade to HTTP/2.
- Fix proxy parsing to assume `http://` if no scheme is found.
- Fix connection pool idle reaping by enabling hyper's `runtime` feature.
- (wasm) Add `Request::new()` constructor.

# v0.11.0

- Change `multipart` to be an optional cargo feature.
- Remove deprecated methods.

- Update to Tokio v1.0.
- Update to Bytes v1.0.
- Update to hyper v0.14.

## v0.10.10

- Add `tcp_keepalive` option to `blocking::ClientBuilder`.
- Add `multipart::Part::stream_with_length` constructor, to create a streaming part with a known length.
- Add `ClientBuilder::https_only` option, to allow requiring URLs to be `https`.
- Change default `tcp_keepalive` value to be disabled.

## v0.10.9

- Add `rustls-tls-native-roots`, `rustls-tls-webpki-roots`, and `rustls-tls-manual-roots` Cargo features, to configure which certificate roots to use with rustls.
- Add `ClientBuilder::tcp_keepalive()` method to enable TCP keepalive.
- Add `ClientBuilder::http1_writev()` method to force enable or disable vectored writes.
- Add `Error::is_connect()` method to identify if the error is related to connection-establishment.
- Add `blocking::ClientBuilder::brotli()` method.
- Windows: Update default protocol to HTTP for HTTPS system proxies, when a protocol is not specified.
- (wasm) Add support for Cloudflare workers runtime.
- (wasm) Add `ClientBuilder::default_headers()` method.
- (wasm) Add `RequestBuilder::build()` method.

## v0.10.8

- Add `must_use` to `RequestBuilder` and `ClientBuilder`.
- Fix Windows system proxy detection of Fiddler proxies.
- (wasm) Add `headers` method to `RequestBuilder`.
- (wasm) Add `execute` method to `Client`.
- (wasm) Add `TryFrom<http::Request>` for `Request`.
- (wasm) Fix checking for global `window` to work in non-browser environments.
- (wasm) Fix sending of an empty body when not required.

## v0.10.7

- Add `NO_PROXY` environment variable support.
- Add more `Error::{is_request, is_body, is_decode}` getters.
- Add conversion of `reqwest::ClientBuilder` to `reqwest::blocking::ClientBuilder`.
- Add `headers_mut()` to `reqwest::blocking::Response`.
- (wasm) Add `form()`, `query()`, `multipart` and `bearer_auth()` to `RequestBuilder`.

## v0.10.6

- Changed handling of URLs that don't have `http:` or `https:` schemes, returning an error instead.
- Fixed a potential hyper-rustls feature conflict.

## v0.10.5

- Add `ClientBuilder::pool_idle_timeout` option.
- Add `ClientBuilder::pool_max_idle_per_host` option, deprecate `max_idle_per_host`.
- Add `Response::content_length` for WASM target.
- Enable TCP_NODELAY by default.
- Implement `TryFrom<http::Request>` for `blocking::Request`.
- Implement `TryFrom<http::Request>` for `Request`.
  - Removes `From<http::Request>` for `Request`.
  - This is technically a breaking change, but was a mistake. It was not valid to convert from an `http::Request` to a `reqwest::Request` in an infallible fashion. It would panic if the conversion was not possible. Instead, the implementation has been changed to `TryFrom` to indicate it could fail.

## v0.10.4

- Add `trust-dns` optional feature to change DNS resolver.
- Add `bytes()` method to `reqwest::blocking::Response`.
- Add `buffer()` method to `reqwest::blocking::Body`.
- Implement `From<http::Request>` for `reqwest::Request`.

## v0.10.3

- Upgrade internal `rustls` version.

## v0.10.2

- Add Brotli support, enabled with the optional `brotli` feature.
- Add `Client::use_preconfigured_tls(tls_connector)` allowing manual configuration of TLS options.
- Implement `Default` for blocking `Client`, `ClientBuilder`, and `multipart::Form`.
- (wasm) Add `Response::error_for_status()` method.
- (wasm) Add `Response::json()` method.
- (wasm) Implement `Default` for `Client` and `ClientBuilder`.

## v0.10.1

- Add `socks` optional feature to support SOCKS5 proxies.
- Add `RequestBuilder::timeout()` to configure a timeout for a single request, instead of using the client's timeout.
- Add `ClientBuilder::connection_verbose()` option to enable verbose IO logs.
- (wasm) Add `RequestBuilder::fetch_mode_no_cors()` option.
- (wasm) Add `Response::url()` getter method.

# v0.10.0

- Add `std::future::Future` support.
- Add `wasm32-unknown-unknown` support (with fewer features).
- Add ability to pass async `Response` as the `body` of another `Request`.
- Add `Body::as_bytes()` method.
- Add `Response::bytes_stream()` method to get body as an `impl Stream`.
- Add `Request::try_clone()` method.

- Change default `Client` API to async. The previous blocking client API is available at `reqwest::blocking`.
- Change to no longer send a default `User-Agent` header. Add one via `ClientBuilder::user_agent()`.
- Change to enable system/environment proxy detection by default.
- Change `default-tls` feature to only include `ClientBuilder` options that both `native-tls` and `rustls` support.
- Change default feature set to reduce unnecessary dependencies. Most features are disabled by default:
  - `blocking`: The `reqwest::blocking` (synchronous) client API.
  - `cookies`: Cookie store support.
  - `gzip`: Automatic response body decompression.
  - `json`: Request and response JSON body methods.
  - `stream`: `futures::Stream` support.
- Change `Error` internal design, removing several `Error::is_*` inspector methods.
- Change Redirect API:
  - Renamed types to be part of the `redirect` module (for example, `reqwest::RedirectPolicy` is now `reqwest::redirect::Policy`).
  - Removed `loop_detected` and `too_many_redirect` methods from `redirect::Attempt`, replaced with a generic `error` method.
  - The default policy no longer specifically looks for redirect loops (but they should be caught by the maximum limit).

- Fix checking `HTTP_PROXY` environment variable if it the environment is from a CGI script.
- Fix removal of username/password of parsed proxy URL.

- Update `url` to v2.0.
- Update `hyper` to v0.13.
- Update `http` to v0.2.


## v0.9.19

- Add `ClientBuilder::use_sys_proxy()` to enable automatic detect of HTTP proxies configured on the system.
- Add `ClientBuilder::no_proxy()` to disable system proxies. This is the default for 0.9, but will change to detecting system proxies by default in 0.10.
- Add support for streaming request bodies in the async client.
- Add `async::Response::text()` that returns a `Future` of the full body decoded to a `String`.
- Add `Clone` for `Certificate`.

## v0.9.18

- Fix `Cookie` headers to no longer send as percent-encoded (instead, exactly as sent by the server).

## v0.9.17

- Fix `Cookie` headers so as to not include attributes from the `Set-Cookie` (like `HttpOnly`, `Secure`, etc).

## v0.9.16

- Add `Response::text_with_charset()` to allow setting the default charset to decode.
- Add `Error::source()` implementation.
- Add `async::ClientBuilder::timeout()` option, will timeout the connect, request, and response body futures.
- Fix gzip + chunked transfer encoding issue preventing connection reuse.
- Fix `RequestBuilder::query()` to not add just `"?"` if the encoded query is empty.
- Fix including new cookie headers when response is a redirect.

## v0.9.15

- Fix sending of "appended" request headers.

## v0.9.14

- Add optional support for SOCKS5 proxies, by enabling the `socks5` cargo feature.
- Add Cookie Store support to `Client`, automatically handling cookies for a session.
* Add `ClientBuilder::cookie_store(enable: bool)` method to enable a cookie store that persists across requests.
* Add `Response::cookies()` accessor that allows iterating over response cookies.
- Fix `Proxy` to check the URL for a username and password.

## v0.9.13

### Fixes

- Fix panic on some invalid `Location` headers during redirects (error is logged and redirect response is returned instead).
- Fix instance when server notices streaming request body is complete before reqwest does.

## v0.9.12

### Features

- Add `ClientBuilder::tcp_nodelay()` to allow disabling Nagle's algorithm.
- Add `ClientBuilder::max_idle_per_host()` to allow reducing the number of idle pooled connections.
- Add `RequestBuilder::bearer_auth()` method to async builder.

### Fixes

- Fix capitalization error in async `RequestBuilder::basic_auth()`.
- Fix ALPN causing issues when using a Proxy.

## v0.9.11

### Features

- Add `multipart::Form::percent_encode_noop()` to allow for servers which don't support percent encoding of parameters.
- Add `ClientBuilder::http1_title_case_headers()` to force request headers to use Title-Case.
- Add `ClientBuilder::connect_timeout()` to allow setting only a connect timeout.

## v0.9.10

### Features

- Add `ClientBuilder::local_address()` to bind to a local IP address.
- Add `Response::error_for_status_ref()` to return an `Error` while borrowing a `Response`.

### Fixes

- Fix `Identity::from_pem` with `rustls-tls` backend when using RSA private keys.

## v0.9.9

### Features

- Add `ClientBuilder::h2_prior_knowledge()` option to force HTTP2.
- Add `Response::content_length()` to get the content-length of a response.
- Enable ALPN h2 with the rustls-tls backend.

## v0.9.8

### Fixes

- Revert default DNS resolver to `getaddrinfo` in a threadpool. There is now a `trust-dns` optional feature to enable the Trust-DNS resolver.
- Detect `Certificate` and `Identity` errors at construction time.

## v0.9.7

### Fixes

- Fix DNS resolver on Android (reverted back to `getaddrinfo`).
- Fix sending unicode `filename`s in `multipart/form-data` requests.

## v0.9.6

### Features

- Add `Proxy::basic_auth` method to support proxy authorization.
- Add `rustls-tls` optional feature to use rustls instead of native-tls.
- Add `try_clone` method to `Request` and `RequestBuilder`.
- Add `reqwest::async::multipart` support, similar to the synchronous API.
- Adds `default-tls-vendored` optional feature to vendor OpenSSL.

### Fixes

- Fix panic from top-level `reqwest::get` if client builder fails to build.
- Removed timeout waiting for `reqwest::Client` runtime to startup.
- Fix `RequestBuilder::headers` to properly append extra headers of the same name.


### Performance

- Replaced DNS threadpool using `getaddrinfo` with a non-blocking DNS resolver.

## v0.9.5

### Features

- Adds `Response::remote_addr()` method to check the address of the connection used.
- Adds `default-tls` crate feature, enabled by default, which allows users to *disable* TLS.

## v0.9.4

### Features

- Adds `percent_encoding_path_segment` and `percent_encoding_attr_char` configuration to `multipart::Form`.

### Fixes

- Reverts `multipart::Form` default percent encoding format to `path-segment`.

## v0.9.3

### Features

- Adds `multipart::Part::bytes()` to create a part of raw bytes.
- Adds constructors for `Response` to help with testing.

### Fixes

- Properly percent-encoding more illegal characters in multipart filenames.
- Ensure timed out requests cancel the associated async task.

## v0.9.2

### Fixes

- Fix panic when `Location` header has UTF-8 characters.

## v0.9.1

### Fixes

- Fix large request bodies failing because of improper handling of backpressure.
- Remove body-related headers when redirect changes a `POST` into a `GET`.
- Reduce memory size of `Response` and `Error` signicantly.

# v0.9.0

### Features

- Upgrade to `tokio` 0.1.
- Upgrade to `hyper` 0.12.
- Upgrade to `native-tls` 0.2.
- Add `ClientBuilder::danger_accept_invalid_certs(bool)` to disable
  certificate verification.
- Add `RequestBuilder::bearer_auth(token)` to ease sending bearer tokens.
- Add `headers()` and `headers_mut()` to `multipart::Part` to allow sending
  extra headers for a specific part.
- Moved `request::unstable::async` to `reqwest::async`.

### Fixes

- Fix panicking when passing a `Url` with a `file://` scheme. Instead, an
  `Error` is returned.

### Breaking Changes

- Changed `ClientBuilder::danger_disable_hostname_verification()`
  to `ClientBuilder::danger_accept_invalid_hostnames(bool)`.
- Changed `ClientBuilder` to be a by-value builder instead of by-ref.

  For single chains of method calls, this shouldn't affect you. For code that
  conditionally uses the builder, this kind of change is needed:

  ```rust
  // Old
  let mut builder = ClientBuilder::new();
  if some_val {
      builder.gzip(false);
  }
  let client = builder.build()?;

  // New
  let mut builder = ClientBuilder::new();
  if some_val {
      builder = builder.gzip(false);
  }
  let client = builder.build()?;
  ```
- Changed `RequestBuilder` to be a by-value builder of by-ref.

  See the previous note about `ClientBuilder` for affected code and
  how to change it.
- Removed the `unstable` cargo-feature, and moved `reqwest::unstable::async`
  to `reqwest::async`.
- Changed `multipart::Part::mime()` to `mime_str()`.

  ```rust
  // Old
  let part = multipart::Part::file(path)?
      .mime(mime::TEXT_PLAIN);

  // New
  let part = multipart::Part::file(path)?
      .mime_str("text/plain")?;
  ```
- The upgrade to `hyper` 0.12 means a temporary removal of the typed headers.

  The `RequestBuilder` has simple methods to set headers using strings, which
  can work in most places.

  ```rust
  // Old
  client
      .get("https://hyper.rs")
      .header(UserAgent::new("hallo"))
      .send()?;

  // New
  client
      .get("https://hyper.rs")
      .header("user-agent", "hallo")
      .send()?;
  ```

  To ease the transition, there is a `hyper-011` cargo-feature that can be
  enabled.

  ```toml
  [dependencies]
  reqwest = { version = "0.9", features = ["hyper-011"] }
  ```

  And then usage:

  ```rust
  client
      .get("https://hyper.rs")
      .header_011(reqwest::hyper_011::header::UserAgent::new("hallo"))
      .send()?;
  ```


## v0.8.8

- Fix docs.rs/reqwest build.

## v0.8.7

### Fixes

- Send an extra CRLF at the end of multipart requests, since some servers expect it.
- Removed internal dependency on `tokio-proto`, which removed unsafe `small-vec`
  dependency.

## v0.8.6

### Features

- Add `RedirectAttempt::status` to check status code that triggered redirect.
- Add `RedirectPolicy::redirect` method publicly, to allow composing policies.

## v0.8.5

### Features

- Try to auto-detect encoding in `Response::text()`.
- Add `Certificate::from_pem` to load PEM encoded client certificates.
- Allow unsized types in `query`, `form`, and `json`.
- Add `unstable::async::RequestBuilder::query`, mirroring the stable builder method.

## v0.8.4

### Features

- Add `RequestBuilder::query` to easily adjust query parameters of requests.

## v0.8.3

### Features

- Upgrades internal log crate usage to v0.4

## v0.8.2

### Fixes

- Enable hyper's `no_proto` config, fixing several bugs in hyper.

## v0.8.1

### Features

- Add `ClientBuilder::default_headers` to set headers used for every request.
- Add `async::ClientBuilder::dns_threads` to set number of threads use for DNS.
- Add `Response::text` as shortcut to read the full body into a `String`.
- Add `Response::copy_to` as shortcut for `std::io::copy`.

# v0.8.0

### Features

- Client TLS Certificates (#43)
- GZIP decoding has been added to the **async** Client (#161)
- `ClientBuilder` and `RequestBuilder` hold their errors till consumed (#189)
- `async::Response::body()` now returns a reference to the body instead of consuming the `Response`
- A default timeout for `reqwest::Client` is used set to 30 seconds (#181)

### Breaking Changes

- `Client::new` no longer returns a `Result`.

  To handle any panics that come from `Client::new`, the builder can be used instead.
- `ClientBuilder` and `RequestBuilder` hold their errors till consumed (#189).

  This means a bunch of `?` will be going away, but means using the builders will be far easier now. Any error encountered inside the builders will now be returned when the builder is consumed.

  To get errors back immediately, the `Request` type can be used directly, by building pieces separately and calling setters.
- `async::Response::body()` now returns a reference to the body instead of consuming the `Response`.
- A default timeout for `reqwest::Client` is used set to 30 seconds (#181)

  For uses where the timeout is too short, it can be changed on the `ClientBuilder`, using the `timeout` method. Passing `None` will disable the timeout, reverting to the pre-0.8 behavior.

## v0.7.3

### Features

- `Proxy::custom(fn)` to allow dynamically picking a proxy URL

### Fixes

- fix occasional panic when program exits while `Client` or `Response` are dropping.

## v0.7.2

### Fixes

- fix a panic when redirecting and a `Authorization<Basic>` header was added (https://github.com/seanmonstar/reqwest/commit/cf246d072badd9b31b487e7a0b00490e4cc9584f)
- fix redirects so that a GET will follow 307/308 responses (https://github.com/seanmonstar/reqwest/commit/2d11a4bd7167e1bf3a35b62f5aeb36d5d294e56e)

## v0.7.1

### Fixes

- fix remove accidental `println`s in the sending of a body
- some documentation improvements

# v0.7.0

### Features

- Proxy support (#30)
- Self-signed TLS certificates (#97)
- Disabling TLS hostname validation   (#89)
- A `Request` type that can be used instead of the `RequestBuilder` (#85)
- Add `Response::error_for_status()` to easily convert 400 and 500 status responses into an `Error`  (#98)
- Upgrade hyper to 0.11
  - Synchronous `Client` remains.
  - Timeouts now affect DNS and socket connection.
  - Pool much better at evicting sockets when they die.
  - An `unstable` Cargo feature to enable `reqwest::unstable::async`.
- A huge docs improvement! 

### Fixes

- Publicly exports `RedirectAction` and `RedirectAttempt`
- `Error::get_ref` returns `Error + Send + Sync`  

### Breaking Changes

- hyper has been upgraded to 0.11, so `header`, `StatusCode`, and `Method` have breaking changes.
- `mime` has been upgraded to 0.3, with a very different API.
- All configuration methods have been removed from the `Client`, and moved to the `ClientBuilder`.
- The `HttpVersion` type was completely removed.
- `Error::cause()` now returns `Error::get_ref().cause()`.
- All methods on `Client` that start a `RequestBuilder` now return a `Result` immediately, instead of delaying the URL parse error for later.
- The `RequestBuilder` methods all take `&mut self`, instead of moving the builder, and return `&mut Self`. (This shouldn't actually affect most people who are building a request in a single chain.)
- `Response::status()` returns a `StatusCode` instead of `&StatusCode`.

## v0.6.2

### Features

- adds `Client::referer(bool)` option to disable setting the `Referer` header during redirects (https://github.com/seanmonstar/reqwest/commit/bafcd7ae6fc232856dd6ddb8bf5b20dbbbfe0bc9)

### Fixes

- fixes filtering sensitive headers during redirects (https://github.com/seanmonstar/reqwest/issues/10)
- fixes sending of the Referer to an HTTP site when coming from HTTPS, and removes username and fragment explicitly (https://github.com/seanmonstar/reqwest/commit/d8696045b4c6bc4d9e33789cff6a9e1fa75462d7)
- documentation updates

## v0.6.1

### Features

- adds `Error::get_ref` to get the underlying error that may have occurred. Includes a `'static` bounds, which allows for downcasting (as opposed to `Error::cause`).

# v0.6.0

### Features

- Upgraded to serde `1.0`
- Added a `url` [method](https://docs.rs/reqwest/0.6.0/reqwest/struct.Error.html#method.url) to `Error`, which returns a possible associated `Url` that occurred with this error.
- Added `req.basic_auth(user, optional_pass)` [method](https://docs.rs/reqwest/0.6.0/reqwest/struct.RequestBuilder.html#method.basic_auth) to ease using `Basic` authentication.

### Breaking Changes

- The publicly exposed peer dependency serde was upgraded. It is now `serde@1.0`. Mismatched version will give a compiler error that a serde trait is not implemented.
- `Error` is no longer an `enum`, but an opaque struct. Details about it can be checked with `std::error::Error::cause()`, and methods on `reqwest::Error` include `is_http()`, `is_serialization()`, and `is_redirect()`.
- `RedirectPolicy::custom` receives different arguments, and returns different values. See the [docs](https://docs.rs/reqwest/0.6.0/reqwest/struct.RedirectPolicy.html#method.custom) for an example.

## v0.5.2

### Fixes

- fix panic with Gzip decoder on an empty body (https://github.com/seanmonstar/reqwest/issues/82)

## v0.5.1

### Features

- add `Clone` implementation for `Client`

# v0.5.0

### Features

- Automatic GZIP decoding: By default, `Client` will try to decode any responses that appear to be gzip encoded (based on headers). This can be disabled via `client.gzip(false)` (https://github.com/seanmonstar/reqwest/commit/ab5e477a123319efd4b17f3666b41b44ec244bee)
- Specify a timeout for requests using `client.timeout(duration)`. (https://github.com/seanmonstar/reqwest/commit/ec049fefbae7355f6e4ddbbc7ebedcadb30e1e04)
- Request bodies with a known length can be constructed with `Body::sized()` (https://github.com/seanmonstar/reqwest/commit/82f1877d4b6cba2fac432670ec306160aee5c501)
- Add `Client.put`, `Client.patch`, and `Client.delete` convenience methods (https://github.com/seanmonstar/reqwest/commit/c37b8aa0338ac4142763d206c6df79856915056d, https://github.com/seanmonstar/reqwest/commit/4d6582d22b23c27927e481a9c8a83ad08cfd1a2a, https://github.com/seanmonstar/reqwest/commit/a3983f3122b2d1495ea36bb5a8fd019a7605ae56)
- Add `reqwest::mime` (https://github.com/seanmonstar/reqwest/commit/0615c6d65e03ba9cb5364169c9e74f4f2a91554b)

### Breaking Changes

The only breaking change is a behavioral one, all programs should still compile without modification. The automatic GZIP decoding could interfere in cases where a user was expecting the GZIP bytes, either to save to a file or decode themselves. To restore this functionality, set `client.gzip(false)`. 

# v0.4.0

- updated to serde 0.9

# v0.3.0

- updated to hyper 0.10

# v0.2.0

### Features
- add `Response.json()` method (https://github.com/seanmonstar/reqwest/commit/2d10ecc99e2aaed66616294baaf65380b446e1c6)
- add `RedirectPolicy` (https://github.com/seanmonstar/reqwest/commit/e92b3e862a1a94c0b4173a7d49a315bc121da31e)
- set an `Accept: */*` header by default if no `Accept` header is set (https://github.com/seanmonstar/reqwest/commit/559ae8011a2c098f4fe1821ec1d3444a46f4bf5e)
- add support for 307 and 308 redirects (https://github.com/seanmonstar/reqwest/commit/a54447c1d9c75dab639333265f51a91a43e99c2e)
- implement `Sync` for `Client`, and `Send` for `RequestBuilder` and `Response` (https://github.com/seanmonstar/reqwest/commit/d18a53b3fcc81c4a60875755c8e95d777a343319)
- implement `Send` for `Error` (https://github.com/seanmonstar/reqwest/commit/20b161096e67d22c962e69b2656ae9741ac73c25)
- implement `std::fmt::Debug` for all public types (https://github.com/seanmonstar/reqwest/commit/d624b0ef29020c6085ec94651a990f58ccd684e2)

### Breaking Changes
- `Error::Serialize` now has a `Box<StdError + Send + Sync>` instead of `Box<StdError>`
- `RequestBuilder` no longer has an associated lifetime (was `RequestBuilder<'a>`)

# v0.1.0

Initial release: http://seanmonstar.com/post/153221119046/introducing-reqwest


---

<!-- source: archive/library/rust/references/packages/tokio-macros/CHANGELOG--000972.md -->

## Imported source: archive/library/rust/references/packages/tokio-macros/CHANGELOG--000972.md

# 2.6.0 (Oct 14th, 2025)

The MSRV is raised to 1.71.

- msrv: increase MSRV to 1.71 ([#7658])
- macros: add `local` runtime flavor ([#7375], [#7597])
- macros: suppress `clippy::unwrap_in_result` in `#[tokio::main]` ([#7651])

[#7375]: https://github.com/tokio-rs/tokio/pull/7375
[#7597]: https://github.com/tokio-rs/tokio/pull/7597
[#7651]: https://github.com/tokio-rs/tokio/pull/7651
[#7658]: https://github.com/tokio-rs/tokio/pull/7658

# 2.5.0 (Jan 8th, 2025)

- macros: suppress `clippy::needless_return` in `#[tokio::main]` ([#6874])

[#6874]: https://github.com/tokio-rs/tokio/pull/6874

# 2.4.0 (July 22nd, 2024)

- msrv: increase MSRV to 1.70 ([#6645])
- macros: allow `unhandled_panic` behavior for `#[tokio::main]` and `#[tokio::test]` ([#6593])

[#6593]: https://github.com/tokio-rs/tokio/pull/6593
[#6645]: https://github.com/tokio-rs/tokio/pull/6645

# 2.3.0 (May 30th, 2024)

- macros: make `#[tokio::test]` append `#[test]` at the end of the attribute list ([#6497])

[#6497]: https://github.com/tokio-rs/tokio/pull/6497

# 2.2.0 (November 19th, 2023)

### Changed

- use `::core` qualified imports instead of `::std` inside `tokio::test` macro ([#5973])

[#5973]: https://github.com/tokio-rs/tokio/pull/5973

# 2.1.0 (April 25th, 2023)

- macros: fix typo in `#[tokio::test]` docs ([#5636])
- macros: make entrypoints more efficient ([#5621])

[#5621]: https://github.com/tokio-rs/tokio/pull/5621
[#5636]: https://github.com/tokio-rs/tokio/pull/5636

# 2.0.0 (March 24th, 2023)

This major release updates the dependency on the syn crate to 2.0.0, and
increases the MSRV to 1.56.

As part of this release, we are adopting a policy of depending on a specific minor
release of tokio-macros. This prevents Tokio from being able to pull in many different
versions of tokio-macros.

- macros: update `syn` ([#5572])
- macros: accept path as crate rename ([#5557])

[#5572]: https://github.com/tokio-rs/tokio/pull/5572
[#5557]: https://github.com/tokio-rs/tokio/pull/5557

# 1.8.2 (November 30th, 2022)

- fix a regression introduced in 1.8.1 ([#5244])

[#5244]: https://github.com/tokio-rs/tokio/pull/5244

# 1.8.1 (November 29th, 2022)

(yanked)

- macros: Pin Futures in `#[tokio::test]` to stack ([#5205])
- macros: Reduce usage of last statement spans in proc-macros ([#5092])
- macros: Improve the documentation for `#[tokio::test]` ([#4761])

[#5205]: https://github.com/tokio-rs/tokio/pull/5205
[#5092]: https://github.com/tokio-rs/tokio/pull/5092
[#4761]: https://github.com/tokio-rs/tokio/pull/4761

# 1.8.0 (June 4th, 2022)

- macros: always emit return statement ([#4636])
- macros: support setting a custom crate name for `#[tokio::main]` and `#[tokio::test]` ([#4613])

[#4613]: https://github.com/tokio-rs/tokio/pull/4613
[#4636]: https://github.com/tokio-rs/tokio/pull/4636

# 1.7.0 (December 15th, 2021)

- macros: address remaining `clippy::semicolon_if_nothing_returned` warning ([#4252])

[#4252]: https://github.com/tokio-rs/tokio/pull/4252

# 1.6.0 (November 16th, 2021)

- macros: fix mut patterns in `select!` macro ([#4211])

[#4211]: https://github.com/tokio-rs/tokio/pull/4211

# 1.5.1 (October 29th, 2021)

- macros: fix type resolution error in `#[tokio::main]` ([#4176])

[#4176]: https://github.com/tokio-rs/tokio/pull/4176

# 1.5.0 (October 13th, 2021)

- macros: make tokio-macros attributes more IDE friendly ([#4162])

[#4162]: https://github.com/tokio-rs/tokio/pull/4162

# 1.4.1 (September 30th, 2021)

Reverted: run `current_thread` inside `LocalSet` ([#4027])

# 1.4.0 (September 29th, 2021)

(yanked)

### Changed

- macros: run `current_thread` inside `LocalSet` ([#4027])
- macros: explicitly relaxed clippy lint for `.expect()` in runtime entry macro ([#4030])

### Fixed

- macros: fix invalid error messages in functions wrapped with `#[main]` or `#[test]` ([#4067])

[#4027]: https://github.com/tokio-rs/tokio/pull/4027
[#4030]: https://github.com/tokio-rs/tokio/pull/4030
[#4067]: https://github.com/tokio-rs/tokio/pull/4067

# 1.3.0 (July 7, 2021)

- macros: don't trigger `clippy::unwrap_used` ([#3926])

[#3926]: https://github.com/tokio-rs/tokio/pull/3926

# 1.2.0 (May 14, 2021)

- macros: forward input arguments in `#[tokio::test]` ([#3691])
- macros: improve diagnostics on type mismatch ([#3766])
- macros: various error message improvements ([#3677])

[#3677]: https://github.com/tokio-rs/tokio/pull/3677
[#3691]: https://github.com/tokio-rs/tokio/pull/3691
[#3766]: https://github.com/tokio-rs/tokio/pull/3766

# 1.1.0 (February 5, 2021)

- add `start_paused` option to macros ([#3492])

# 1.0.0 (December 23, 2020)

- track `tokio` 1.0 release.

# 0.3.1 (October 25, 2020)

### Fixed

- fix incorrect docs regarding `max_threads` option ([#3038])

# 0.3.0 (October 15, 2020)

- Track `tokio` 0.3 release.

### Changed
- options are renamed to track `tokio` runtime builder fn names.
- `#[tokio::main]` macro requires `rt-multi-thread` when no `flavor` is specified.

# 0.2.5 (February 27, 2019)

### Fixed
- doc improvements ([#2225]).

# 0.2.4 (January 27, 2019)

### Fixed
- generics on `#[tokio::main]` function ([#2177]).

### Added
- support for `tokio::select!` ([#2152]).

# 0.2.3 (January 7, 2019)

### Fixed
- Revert breaking change.

# 0.2.2 (January 7, 2019)

### Added
- General refactoring and inclusion of additional runtime options ([#2022] and [#2038])

# 0.2.1 (December 18, 2019)

### Fixes
- inherit visibility when wrapping async fn ([#1954]).

# 0.2.0 (November 26, 2019)

- Initial release

[#1954]: https://github.com/tokio-rs/tokio/pull/1954
[#2022]: https://github.com/tokio-rs/tokio/pull/2022
[#2038]: https://github.com/tokio-rs/tokio/pull/2038
[#2152]: https://github.com/tokio-rs/tokio/pull/2152
[#2177]: https://github.com/tokio-rs/tokio/pull/2177
[#2225]: https://github.com/tokio-rs/tokio/pull/2225
[#3038]: https://github.com/tokio-rs/tokio/pull/3038
[#3492]: https://github.com/tokio-rs/tokio/pull/3492


---

<!-- source: archive/library/rust/references/packages/tokio-util/CHANGELOG--000956.md -->

## Imported source: archive/library/rust/references/packages/tokio-util/CHANGELOG--000956.md

# 0.7.17 (November 2nd, 2025)

The MSRV is increased to 1.71.

### Added

- codec: add `{FramedRead,FramedWrite}::into_parts()` ([#7566])
- time: add `#[track_caller]` to `FutureExt::timeout` ([#7588])
- task: add `tokio_util::task::JoinQueue` ([#7590])

### Changed

- codec: remove unnecessary trait bounds on all Framed constructors ([#7716])

### Documented

- time: clarify the cancellation safety of the `DelayQueue` ([#7564])
- docs: fix some docs links ([#7654])
- task: simplify the example of `TaskTracker` ([#7657])
- task: clarify the behavior of several `spawn_local` methods ([#7669])

[#7564]: https://github.com/tokio-rs/tokio/pull/7564
[#7566]: https://github.com/tokio-rs/tokio/pull/7566
[#7588]: https://github.com/tokio-rs/tokio/pull/7588
[#7590]: https://github.com/tokio-rs/tokio/pull/7590
[#7654]: https://github.com/tokio-rs/tokio/pull/7654
[#7657]: https://github.com/tokio-rs/tokio/pull/7657
[#7669]: https://github.com/tokio-rs/tokio/pull/7669
[#7716]: https://github.com/tokio-rs/tokio/pull/7716

# 0.7.16 (August 3rd, 2025)

### Added

- codec: add `FramedWrite::with_capacity` ([#7493])
- future: add adapters of `CancellationToken` for `FutureExt` ([#7475])
- sync: add `DropGuardRef` for `CancellationToken` ([#7407])
- task: add `AbortOnDropHandle::detach` ([#7400])
- task: stabilise `JoinMap` ([#7075])

### Changed

- codec: also apply capacity to read buffer in `Framed::with_capacity` ([#7500])
- sync: make `CancellationToken::run_until_cancelled` biased towards the token ([#7462])
- task: remove raw-entry feature from hashbrown dep ([#7252])

### Documented

- compat: add more documentation to `tokio_util::compat` ([#7279])
- sync: improve docs of `tokio_util::sync::CancellationToken` ([#7408])

[#7075]: https://github.com/tokio-rs/tokio/pull/7075
[#7252]: https://github.com/tokio-rs/tokio/pull/7252
[#7279]: https://github.com/tokio-rs/tokio/pull/7279
[#7400]: https://github.com/tokio-rs/tokio/pull/7400
[#7407]: https://github.com/tokio-rs/tokio/pull/7407
[#7408]: https://github.com/tokio-rs/tokio/pull/7408
[#7462]: https://github.com/tokio-rs/tokio/pull/7462
[#7475]: https://github.com/tokio-rs/tokio/pull/7475
[#7493]: https://github.com/tokio-rs/tokio/pull/7493
[#7500]: https://github.com/tokio-rs/tokio/pull/7500

# 0.7.15 (April 23rd, 2025)

### Fixed

- task: properly handle removed entries in `JoinMap` ([#7264])

### Updated

- deps: update hashbrown to 0.15 ([#7219])

### Documented

- task: explicitly state that `TaskTracker` does not abort tasks on Drop ([#7223])

[#7219]: https://github.com/tokio-rs/tokio/pull/7219
[#7223]: https://github.com/tokio-rs/tokio/pull/7223
[#7264]: https://github.com/tokio-rs/tokio/pull/7264

# 0.7.14 (March 12th, 2025)

### Added

- io: add `get_ref` and `get_mut` for `SyncIoBridge` ([#7128])
- io: add `read_exact_arc` ([#7165])
- sync: add `CancellationToken::run_until_cancelled_owned` ([#7081])

### Changed

- codec: optimize buffer reserve for `AnyDelimiterCodec::encode` ([#7188])
- either: enable `Either` to use underlying `AsyncWrite` implementation ([#7025])

### Fixed

- codec: fix typo in API docs ([#7044])
- util: fix example in `StreamReader` docs ([#7167])

### Documented

- io: add docs for `SyncIoBridge` with examples and alternatives ([#6815])

### Internal

- io: clean up buffer casts ([#7142])
- task: run `spawn_pinned` tests with miri ([#7023])

[#6815]: https://github.com/tokio-rs/tokio/pull/6815
[#7023]: https://github.com/tokio-rs/tokio/pull/7023
[#7025]: https://github.com/tokio-rs/tokio/pull/7025
[#7044]: https://github.com/tokio-rs/tokio/pull/7044
[#7081]: https://github.com/tokio-rs/tokio/pull/7081
[#7128]: https://github.com/tokio-rs/tokio/pull/7128
[#7142]: https://github.com/tokio-rs/tokio/pull/7142
[#7165]: https://github.com/tokio-rs/tokio/pull/7165
[#7167]: https://github.com/tokio-rs/tokio/pull/7167
[#7188]: https://github.com/tokio-rs/tokio/pull/7188

# 0.7.13 (December 4th, 2024)

### Fixed

- codec: fix incorrect handling of invalid utf-8 in `LinesCodec::decode_eof` ([#7011])

[#7011]: https://github.com/tokio-rs/tokio/pull/7011

# 0.7.12 (September 5th, 2024)

This release bumps the MSRV to 1.70. ([#6645])

### Added
- sync: Add `run_until_cancelled` to `tokio_util::sync::CancellationToken` ([#6618])
- task: add `AbortOnDropHandle` type ([#6786])

### Changed
- deps: no default features for hashbrown ([#6541])
- time: wake `DelayQueue` when removing last item ([#6752])
- deps: enable the full feature when compiled for the playground ([#6818])

### Documented
- task: fix typo in `TaskTracker` docs ([#6792])

[#6645]: https://github.com/tokio-rs/tokio/pull/6645
[#6541]: https://github.com/tokio-rs/tokio/pull/6541
[#6618]: https://github.com/tokio-rs/tokio/pull/6618
[#6752]: https://github.com/tokio-rs/tokio/pull/6752
[#6786]: https://github.com/tokio-rs/tokio/pull/6786
[#6792]: https://github.com/tokio-rs/tokio/pull/6792
[#6818]: https://github.com/tokio-rs/tokio/pull/6818

# 0.7.11 (May 4th, 2024)

This release updates the MSRV to 1.63. ([#6126])

### Added

- either: implement `Sink` for `Either` ([#6239])
- time: add `DelayQueue::deadline` ([#6163])
- time: add `FutureExt::timeout` ([#6276])

### Changed

- codec: assert compatibility between `LengthDelimitedCodec` options ([#6414])
- codec: make tracing feature optional for codecs ([#6434])
- io: add `T: ?Sized` to `tokio_util::io::poll_read_buf` ([#6441])
- sync: remove `'static` bound on `impl Sink for PollSender` ([#6397])

### Documented

- codec: add examples for `FramedRead` and `FramedWrite` ([#6310])
- codec: document cancel safety of `SinkExt::send` and `StreamExt::next` ([#6417])

[#6126]: https://github.com/tokio-rs/tokio/pull/6126
[#6163]: https://github.com/tokio-rs/tokio/pull/6163
[#6239]: https://github.com/tokio-rs/tokio/pull/6239
[#6276]: https://github.com/tokio-rs/tokio/pull/6276
[#6310]: https://github.com/tokio-rs/tokio/pull/6310
[#6397]: https://github.com/tokio-rs/tokio/pull/6397
[#6414]: https://github.com/tokio-rs/tokio/pull/6414
[#6417]: https://github.com/tokio-rs/tokio/pull/6417
[#6434]: https://github.com/tokio-rs/tokio/pull/6434
[#6441]: https://github.com/tokio-rs/tokio/pull/6441

# 0.7.10 (October 24th, 2023)

### Added

- task: add `TaskTracker` ([#6033])
- task: add `JoinMap::keys` ([#6046])
- io: implement `Seek` for `SyncIoBridge` ([#6058])

### Changed

- deps: update hashbrown to 0.14 ([#6102])

[#6033]: https://github.com/tokio-rs/tokio/pull/6033
[#6046]: https://github.com/tokio-rs/tokio/pull/6046
[#6058]: https://github.com/tokio-rs/tokio/pull/6058
[#6102]: https://github.com/tokio-rs/tokio/pull/6102

# 0.7.9 (September 20th, 2023)

### Added

- io: add passthrough `AsyncRead`/`AsyncWrite` to `InspectWriter`/`InspectReader` ([#5739])
- task: add spawn blocking methods to `JoinMap` ([#5797])
- io: pass through traits for `StreamReader` and `SinkWriter` ([#5941])
- io: add `SyncIoBridge::into_inner` ([#5971])

### Fixed

- sync: handle possibly dangling reference safely ([#5812])
- util: fix broken intra-doc link ([#5849])
- compat: fix clippy warnings ([#5891])

### Documented

- codec: Specify the line ending of `LinesCodec` ([#5982])

[#5739]: https://github.com/tokio-rs/tokio/pull/5739
[#5797]: https://github.com/tokio-rs/tokio/pull/5797
[#5941]: https://github.com/tokio-rs/tokio/pull/5941
[#5971]: https://github.com/tokio-rs/tokio/pull/5971
[#5812]: https://github.com/tokio-rs/tokio/pull/5812
[#5849]: https://github.com/tokio-rs/tokio/pull/5849
[#5891]: https://github.com/tokio-rs/tokio/pull/5891
[#5982]: https://github.com/tokio-rs/tokio/pull/5982

# 0.7.8 (April 25th, 2023)

This release bumps the MSRV of tokio-util to 1.56.

### Added

- time: add `DelayQueue::peek` ([#5569])

### Changed

This release contains one performance improvement:

- sync: try to lock the parent first in `CancellationToken` ([#5561])

### Fixed

- time: fix panic in `DelayQueue` ([#5630])

### Documented

- sync: improve `CancellationToken` doc on child tokens ([#5632])

[#5561]: https://github.com/tokio-rs/tokio/pull/5561
[#5569]: https://github.com/tokio-rs/tokio/pull/5569
[#5630]: https://github.com/tokio-rs/tokio/pull/5630
[#5632]: https://github.com/tokio-rs/tokio/pull/5632

# 0.7.7 (February 12th, 2023)

This release reverts the removal of the `Encoder` bound on the `FramedParts`
constructor from [#5280] since it turned out to be a breaking change. ([#5450])

[#5450]: https://github.com/tokio-rs/tokio/pull/5450

# 0.7.6 (February 10, 2023)

This release fixes a compilation failure in 0.7.5 when it is used together with
Tokio version 1.21 and unstable features are enabled. ([#5445])

[#5445]: https://github.com/tokio-rs/tokio/pull/5445

# 0.7.5 (February 9, 2023)

This release fixes an accidental breaking change where `UnwindSafe` was
accidentally removed from `CancellationToken`.

### Added
- codec: add `Framed::backpressure_boundary` ([#5124])
- io: add `InspectReader` and `InspectWriter` ([#5033])
- io: add `tokio_util::io::{CopyToBytes, SinkWriter}` ([#5070], [#5436])
- io: impl `std::io::BufRead` on `SyncIoBridge` ([#5265])
- sync: add `PollSemaphore::poll_acquire_many` ([#5137])
- sync: add owned future for `CancellationToken` ([#5153])
- time: add `DelayQueue::try_remove` ([#5052])

### Fixed
- codec: fix `LengthDelimitedCodec` buffer over-reservation ([#4997])
- sync: impl `UnwindSafe` on `CancellationToken` ([#5438])
- util: remove `Encoder` bound on `FramedParts` constructor ([#5280])

### Documented
- io: add lines example for `StreamReader` ([#5145])

[#4997]: https://github.com/tokio-rs/tokio/pull/4997
[#5033]: https://github.com/tokio-rs/tokio/pull/5033
[#5052]: https://github.com/tokio-rs/tokio/pull/5052
[#5070]: https://github.com/tokio-rs/tokio/pull/5070
[#5124]: https://github.com/tokio-rs/tokio/pull/5124
[#5137]: https://github.com/tokio-rs/tokio/pull/5137
[#5145]: https://github.com/tokio-rs/tokio/pull/5145
[#5153]: https://github.com/tokio-rs/tokio/pull/5153
[#5265]: https://github.com/tokio-rs/tokio/pull/5265
[#5280]: https://github.com/tokio-rs/tokio/pull/5280
[#5436]: https://github.com/tokio-rs/tokio/pull/5436
[#5438]: https://github.com/tokio-rs/tokio/pull/5438

# 0.7.4 (September 8, 2022)

### Added

- io: add `SyncIoBridge::shutdown()` ([#4938])
- task: improve `LocalPoolHandle` ([#4680])

### Fixed

- util: add `track_caller` to public APIs ([#4785])

### Unstable

- task: fix compilation errors in `JoinMap` with Tokio v1.21.0 ([#4755])
- task: remove the unstable, deprecated `JoinMap::join_one` ([#4920])

[#4680]: https://github.com/tokio-rs/tokio/pull/4680
[#4755]: https://github.com/tokio-rs/tokio/pull/4755
[#4785]: https://github.com/tokio-rs/tokio/pull/4785
[#4920]: https://github.com/tokio-rs/tokio/pull/4920
[#4938]: https://github.com/tokio-rs/tokio/pull/4938

# 0.7.3 (June 4, 2022)

### Changed

- tracing: don't require default tracing features ([#4592])
- util: simplify implementation of `ReusableBoxFuture` ([#4675])

### Added (unstable)

- task: add `JoinMap` ([#4640], [#4697])

[#4592]: https://github.com/tokio-rs/tokio/pull/4592
[#4640]: https://github.com/tokio-rs/tokio/pull/4640
[#4675]: https://github.com/tokio-rs/tokio/pull/4675
[#4697]: https://github.com/tokio-rs/tokio/pull/4697

# 0.7.2 (May 14, 2022)

This release contains a rewrite of `CancellationToken` that fixes a memory leak. ([#4652])

[#4652]: https://github.com/tokio-rs/tokio/pull/4652

# 0.7.1 (February 21, 2022)

### Added

- codec: add `length_field_type` to `LengthDelimitedCodec` builder ([#4508])
- io: add `StreamReader::into_inner_with_chunk()` ([#4559])

### Changed

- switch from log to tracing ([#4539])

### Fixed

- sync: fix waker update condition in `CancellationToken` ([#4497])
- bumped tokio dependency to 1.6 to satisfy minimum requirements ([#4490])

[#4490]: https://github.com/tokio-rs/tokio/pull/4490
[#4497]: https://github.com/tokio-rs/tokio/pull/4497
[#4508]: https://github.com/tokio-rs/tokio/pull/4508
[#4539]: https://github.com/tokio-rs/tokio/pull/4539
[#4559]: https://github.com/tokio-rs/tokio/pull/4559

# 0.7.0 (February 9, 2022)

### Added

- task: add `spawn_pinned` ([#3370])
- time: add `shrink_to_fit` and `compact` methods to `DelayQueue` ([#4170])
- codec: improve `Builder::max_frame_length` docs ([#4352])
- codec: add mutable reference getters for codecs to pinned `Framed` ([#4372])
- net: add generic trait to combine `UnixListener` and `TcpListener` ([#4385])
- codec: implement `Framed::map_codec` ([#4427])
- codec: implement `Encoder<BytesMut>` for `BytesCodec` ([#4465])

### Changed

- sync: add lifetime parameter to `ReusableBoxFuture` ([#3762])
- sync: refactored `PollSender<T>` to fix a subtly broken `Sink<T>` implementation ([#4214])
- time: remove error case from the infallible `DelayQueue::poll_elapsed` ([#4241])

[#3370]: https://github.com/tokio-rs/tokio/pull/3370
[#4170]: https://github.com/tokio-rs/tokio/pull/4170
[#4352]: https://github.com/tokio-rs/tokio/pull/4352
[#4372]: https://github.com/tokio-rs/tokio/pull/4372
[#4385]: https://github.com/tokio-rs/tokio/pull/4385
[#4427]: https://github.com/tokio-rs/tokio/pull/4427
[#4465]: https://github.com/tokio-rs/tokio/pull/4465
[#3762]: https://github.com/tokio-rs/tokio/pull/3762
[#4214]: https://github.com/tokio-rs/tokio/pull/4214
[#4241]: https://github.com/tokio-rs/tokio/pull/4241

# 0.6.10 (May 14, 2021)

This is a backport for the memory leak in `CancellationToken` that was originally fixed in 0.7.2. ([#4652])

[#4652]: https://github.com/tokio-rs/tokio/pull/4652

# 0.6.9 (October 29, 2021)

### Added

- codec: implement `Clone` for `LengthDelimitedCodec` ([#4089])
- io: add `SyncIoBridge`  ([#4146])

### Fixed

- time: update deadline on removal in `DelayQueue` ([#4178])
- codec: Update stream impl for Framed to return None after Err ([#4166])

[#4089]: https://github.com/tokio-rs/tokio/pull/4089
[#4146]: https://github.com/tokio-rs/tokio/pull/4146
[#4166]: https://github.com/tokio-rs/tokio/pull/4166
[#4178]: https://github.com/tokio-rs/tokio/pull/4178

# 0.6.8 (September 3, 2021)

### Added

- sync: add drop guard for `CancellationToken` ([#3839])
- compact: added `AsyncSeek` compat ([#4078])
- time: expose `Key` used in `DelayQueue`'s `Expired` ([#4081])
- io: add `with_capacity` to `ReaderStream` ([#4086])

### Fixed

- codec: remove unnecessary `doc(cfg(...))` ([#3989])

[#3839]: https://github.com/tokio-rs/tokio/pull/3839
[#4078]: https://github.com/tokio-rs/tokio/pull/4078
[#4081]: https://github.com/tokio-rs/tokio/pull/4081
[#4086]: https://github.com/tokio-rs/tokio/pull/4086
[#3989]: https://github.com/tokio-rs/tokio/pull/3989

# 0.6.7 (May 14, 2021)

### Added

- udp: make `UdpFramed` take `Borrow<UdpSocket>` ([#3451])
- compat: implement `AsRawFd`/`AsRawHandle` for `Compat<T>` ([#3765])

[#3451]: https://github.com/tokio-rs/tokio/pull/3451
[#3765]: https://github.com/tokio-rs/tokio/pull/3765

# 0.6.6 (April 12, 2021)

### Added

- util: makes `Framed` and `FramedStream` resumable after eof ([#3272])
- util: add `PollSemaphore::{add_permits, available_permits}` ([#3683])

### Fixed

- chore: avoid allocation if `PollSemaphore` is unused ([#3634])

[#3272]: https://github.com/tokio-rs/tokio/pull/3272
[#3634]: https://github.com/tokio-rs/tokio/pull/3634
[#3683]: https://github.com/tokio-rs/tokio/pull/3683

# 0.6.5 (March 20, 2021)

### Fixed

- util: annotate time module as requiring `time` feature ([#3606])

[#3606]: https://github.com/tokio-rs/tokio/pull/3606

# 0.6.4 (March 9, 2021)

### Added

- codec: `AnyDelimiter` codec ([#3406])
- sync: add pollable `mpsc::Sender` ([#3490])

### Fixed

- codec: `LinesCodec` should only return `MaxLineLengthExceeded` once per line ([#3556])
- sync: fuse PollSemaphore ([#3578])

[#3406]: https://github.com/tokio-rs/tokio/pull/3406
[#3490]: https://github.com/tokio-rs/tokio/pull/3490
[#3556]: https://github.com/tokio-rs/tokio/pull/3556
[#3578]: https://github.com/tokio-rs/tokio/pull/3578

# 0.6.3 (January 31, 2021)

### Added

- sync: add `ReusableBoxFuture` utility ([#3464])

### Changed

- sync: use `ReusableBoxFuture` for `PollSemaphore` ([#3463])
- deps: remove `async-stream` dependency ([#3463])
- deps: remove `tokio-stream` dependency ([#3487])

# 0.6.2 (January 21, 2021)

### Added

- sync: add pollable `Semaphore` ([#3444])

### Fixed

- time: fix panics on updating `DelayQueue` entries ([#3270])

# 0.6.1 (January 12, 2021)

### Added

- codec: `get_ref()`, `get_mut()`, `get_pin_mut()` and `into_inner()` for
  `Framed`, `FramedRead`, `FramedWrite` and `StreamReader` ([#3364]).
- codec: `write_buffer()` and `write_buffer_mut()` for `Framed` and
  `FramedWrite` ([#3387]).

# 0.6.0 (December 23, 2020)

### Changed
- depend on `tokio` 1.0.

### Added
- rt: add constructors to `TokioContext` (#3221).

# 0.5.1 (December 3, 2020)

### Added
- io: `poll_read_buf` util fn (#2972).
- io: `poll_write_buf` util fn with vectored write support (#3156).

# 0.5.0 (October 30, 2020)

### Changed
- io: update `bytes` to 0.6 (#3071).

# 0.4.0 (October 15, 2020)

### Added
- sync: `CancellationToken` for coordinating task cancellation (#2747).
- rt: `TokioContext` sets the Tokio runtime for the duration of a future (#2791)
- io: `StreamReader`/`ReaderStream` map between `AsyncRead` values and `Stream`
  of bytes (#2788).
- time: `DelayQueue` to manage many delays (#2897).

# 0.3.1 (March 18, 2020)

### Fixed

- Adjust minimum-supported Tokio version to v0.2.5 to account for an internal
  dependency on features in that version of Tokio. ([#2326])

# 0.3.0 (March 4, 2020)

### Changed

- **Breaking Change**: Change `Encoder` trait to take a generic `Item` parameter, which allows
  codec writers to pass references into `Framed` and `FramedWrite` types. ([#1746])

### Added

- Add futures-io/tokio::io compatibility layer. ([#2117])
- Add `Framed::with_capacity`. ([#2215])

### Fixed

- Use advance over split_to when data is not needed. ([#2198])

# 0.2.0 (November 26, 2019)

- Initial release

[#3487]: https://github.com/tokio-rs/tokio/pull/3487
[#3464]: https://github.com/tokio-rs/tokio/pull/3464
[#3463]: https://github.com/tokio-rs/tokio/pull/3463
[#3444]: https://github.com/tokio-rs/tokio/pull/3444
[#3387]: https://github.com/tokio-rs/tokio/pull/3387
[#3364]: https://github.com/tokio-rs/tokio/pull/3364
[#3270]: https://github.com/tokio-rs/tokio/pull/3270
[#2326]: https://github.com/tokio-rs/tokio/pull/2326
[#2215]: https://github.com/tokio-rs/tokio/pull/2215
[#2198]: https://github.com/tokio-rs/tokio/pull/2198
[#2117]: https://github.com/tokio-rs/tokio/pull/2117
[#1746]: https://github.com/tokio-rs/tokio/pull/1746


---

<!-- source: archive/library/rust/references/packages/tokio/CHANGELOG--000967.md -->

## Imported source: archive/library/rust/references/packages/tokio/CHANGELOG--000967.md

# 1.48.0 (October 14th, 2025)

The MSRV is increased to 1.71.

### Added

- fs: add `File::max_buf_size` ([#7594])
- io: export `Chain` of `AsyncReadExt::chain` ([#7599])
- net: add `SocketAddr::as_abstract_name` ([#7491])
- net: add `TcpStream::quickack` and `TcpStream::set_quickack` ([#7490])
- net: implement `AsRef<Self>` for `TcpStream` and `UnixStream` ([#7573])
- task: add `LocalKey::try_get` ([#7666])
- task: implement `Ord` for `task::Id` ([#7530])

### Changed

- deps: bump windows-sys to version 0.61 ([#7645])
- fs: preserve `max_buf_size` when cloning a `File` ([#7593])
- macros: suppress `clippy::unwrap_in_result` in `#[tokio::main]` ([#7651])
- net: remove `PollEvented` noise from Debug formats ([#7675])
- process: upgrade `Command::spawn_with` to use `FnOnce` ([#7511])
- sync: remove inner mutex in `SetOnce` ([#7554])
- sync: use `UnsafeCell::get_mut` in `Mutex::get_mut` and `RwLock::get_mut` ([#7569])
- time: reduce the generated code size of `Timeout<T>::poll` ([#7535])

### Fixed

- macros: fix hygiene issue in `join!` and `try_join!` ([#7638])
- net: fix copy/paste errors in udp peek methods ([#7604])
- process: fix error when runtime is shut down on nightly-2025-10-12 ([#7672])
- runtime: use release ordering in `wake_by_ref()` even if already woken ([#7622])
- sync: close the `broadcast::Sender` in `broadcast::Sender::new()` ([#7629])
- sync: fix implementation of unused `RwLock::try_*` methods ([#7587])

### Unstable

- tokio: use cargo features instead of `--cfg` flags for `taskdump` and `io_uring` ([#7655], [#7621])
- fs: support `io_uring` in `fs::write` ([#7567])
- fs: support `io_uring` with `File::open()` ([#7617])
- fs: support `io_uring` with `OpenOptions` ([#7321])
- macros: add `local` runtime flavor ([#7375], [#7597])

### Documented

- io: clarify the zero capacity case of `AsyncRead::poll_read` ([#7580])
- io: fix typos in the docs of `AsyncFd` readiness guards ([#7583])
- net: clarify socket gets closed on drop ([#7526])
- net: clarify the behavior of `UCred::pid()` on Cygwin ([#7611])
- net: clarify the supported platform of `set_reuseport()` and `reuseport()` ([#7628])
- net: qualify that `SO_REUSEADDR` is only set on Unix ([#7533])
- runtime: add guide for choosing between runtime types ([#7635])
- runtime: clarify the behavior of `Handle::block_on` ([#7665])
- runtime: clarify the edge case of `Builder::global_queue_interval()` ([#7605])
- sync: clarify bounded channel panic behavior ([#7641])
- sync: clarify the behavior of `tokio::sync::watch::Receiver` ([#7584])
- sync: document cancel safety on `SetOnce::wait` ([#7506])
- sync: fix the docs of `parking_lot` feature flag ([#7663])
- sync: improve the docs of `UnboundedSender::send` ([#7661])
- sync: improve the docs of `sync::watch` ([#7601])
- sync: reword allocation failure paragraph in broadcast docs ([#7595])
- task: clarify the behavior of several `spawn_local` methods ([#7669])
- task: clarify the task ID reuse guarantees ([#7577])
- task: improve the example of `poll_proceed` ([#7586])

[#7321]: https://github.com/tokio-rs/tokio/pull/7321
[#7375]: https://github.com/tokio-rs/tokio/pull/7375
[#7490]: https://github.com/tokio-rs/tokio/pull/7490
[#7491]: https://github.com/tokio-rs/tokio/pull/7491
[#7494]: https://github.com/tokio-rs/tokio/pull/7494
[#7506]: https://github.com/tokio-rs/tokio/pull/7506
[#7511]: https://github.com/tokio-rs/tokio/pull/7511
[#7526]: https://github.com/tokio-rs/tokio/pull/7526
[#7530]: https://github.com/tokio-rs/tokio/pull/7530
[#7533]: https://github.com/tokio-rs/tokio/pull/7533
[#7535]: https://github.com/tokio-rs/tokio/pull/7535
[#7554]: https://github.com/tokio-rs/tokio/pull/7554
[#7567]: https://github.com/tokio-rs/tokio/pull/7567
[#7569]: https://github.com/tokio-rs/tokio/pull/7569
[#7573]: https://github.com/tokio-rs/tokio/pull/7573
[#7577]: https://github.com/tokio-rs/tokio/pull/7577
[#7580]: https://github.com/tokio-rs/tokio/pull/7580
[#7583]: https://github.com/tokio-rs/tokio/pull/7583
[#7584]: https://github.com/tokio-rs/tokio/pull/7584
[#7586]: https://github.com/tokio-rs/tokio/pull/7586
[#7587]: https://github.com/tokio-rs/tokio/pull/7587
[#7593]: https://github.com/tokio-rs/tokio/pull/7593
[#7594]: https://github.com/tokio-rs/tokio/pull/7594
[#7595]: https://github.com/tokio-rs/tokio/pull/7595
[#7597]: https://github.com/tokio-rs/tokio/pull/7597
[#7599]: https://github.com/tokio-rs/tokio/pull/7599
[#7601]: https://github.com/tokio-rs/tokio/pull/7601
[#7604]: https://github.com/tokio-rs/tokio/pull/7604
[#7605]: https://github.com/tokio-rs/tokio/pull/7605
[#7611]: https://github.com/tokio-rs/tokio/pull/7611
[#7617]: https://github.com/tokio-rs/tokio/pull/7617
[#7621]: https://github.com/tokio-rs/tokio/pull/7621
[#7622]: https://github.com/tokio-rs/tokio/pull/7622
[#7628]: https://github.com/tokio-rs/tokio/pull/7628
[#7629]: https://github.com/tokio-rs/tokio/pull/7629
[#7635]: https://github.com/tokio-rs/tokio/pull/7635
[#7638]: https://github.com/tokio-rs/tokio/pull/7638
[#7641]: https://github.com/tokio-rs/tokio/pull/7641
[#7645]: https://github.com/tokio-rs/tokio/pull/7645
[#7651]: https://github.com/tokio-rs/tokio/pull/7651
[#7655]: https://github.com/tokio-rs/tokio/pull/7655
[#7661]: https://github.com/tokio-rs/tokio/pull/7661
[#7663]: https://github.com/tokio-rs/tokio/pull/7663
[#7665]: https://github.com/tokio-rs/tokio/pull/7665
[#7666]: https://github.com/tokio-rs/tokio/pull/7666
[#7669]: https://github.com/tokio-rs/tokio/pull/7669
[#7672]: https://github.com/tokio-rs/tokio/pull/7672
[#7675]: https://github.com/tokio-rs/tokio/pull/7675

# 1.47.1 (August 1st, 2025)

### Fixed

- process: fix panic from spurious pidfd wakeup ([#7494])
- sync: fix broken link of Python `asyncio.Event` in `SetOnce` docs ([#7485])

[#7485]: https://github.com/tokio-rs/tokio/pull/7485

# 1.47.0 (July 25th, 2025)

This release adds `poll_proceed` and `cooperative` to the `coop` module for
cooperative scheduling, adds `SetOnce` to the `sync` module which provides
similar functionality to [`std::sync::OnceLock`], and adds a new method
`sync::Notify::notified_owned()` which returns an `OwnedNotified` without
a lifetime parameter.

## Added

- coop: add `cooperative` and `poll_proceed` ([#7405])
- sync: add `SetOnce` ([#7418])
- sync: add `sync::Notify::notified_owned()` ([#7465])

## Changed

- deps: upgrade windows-sys 0.52 → 0.59 ([#7117])
- deps: update to socket2 v0.6 ([#7443])
- sync: improve `AtomicWaker::wake` performance ([#7450])

## Documented

- metrics: fix listed feature requirements for some metrics ([#7449])
- runtime: improve safety comments of `Readiness<'_>` ([#7415])

[#7117]: https://github.com/tokio-rs/tokio/pull/7117
[#7405]: https://github.com/tokio-rs/tokio/pull/7405
[#7415]: https://github.com/tokio-rs/tokio/pull/7415
[#7418]: https://github.com/tokio-rs/tokio/pull/7418
[#7443]: https://github.com/tokio-rs/tokio/pull/7443
[#7449]: https://github.com/tokio-rs/tokio/pull/7449
[#7450]: https://github.com/tokio-rs/tokio/pull/7450
[#7465]: https://github.com/tokio-rs/tokio/pull/7465

# 1.46.1 (July 4th, 2025)

This release fixes incorrect spawn locations in runtime task hooks for tasks
spawned using `tokio::spawn` rather than `Runtime::spawn`. This issue only
affected the spawn location in `TaskMeta::spawned_at`, and did not affect task
locations in Tracing events.

## Unstable

- runtime: add `TaskMeta::spawned_at` tracking where a task was spawned
  ([#7440])

[#7440]: https://github.com/tokio-rs/tokio/pull/7440

# 1.46.0 (July 2nd, 2025)

## Fixed

- net: fixed `TcpStream::shutdown` incorrectly returning an error on macOS ([#7290])

## Added

- sync: `mpsc::OwnedPermit::{same_channel, same_channel_as_sender}` methods ([#7389])
- macros: `biased` option for `join!` and `try_join!`, similar to `select!` ([#7307])
- net: support for cygwin ([#7393])
- net: support `pipe::OpenOptions::read_write` on Android ([#7426])
- net: add `Clone` implementation for `net::unix::SocketAddr` ([#7422])

## Changed

- runtime: eliminate unnecessary lfence while operating on `queue::Local<T>` ([#7340])
- task: disallow blocking in `LocalSet::{poll,drop}` ([#7372])

## Unstable

- runtime: add `TaskMeta::spawn_location` tracking where a task was spawned ([#7417])
- runtime: removed borrow from `LocalOptions` parameter to `runtime::Builder::build_local` ([#7346])

## Documented

- io: clarify behavior of seeking when `start_seek` is not used ([#7366])
- io: document cancellation safety of `AsyncWriteExt::flush` ([#7364])
- net: fix docs for `recv_buffer_size` method ([#7336])
- net: fix broken link of `RawFd` in `TcpSocket` docs ([#7416])
- net: update `AsRawFd` doc link to current Rust stdlib location ([#7429])
- readme: fix double period in reactor description ([#7363])
- runtime: add doc note that `on_*_task_poll` is unstable ([#7311])
- sync: update broadcast docs on allocation failure ([#7352])
- time: add a missing panic scenario of `time::advance` ([#7394])

[#7290]: https://github.com/tokio-rs/tokio/pull/7290
[#7307]: https://github.com/tokio-rs/tokio/pull/7307
[#7311]: https://github.com/tokio-rs/tokio/pull/7311
[#7336]: https://github.com/tokio-rs/tokio/pull/7336
[#7340]: https://github.com/tokio-rs/tokio/pull/7340
[#7346]: https://github.com/tokio-rs/tokio/pull/7346
[#7352]: https://github.com/tokio-rs/tokio/pull/7352
[#7363]: https://github.com/tokio-rs/tokio/pull/7363
[#7364]: https://github.com/tokio-rs/tokio/pull/7364
[#7366]: https://github.com/tokio-rs/tokio/pull/7366
[#7372]: https://github.com/tokio-rs/tokio/pull/7372
[#7389]: https://github.com/tokio-rs/tokio/pull/7389
[#7393]: https://github.com/tokio-rs/tokio/pull/7393
[#7394]: https://github.com/tokio-rs/tokio/pull/7394
[#7416]: https://github.com/tokio-rs/tokio/pull/7416
[#7422]: https://github.com/tokio-rs/tokio/pull/7422
[#7426]: https://github.com/tokio-rs/tokio/pull/7426
[#7429]: https://github.com/tokio-rs/tokio/pull/7429
[#7417]: https://github.com/tokio-rs/tokio/pull/7417

# 1.45.1 (May 24th, 2025)

This fixes a regression on the wasm32-unknown-unknown target, where code that
previously did not panic due to calls to `Instant::now()` started failing. This
is due to the stabilization of the first time-based metric.

### Fixed

- Disable time-based metrics on wasm32-unknown-unknown ([#7322])

[#7322]: https://github.com/tokio-rs/tokio/pull/7322

# 1.45.0 (May 5th, 2025)

### Added

- metrics: stabilize `worker_total_busy_duration`, `worker_park_count`, and
  `worker_unpark_count` ([#6899], [#7276])
- process: add `Command::spawn_with` ([#7249])

### Changed

- io: do not require `Unpin` for some trait impls ([#7204])
- rt: mark `runtime::Handle` as unwind safe ([#7230])
- time: revert internal sharding implementation ([#7226])

### Unstable

- rt: remove alt multi-threaded runtime ([#7275])

[#6899]: https://github.com/tokio-rs/tokio/pull/6899
[#7276]: https://github.com/tokio-rs/tokio/pull/7276
[#7249]: https://github.com/tokio-rs/tokio/pull/7249
[#7204]: https://github.com/tokio-rs/tokio/pull/7204
[#7230]: https://github.com/tokio-rs/tokio/pull/7230
[#7226]: https://github.com/tokio-rs/tokio/pull/7226
[#7275]: https://github.com/tokio-rs/tokio/pull/7275


# 1.44.2 (April 5th, 2025)

This release fixes a soundness issue in the broadcast channel. The channel
accepts values that are `Send` but `!Sync`. Previously, the channel called
`clone()` on these values without synchronizing. This release fixes the channel
by synchronizing calls to `.clone()` (Thanks Austin Bonander for finding and
reporting the issue).

### Fixed

- sync: synchronize `clone()` call in broadcast channel ([#7232])

[#7232]: https://github.com/tokio-rs/tokio/pull/7232

# 1.44.1 (March 13th, 2025)

### Fixed

- rt: skip defer queue in `block_in_place` context ([#7216])

[#7216]: https://github.com/tokio-rs/tokio/pull/7216

# 1.44.0 (March 7th, 2025)

This release changes the `from_std` method on sockets to panic if a blocking
socket is provided. We determined this change is not a breaking change as Tokio is not
intended to operate using blocking sockets. Doing so results in runtime hangs and
should be considered a bug. Accidentally passing a blocking socket to Tokio is one
of the most common user mistakes. If this change causes an issue for you, please
comment on [#7172].

### Added

 - coop: add `task::coop` module ([#7116])
 - process: add `Command::get_kill_on_drop()` ([#7086])
 - sync: add `broadcast::Sender::closed` ([#6685], [#7090])
 - sync: add `broadcast::WeakSender` ([#7100])
 - sync: add `oneshot::Receiver::is_empty()` ([#7153])
 - sync: add `oneshot::Receiver::is_terminated()` ([#7152])

### Fixed

 - fs: empty reads on `File` should not start a background read ([#7139])
 - process: calling `start_kill` on exited child should not fail ([#7160])
 - signal: fix `CTRL_CLOSE`, `CTRL_LOGOFF`, `CTRL_SHUTDOWN` on windows ([#7122])
 - sync: properly handle panic during mpsc drop ([#7094])

### Changes

 - runtime: clean up magic number in registration set ([#7112])
 - coop: make coop yield using waker defer strategy ([#7185])
 - macros: make `select!` budget-aware ([#7164])
 - net: panic when passing a blocking socket to `from_std` ([#7166])
 - io: clean up buffer casts ([#7142])

### Changes to unstable APIs

 - rt: add before and after task poll callbacks ([#7120])
 - tracing: make the task tracing API unstable public ([#6972])

### Documented

 - docs: fix nesting of sections in top-level docs ([#7159])
 - fs: rename symlink and hardlink parameter names ([#7143])
 - io: swap reader/writer in simplex doc test ([#7176])
 - macros: docs about `select!` alternatives ([#7110])
 - net: rename the argument for `send_to` ([#7146])
 - process: add example for reading `Child` stdout ([#7141])
 - process: clarify `Child::kill` behavior ([#7162])
 - process: fix grammar of the `ChildStdin` struct doc comment ([#7192])
 - runtime: consistently use `worker_threads` instead of `core_threads` ([#7186])

[#6685]: https://github.com/tokio-rs/tokio/pull/6685
[#6972]: https://github.com/tokio-rs/tokio/pull/6972
[#7086]: https://github.com/tokio-rs/tokio/pull/7086
[#7090]: https://github.com/tokio-rs/tokio/pull/7090
[#7094]: https://github.com/tokio-rs/tokio/pull/7094
[#7100]: https://github.com/tokio-rs/tokio/pull/7100
[#7110]: https://github.com/tokio-rs/tokio/pull/7110
[#7112]: https://github.com/tokio-rs/tokio/pull/7112
[#7116]: https://github.com/tokio-rs/tokio/pull/7116
[#7120]: https://github.com/tokio-rs/tokio/pull/7120
[#7122]: https://github.com/tokio-rs/tokio/pull/7122
[#7139]: https://github.com/tokio-rs/tokio/pull/7139
[#7141]: https://github.com/tokio-rs/tokio/pull/7141
[#7142]: https://github.com/tokio-rs/tokio/pull/7142
[#7143]: https://github.com/tokio-rs/tokio/pull/7143
[#7146]: https://github.com/tokio-rs/tokio/pull/7146
[#7152]: https://github.com/tokio-rs/tokio/pull/7152
[#7153]: https://github.com/tokio-rs/tokio/pull/7153
[#7159]: https://github.com/tokio-rs/tokio/pull/7159
[#7160]: https://github.com/tokio-rs/tokio/pull/7160
[#7162]: https://github.com/tokio-rs/tokio/pull/7162
[#7164]: https://github.com/tokio-rs/tokio/pull/7164
[#7166]: https://github.com/tokio-rs/tokio/pull/7166
[#7172]: https://github.com/tokio-rs/tokio/pull/7172
[#7176]: https://github.com/tokio-rs/tokio/pull/7176
[#7185]: https://github.com/tokio-rs/tokio/pull/7185
[#7186]: https://github.com/tokio-rs/tokio/pull/7186
[#7192]: https://github.com/tokio-rs/tokio/pull/7192

# 1.43.2 (August 1st, 2025)

### Fixed

- process: fix panic from spurious pidfd wakeup ([#7494])

[#7494]: https://github.com/tokio-rs/tokio/pull/7494

# 1.43.1 (April 5th, 2025)

This release fixes a soundness issue in the broadcast channel. The channel
accepts values that are `Send` but `!Sync`. Previously, the channel called
`clone()` on these values without synchronizing. This release fixes the channel
by synchronizing calls to `.clone()` (Thanks Austin Bonander for finding and
reporting the issue).

### Fixed

- sync: synchronize `clone()` call in broadcast channel ([#7232])

[#7232]: https://github.com/tokio-rs/tokio/pull/7232

# 1.43.0 (Jan 8th, 2025)

### Added

- net: add `UdpSocket::peek` methods ([#7068])
- net: add support for Haiku OS ([#7042])
- process: add `Command::into_std()` ([#7014])
- signal: add `SignalKind::info` on illumos ([#6995])
- signal: add support for realtime signals on illumos ([#7029])

### Fixed

- io: don't call `set_len` before initializing vector in `Blocking` ([#7054])
- macros: suppress `clippy::needless_return` in `#[tokio::main]` ([#6874])
- runtime: fix thread parking on WebAssembly ([#7041])

### Changes

- chore: use unsync loads for `unsync_load` ([#7073])
- io: use `Buf::put_bytes` in `Repeat` read impl ([#7055])
- task: drop the join waker of a task eagerly ([#6986])

### Changes to unstable APIs

- metrics: improve flexibility of H2Histogram Configuration ([#6963])
- taskdump: add accessor methods for backtrace ([#6975])

### Documented

- io: clarify `ReadBuf::uninit` allows initialized buffers as well ([#7053])
- net: fix ambiguity in `TcpStream::try_write_vectored` docs ([#7067])
- runtime: fix `LocalRuntime` doc links ([#7074])
- sync: extend documentation for `watch::Receiver::wait_for` ([#7038])
- sync: fix typos in `OnceCell` docs ([#7047])

[#6874]: https://github.com/tokio-rs/tokio/pull/6874
[#6963]: https://github.com/tokio-rs/tokio/pull/6963
[#6975]: https://github.com/tokio-rs/tokio/pull/6975
[#6986]: https://github.com/tokio-rs/tokio/pull/6986
[#6995]: https://github.com/tokio-rs/tokio/pull/6995
[#7014]: https://github.com/tokio-rs/tokio/pull/7014
[#7029]: https://github.com/tokio-rs/tokio/pull/7029
[#7038]: https://github.com/tokio-rs/tokio/pull/7038
[#7041]: https://github.com/tokio-rs/tokio/pull/7041
[#7042]: https://github.com/tokio-rs/tokio/pull/7042
[#7047]: https://github.com/tokio-rs/tokio/pull/7047
[#7053]: https://github.com/tokio-rs/tokio/pull/7053
[#7054]: https://github.com/tokio-rs/tokio/pull/7054
[#7055]: https://github.com/tokio-rs/tokio/pull/7055
[#7067]: https://github.com/tokio-rs/tokio/pull/7067
[#7068]: https://github.com/tokio-rs/tokio/pull/7068
[#7073]: https://github.com/tokio-rs/tokio/pull/7073
[#7074]: https://github.com/tokio-rs/tokio/pull/7074

# 1.42.1 (April 8th, 2025)

This release fixes a soundness issue in the broadcast channel. The channel
accepts values that are `Send` but `!Sync`. Previously, the channel called
`clone()` on these values without synchronizing. This release fixes the channel
by synchronizing calls to `.clone()` (Thanks Austin Bonander for finding and
reporting the issue).

### Fixed

- sync: synchronize `clone()` call in broadcast channel ([#7232])

[#7232]: https://github.com/tokio-rs/tokio/pull/7232

# 1.42.0 (Dec 3rd, 2024)

### Added

- io: add `AsyncFd::{try_io, try_io_mut}` ([#6967])

### Fixed

- io: avoid `ptr->ref->ptr` roundtrip in RegistrationSet ([#6929])
- runtime: do not defer `yield_now` inside `block_in_place` ([#6999])

### Changes

- io: simplify io readiness logic ([#6966])

### Documented

- net: fix docs for `tokio::net::unix::{pid_t, gid_t, uid_t}` ([#6791])
- time: fix a typo in `Instant` docs ([#6982])

[#6791]: https://github.com/tokio-rs/tokio/pull/6791
[#6929]: https://github.com/tokio-rs/tokio/pull/6929
[#6966]: https://github.com/tokio-rs/tokio/pull/6966
[#6967]: https://github.com/tokio-rs/tokio/pull/6967
[#6982]: https://github.com/tokio-rs/tokio/pull/6982
[#6999]: https://github.com/tokio-rs/tokio/pull/6999

# 1.41.1 (Nov 7th, 2024)

### Fixed

- metrics: fix bug with wrong number of buckets for the histogram ([#6957])
- net: display `net` requirement for `net::UdpSocket` in docs ([#6938])
- net: fix typo in `TcpStream` internal comment ([#6944])

[#6957]: https://github.com/tokio-rs/tokio/pull/6957
[#6938]: https://github.com/tokio-rs/tokio/pull/6938
[#6944]: https://github.com/tokio-rs/tokio/pull/6944

# 1.41.0 (Oct 22nd, 2024)

### Added

- metrics: stabilize `global_queue_depth` ([#6854], [#6918])
- net: add conversions for unix `SocketAddr` ([#6868])
- sync: add `watch::Sender::sender_count` ([#6836])
- sync: add `mpsc::Receiver::blocking_recv_many` ([#6867])
- task: stabilize `Id` apis ([#6793], [#6891])

### Added (unstable)

- metrics: add H2 Histogram option to improve histogram granularity ([#6897])
- metrics: rename some histogram apis ([#6924])
- runtime: add `LocalRuntime` ([#6808])

### Changed

- runtime: box futures larger than 16k on release mode ([#6826])
- sync: add `#[must_use]` to `Notified` ([#6828])
- sync: make `watch` cooperative ([#6846])
- sync: make `broadcast::Receiver` cooperative ([#6870])
- task: add task size to tracing instrumentation ([#6881])
- wasm: enable `cfg_fs` for `wasi` target ([#6822])

### Fixed

- net: fix regression of abstract socket path in unix socket ([#6838])

### Documented

- io: recommend `OwnedFd` with `AsyncFd` ([#6821])
- io: document cancel safety of `AsyncFd` methods ([#6890])
- macros: render more comprehensible documentation for `join` and `try_join` ([#6814], [#6841])
- net: fix swapped examples for `TcpSocket::set_nodelay` and `TcpSocket::nodelay` ([#6840])
- sync: document runtime compatibility ([#6833])

[#6793]: https://github.com/tokio-rs/tokio/pull/6793
[#6808]: https://github.com/tokio-rs/tokio/pull/6808
[#6810]: https://github.com/tokio-rs/tokio/pull/6810
[#6814]: https://github.com/tokio-rs/tokio/pull/6814
[#6821]: https://github.com/tokio-rs/tokio/pull/6821
[#6822]: https://github.com/tokio-rs/tokio/pull/6822
[#6826]: https://github.com/tokio-rs/tokio/pull/6826
[#6828]: https://github.com/tokio-rs/tokio/pull/6828
[#6833]: https://github.com/tokio-rs/tokio/pull/6833
[#6836]: https://github.com/tokio-rs/tokio/pull/6836
[#6838]: https://github.com/tokio-rs/tokio/pull/6838
[#6840]: https://github.com/tokio-rs/tokio/pull/6840
[#6841]: https://github.com/tokio-rs/tokio/pull/6841
[#6846]: https://github.com/tokio-rs/tokio/pull/6846
[#6854]: https://github.com/tokio-rs/tokio/pull/6854
[#6867]: https://github.com/tokio-rs/tokio/pull/6867
[#6868]: https://github.com/tokio-rs/tokio/pull/6868
[#6870]: https://github.com/tokio-rs/tokio/pull/6870
[#6881]: https://github.com/tokio-rs/tokio/pull/6881
[#6890]: https://github.com/tokio-rs/tokio/pull/6890
[#6891]: https://github.com/tokio-rs/tokio/pull/6891
[#6897]: https://github.com/tokio-rs/tokio/pull/6897
[#6918]: https://github.com/tokio-rs/tokio/pull/6918
[#6924]: https://github.com/tokio-rs/tokio/pull/6924

# 1.40.0 (August 30th, 2024)

### Added

- io: add `util::SimplexStream` ([#6589])
- process: stabilize `Command::process_group` ([#6731])
- sync: add `{TrySendError,SendTimeoutError}::into_inner` ([#6755])
- task: add `JoinSet::join_all` ([#6784])

### Added (unstable)

- runtime: add `Builder::{on_task_spawn, on_task_terminate}` ([#6742])

### Changed

- io: use vectored io for `write_all_buf` when possible ([#6724])
- runtime: prevent niche-optimization to avoid triggering miri ([#6744])
- sync: mark mpsc types as `UnwindSafe` ([#6783])
- sync,time: make `Sleep` and `BatchSemaphore` instrumentation explicit roots ([#6727])
- task: use `NonZeroU64` for `task::Id` ([#6733])
- task: include panic message when printing `JoinError` ([#6753])
- task: add `#[must_use]` to `JoinHandle::abort_handle` ([#6762])
- time: eliminate timer wheel allocations ([#6779])

### Documented

- docs: clarify that `[build]` section doesn't go in Cargo.toml ([#6728])
- io: clarify zero remaining capacity case ([#6790])
- macros: improve documentation for `select!` ([#6774])
- sync: document mpsc channel allocation behavior ([#6773])

[#6589]: https://github.com/tokio-rs/tokio/pull/6589
[#6724]: https://github.com/tokio-rs/tokio/pull/6724
[#6727]: https://github.com/tokio-rs/tokio/pull/6727
[#6728]: https://github.com/tokio-rs/tokio/pull/6728
[#6731]: https://github.com/tokio-rs/tokio/pull/6731
[#6733]: https://github.com/tokio-rs/tokio/pull/6733
[#6742]: https://github.com/tokio-rs/tokio/pull/6742
[#6744]: https://github.com/tokio-rs/tokio/pull/6744
[#6753]: https://github.com/tokio-rs/tokio/pull/6753
[#6755]: https://github.com/tokio-rs/tokio/pull/6755
[#6762]: https://github.com/tokio-rs/tokio/pull/6762
[#6773]: https://github.com/tokio-rs/tokio/pull/6773
[#6774]: https://github.com/tokio-rs/tokio/pull/6774
[#6779]: https://github.com/tokio-rs/tokio/pull/6779
[#6783]: https://github.com/tokio-rs/tokio/pull/6783
[#6784]: https://github.com/tokio-rs/tokio/pull/6784
[#6790]: https://github.com/tokio-rs/tokio/pull/6790

# 1.39.3 (August 17th, 2024)

This release fixes a regression where the unix socket api stopped accepting
the abstract socket namespace. ([#6772])

[#6772]: https://github.com/tokio-rs/tokio/pull/6772

# 1.39.2 (July 27th, 2024)

This release fixes a regression where the `select!` macro stopped accepting
expressions that make use of temporary lifetime extension. ([#6722])

[#6722]: https://github.com/tokio-rs/tokio/pull/6722

# 1.39.1 (July 23rd, 2024)

This release reverts "time: avoid traversing entries in the time wheel twice"
because it contains a bug. ([#6715])

[#6715]: https://github.com/tokio-rs/tokio/pull/6715

# 1.39.0 (July 23rd, 2024)

Yanked. Please use 1.39.1 instead.

- This release bumps the MSRV to 1.70. ([#6645])
- This release upgrades to mio v1. ([#6635])
- This release upgrades to windows-sys v0.52 ([#6154])

### Added

- io: implement `AsyncSeek` for `Empty` ([#6663])
- metrics: stabilize `num_alive_tasks` ([#6619], [#6667])
- process: add `Command::as_std_mut` ([#6608])
- sync: add `watch::Sender::same_channel` ([#6637])
- sync: add `{Receiver,UnboundedReceiver}::{sender_strong_count,sender_weak_count}` ([#6661])
- sync: implement `Default` for `watch::Sender` ([#6626])
- task: implement `Clone` for `AbortHandle` ([#6621])
- task: stabilize `consume_budget` ([#6622])

### Changed

- io: improve panic message of `ReadBuf::put_slice()` ([#6629])
- io: read during write in `copy_bidirectional` and `copy` ([#6532])
- runtime: replace `num_cpus` with `available_parallelism` ([#6709])
- task: avoid stack overflow when passing large future to `block_on` ([#6692])
- time: avoid traversing entries in the time wheel twice ([#6584])
- time: support `IntoFuture` with `timeout` ([#6666])
- macros: support `IntoFuture` with `join!` and `select!` ([#6710])

### Fixed

- docs: fix docsrs builds with the fs feature enabled ([#6585])
- io: only use short-read optimization on known-to-be-compatible platforms ([#6668])
- time: fix overflow panic when using large durations with `Interval` ([#6612])

### Added (unstable)

- macros: allow `unhandled_panic` behavior for `#[tokio::main]` and `#[tokio::test]` ([#6593])
- metrics: add `spawned_tasks_count` ([#6114])
- metrics: add `worker_park_unpark_count` ([#6696])
- metrics: add worker thread id ([#6695])

### Documented

- io: update `tokio::io::stdout` documentation ([#6674])
- macros: typo fix in `join.rs` and `try_join.rs` ([#6641])
- runtime: fix typo in `unhandled_panic` ([#6660])
- task: document behavior of `JoinSet::try_join_next` when all tasks are running ([#6671])

[#6114]: https://github.com/tokio-rs/tokio/pull/6114
[#6154]: https://github.com/tokio-rs/tokio/pull/6154
[#6532]: https://github.com/tokio-rs/tokio/pull/6532
[#6584]: https://github.com/tokio-rs/tokio/pull/6584
[#6585]: https://github.com/tokio-rs/tokio/pull/6585
[#6593]: https://github.com/tokio-rs/tokio/pull/6593
[#6608]: https://github.com/tokio-rs/tokio/pull/6608
[#6612]: https://github.com/tokio-rs/tokio/pull/6612
[#6619]: https://github.com/tokio-rs/tokio/pull/6619
[#6621]: https://github.com/tokio-rs/tokio/pull/6621
[#6622]: https://github.com/tokio-rs/tokio/pull/6622
[#6626]: https://github.com/tokio-rs/tokio/pull/6626
[#6629]: https://github.com/tokio-rs/tokio/pull/6629
[#6635]: https://github.com/tokio-rs/tokio/pull/6635
[#6637]: https://github.com/tokio-rs/tokio/pull/6637
[#6641]: https://github.com/tokio-rs/tokio/pull/6641
[#6645]: https://github.com/tokio-rs/tokio/pull/6645
[#6660]: https://github.com/tokio-rs/tokio/pull/6660
[#6661]: https://github.com/tokio-rs/tokio/pull/6661
[#6663]: https://github.com/tokio-rs/tokio/pull/6663
[#6666]: https://github.com/tokio-rs/tokio/pull/6666
[#6667]: https://github.com/tokio-rs/tokio/pull/6667
[#6668]: https://github.com/tokio-rs/tokio/pull/6668
[#6671]: https://github.com/tokio-rs/tokio/pull/6671
[#6674]: https://github.com/tokio-rs/tokio/pull/6674
[#6692]: https://github.com/tokio-rs/tokio/pull/6692
[#6695]: https://github.com/tokio-rs/tokio/pull/6695
[#6696]: https://github.com/tokio-rs/tokio/pull/6696
[#6709]: https://github.com/tokio-rs/tokio/pull/6709
[#6710]: https://github.com/tokio-rs/tokio/pull/6710

# 1.38.2 (April 2nd, 2025)

This release fixes a soundness issue in the broadcast channel. The channel
accepts values that are `Send` but `!Sync`. Previously, the channel called
`clone()` on these values without synchronizing. This release fixes the channel
by synchronizing calls to `.clone()` (Thanks Austin Bonander for finding and
reporting the issue).

### Fixed

- sync: synchronize `clone()` call in broadcast channel ([#7232])

[#7232]: https://github.com/tokio-rs/tokio/pull/7232

# 1.38.1 (July 16th, 2024)

This release fixes the bug identified as ([#6682]), which caused timers not
to fire when they should.

### Fixed

- time: update `wake_up` while holding all the locks of sharded time wheels ([#6683])

[#6682]: https://github.com/tokio-rs/tokio/pull/6682
[#6683]: https://github.com/tokio-rs/tokio/pull/6683

# 1.38.0 (May 30th, 2024)

This release marks the beginning of stabilization for runtime metrics. It
stabilizes `RuntimeMetrics::worker_count`. Future releases will continue to
stabilize more metrics.

### Added

- fs: add `File::create_new` ([#6573])
- io: add `copy_bidirectional_with_sizes` ([#6500])
- io: implement `AsyncBufRead` for `Join` ([#6449])
- net: add Apple visionOS support ([#6465])
- net: implement `Clone` for `NamedPipeInfo` ([#6586])
- net: support QNX OS ([#6421])
- sync: add `Notify::notify_last` ([#6520])
- sync: add `mpsc::Receiver::{capacity,max_capacity}` ([#6511])
- sync: add `split` method to the semaphore permit ([#6472], [#6478])
- task: add `tokio::task::join_set::Builder::spawn_blocking` ([#6578])
- wasm: support rt-multi-thread with wasm32-wasi-preview1-threads ([#6510])

### Changed

- macros: make `#[tokio::test]` append `#[test]` at the end of the attribute list ([#6497])
- metrics: fix `blocking_threads` count ([#6551])
- metrics: stabilize `RuntimeMetrics::worker_count` ([#6556])
- runtime: move task out of the `lifo_slot` in `block_in_place` ([#6596])
- runtime: panic if `global_queue_interval` is zero ([#6445])
- sync: always drop message in destructor for oneshot receiver ([#6558])
- sync: instrument `Semaphore` for task dumps ([#6499])
- sync: use FIFO ordering when waking batches of wakers ([#6521])
- task: make `LocalKey::get` work with Clone types ([#6433])
- tests: update nix and mio-aio dev-dependencies ([#6552])
- time: clean up implementation ([#6517])
- time: lazily init timers on first poll ([#6512])
- time: remove the `true_when` field in `TimerShared` ([#6563])
- time: use sharding for timer implementation ([#6534])

### Fixed

- taskdump: allow building taskdump docs on non-unix machines ([#6564])
- time: check for overflow in `Interval::poll_tick` ([#6487])
- sync: fix incorrect `is_empty` on mpsc block boundaries ([#6603])

### Documented

- fs: rewrite file system docs ([#6467])
- io: fix `stdin` documentation ([#6581])
- io: fix obsolete reference in `ReadHalf::unsplit()` documentation ([#6498])
- macros: render more comprehensible documentation for `select!` ([#6468])
- net: add missing types to module docs ([#6482])
- net: fix misleading `NamedPipeServer` example ([#6590])
- sync: add examples for `SemaphorePermit`, `OwnedSemaphorePermit` ([#6477])
- sync: document that `Barrier::wait` is not cancel safe ([#6494])
- sync: explain relation between `watch::Sender::{subscribe,closed}` ([#6490])
- task: clarify that you can't abort `spawn_blocking` tasks ([#6571])
- task: fix a typo in doc of `LocalSet::run_until` ([#6599])
- time: fix test-util requirement for pause and resume in docs ([#6503])

[#6421]: https://github.com/tokio-rs/tokio/pull/6421
[#6433]: https://github.com/tokio-rs/tokio/pull/6433
[#6445]: https://github.com/tokio-rs/tokio/pull/6445
[#6449]: https://github.com/tokio-rs/tokio/pull/6449
[#6465]: https://github.com/tokio-rs/tokio/pull/6465
[#6467]: https://github.com/tokio-rs/tokio/pull/6467
[#6468]: https://github.com/tokio-rs/tokio/pull/6468
[#6472]: https://github.com/tokio-rs/tokio/pull/6472
[#6477]: https://github.com/tokio-rs/tokio/pull/6477
[#6478]: https://github.com/tokio-rs/tokio/pull/6478
[#6482]: https://github.com/tokio-rs/tokio/pull/6482
[#6487]: https://github.com/tokio-rs/tokio/pull/6487
[#6490]: https://github.com/tokio-rs/tokio/pull/6490
[#6494]: https://github.com/tokio-rs/tokio/pull/6494
[#6497]: https://github.com/tokio-rs/tokio/pull/6497
[#6498]: https://github.com/tokio-rs/tokio/pull/6498
[#6499]: https://github.com/tokio-rs/tokio/pull/6499
[#6500]: https://github.com/tokio-rs/tokio/pull/6500
[#6503]: https://github.com/tokio-rs/tokio/pull/6503
[#6510]: https://github.com/tokio-rs/tokio/pull/6510
[#6511]: https://github.com/tokio-rs/tokio/pull/6511
[#6512]: https://github.com/tokio-rs/tokio/pull/6512
[#6517]: https://github.com/tokio-rs/tokio/pull/6517
[#6520]: https://github.com/tokio-rs/tokio/pull/6520
[#6521]: https://github.com/tokio-rs/tokio/pull/6521
[#6534]: https://github.com/tokio-rs/tokio/pull/6534
[#6551]: https://github.com/tokio-rs/tokio/pull/6551
[#6552]: https://github.com/tokio-rs/tokio/pull/6552
[#6556]: https://github.com/tokio-rs/tokio/pull/6556
[#6558]: https://github.com/tokio-rs/tokio/pull/6558
[#6563]: https://github.com/tokio-rs/tokio/pull/6563
[#6564]: https://github.com/tokio-rs/tokio/pull/6564
[#6571]: https://github.com/tokio-rs/tokio/pull/6571
[#6573]: https://github.com/tokio-rs/tokio/pull/6573
[#6578]: https://github.com/tokio-rs/tokio/pull/6578
[#6581]: https://github.com/tokio-rs/tokio/pull/6581
[#6586]: https://github.com/tokio-rs/tokio/pull/6586
[#6590]: https://github.com/tokio-rs/tokio/pull/6590
[#6596]: https://github.com/tokio-rs/tokio/pull/6596
[#6599]: https://github.com/tokio-rs/tokio/pull/6599
[#6603]: https://github.com/tokio-rs/tokio/pull/6603

# 1.37.0 (March 28th, 2024)

### Added

- fs: add `set_max_buf_size` to `tokio::fs::File` ([#6411])
- io: add `try_new` and `try_with_interest` to `AsyncFd` ([#6345])
- sync: add `forget_permits` method to semaphore ([#6331])
- sync: add `is_closed`, `is_empty`, and `len` to mpsc receivers ([#6348])
- sync: add a `rwlock()` method to owned `RwLock` guards ([#6418])
- sync: expose strong and weak counts of mpsc sender handles ([#6405])
- sync: implement `Clone` for `watch::Sender` ([#6388])
- task: add `TaskLocalFuture::take_value` ([#6340])
- task: implement `FromIterator` for `JoinSet` ([#6300])

### Changed

- io: make `io::split` use a mutex instead of a spinlock ([#6403])

### Fixed

- docs: fix docsrs build without net feature ([#6360])
- macros: allow select with only else branch ([#6339])
- runtime: fix leaking registration entries when os registration fails ([#6329])

### Documented

- io: document cancel safety of `AsyncBufReadExt::fill_buf` ([#6431])
- io: document cancel safety of `AsyncReadExt`'s primitive read functions ([#6337])
- runtime: add doc link from `Runtime` to `#[tokio::main]` ([#6366])
- runtime: make the `enter` example deterministic ([#6351])
- sync: add Semaphore example for limiting the number of outgoing requests ([#6419])
- sync: fix missing period in broadcast docs ([#6377])
- sync: mark `mpsc::Sender::downgrade` with `#[must_use]` ([#6326])
- sync: reorder `const_new` before `new_with` ([#6392])
- sync: update watch channel docs ([#6395])
- task: fix documentation links ([#6336])

### Changed (unstable)

- runtime: include task `Id` in taskdumps ([#6328])
- runtime: panic if `unhandled_panic` is enabled when not supported ([#6410])

[#6300]: https://github.com/tokio-rs/tokio/pull/6300
[#6326]: https://github.com/tokio-rs/tokio/pull/6326
[#6328]: https://github.com/tokio-rs/tokio/pull/6328
[#6329]: https://github.com/tokio-rs/tokio/pull/6329
[#6331]: https://github.com/tokio-rs/tokio/pull/6331
[#6336]: https://github.com/tokio-rs/tokio/pull/6336
[#6337]: https://github.com/tokio-rs/tokio/pull/6337
[#6339]: https://github.com/tokio-rs/tokio/pull/6339
[#6340]: https://github.com/tokio-rs/tokio/pull/6340
[#6345]: https://github.com/tokio-rs/tokio/pull/6345
[#6348]: https://github.com/tokio-rs/tokio/pull/6348
[#6351]: https://github.com/tokio-rs/tokio/pull/6351
[#6360]: https://github.com/tokio-rs/tokio/pull/6360
[#6366]: https://github.com/tokio-rs/tokio/pull/6366
[#6377]: https://github.com/tokio-rs/tokio/pull/6377
[#6388]: https://github.com/tokio-rs/tokio/pull/6388
[#6392]: https://github.com/tokio-rs/tokio/pull/6392
[#6395]: https://github.com/tokio-rs/tokio/pull/6395
[#6403]: https://github.com/tokio-rs/tokio/pull/6403
[#6405]: https://github.com/tokio-rs/tokio/pull/6405
[#6410]: https://github.com/tokio-rs/tokio/pull/6410
[#6411]: https://github.com/tokio-rs/tokio/pull/6411
[#6418]: https://github.com/tokio-rs/tokio/pull/6418
[#6419]: https://github.com/tokio-rs/tokio/pull/6419
[#6431]: https://github.com/tokio-rs/tokio/pull/6431

# 1.36.0 (February 2nd, 2024)

### Added

- io: add `tokio::io::Join` ([#6220])
- io: implement `AsyncWrite` for `Empty` ([#6235])
- net: add support for anonymous unix pipes ([#6127])
- net: add `UnixSocket` ([#6290])
- net: expose keepalive option on `TcpSocket` ([#6311])
- sync: add `{Receiver,UnboundedReceiver}::poll_recv_many` ([#6236])
- sync: add `Sender::{try_,}reserve_many` ([#6205])
- sync: add `watch::Receiver::mark_unchanged` ([#6252])
- task: add `JoinSet::try_join_next` ([#6280])

### Changed

- io: make `copy` cooperative ([#6265])
- io: make `repeat` and `sink` cooperative ([#6254])
- io: simplify check for empty slice ([#6293])
- process: use pidfd on Linux when available ([#6152])
- sync: use AtomicBool in broadcast channel future ([#6298])

### Documented

- io: clarify `clear_ready` docs ([#6304])
- net: document that `*Fd` traits on `TcpSocket` are unix-only ([#6294])
- sync: document FIFO behavior of `tokio::sync::Mutex` ([#6279])
- chore: typographic improvements ([#6262])
- runtime: remove obsolete comment ([#6303])
- task: fix typo ([#6261])

[#6220]: https://github.com/tokio-rs/tokio/pull/6220
[#6235]: https://github.com/tokio-rs/tokio/pull/6235
[#6127]: https://github.com/tokio-rs/tokio/pull/6127
[#6290]: https://github.com/tokio-rs/tokio/pull/6290
[#6311]: https://github.com/tokio-rs/tokio/pull/6311
[#6236]: https://github.com/tokio-rs/tokio/pull/6236
[#6205]: https://github.com/tokio-rs/tokio/pull/6205
[#6252]: https://github.com/tokio-rs/tokio/pull/6252
[#6280]: https://github.com/tokio-rs/tokio/pull/6280
[#6265]: https://github.com/tokio-rs/tokio/pull/6265
[#6254]: https://github.com/tokio-rs/tokio/pull/6254
[#6293]: https://github.com/tokio-rs/tokio/pull/6293
[#6238]: https://github.com/tokio-rs/tokio/pull/6238
[#6152]: https://github.com/tokio-rs/tokio/pull/6152
[#6298]: https://github.com/tokio-rs/tokio/pull/6298
[#6262]: https://github.com/tokio-rs/tokio/pull/6262
[#6303]: https://github.com/tokio-rs/tokio/pull/6303
[#6261]: https://github.com/tokio-rs/tokio/pull/6261
[#6304]: https://github.com/tokio-rs/tokio/pull/6304
[#6294]: https://github.com/tokio-rs/tokio/pull/6294
[#6279]: https://github.com/tokio-rs/tokio/pull/6279

# 1.35.1 (December 19, 2023)

This is a forward part of a change that was backported to 1.25.3.

### Fixed

- io: add budgeting to `tokio::runtime::io::registration::async_io` ([#6221])

[#6221]: https://github.com/tokio-rs/tokio/pull/6221

# 1.35.0 (December 8th, 2023)

### Added

- net: add Apple watchOS support ([#6176])

### Changed

- io: drop the `Sized` requirements from `AsyncReadExt.read_buf` ([#6169])
- runtime: make `Runtime` unwind safe ([#6189])
- runtime: reduce the lock contention in task spawn ([#6001])
- tokio: update nix dependency to 0.27.1 ([#6190])

### Fixed

- chore: make `--cfg docsrs` work without net feature ([#6166])
- chore: use relaxed load for `unsync_load` on miri ([#6179])
- runtime: handle missing context on wake ([#6148])
- taskdump: fix taskdump cargo config example ([#6150])
- taskdump: skip notified tasks during taskdumps ([#6194])
- tracing: avoid creating resource spans with current parent, use a None parent instead ([#6107])
- tracing: make task span explicit root ([#6158])

### Documented

- io: flush in `AsyncWriteExt` examples ([#6149])
- runtime: document fairness guarantees and current behavior ([#6145])
- task: document cancel safety of `LocalSet::run_until` ([#6147])

[#6001]: https://github.com/tokio-rs/tokio/pull/6001
[#6107]: https://github.com/tokio-rs/tokio/pull/6107
[#6144]: https://github.com/tokio-rs/tokio/pull/6144
[#6145]: https://github.com/tokio-rs/tokio/pull/6145
[#6147]: https://github.com/tokio-rs/tokio/pull/6147
[#6148]: https://github.com/tokio-rs/tokio/pull/6148
[#6149]: https://github.com/tokio-rs/tokio/pull/6149
[#6150]: https://github.com/tokio-rs/tokio/pull/6150
[#6158]: https://github.com/tokio-rs/tokio/pull/6158
[#6166]: https://github.com/tokio-rs/tokio/pull/6166
[#6169]: https://github.com/tokio-rs/tokio/pull/6169
[#6176]: https://github.com/tokio-rs/tokio/pull/6176
[#6179]: https://github.com/tokio-rs/tokio/pull/6179
[#6189]: https://github.com/tokio-rs/tokio/pull/6189
[#6190]: https://github.com/tokio-rs/tokio/pull/6190
[#6194]: https://github.com/tokio-rs/tokio/pull/6194

# 1.34.0 (November 19th, 2023)

### Fixed

- io: allow `clear_readiness` after io driver shutdown ([#6067])
- io: fix integer overflow in `take` ([#6080])
- io: fix I/O resource hang ([#6134])
- sync: fix `broadcast::channel` link ([#6100])

### Changed

- macros: use `::core` qualified imports instead of `::std` inside `tokio::test` macro ([#5973])

### Added

- fs: update cfg attr in `fs::read_dir` to include `aix` ([#6075])
- sync: add `mpsc::Receiver::recv_many` ([#6010])
- tokio: added vita target support ([#6094])

[#5973]: https://github.com/tokio-rs/tokio/pull/5973
[#6067]: https://github.com/tokio-rs/tokio/pull/6067
[#6080]: https://github.com/tokio-rs/tokio/pull/6080
[#6134]: https://github.com/tokio-rs/tokio/pull/6134
[#6100]: https://github.com/tokio-rs/tokio/pull/6100
[#6075]: https://github.com/tokio-rs/tokio/pull/6075
[#6010]: https://github.com/tokio-rs/tokio/pull/6010
[#6094]: https://github.com/tokio-rs/tokio/pull/6094

# 1.33.0 (October 9, 2023)

### Fixed

- io: mark `Interest::add` with `#[must_use]` ([#6037])
- runtime: fix cache line size for RISC-V ([#5994])
- sync: prevent lock poisoning in `watch::Receiver::wait_for` ([#6021])
- task: fix `spawn_local` source location ([#5984])

### Changed

- sync: use Acquire/Release orderings instead of SeqCst in `watch` ([#6018])

### Added

- fs: add vectored writes to `tokio::fs::File` ([#5958])
- io: add `Interest::remove` method ([#5906])
- io: add vectored writes to `DuplexStream` ([#5985])
- net: add Apple tvOS support ([#6045])
- sync: add `?Sized` bound to `{MutexGuard,OwnedMutexGuard}::map` ([#5997])
- sync: add `watch::Receiver::mark_unseen` ([#5962], [#6014], [#6017])
- sync: add `watch::Sender::new` ([#5998])
- sync: add const fn `OnceCell::from_value` ([#5903])

### Removed

- remove unused `stats` feature ([#5952])

### Documented

- add missing backticks in code examples ([#5938], [#6056])
- fix typos ([#5988], [#6030])
- process: document that `Child::wait` is cancel safe ([#5977])
- sync: add examples for `Semaphore` ([#5939], [#5956], [#5978], [#6031], [#6032], [#6050])
- sync: document that `broadcast` capacity is a lower bound ([#6042])
- sync: document that `const_new` is not instrumented ([#6002])
- sync: improve cancel-safety documentation for `mpsc::Sender::send` ([#5947])
- sync: improve docs for `watch` channel ([#5954])
- taskdump: render taskdump documentation on docs.rs ([#5972])

### Unstable

- taskdump: fix potential deadlock ([#6036])

[#5903]: https://github.com/tokio-rs/tokio/pull/5903
[#5906]: https://github.com/tokio-rs/tokio/pull/5906
[#5938]: https://github.com/tokio-rs/tokio/pull/5938
[#5939]: https://github.com/tokio-rs/tokio/pull/5939
[#5947]: https://github.com/tokio-rs/tokio/pull/5947
[#5952]: https://github.com/tokio-rs/tokio/pull/5952
[#5954]: https://github.com/tokio-rs/tokio/pull/5954
[#5956]: https://github.com/tokio-rs/tokio/pull/5956
[#5958]: https://github.com/tokio-rs/tokio/pull/5958
[#5960]: https://github.com/tokio-rs/tokio/pull/5960
[#5962]: https://github.com/tokio-rs/tokio/pull/5962
[#5971]: https://github.com/tokio-rs/tokio/pull/5971
[#5972]: https://github.com/tokio-rs/tokio/pull/5972
[#5977]: https://github.com/tokio-rs/tokio/pull/5977
[#5978]: https://github.com/tokio-rs/tokio/pull/5978
[#5984]: https://github.com/tokio-rs/tokio/pull/5984
[#5985]: https://github.com/tokio-rs/tokio/pull/5985
[#5988]: https://github.com/tokio-rs/tokio/pull/5988
[#5994]: https://github.com/tokio-rs/tokio/pull/5994
[#5997]: https://github.com/tokio-rs/tokio/pull/5997
[#5998]: https://github.com/tokio-rs/tokio/pull/5998
[#6002]: https://github.com/tokio-rs/tokio/pull/6002
[#6014]: https://github.com/tokio-rs/tokio/pull/6014
[#6017]: https://github.com/tokio-rs/tokio/pull/6017
[#6018]: https://github.com/tokio-rs/tokio/pull/6018
[#6021]: https://github.com/tokio-rs/tokio/pull/6021
[#6030]: https://github.com/tokio-rs/tokio/pull/6030
[#6031]: https://github.com/tokio-rs/tokio/pull/6031
[#6032]: https://github.com/tokio-rs/tokio/pull/6032
[#6036]: https://github.com/tokio-rs/tokio/pull/6036
[#6037]: https://github.com/tokio-rs/tokio/pull/6037
[#6042]: https://github.com/tokio-rs/tokio/pull/6042
[#6045]: https://github.com/tokio-rs/tokio/pull/6045
[#6050]: https://github.com/tokio-rs/tokio/pull/6050
[#6056]: https://github.com/tokio-rs/tokio/pull/6056
[#6058]: https://github.com/tokio-rs/tokio/pull/6058

# 1.32.1 (December 19, 2023)

This is a forward part of a change that was backported to 1.25.3.

### Fixed

- io: add budgeting to `tokio::runtime::io::registration::async_io` ([#6221])

[#6221]: https://github.com/tokio-rs/tokio/pull/6221

# 1.32.0 (August 16, 2023)

### Fixed

- sync: fix potential quadratic behavior in `broadcast::Receiver` ([#5925])

### Added

- process: stabilize `Command::raw_arg` ([#5930])
- io: enable awaiting error readiness ([#5781])

### Unstable

- rt(alt): improve scalability of alt runtime as the number of cores grows ([#5935])

[#5925]: https://github.com/tokio-rs/tokio/pull/5925
[#5930]: https://github.com/tokio-rs/tokio/pull/5930
[#5781]: https://github.com/tokio-rs/tokio/pull/5781
[#5935]: https://github.com/tokio-rs/tokio/pull/5935

# 1.31.0 (August 10, 2023)

### Fixed

* io: delegate `WriteHalf::poll_write_vectored` ([#5914])

### Unstable

* rt(alt): fix memory leak in unstable next-gen scheduler prototype ([#5911])
* rt: expose mean task poll time metric ([#5927])

[#5914]: https://github.com/tokio-rs/tokio/pull/5914
[#5911]: https://github.com/tokio-rs/tokio/pull/5911
[#5927]: https://github.com/tokio-rs/tokio/pull/5927

# 1.30.0 (August 9, 2023)

This release bumps the MSRV of Tokio to 1.63. ([#5887])

### Changed

- tokio: reduce LLVM code generation ([#5859])
- io: support `--cfg mio_unsupported_force_poll_poll` flag ([#5881])
- sync: make `const_new` methods always available ([#5885])
- sync: avoid false sharing in mpsc channel ([#5829])
- rt: pop at least one task from inject queue ([#5908])

### Added

- sync: add `broadcast::Sender::new` ([#5824])
- net: implement `UCred` for espidf ([#5868])
- fs: add `File::options()` ([#5869])
- time: implement extra reset variants for `Interval` ([#5878])
- process: add `{ChildStd*}::into_owned_{fd, handle}` ([#5899])

### Removed

- tokio: removed unused `tokio_*` cfgs ([#5890])
- remove build script to speed up compilation ([#5887])

### Documented

- sync: mention lagging in docs for `broadcast::send` ([#5820])
- runtime: expand on sharing runtime docs ([#5858])
- io: use vec in example for `AsyncReadExt::read_exact` ([#5863])
- time: mark `Sleep` as `!Unpin` in docs ([#5916])
- process: fix `raw_arg` not showing up in docs ([#5865])

### Unstable

- rt: add runtime ID ([#5864])
- rt: initial implementation of new threaded runtime ([#5823])

[#5820]: https://github.com/tokio-rs/tokio/pull/5820
[#5823]: https://github.com/tokio-rs/tokio/pull/5823
[#5824]: https://github.com/tokio-rs/tokio/pull/5824
[#5829]: https://github.com/tokio-rs/tokio/pull/5829
[#5858]: https://github.com/tokio-rs/tokio/pull/5858
[#5859]: https://github.com/tokio-rs/tokio/pull/5859
[#5863]: https://github.com/tokio-rs/tokio/pull/5863
[#5864]: https://github.com/tokio-rs/tokio/pull/5864
[#5865]: https://github.com/tokio-rs/tokio/pull/5865
[#5868]: https://github.com/tokio-rs/tokio/pull/5868
[#5869]: https://github.com/tokio-rs/tokio/pull/5869
[#5878]: https://github.com/tokio-rs/tokio/pull/5878
[#5881]: https://github.com/tokio-rs/tokio/pull/5881
[#5885]: https://github.com/tokio-rs/tokio/pull/5885
[#5887]: https://github.com/tokio-rs/tokio/pull/5887
[#5890]: https://github.com/tokio-rs/tokio/pull/5890
[#5899]: https://github.com/tokio-rs/tokio/pull/5899
[#5908]: https://github.com/tokio-rs/tokio/pull/5908
[#5916]: https://github.com/tokio-rs/tokio/pull/5916

# 1.29.1 (June 29, 2023)

### Fixed

- rt: fix nesting two `block_in_place` with a `block_on` between ([#5837])

[#5837]: https://github.com/tokio-rs/tokio/pull/5837

# 1.29.0 (June 27, 2023)

Technically a breaking change, the `Send` implementation is removed from
`runtime::EnterGuard`. This change fixes a bug and should not impact most users.

### Breaking

- rt: `EnterGuard` should not be `Send` ([#5766])

### Fixed

- fs: reduce blocking ops in `fs::read_dir` ([#5653])
- rt: fix possible starvation ([#5686], [#5712])
- rt: fix stacked borrows issue in `JoinSet` ([#5693])
- rt: panic if `EnterGuard` dropped incorrect order ([#5772])
- time: do not overflow to signal value ([#5710])
- fs: wait for in-flight ops before cloning `File` ([#5803])

### Changed

- rt: reduce time to poll tasks scheduled from outside the runtime ([#5705], [#5720])

### Added

- net: add uds doc alias for unix sockets ([#5659])
- rt: add metric for number of tasks ([#5628])
- sync: implement more traits for channel errors ([#5666])
- net: add nodelay methods on TcpSocket ([#5672])
- sync: add `broadcast::Receiver::blocking_recv` ([#5690])
- process: add `raw_arg` method to `Command` ([#5704])
- io: support PRIORITY epoll events ([#5566])
- task: add `JoinSet::poll_join_next` ([#5721])
- net: add support for Redox OS ([#5790])


### Unstable

- rt: add the ability to dump task backtraces ([#5608], [#5676], [#5708], [#5717])
- rt: instrument task poll times with a histogram ([#5685])

[#5766]: https://github.com/tokio-rs/tokio/pull/5766
[#5653]: https://github.com/tokio-rs/tokio/pull/5653
[#5686]: https://github.com/tokio-rs/tokio/pull/5686
[#5712]: https://github.com/tokio-rs/tokio/pull/5712
[#5693]: https://github.com/tokio-rs/tokio/pull/5693
[#5772]: https://github.com/tokio-rs/tokio/pull/5772
[#5710]: https://github.com/tokio-rs/tokio/pull/5710
[#5803]: https://github.com/tokio-rs/tokio/pull/5803
[#5705]: https://github.com/tokio-rs/tokio/pull/5705
[#5720]: https://github.com/tokio-rs/tokio/pull/5720
[#5659]: https://github.com/tokio-rs/tokio/pull/5659
[#5628]: https://github.com/tokio-rs/tokio/pull/5628
[#5666]: https://github.com/tokio-rs/tokio/pull/5666
[#5672]: https://github.com/tokio-rs/tokio/pull/5672
[#5690]: https://github.com/tokio-rs/tokio/pull/5690
[#5704]: https://github.com/tokio-rs/tokio/pull/5704
[#5566]: https://github.com/tokio-rs/tokio/pull/5566
[#5721]: https://github.com/tokio-rs/tokio/pull/5721
[#5790]: https://github.com/tokio-rs/tokio/pull/5790
[#5608]: https://github.com/tokio-rs/tokio/pull/5608
[#5676]: https://github.com/tokio-rs/tokio/pull/5676
[#5708]: https://github.com/tokio-rs/tokio/pull/5708
[#5717]: https://github.com/tokio-rs/tokio/pull/5717
[#5685]: https://github.com/tokio-rs/tokio/pull/5685

# 1.28.2 (May 28, 2023)

Forward ports 1.18.6 changes.

### Fixed

- deps: disable default features for mio ([#5728])

[#5728]: https://github.com/tokio-rs/tokio/pull/5728

# 1.28.1 (May 10th, 2023)

This release fixes a mistake in the build script that makes `AsFd`
implementations unavailable on Rust 1.63. ([#5677])

[#5677]: https://github.com/tokio-rs/tokio/pull/5677

# 1.28.0 (April 25th, 2023)

### Added

- io: add `AsyncFd::async_io` ([#5542])
- io: impl BufMut for ReadBuf ([#5590])
- net: add `recv_buf` for `UdpSocket` and `UnixDatagram` ([#5583])
- sync: add `OwnedSemaphorePermit::semaphore` ([#5618])
- sync: add `same_channel` to broadcast channel ([#5607])
- sync: add `watch::Receiver::wait_for` ([#5611])
- task: add `JoinSet::spawn_blocking` and `JoinSet::spawn_blocking_on` ([#5612])

### Changed

- deps: update windows-sys to 0.48 ([#5591])
- io: make `read_to_end` not grow unnecessarily ([#5610])
- macros: make entrypoints more efficient ([#5621])
- sync: improve Debug impl for `RwLock` ([#5647])
- sync: reduce contention in `Notify` ([#5503])

### Fixed

- net: support `get_peer_cred` on AIX ([#5065])
- sync: avoid deadlocks in `broadcast` with custom wakers ([#5578])

### Documented

- sync: fix typo in `Semaphore::MAX_PERMITS` ([#5645])
- sync: fix typo in `tokio::sync::watch::Sender` docs ([#5587])

[#5065]: https://github.com/tokio-rs/tokio/pull/5065
[#5503]: https://github.com/tokio-rs/tokio/pull/5503
[#5542]: https://github.com/tokio-rs/tokio/pull/5542
[#5578]: https://github.com/tokio-rs/tokio/pull/5578
[#5583]: https://github.com/tokio-rs/tokio/pull/5583
[#5587]: https://github.com/tokio-rs/tokio/pull/5587
[#5590]: https://github.com/tokio-rs/tokio/pull/5590
[#5591]: https://github.com/tokio-rs/tokio/pull/5591
[#5607]: https://github.com/tokio-rs/tokio/pull/5607
[#5610]: https://github.com/tokio-rs/tokio/pull/5610
[#5611]: https://github.com/tokio-rs/tokio/pull/5611
[#5612]: https://github.com/tokio-rs/tokio/pull/5612
[#5618]: https://github.com/tokio-rs/tokio/pull/5618
[#5621]: https://github.com/tokio-rs/tokio/pull/5621
[#5645]: https://github.com/tokio-rs/tokio/pull/5645
[#5647]: https://github.com/tokio-rs/tokio/pull/5647

# 1.27.0 (March 27th, 2023)

This release bumps the MSRV of Tokio to 1.56. ([#5559])

### Added

- io: add `async_io` helper method to sockets ([#5512])
- io: add implementations of `AsFd`/`AsHandle`/`AsSocket` ([#5514], [#5540])
- net: add `UdpSocket::peek_sender()` ([#5520])
- sync: add `RwLockWriteGuard::{downgrade_map, try_downgrade_map}` ([#5527])
- task: add `JoinHandle::abort_handle` ([#5543])

### Changed

- io: use `memchr` from `libc` ([#5558])
- macros: accept path as crate rename in `#[tokio::main]` ([#5557])
- macros: update to syn 2.0.0 ([#5572])
- time: don't register for a wakeup when `Interval` returns `Ready` ([#5553])

### Fixed

- fs: fuse std iterator in `ReadDir` ([#5555])
- tracing: fix `spawn_blocking` location fields ([#5573])
- time: clean up redundant check in `Wheel::poll()` ([#5574])

### Documented

- macros: define cancellation safety ([#5525])
- io: add details to docs of `tokio::io::copy[_buf]` ([#5575])
- io: refer to `ReaderStream` and `StreamReader` in module docs ([#5576])

[#5512]: https://github.com/tokio-rs/tokio/pull/5512
[#5514]: https://github.com/tokio-rs/tokio/pull/5514
[#5520]: https://github.com/tokio-rs/tokio/pull/5520
[#5525]: https://github.com/tokio-rs/tokio/pull/5525
[#5527]: https://github.com/tokio-rs/tokio/pull/5527
[#5540]: https://github.com/tokio-rs/tokio/pull/5540
[#5543]: https://github.com/tokio-rs/tokio/pull/5543
[#5553]: https://github.com/tokio-rs/tokio/pull/5553
[#5555]: https://github.com/tokio-rs/tokio/pull/5555
[#5557]: https://github.com/tokio-rs/tokio/pull/5557
[#5558]: https://github.com/tokio-rs/tokio/pull/5558
[#5559]: https://github.com/tokio-rs/tokio/pull/5559
[#5572]: https://github.com/tokio-rs/tokio/pull/5572
[#5573]: https://github.com/tokio-rs/tokio/pull/5573
[#5574]: https://github.com/tokio-rs/tokio/pull/5574
[#5575]: https://github.com/tokio-rs/tokio/pull/5575
[#5576]: https://github.com/tokio-rs/tokio/pull/5576

# 1.26.0 (March 1st, 2023)

### Fixed

- macros: fix empty `join!` and `try_join!` ([#5504])
- sync: don't leak tracing spans in mutex guards ([#5469])
- sync: drop wakers after unlocking the mutex in Notify ([#5471])
- sync: drop wakers outside lock in semaphore ([#5475])

### Added

- fs: add `fs::try_exists` ([#4299])
- net: add types for named unix pipes ([#5351])
- sync: add `MappedOwnedMutexGuard` ([#5474])

### Changed

- chore: update windows-sys to 0.45 ([#5386])
- net: use Message Read Mode for named pipes ([#5350])
- sync: mark lock guards with `#[clippy::has_significant_drop]` ([#5422])
- sync: reduce contention in watch channel ([#5464])
- time: remove cache padding in timer entries ([#5468])
- time: Improve `Instant::now()` perf with test-util ([#5513])

### Internal Changes

- io: use `poll_fn` in `copy_bidirectional` ([#5486])
- net: refactor named pipe builders to not use bitfields ([#5477])
- rt: remove Arc from Clock ([#5434])
- sync: make `notify_waiters` calls atomic ([#5458])
- time: don't store deadline twice in sleep entries ([#5410])

### Unstable

- metrics: add a new metric for budget exhaustion yields ([#5517])

### Documented

- io: improve AsyncFd example ([#5481])
- runtime: document the nature of the main future ([#5494])
- runtime: remove extra period in docs ([#5511])
- signal: updated Documentation for Signals ([#5459])
- sync: add doc aliases for `blocking_*` methods ([#5448])
- sync: fix docs for Send/Sync bounds in broadcast ([#5480])
- sync: document drop behavior for channels ([#5497])
- task: clarify what happens to spawned work during runtime shutdown ([#5394])
- task: clarify `process::Command` docs ([#5413])
- task: fix wording with 'unsend' ([#5452])
- time: document immediate completion guarantee for timeouts ([#5509])
- tokio: document supported platforms ([#5483])

[#4299]: https://github.com/tokio-rs/tokio/pull/4299
[#5350]: https://github.com/tokio-rs/tokio/pull/5350
[#5351]: https://github.com/tokio-rs/tokio/pull/5351
[#5386]: https://github.com/tokio-rs/tokio/pull/5386
[#5394]: https://github.com/tokio-rs/tokio/pull/5394
[#5410]: https://github.com/tokio-rs/tokio/pull/5410
[#5413]: https://github.com/tokio-rs/tokio/pull/5413
[#5422]: https://github.com/tokio-rs/tokio/pull/5422
[#5434]: https://github.com/tokio-rs/tokio/pull/5434
[#5448]: https://github.com/tokio-rs/tokio/pull/5448
[#5452]: https://github.com/tokio-rs/tokio/pull/5452
[#5458]: https://github.com/tokio-rs/tokio/pull/5458
[#5459]: https://github.com/tokio-rs/tokio/pull/5459
[#5464]: https://github.com/tokio-rs/tokio/pull/5464
[#5468]: https://github.com/tokio-rs/tokio/pull/5468
[#5469]: https://github.com/tokio-rs/tokio/pull/5469
[#5471]: https://github.com/tokio-rs/tokio/pull/5471
[#5474]: https://github.com/tokio-rs/tokio/pull/5474
[#5475]: https://github.com/tokio-rs/tokio/pull/5475
[#5477]: https://github.com/tokio-rs/tokio/pull/5477
[#5480]: https://github.com/tokio-rs/tokio/pull/5480
[#5481]: https://github.com/tokio-rs/tokio/pull/5481
[#5483]: https://github.com/tokio-rs/tokio/pull/5483
[#5486]: https://github.com/tokio-rs/tokio/pull/5486
[#5494]: https://github.com/tokio-rs/tokio/pull/5494
[#5497]: https://github.com/tokio-rs/tokio/pull/5497
[#5504]: https://github.com/tokio-rs/tokio/pull/5504
[#5509]: https://github.com/tokio-rs/tokio/pull/5509
[#5511]: https://github.com/tokio-rs/tokio/pull/5511
[#5513]: https://github.com/tokio-rs/tokio/pull/5513
[#5517]: https://github.com/tokio-rs/tokio/pull/5517

# 1.25.3 (December 17th, 2023)

### Fixed
- io: add budgeting to `tokio::runtime::io::registration::async_io` ([#6221])

[#6221]: https://github.com/tokio-rs/tokio/pull/6221

# 1.25.2 (September 22, 2023)

Forward ports 1.20.6 changes.

### Changed

- io: use `memchr` from `libc` ([#5960])

[#5960]: https://github.com/tokio-rs/tokio/pull/5960

# 1.25.1 (May 28, 2023)

Forward ports 1.18.6 changes.

### Fixed

- deps: disable default features for mio ([#5728])

[#5728]: https://github.com/tokio-rs/tokio/pull/5728

# 1.25.0 (January 28, 2023)

### Fixed

- rt: fix runtime metrics reporting ([#5330])

### Added

- sync: add `broadcast::Sender::len` ([#5343])

### Changed

- fs: increase maximum read buffer size to 2MiB ([#5397])

[#5330]: https://github.com/tokio-rs/tokio/pull/5330
[#5343]: https://github.com/tokio-rs/tokio/pull/5343
[#5397]: https://github.com/tokio-rs/tokio/pull/5397

# 1.24.2 (January 17, 2023)

Forward ports 1.18.5 changes.

### Fixed

- io: fix unsoundness in `ReadHalf::unsplit` ([#5375])

[#5375]: https://github.com/tokio-rs/tokio/pull/5375

# 1.24.1 (January 6, 2022)

This release fixes a compilation failure on targets without `AtomicU64` when using rustc older than 1.63. ([#5356])

[#5356]: https://github.com/tokio-rs/tokio/pull/5356

# 1.24.0 (January 5, 2022)

### Fixed
 - rt: improve native `AtomicU64` support detection ([#5284])

### Added
 - rt: add configuration option for max number of I/O events polled from the OS
   per tick ([#5186])
 - rt: add an environment variable for configuring the default number of worker
   threads per runtime instance ([#4250])

### Changed
 - sync: reduce MPSC channel stack usage ([#5294])
 - io: reduce lock contention in I/O operations  ([#5300])
 - fs: speed up `read_dir()` by chunking operations ([#5309])
 - rt: use internal `ThreadId` implementation ([#5329])
 - test: don't auto-advance time when a `spawn_blocking` task is running ([#5115])

[#5186]: https://github.com/tokio-rs/tokio/pull/5186
[#5294]: https://github.com/tokio-rs/tokio/pull/5294
[#5284]: https://github.com/tokio-rs/tokio/pull/5284
[#4250]: https://github.com/tokio-rs/tokio/pull/4250
[#5300]: https://github.com/tokio-rs/tokio/pull/5300
[#5329]: https://github.com/tokio-rs/tokio/pull/5329
[#5115]: https://github.com/tokio-rs/tokio/pull/5115
[#5309]: https://github.com/tokio-rs/tokio/pull/5309

# 1.23.1 (January 4, 2022)

This release forward ports changes from 1.18.4.

### Fixed

- net: fix Windows named pipe server builder to maintain option when toggling
  pipe mode ([#5336]).

[#5336]: https://github.com/tokio-rs/tokio/pull/5336

# 1.23.0 (December 5, 2022)

### Fixed

 - net: fix Windows named pipe connect ([#5208])
 - io: support vectored writes for `ChildStdin` ([#5216])
 - io: fix `async fn ready()` false positive for OS-specific events ([#5231])

 ### Changed
 - runtime: `yield_now` defers task until after driver poll ([#5223])
 - runtime: reduce amount of codegen needed per spawned task ([#5213])
 - windows: replace `winapi` dependency with `windows-sys` ([#5204])

 [#5208]: https://github.com/tokio-rs/tokio/pull/5208
 [#5216]: https://github.com/tokio-rs/tokio/pull/5216
 [#5213]: https://github.com/tokio-rs/tokio/pull/5213
 [#5204]: https://github.com/tokio-rs/tokio/pull/5204
 [#5223]: https://github.com/tokio-rs/tokio/pull/5223
 [#5231]: https://github.com/tokio-rs/tokio/pull/5231

# 1.22.0 (November 17, 2022)

### Added
 - runtime: add `Handle::runtime_flavor` ([#5138])
 - sync: add `Mutex::blocking_lock_owned` ([#5130])
 - sync: add `Semaphore::MAX_PERMITS` ([#5144])
 - sync: add `merge()` to semaphore permits ([#4948])
 - sync: add `mpsc::WeakUnboundedSender` ([#5189])

### Added (unstable)

 - process: add `Command::process_group` ([#5114])
 - runtime: export metrics about the blocking thread pool ([#5161])
 - task: add `task::id()` and `task::try_id()` ([#5171])

### Fixed
 - macros: don't take ownership of futures in macros ([#5087])
 - runtime: fix Stacked Borrows violation in `LocalOwnedTasks` ([#5099])
 - runtime: mitigate ABA with 32-bit queue indices when possible ([#5042])
 - task: wake local tasks to the local queue when woken by the same thread ([#5095])
 - time: panic in release mode when `mark_pending` called illegally ([#5093])
 - runtime: fix typo in expect message ([#5169])
 - runtime: fix `unsync_load` on atomic types ([#5175])
 - task: elaborate safety comments in task deallocation ([#5172])
 - runtime: fix `LocalSet` drop in thread local ([#5179])
 - net: remove libc type leakage in a public API ([#5191])
 - runtime: update the alignment of `CachePadded` ([#5106])

### Changed
 - io: make `tokio::io::copy` continue filling the buffer when writer stalls ([#5066])
 - runtime: remove `coop::budget` from `LocalSet::run_until` ([#5155])
 - sync: make `Notify` panic safe ([#5154])

### Documented
 - io: fix doc for `write_i8` to use signed integers ([#5040])
 - net: fix doc typos for TCP and UDP `set_tos` methods ([#5073])
 - net: fix function name in `UdpSocket::recv` documentation ([#5150])
 - sync: typo in `TryLockError` for `RwLock::try_write` ([#5160])
 - task: document that spawned tasks execute immediately ([#5117])
 - time: document return type of `timeout` ([#5118])
 - time: document that `timeout` checks only before poll ([#5126])
 - sync: specify return type of `oneshot::Receiver` in docs ([#5198])

### Internal changes
 - runtime: use const `Mutex::new` for globals ([#5061])
 - runtime: remove `Option` around `mio::Events` in io driver ([#5078])
 - runtime: remove a conditional compilation clause ([#5104])
 - runtime: remove a reference to internal time handle ([#5107])
 - runtime: misc time driver cleanup ([#5120])
 - runtime: move signal driver to runtime module ([#5121])
 - runtime: signal driver now uses I/O driver directly ([#5125])
 - runtime: start decoupling I/O driver and I/O handle ([#5127])
 - runtime: switch `io::handle` refs with scheduler:Handle ([#5128])
 - runtime: remove Arc from I/O driver ([#5134])
 - runtime: use signal driver handle via `scheduler::Handle` ([#5135])
 - runtime: move internal clock fns out of context ([#5139])
 - runtime: remove `runtime::context` module ([#5140])
 - runtime: keep driver cfgs in `driver.rs` ([#5141])
 - runtime: add `runtime::context` to unify thread-locals ([#5143])
 - runtime: rename some confusing internal variables/fns ([#5151])
 - runtime: move `coop` mod into `runtime` ([#5152])
 - runtime: move budget state to context thread-local ([#5157])
 - runtime: move park logic into runtime module ([#5158])
 - runtime: move `Runtime` into its own file ([#5159])
 - runtime: unify entering a runtime with `Handle::enter` ([#5163])
 - runtime: remove handle reference from each scheduler ([#5166])
 - runtime: move `enter` into `context` ([#5167])
 - runtime: combine context and entered thread-locals ([#5168])
 - runtime: fix accidental unsetting of current handle ([#5178])
 - runtime: move `CoreStage` methods to `Core` ([#5182])
 - sync: name mpsc semaphore types ([#5146])

[#4948]: https://github.com/tokio-rs/tokio/pull/4948
[#5040]: https://github.com/tokio-rs/tokio/pull/5040
[#5042]: https://github.com/tokio-rs/tokio/pull/5042
[#5061]: https://github.com/tokio-rs/tokio/pull/5061
[#5066]: https://github.com/tokio-rs/tokio/pull/5066
[#5073]: https://github.com/tokio-rs/tokio/pull/5073
[#5078]: https://github.com/tokio-rs/tokio/pull/5078
[#5087]: https://github.com/tokio-rs/tokio/pull/5087
[#5093]: https://github.com/tokio-rs/tokio/pull/5093
[#5095]: https://github.com/tokio-rs/tokio/pull/5095
[#5099]: https://github.com/tokio-rs/tokio/pull/5099
[#5104]: https://github.com/tokio-rs/tokio/pull/5104
[#5106]: https://github.com/tokio-rs/tokio/pull/5106
[#5107]: https://github.com/tokio-rs/tokio/pull/5107
[#5114]: https://github.com/tokio-rs/tokio/pull/5114
[#5117]: https://github.com/tokio-rs/tokio/pull/5117
[#5118]: https://github.com/tokio-rs/tokio/pull/5118
[#5120]: https://github.com/tokio-rs/tokio/pull/5120
[#5121]: https://github.com/tokio-rs/tokio/pull/5121
[#5125]: https://github.com/tokio-rs/tokio/pull/5125
[#5126]: https://github.com/tokio-rs/tokio/pull/5126
[#5127]: https://github.com/tokio-rs/tokio/pull/5127
[#5128]: https://github.com/tokio-rs/tokio/pull/5128
[#5130]: https://github.com/tokio-rs/tokio/pull/5130
[#5134]: https://github.com/tokio-rs/tokio/pull/5134
[#5135]: https://github.com/tokio-rs/tokio/pull/5135
[#5138]: https://github.com/tokio-rs/tokio/pull/5138
[#5138]: https://github.com/tokio-rs/tokio/pull/5138
[#5139]: https://github.com/tokio-rs/tokio/pull/5139
[#5140]: https://github.com/tokio-rs/tokio/pull/5140
[#5141]: https://github.com/tokio-rs/tokio/pull/5141
[#5143]: https://github.com/tokio-rs/tokio/pull/5143
[#5144]: https://github.com/tokio-rs/tokio/pull/5144
[#5144]: https://github.com/tokio-rs/tokio/pull/5144
[#5146]: https://github.com/tokio-rs/tokio/pull/5146
[#5150]: https://github.com/tokio-rs/tokio/pull/5150
[#5151]: https://github.com/tokio-rs/tokio/pull/5151
[#5152]: https://github.com/tokio-rs/tokio/pull/5152
[#5154]: https://github.com/tokio-rs/tokio/pull/5154
[#5155]: https://github.com/tokio-rs/tokio/pull/5155
[#5157]: https://github.com/tokio-rs/tokio/pull/5157
[#5158]: https://github.com/tokio-rs/tokio/pull/5158
[#5159]: https://github.com/tokio-rs/tokio/pull/5159
[#5160]: https://github.com/tokio-rs/tokio/pull/5160
[#5161]: https://github.com/tokio-rs/tokio/pull/5161
[#5163]: https://github.com/tokio-rs/tokio/pull/5163
[#5166]: https://github.com/tokio-rs/tokio/pull/5166
[#5167]: https://github.com/tokio-rs/tokio/pull/5167
[#5168]: https://github.com/tokio-rs/tokio/pull/5168
[#5169]: https://github.com/tokio-rs/tokio/pull/5169
[#5171]: https://github.com/tokio-rs/tokio/pull/5171
[#5172]: https://github.com/tokio-rs/tokio/pull/5172
[#5175]: https://github.com/tokio-rs/tokio/pull/5175
[#5178]: https://github.com/tokio-rs/tokio/pull/5178
[#5179]: https://github.com/tokio-rs/tokio/pull/5179
[#5182]: https://github.com/tokio-rs/tokio/pull/5182
[#5189]: https://github.com/tokio-rs/tokio/pull/5189
[#5191]: https://github.com/tokio-rs/tokio/pull/5191
[#5198]: https://github.com/tokio-rs/tokio/pull/5198

# 1.21.2 (September 27, 2022)

This release removes the dependency on the `once_cell` crate to restore the MSRV
of 1.21.x, which is the latest minor version at the time of release. ([#5048])

[#5048]: https://github.com/tokio-rs/tokio/pull/5048

# 1.21.1 (September 13, 2022)

### Fixed

- net: fix dependency resolution for socket2 ([#5000])
- task: ignore failure to set TLS in `LocalSet` Drop ([#4976])

[#4976]: https://github.com/tokio-rs/tokio/pull/4976
[#5000]: https://github.com/tokio-rs/tokio/pull/5000

# 1.21.0 (September 2, 2022)

This release is the first release of Tokio to intentionally support WASM. The
`sync,macros,io-util,rt,time` features are stabilized on WASM. Additionally the
wasm32-wasi target is given unstable support for the `net` feature.

### Added

- net: add `device` and `bind_device` methods to TCP/UDP sockets ([#4882])
- net: add `tos` and `set_tos` methods to TCP and UDP sockets ([#4877])
- net: add security flags to named pipe `ServerOptions` ([#4845])
- signal: add more windows signal handlers ([#4924])
- sync: add `mpsc::Sender::max_capacity` method ([#4904])
- sync: implement Weak version of `mpsc::Sender` ([#4595])
- task: add `LocalSet::enter` ([#4765])
- task: stabilize `JoinSet` and `AbortHandle` ([#4920])
- tokio: add `track_caller` to public APIs ([#4805], [#4848], [#4852])
- wasm: initial support for `wasm32-wasi` target ([#4716])

### Fixed

- miri: improve miri compatibility by avoiding temporary references in `linked_list::Link` impls ([#4841])
- signal: don't register write interest on signal pipe ([#4898])
- sync: add `#[must_use]` to lock guards ([#4886])
- sync: fix hang when calling `recv` on closed and reopened broadcast channel ([#4867])
- task: propagate attributes on task-locals ([#4837])

### Changed

- fs: change panic to error in `File::start_seek` ([#4897])
- io: reduce syscalls in `poll_read` ([#4840])
- process: use blocking threadpool for child stdio I/O ([#4824])
- signal: make `SignalKind` methods const ([#4956])

### Internal changes

- rt: extract `basic_scheduler::Config` ([#4935])
- rt: move I/O driver into `runtime` module ([#4942])
- rt: rename internal scheduler types ([#4945])

### Documented

- chore: fix typos and grammar ([#4858], [#4894], [#4928])
- io: fix typo in `AsyncSeekExt::rewind` docs ([#4893])
- net: add documentation to `try_read()` for zero-length buffers ([#4937])
- runtime: remove incorrect panic section for `Builder::worker_threads` ([#4849])
- sync: doc of `watch::Sender::send` improved ([#4959])
- task: add cancel safety docs to `JoinHandle` ([#4901])
- task: expand on cancellation of `spawn_blocking` ([#4811])
- time: clarify that the first tick of `Interval::tick` happens immediately ([#4951])

### Unstable

- rt: add unstable option to disable the LIFO slot ([#4936])
- task: fix incorrect signature in `Builder::spawn_on` ([#4953])
- task: make `task::Builder::spawn*` methods fallible ([#4823])

[#4595]: https://github.com/tokio-rs/tokio/pull/4595
[#4716]: https://github.com/tokio-rs/tokio/pull/4716
[#4765]: https://github.com/tokio-rs/tokio/pull/4765
[#4805]: https://github.com/tokio-rs/tokio/pull/4805
[#4811]: https://github.com/tokio-rs/tokio/pull/4811
[#4823]: https://github.com/tokio-rs/tokio/pull/4823
[#4824]: https://github.com/tokio-rs/tokio/pull/4824
[#4837]: https://github.com/tokio-rs/tokio/pull/4837
[#4840]: https://github.com/tokio-rs/tokio/pull/4840
[#4841]: https://github.com/tokio-rs/tokio/pull/4841
[#4845]: https://github.com/tokio-rs/tokio/pull/4845
[#4848]: https://github.com/tokio-rs/tokio/pull/4848
[#4849]: https://github.com/tokio-rs/tokio/pull/4849
[#4852]: https://github.com/tokio-rs/tokio/pull/4852
[#4858]: https://github.com/tokio-rs/tokio/pull/4858
[#4867]: https://github.com/tokio-rs/tokio/pull/4867
[#4877]: https://github.com/tokio-rs/tokio/pull/4877
[#4882]: https://github.com/tokio-rs/tokio/pull/4882
[#4886]: https://github.com/tokio-rs/tokio/pull/4886
[#4893]: https://github.com/tokio-rs/tokio/pull/4893
[#4894]: https://github.com/tokio-rs/tokio/pull/4894
[#4897]: https://github.com/tokio-rs/tokio/pull/4897
[#4898]: https://github.com/tokio-rs/tokio/pull/4898
[#4901]: https://github.com/tokio-rs/tokio/pull/4901
[#4904]: https://github.com/tokio-rs/tokio/pull/4904
[#4920]: https://github.com/tokio-rs/tokio/pull/4920
[#4924]: https://github.com/tokio-rs/tokio/pull/4924
[#4928]: https://github.com/tokio-rs/tokio/pull/4928
[#4935]: https://github.com/tokio-rs/tokio/pull/4935
[#4936]: https://github.com/tokio-rs/tokio/pull/4936
[#4937]: https://github.com/tokio-rs/tokio/pull/4937
[#4942]: https://github.com/tokio-rs/tokio/pull/4942
[#4945]: https://github.com/tokio-rs/tokio/pull/4945
[#4951]: https://github.com/tokio-rs/tokio/pull/4951
[#4953]: https://github.com/tokio-rs/tokio/pull/4953
[#4956]: https://github.com/tokio-rs/tokio/pull/4956
[#4959]: https://github.com/tokio-rs/tokio/pull/4959

# 1.20.6 (September 22, 2023)

This is a backport of a change from 1.27.0.

### Changed

- io: use `memchr` from `libc` ([#5960])

[#5960]: https://github.com/tokio-rs/tokio/pull/5960

# 1.20.5 (May 28, 2023)

Forward ports 1.18.6 changes.

### Fixed

- deps: disable default features for mio ([#5728])

[#5728]: https://github.com/tokio-rs/tokio/pull/5728

# 1.20.4 (January 17, 2023)

Forward ports 1.18.5 changes.

### Fixed

- io: fix unsoundness in `ReadHalf::unsplit` ([#5375])

[#5375]: https://github.com/tokio-rs/tokio/pull/5375

# 1.20.3 (January 3, 2022)

This release forward ports changes from 1.18.4.

### Fixed

- net: fix Windows named pipe server builder to maintain option when toggling
  pipe mode ([#5336]).

[#5336]: https://github.com/tokio-rs/tokio/pull/5336

# 1.20.2 (September 27, 2022)

This release removes the dependency on the `once_cell` crate to restore the MSRV
of the 1.20.x LTS release. ([#5048])

[#5048]: https://github.com/tokio-rs/tokio/pull/5048

# 1.20.1 (July 25, 2022)

### Fixed

- chore: fix version detection in build script ([#4860])

[#4860]: https://github.com/tokio-rs/tokio/pull/4860

# 1.20.0 (July 12, 2022)

### Added
- tokio: add `track_caller` to public APIs ([#4772], [#4791], [#4793], [#4806], [#4808])
- sync: Add `has_changed` method to `watch::Ref` ([#4758])

### Changed

- time: remove `src/time/driver/wheel/stack.rs` ([#4766])
- rt: clean up arguments passed to basic scheduler ([#4767])
- net: be more specific about winapi features ([#4764])
- tokio: use const initialized thread locals where possible ([#4677])
- task: various small improvements to LocalKey ([#4795])

### Documented

- fs: warn about performance pitfall ([#4762])
- chore: fix spelling ([#4769])
- sync: document spurious failures in oneshot ([#4777])
- sync: add warning for watch in non-Send futures ([#4741])
- chore: fix typo ([#4798])

### Unstable

- joinset: rename `join_one` to `join_next` ([#4755])
- rt: unhandled panic config for current thread rt ([#4770])

[#4677]: https://github.com/tokio-rs/tokio/pull/4677
[#4741]: https://github.com/tokio-rs/tokio/pull/4741
[#4755]: https://github.com/tokio-rs/tokio/pull/4755
[#4758]: https://github.com/tokio-rs/tokio/pull/4758
[#4762]: https://github.com/tokio-rs/tokio/pull/4762
[#4764]: https://github.com/tokio-rs/tokio/pull/4764
[#4766]: https://github.com/tokio-rs/tokio/pull/4766
[#4767]: https://github.com/tokio-rs/tokio/pull/4767
[#4769]: https://github.com/tokio-rs/tokio/pull/4769
[#4770]: https://github.com/tokio-rs/tokio/pull/4770
[#4772]: https://github.com/tokio-rs/tokio/pull/4772
[#4777]: https://github.com/tokio-rs/tokio/pull/4777
[#4791]: https://github.com/tokio-rs/tokio/pull/4791
[#4793]: https://github.com/tokio-rs/tokio/pull/4793
[#4795]: https://github.com/tokio-rs/tokio/pull/4795
[#4798]: https://github.com/tokio-rs/tokio/pull/4798
[#4806]: https://github.com/tokio-rs/tokio/pull/4806
[#4808]: https://github.com/tokio-rs/tokio/pull/4808

# 1.19.2 (June 6, 2022)

This release fixes another bug in `Notified::enable`. ([#4751])

[#4751]: https://github.com/tokio-rs/tokio/pull/4751

# 1.19.1 (June 5, 2022)

This release fixes a bug in `Notified::enable`. ([#4747])

[#4747]: https://github.com/tokio-rs/tokio/pull/4747

# 1.19.0 (June 3, 2022)

### Added

- runtime: add `is_finished` method for `JoinHandle` and `AbortHandle` ([#4709])
- runtime: make global queue and event polling intervals configurable ([#4671])
- sync: add `Notified::enable` ([#4705])
- sync: add `watch::Sender::send_if_modified` ([#4591])
- sync: add resubscribe method to broadcast::Receiver ([#4607])
- net: add `take_error` to `TcpSocket` and `TcpStream` ([#4739])

### Changed

- io: refactor out usage of Weak in the io handle ([#4656])

### Fixed

- macros: avoid starvation in `join!` and `try_join!` ([#4624])

### Documented

- runtime: clarify semantics of tasks outliving `block_on` ([#4729])
- time: fix example for `MissedTickBehavior::Burst` ([#4713])

### Unstable

- metrics: correctly update atomics in `IoDriverMetrics` ([#4725])
- metrics: fix compilation with unstable, process, and rt, but without net ([#4682])
- task: add `#[track_caller]` to `JoinSet`/`JoinMap` ([#4697])
- task: add `Builder::{spawn_on, spawn_local_on, spawn_blocking_on}` ([#4683])
- task: add `consume_budget` for cooperative scheduling ([#4498])
- task: add `join_set::Builder` for configuring `JoinSet` tasks ([#4687])
- task: update return value of `JoinSet::join_one` ([#4726])

[#4498]: https://github.com/tokio-rs/tokio/pull/4498
[#4591]: https://github.com/tokio-rs/tokio/pull/4591
[#4607]: https://github.com/tokio-rs/tokio/pull/4607
[#4624]: https://github.com/tokio-rs/tokio/pull/4624
[#4656]: https://github.com/tokio-rs/tokio/pull/4656
[#4671]: https://github.com/tokio-rs/tokio/pull/4671
[#4682]: https://github.com/tokio-rs/tokio/pull/4682
[#4683]: https://github.com/tokio-rs/tokio/pull/4683
[#4687]: https://github.com/tokio-rs/tokio/pull/4687
[#4697]: https://github.com/tokio-rs/tokio/pull/4697
[#4705]: https://github.com/tokio-rs/tokio/pull/4705
[#4709]: https://github.com/tokio-rs/tokio/pull/4709
[#4713]: https://github.com/tokio-rs/tokio/pull/4713
[#4725]: https://github.com/tokio-rs/tokio/pull/4725
[#4726]: https://github.com/tokio-rs/tokio/pull/4726
[#4729]: https://github.com/tokio-rs/tokio/pull/4729
[#4739]: https://github.com/tokio-rs/tokio/pull/4739

# 1.18.6 (May 28, 2023)

### Fixed

- deps: disable default features for mio ([#5728])

[#5728]: https://github.com/tokio-rs/tokio/pull/5728

# 1.18.5 (January 17, 2023)

### Fixed

- io: fix unsoundness in `ReadHalf::unsplit` ([#5375])

[#5375]: https://github.com/tokio-rs/tokio/pull/5375

# 1.18.4 (January 3, 2022)

### Fixed

- net: fix Windows named pipe server builder to maintain option when toggling
  pipe mode ([#5336]).

[#5336]: https://github.com/tokio-rs/tokio/pull/5336

# 1.18.3 (September 27, 2022)

This release removes the dependency on the `once_cell` crate to restore the MSRV
of the 1.18.x LTS release. ([#5048])

[#5048]: https://github.com/tokio-rs/tokio/pull/5048

# 1.18.2 (May 5, 2022)

Add missing features for the `winapi` dependency. ([#4663])

[#4663]: https://github.com/tokio-rs/tokio/pull/4663

# 1.18.1 (May 2, 2022)

The 1.18.0 release broke the build for targets without 64-bit atomics when
building with `tokio_unstable`. This release fixes that. ([#4649])

[#4649]: https://github.com/tokio-rs/tokio/pull/4649

# 1.18.0 (April 27, 2022)

This release adds a number of new APIs in `tokio::net`, `tokio::signal`, and
`tokio::sync`. In addition, it adds new unstable APIs to `tokio::task` (`Id`s
for uniquely identifying a task, and `AbortHandle` for remotely cancelling a
task), as well as a number of bugfixes.

### Fixed

- blocking: add missing `#[track_caller]` for `spawn_blocking` ([#4616])
- macros: fix `select` macro to process 64 branches ([#4519])
- net: fix `try_io` methods not calling Mio's `try_io` internally ([#4582])
- runtime: recover when OS fails to spawn a new thread ([#4485])

### Added

- net: add `UdpSocket::peer_addr` ([#4611])
- net: add `try_read_buf` method for named pipes ([#4626])
- signal: add `SignalKind` `Hash`/`Eq` impls and `c_int` conversion ([#4540])
- signal: add support for signals up to `SIGRTMAX` ([#4555])
- sync: add `watch::Sender::send_modify` method ([#4310])
- sync: add `broadcast::Receiver::len` method ([#4542])
- sync: add `watch::Receiver::same_channel` method ([#4581])
- sync: implement `Clone` for `RecvError` types ([#4560])

### Changed

- update `mio` to 0.8.1 ([#4582])
- macros: rename `tokio::select!`'s internal `util` module ([#4543])
- runtime: use `Vec::with_capacity` when building runtime ([#4553])

### Documented

- improve docs for `tokio_unstable` ([#4524])
- runtime: include more documentation for thread_pool/worker ([#4511])
- runtime: update `Handle::current`'s docs to mention `EnterGuard` ([#4567])
- time: clarify platform specific timer resolution ([#4474])
- signal: document that `Signal::recv` is cancel-safe ([#4634])
- sync: `UnboundedReceiver` close docs ([#4548])

### Unstable

The following changes only apply when building with `--cfg tokio_unstable`:

- task: add `task::Id` type ([#4630])
- task: add `AbortHandle` type for cancelling tasks in a `JoinSet` ([#4530],
  [#4640])
- task: fix missing `doc(cfg(...))` attributes for `JoinSet` ([#4531])
- task: fix broken link in `AbortHandle` RustDoc ([#4545])
- metrics: add initial IO driver metrics ([#4507])


[#4616]: https://github.com/tokio-rs/tokio/pull/4616
[#4519]: https://github.com/tokio-rs/tokio/pull/4519
[#4582]: https://github.com/tokio-rs/tokio/pull/4582
[#4485]: https://github.com/tokio-rs/tokio/pull/4485
[#4613]: https://github.com/tokio-rs/tokio/pull/4613
[#4611]: https://github.com/tokio-rs/tokio/pull/4611
[#4626]: https://github.com/tokio-rs/tokio/pull/4626
[#4540]: https://github.com/tokio-rs/tokio/pull/4540
[#4555]: https://github.com/tokio-rs/tokio/pull/4555
[#4310]: https://github.com/tokio-rs/tokio/pull/4310
[#4542]: https://github.com/tokio-rs/tokio/pull/4542
[#4581]: https://github.com/tokio-rs/tokio/pull/4581
[#4560]: https://github.com/tokio-rs/tokio/pull/4560
[#4631]: https://github.com/tokio-rs/tokio/pull/4631
[#4582]: https://github.com/tokio-rs/tokio/pull/4582
[#4543]: https://github.com/tokio-rs/tokio/pull/4543
[#4553]: https://github.com/tokio-rs/tokio/pull/4553
[#4524]: https://github.com/tokio-rs/tokio/pull/4524
[#4511]: https://github.com/tokio-rs/tokio/pull/4511
[#4567]: https://github.com/tokio-rs/tokio/pull/4567
[#4474]: https://github.com/tokio-rs/tokio/pull/4474
[#4634]: https://github.com/tokio-rs/tokio/pull/4634
[#4548]: https://github.com/tokio-rs/tokio/pull/4548
[#4630]: https://github.com/tokio-rs/tokio/pull/4630
[#4530]: https://github.com/tokio-rs/tokio/pull/4530
[#4640]: https://github.com/tokio-rs/tokio/pull/4640
[#4531]: https://github.com/tokio-rs/tokio/pull/4531
[#4545]: https://github.com/tokio-rs/tokio/pull/4545
[#4507]: https://github.com/tokio-rs/tokio/pull/4507

# 1.17.0 (February 16, 2022)

This release updates the minimum supported Rust version (MSRV) to 1.49, the
`mio` dependency to v0.8, and the (optional) `parking_lot` dependency to v0.12.
Additionally, it contains several bug fixes, as well as internal refactoring and
performance improvements.

### Fixed

- time: prevent panicking in `sleep` with large durations ([#4495])
- time: eliminate potential panics in `Instant` arithmetic on platforms where
  `Instant::now` is not monotonic ([#4461])
- io: fix `DuplexStream` not participating in cooperative yielding ([#4478])
- rt: fix potential double panic when dropping a `JoinHandle` ([#4430])

### Changed

- update minimum supported Rust version to 1.49 ([#4457])
- update `parking_lot` dependency to v0.12.0 ([#4459])
- update `mio` dependency to v0.8 ([#4449])
- rt: remove an unnecessary lock in the blocking pool ([#4436])
- rt: remove an unnecessary enum in the basic scheduler ([#4462])
- time: use bit manipulation instead of modulo to improve performance ([#4480])
- net: use `std::future::Ready` instead of our own `Ready` future ([#4271])
- replace deprecated `atomic::spin_loop_hint` with `hint::spin_loop` ([#4491])
- fix miri failures in intrusive linked lists ([#4397])

### Documented

- io: add an example for `tokio::process::ChildStdin` ([#4479])

### Unstable

The following changes only apply when building with `--cfg tokio_unstable`:

- task: fix missing location information in `tracing` spans generated by
  `spawn_local` ([#4483])
- task: add `JoinSet` for managing sets of tasks ([#4335])
- metrics: fix compilation error on MIPS ([#4475])
- metrics: fix compilation error on arm32v7 ([#4453])

[#4495]: https://github.com/tokio-rs/tokio/pull/4495
[#4461]: https://github.com/tokio-rs/tokio/pull/4461
[#4478]: https://github.com/tokio-rs/tokio/pull/4478
[#4430]: https://github.com/tokio-rs/tokio/pull/4430
[#4457]: https://github.com/tokio-rs/tokio/pull/4457
[#4459]: https://github.com/tokio-rs/tokio/pull/4459
[#4449]: https://github.com/tokio-rs/tokio/pull/4449
[#4462]: https://github.com/tokio-rs/tokio/pull/4462
[#4436]: https://github.com/tokio-rs/tokio/pull/4436
[#4480]: https://github.com/tokio-rs/tokio/pull/4480
[#4271]: https://github.com/tokio-rs/tokio/pull/4271
[#4491]: https://github.com/tokio-rs/tokio/pull/4491
[#4397]: https://github.com/tokio-rs/tokio/pull/4397
[#4479]: https://github.com/tokio-rs/tokio/pull/4479
[#4483]: https://github.com/tokio-rs/tokio/pull/4483
[#4335]: https://github.com/tokio-rs/tokio/pull/4335
[#4475]: https://github.com/tokio-rs/tokio/pull/4475
[#4453]: https://github.com/tokio-rs/tokio/pull/4453

# 1.16.1 (January 28, 2022)

This release fixes a bug in [#4428] with the change [#4437].

[#4428]: https://github.com/tokio-rs/tokio/pull/4428
[#4437]: https://github.com/tokio-rs/tokio/pull/4437

# 1.16.0 (January 27, 2022)

Fixes a soundness bug in `io::Take` ([#4428]). The unsoundness is exposed when
leaking memory in the given `AsyncRead` implementation and then overwriting the
supplied buffer:

```rust
impl AsyncRead for Buggy {
    fn poll_read(
        self: Pin<&mut Self>,
        cx: &mut Context<'_>,
        buf: &mut ReadBuf<'_>
    ) -> Poll<Result<()>> {
      let new_buf = vec![0; 5].leak();
      *buf = ReadBuf::new(new_buf);
      buf.put_slice(b"hello");
      Poll::Ready(Ok(()))
    }
}
```

Also, this release includes improvements to the multi-threaded scheduler that
can increase throughput by up to 20% in some cases ([#4383]).

### Fixed

- io: **soundness** don't expose uninitialized memory when using `io::Take` in edge case ([#4428])
- fs: ensure `File::write` results in a `write` syscall when the runtime shuts down ([#4316])
- process: drop pipe after child exits in `wait_with_output` ([#4315])
- rt: improve error message when spawning a thread fails ([#4398])
- rt: reduce false-positive thread wakups in the multi-threaded scheduler ([#4383])
- sync: don't inherit `Send` from `parking_lot::*Guard` ([#4359])

### Added

- net: `TcpSocket::linger()` and `set_linger()` ([#4324])
- net: impl `UnwindSafe` for socket types ([#4384])
- rt: impl `UnwindSafe` for `JoinHandle` ([#4418])
- sync: `watch::Receiver::has_changed()` ([#4342])
- sync: `oneshot::Receiver::blocking_recv()` ([#4334])
- sync: `RwLock` blocking operations ([#4425])

### Unstable

The following changes only apply when building with `--cfg tokio_unstable`

- rt: **breaking change** overhaul runtime metrics API ([#4373])

[#4428]: https://github.com/tokio-rs/tokio/pull/4428
[#4316]: https://github.com/tokio-rs/tokio/pull/4316
[#4315]: https://github.com/tokio-rs/tokio/pull/4315
[#4398]: https://github.com/tokio-rs/tokio/pull/4398
[#4383]: https://github.com/tokio-rs/tokio/pull/4383
[#4359]: https://github.com/tokio-rs/tokio/pull/4359
[#4324]: https://github.com/tokio-rs/tokio/pull/4324
[#4384]: https://github.com/tokio-rs/tokio/pull/4384
[#4418]: https://github.com/tokio-rs/tokio/pull/4418
[#4342]: https://github.com/tokio-rs/tokio/pull/4342
[#4334]: https://github.com/tokio-rs/tokio/pull/4334
[#4425]: https://github.com/tokio-rs/tokio/pull/4425
[#4373]: https://github.com/tokio-rs/tokio/pull/4373

# 1.15.0 (December 15, 2021)

### Fixed

- io: add cooperative yielding support to `io::empty()` ([#4300])
- time: make timeout robust against budget-depleting tasks ([#4314])

### Changed

- update minimum supported Rust version to 1.46.

### Added

- time: add `Interval::reset()` ([#4248])
- io: add explicit lifetimes to `AsyncFdReadyGuard` ([#4267])
- process: add `Command::as_std()` ([#4295])

### Added (unstable)

- tracing: instrument `tokio::sync` types ([#4302])

[#4302]: https://github.com/tokio-rs/tokio/pull/4302
[#4300]: https://github.com/tokio-rs/tokio/pull/4300
[#4295]: https://github.com/tokio-rs/tokio/pull/4295
[#4267]: https://github.com/tokio-rs/tokio/pull/4267
[#4248]: https://github.com/tokio-rs/tokio/pull/4248
[#4314]: https://github.com/tokio-rs/tokio/pull/4314

# 1.14.0 (November 15, 2021)

### Fixed

- macros: fix compiler errors when using `mut` patterns in `select!` ([#4211])
- sync: fix a data race between `oneshot::Sender::send` and awaiting a
  `oneshot::Receiver` when the oneshot has been closed ([#4226])
- sync: make `AtomicWaker` panic safe ([#3689])
- runtime: fix basic scheduler dropping tasks outside a runtime context
  ([#4213])

### Added

- stats: add `RuntimeStats::busy_duration_total` ([#4179], [#4223])

### Changed

- io: updated `copy` buffer size to match `std::io::copy` ([#4209])

### Documented

-  io: rename buffer to file in doc-test ([#4230])
-  sync: fix Notify example ([#4212])

[#4211]: https://github.com/tokio-rs/tokio/pull/4211
[#4226]: https://github.com/tokio-rs/tokio/pull/4226
[#3689]: https://github.com/tokio-rs/tokio/pull/3689
[#4213]: https://github.com/tokio-rs/tokio/pull/4213
[#4179]: https://github.com/tokio-rs/tokio/pull/4179
[#4223]: https://github.com/tokio-rs/tokio/pull/4223
[#4209]: https://github.com/tokio-rs/tokio/pull/4209
[#4230]: https://github.com/tokio-rs/tokio/pull/4230
[#4212]: https://github.com/tokio-rs/tokio/pull/4212

# 1.13.1 (November 15, 2021)

### Fixed

- sync: fix a data race between `oneshot::Sender::send` and awaiting a
  `oneshot::Receiver` when the oneshot has been closed ([#4226])

[#4226]: https://github.com/tokio-rs/tokio/pull/4226

# 1.13.0 (October 29, 2021)

### Fixed

- sync: fix `Notify` to clone the waker before locking its waiter list ([#4129])
- tokio: add riscv32 to non atomic64 architectures ([#4185])

### Added

- net: add `poll_{recv,send}_ready` methods to `udp` and `uds_datagram` ([#4131])
- net: add `try_*`, `readable`, `writable`, `ready`, and `peer_addr` methods to split halves ([#4120])
- sync: add `blocking_lock` to `Mutex` ([#4130])
- sync: add `watch::Sender::send_replace` ([#3962], [#4195])
- sync: expand `Debug` for `Mutex<T>` impl to unsized `T` ([#4134])
- tracing: instrument time::Sleep ([#4072])
- tracing: use structured location fields for spawned tasks ([#4128])

### Changed

- io: add assert in `copy_bidirectional` that `poll_write` is sensible ([#4125])
- macros: use qualified syntax when polling in `select!` ([#4192])
- runtime: handle `block_on` wakeups better ([#4157])
- task: allocate callback on heap immediately in debug mode ([#4203])
- tokio: assert platform-minimum requirements at build time ([#3797])

### Documented

- docs: conversion of doc comments to indicative mood ([#4174])
- docs: add returning on the first error example for `try_join!` ([#4133])
- docs: fixing broken links in `tokio/src/lib.rs` ([#4132])
- signal: add example with background listener ([#4171])
- sync: add more oneshot examples ([#4153])
- time: document `Interval::tick` cancel safety ([#4152])

[#3797]: https://github.com/tokio-rs/tokio/pull/3797
[#3962]: https://github.com/tokio-rs/tokio/pull/3962
[#4072]: https://github.com/tokio-rs/tokio/pull/4072
[#4120]: https://github.com/tokio-rs/tokio/pull/4120
[#4125]: https://github.com/tokio-rs/tokio/pull/4125
[#4128]: https://github.com/tokio-rs/tokio/pull/4128
[#4129]: https://github.com/tokio-rs/tokio/pull/4129
[#4130]: https://github.com/tokio-rs/tokio/pull/4130
[#4131]: https://github.com/tokio-rs/tokio/pull/4131
[#4132]: https://github.com/tokio-rs/tokio/pull/4132
[#4133]: https://github.com/tokio-rs/tokio/pull/4133
[#4134]: https://github.com/tokio-rs/tokio/pull/4134
[#4152]: https://github.com/tokio-rs/tokio/pull/4152
[#4153]: https://github.com/tokio-rs/tokio/pull/4153
[#4157]: https://github.com/tokio-rs/tokio/pull/4157
[#4171]: https://github.com/tokio-rs/tokio/pull/4171
[#4174]: https://github.com/tokio-rs/tokio/pull/4174
[#4185]: https://github.com/tokio-rs/tokio/pull/4185
[#4192]: https://github.com/tokio-rs/tokio/pull/4192
[#4195]: https://github.com/tokio-rs/tokio/pull/4195
[#4203]: https://github.com/tokio-rs/tokio/pull/4203

# 1.12.0 (September 21, 2021)

### Fixed

- mpsc: ensure `try_reserve` error is consistent with `try_send` ([#4119])
- mpsc: use `spin_loop_hint` instead of `yield_now` ([#4115])
- sync: make `SendError` field public ([#4097])

### Added

- io: add POSIX AIO on FreeBSD ([#4054])
- io: add convenience method `AsyncSeekExt::rewind` ([#4107])
- runtime: add tracing span for `block_on` futures ([#4094])
- runtime: callback when a worker parks and unparks ([#4070])
- sync: implement `try_recv` for mpsc channels ([#4113])

### Documented

- docs: clarify CPU-bound tasks on Tokio ([#4105])
- mpsc: document spurious failures on `poll_recv` ([#4117])
- mpsc: document that `PollSender` impls `Sink` ([#4110])
- task: document non-guarantees of `yield_now` ([#4091])
- time: document paused time details better ([#4061], [#4103])

[#4027]: https://github.com/tokio-rs/tokio/pull/4027
[#4054]: https://github.com/tokio-rs/tokio/pull/4054
[#4061]: https://github.com/tokio-rs/tokio/pull/4061
[#4070]: https://github.com/tokio-rs/tokio/pull/4070
[#4091]: https://github.com/tokio-rs/tokio/pull/4091
[#4094]: https://github.com/tokio-rs/tokio/pull/4094
[#4097]: https://github.com/tokio-rs/tokio/pull/4097
[#4103]: https://github.com/tokio-rs/tokio/pull/4103
[#4105]: https://github.com/tokio-rs/tokio/pull/4105
[#4107]: https://github.com/tokio-rs/tokio/pull/4107
[#4110]: https://github.com/tokio-rs/tokio/pull/4110
[#4113]: https://github.com/tokio-rs/tokio/pull/4113
[#4115]: https://github.com/tokio-rs/tokio/pull/4115
[#4117]: https://github.com/tokio-rs/tokio/pull/4117
[#4119]: https://github.com/tokio-rs/tokio/pull/4119

# 1.11.0 (August 31, 2021)

### Fixed

 - time: don't panic when Instant is not monotonic ([#4044])
 - io: fix panic in `fill_buf` by not calling `poll_fill_buf` twice ([#4084])

### Added

 - watch: add `watch::Sender::subscribe` ([#3800])
 - process: add `from_std` to `ChildStd*` ([#4045])
 - stats: initial work on runtime stats ([#4043])

### Changed

 - tracing: change span naming to new console convention ([#4042])
 - io: speed-up waking by using uninitialized array ([#4055], [#4071], [#4075])

### Documented

 - time: make Sleep examples easier to find ([#4040])

[#3800]: https://github.com/tokio-rs/tokio/pull/3800
[#4040]: https://github.com/tokio-rs/tokio/pull/4040
[#4042]: https://github.com/tokio-rs/tokio/pull/4042
[#4043]: https://github.com/tokio-rs/tokio/pull/4043
[#4044]: https://github.com/tokio-rs/tokio/pull/4044
[#4045]: https://github.com/tokio-rs/tokio/pull/4045
[#4055]: https://github.com/tokio-rs/tokio/pull/4055
[#4071]: https://github.com/tokio-rs/tokio/pull/4071
[#4075]: https://github.com/tokio-rs/tokio/pull/4075
[#4084]: https://github.com/tokio-rs/tokio/pull/4084

# 1.10.1 (August 24, 2021)

### Fixed

 - runtime: fix leak in UnownedTask ([#4063])

[#4063]: https://github.com/tokio-rs/tokio/pull/4063

# 1.10.0 (August 12, 2021)

### Added

 - io: add `(read|write)_f(32|64)[_le]` methods ([#4022])
 - io: add `fill_buf` and `consume` to `AsyncBufReadExt` ([#3991])
 - process: add `Child::raw_handle()` on windows ([#3998])

### Fixed

 - doc: fix non-doc builds with `--cfg docsrs` ([#4020])
 - io: flush eagerly in `io::copy` ([#4001])
 - runtime: a debug assert was sometimes triggered during shutdown ([#4005])
 - sync: use `spin_loop_hint` instead of `yield_now` in mpsc ([#4037])
 - tokio: the test-util feature depends on rt, sync, and time ([#4036])

### Changes

 - runtime: reorganize parts of the runtime ([#3979], [#4005])
 - signal: make windows docs for signal module show up on unix builds ([#3770])
 - task: quickly send task to heap on debug mode ([#4009])

### Documented

 - io: document cancellation safety of `AsyncBufReadExt` ([#3997])
 - sync: document when `watch::send` fails ([#4021])

[#3770]: https://github.com/tokio-rs/tokio/pull/3770
[#3979]: https://github.com/tokio-rs/tokio/pull/3979
[#3991]: https://github.com/tokio-rs/tokio/pull/3991
[#3997]: https://github.com/tokio-rs/tokio/pull/3997
[#3998]: https://github.com/tokio-rs/tokio/pull/3998
[#4001]: https://github.com/tokio-rs/tokio/pull/4001
[#4005]: https://github.com/tokio-rs/tokio/pull/4005
[#4009]: https://github.com/tokio-rs/tokio/pull/4009
[#4020]: https://github.com/tokio-rs/tokio/pull/4020
[#4021]: https://github.com/tokio-rs/tokio/pull/4021
[#4022]: https://github.com/tokio-rs/tokio/pull/4022
[#4036]: https://github.com/tokio-rs/tokio/pull/4036
[#4037]: https://github.com/tokio-rs/tokio/pull/4037

# 1.9.0 (July 22, 2021)

### Added

 - net: allow customized I/O operations for `TcpStream` ([#3888])
 - sync: add getter for the mutex from a guard ([#3928])
 - task: expose nameable future for `TaskLocal::scope` ([#3273])

### Fixed

 - Fix leak if output of future panics on drop ([#3967])
 - Fix leak in `LocalSet` ([#3978])

### Changes

 - runtime: reorganize parts of the runtime ([#3909], [#3939], [#3950], [#3955], [#3980])
 - sync: clean up `OnceCell` ([#3945])
 - task: remove mutex in `JoinError` ([#3959])

[#3273]: https://github.com/tokio-rs/tokio/pull/3273
[#3888]: https://github.com/tokio-rs/tokio/pull/3888
[#3909]: https://github.com/tokio-rs/tokio/pull/3909
[#3928]: https://github.com/tokio-rs/tokio/pull/3928
[#3934]: https://github.com/tokio-rs/tokio/pull/3934
[#3939]: https://github.com/tokio-rs/tokio/pull/3939
[#3945]: https://github.com/tokio-rs/tokio/pull/3945
[#3950]: https://github.com/tokio-rs/tokio/pull/3950
[#3955]: https://github.com/tokio-rs/tokio/pull/3955
[#3959]: https://github.com/tokio-rs/tokio/pull/3959
[#3967]: https://github.com/tokio-rs/tokio/pull/3967
[#3978]: https://github.com/tokio-rs/tokio/pull/3978
[#3980]: https://github.com/tokio-rs/tokio/pull/3980

# 1.8.3 (July 26, 2021)

This release backports two fixes from 1.9.0

### Fixed

 - Fix leak if output of future panics on drop ([#3967])
 - Fix leak in `LocalSet` ([#3978])

[#3967]: https://github.com/tokio-rs/tokio/pull/3967
[#3978]: https://github.com/tokio-rs/tokio/pull/3978

# 1.8.2 (July 19, 2021)

Fixes a missed edge case from 1.8.1.

### Fixed

- runtime: drop canceled future on next poll ([#3965])

[#3965]: https://github.com/tokio-rs/tokio/pull/3965

# 1.8.1 (July 6, 2021)

Forward ports 1.5.1 fixes.

### Fixed

- runtime: remotely abort tasks on `JoinHandle::abort` ([#3934])

[#3934]: https://github.com/tokio-rs/tokio/pull/3934

# 1.8.0 (July 2, 2021)

### Added

- io: add `get_{ref,mut}` methods to `AsyncFdReadyGuard` and `AsyncFdReadyMutGuard` ([#3807])
- io: efficient implementation of vectored writes for `BufWriter` ([#3163])
- net: add ready/try methods to `NamedPipe{Client,Server}` ([#3866], [#3899])
- sync: add `watch::Receiver::borrow_and_update` ([#3813])
- sync: implement `From<T>` for `OnceCell<T>` ([#3877])
- time: allow users to specify Interval behavior when delayed ([#3721])

### Added (unstable)

- rt: add `tokio::task::Builder` ([#3881])

### Fixed

- net: handle HUP event with `UnixStream` ([#3898])

### Documented

- doc: document cancellation safety ([#3900])
- time: add wait alias to sleep ([#3897])
- time: document auto-advancing behavior of runtime ([#3763])

[#3163]: https://github.com/tokio-rs/tokio/pull/3163
[#3721]: https://github.com/tokio-rs/tokio/pull/3721
[#3763]: https://github.com/tokio-rs/tokio/pull/3763
[#3807]: https://github.com/tokio-rs/tokio/pull/3807
[#3813]: https://github.com/tokio-rs/tokio/pull/3813
[#3866]: https://github.com/tokio-rs/tokio/pull/3866
[#3877]: https://github.com/tokio-rs/tokio/pull/3877
[#3881]: https://github.com/tokio-rs/tokio/pull/3881
[#3897]: https://github.com/tokio-rs/tokio/pull/3897
[#3898]: https://github.com/tokio-rs/tokio/pull/3898
[#3899]: https://github.com/tokio-rs/tokio/pull/3899
[#3900]: https://github.com/tokio-rs/tokio/pull/3900

# 1.7.2 (July 6, 2021)

Forward ports 1.5.1 fixes.

### Fixed

- runtime: remotely abort tasks on `JoinHandle::abort` ([#3934])

[#3934]: https://github.com/tokio-rs/tokio/pull/3934

# 1.7.1 (June 18, 2021)

### Fixed

- runtime: fix early task shutdown during runtime shutdown ([#3870])

[#3870]: https://github.com/tokio-rs/tokio/pull/3870

# 1.7.0 (June 15, 2021)

### Added

- net: add named pipes on windows ([#3760])
- net: add `TcpSocket` from `std::net::TcpStream` conversion ([#3838])
- sync: add `receiver_count` to `watch::Sender` ([#3729])
- sync: export `sync::notify::Notified` future publicly ([#3840])
- tracing: instrument task wakers ([#3836])

### Fixed

- macros: suppress `clippy::default_numeric_fallback` lint in generated code ([#3831])
- runtime: immediately drop new tasks when runtime is shut down ([#3752])
- sync: deprecate unused `mpsc::RecvError` type ([#3833])

### Documented

- io: clarify EOF condition for `AsyncReadExt::read_buf` ([#3850])
- io: clarify limits on return values of `AsyncWrite::poll_write` ([#3820])
- sync: add examples to Semaphore ([#3808])

[#3729]: https://github.com/tokio-rs/tokio/pull/3729
[#3752]: https://github.com/tokio-rs/tokio/pull/3752
[#3760]: https://github.com/tokio-rs/tokio/pull/3760
[#3808]: https://github.com/tokio-rs/tokio/pull/3808
[#3820]: https://github.com/tokio-rs/tokio/pull/3820
[#3831]: https://github.com/tokio-rs/tokio/pull/3831
[#3833]: https://github.com/tokio-rs/tokio/pull/3833
[#3836]: https://github.com/tokio-rs/tokio/pull/3836
[#3838]: https://github.com/tokio-rs/tokio/pull/3838
[#3840]: https://github.com/tokio-rs/tokio/pull/3840
[#3850]: https://github.com/tokio-rs/tokio/pull/3850

# 1.6.3 (July 6, 2021)

Forward ports 1.5.1 fixes.

### Fixed

- runtime: remotely abort tasks on `JoinHandle::abort` ([#3934])

[#3934]: https://github.com/tokio-rs/tokio/pull/3934

# 1.6.2 (June 14, 2021)

### Fixes

- test: sub-ms `time:advance` regression introduced in 1.6 ([#3852])

[#3852]: https://github.com/tokio-rs/tokio/pull/3852

# 1.6.1 (May 28, 2021)

This release reverts [#3518] because it doesn't work on some kernels due to
a kernel bug. ([#3803])

[#3518]: https://github.com/tokio-rs/tokio/issues/3518
[#3803]: https://github.com/tokio-rs/tokio/issues/3803

# 1.6.0 (May 14, 2021)

### Added

- fs: try doing a non-blocking read before punting to the threadpool ([#3518])
- io: add `write_all_buf` to `AsyncWriteExt` ([#3737])
- io: implement `AsyncSeek` for `BufReader`, `BufWriter`, and `BufStream` ([#3491])
- net: support non-blocking vectored I/O ([#3761])
- sync: add `mpsc::Sender::{reserve_owned, try_reserve_owned}` ([#3704])
- sync: add a `MutexGuard::map` method that returns a `MappedMutexGuard` ([#2472])
- time: add getter for Interval's period ([#3705])

### Fixed

- io: wake pending writers on `DuplexStream` close ([#3756])
- process: avoid redundant effort to reap orphan processes ([#3743])
- signal: use `std::os::raw::c_int` instead of `libc::c_int` on public API ([#3774])
- sync: preserve permit state in `notify_waiters` ([#3660])
- task: update `JoinHandle` panic message ([#3727])
- time: prevent `time::advance` from going too far ([#3712])

### Documented

- net: hide `net::unix::datagram` module from docs ([#3775])
- process: updated example ([#3748])
- sync: `Barrier` doc should use task, not thread ([#3780])
- task: update documentation on `block_in_place` ([#3753])

[#2472]: https://github.com/tokio-rs/tokio/pull/2472
[#3491]: https://github.com/tokio-rs/tokio/pull/3491
[#3518]: https://github.com/tokio-rs/tokio/pull/3518
[#3660]: https://github.com/tokio-rs/tokio/pull/3660
[#3704]: https://github.com/tokio-rs/tokio/pull/3704
[#3705]: https://github.com/tokio-rs/tokio/pull/3705
[#3712]: https://github.com/tokio-rs/tokio/pull/3712
[#3727]: https://github.com/tokio-rs/tokio/pull/3727
[#3737]: https://github.com/tokio-rs/tokio/pull/3737
[#3743]: https://github.com/tokio-rs/tokio/pull/3743
[#3748]: https://github.com/tokio-rs/tokio/pull/3748
[#3753]: https://github.com/tokio-rs/tokio/pull/3753
[#3756]: https://github.com/tokio-rs/tokio/pull/3756
[#3761]: https://github.com/tokio-rs/tokio/pull/3761
[#3774]: https://github.com/tokio-rs/tokio/pull/3774
[#3775]: https://github.com/tokio-rs/tokio/pull/3775
[#3780]: https://github.com/tokio-rs/tokio/pull/3780

# 1.5.1 (July 6, 2021)

### Fixed

- runtime: remotely abort tasks on `JoinHandle::abort` ([#3934])

[#3934]: https://github.com/tokio-rs/tokio/pull/3934

# 1.5.0 (April 12, 2021)

### Added

- io: add `AsyncSeekExt::stream_position` ([#3650])
- io: add `AsyncWriteExt::write_vectored` ([#3678])
- io: add a `copy_bidirectional` utility ([#3572])
- net: implement `IntoRawFd` for `TcpSocket` ([#3684])
- sync: add `OnceCell` ([#3591])
- sync: add `OwnedRwLockReadGuard` and `OwnedRwLockWriteGuard` ([#3340])
- sync: add `Semaphore::is_closed` ([#3673])
- sync: add `mpsc::Sender::capacity` ([#3690])
- sync: allow configuring `RwLock` max reads ([#3644])
- task: add `sync_scope` for `LocalKey` ([#3612])

### Fixed

- chore: try to avoid `noalias` attributes on intrusive linked list ([#3654])
- rt: fix panic in `JoinHandle::abort()` when called from other threads ([#3672])
- sync: don't panic in `oneshot::try_recv` ([#3674])
- sync: fix notifications getting dropped on receiver drop ([#3652])
- sync: fix `Semaphore` permit overflow calculation ([#3644])

### Documented

- io: clarify requirements of `AsyncFd` ([#3635])
- runtime: fix unclear docs for `{Handle,Runtime}::block_on` ([#3628])
- sync: document that `Semaphore` is fair ([#3693])
- sync: improve doc on blocking mutex ([#3645])

[#3340]: https://github.com/tokio-rs/tokio/pull/3340
[#3572]: https://github.com/tokio-rs/tokio/pull/3572
[#3591]: https://github.com/tokio-rs/tokio/pull/3591
[#3612]: https://github.com/tokio-rs/tokio/pull/3612
[#3628]: https://github.com/tokio-rs/tokio/pull/3628
[#3635]: https://github.com/tokio-rs/tokio/pull/3635
[#3644]: https://github.com/tokio-rs/tokio/pull/3644
[#3645]: https://github.com/tokio-rs/tokio/pull/3645
[#3650]: https://github.com/tokio-rs/tokio/pull/3650
[#3652]: https://github.com/tokio-rs/tokio/pull/3652
[#3654]: https://github.com/tokio-rs/tokio/pull/3654
[#3672]: https://github.com/tokio-rs/tokio/pull/3672
[#3673]: https://github.com/tokio-rs/tokio/pull/3673
[#3674]: https://github.com/tokio-rs/tokio/pull/3674
[#3678]: https://github.com/tokio-rs/tokio/pull/3678
[#3684]: https://github.com/tokio-rs/tokio/pull/3684
[#3690]: https://github.com/tokio-rs/tokio/pull/3690
[#3693]: https://github.com/tokio-rs/tokio/pull/3693

# 1.4.0 (March 20, 2021)

### Added

- macros: introduce biased argument for `select!` ([#3603])
- runtime: add `Handle::block_on` ([#3569])

### Fixed

- runtime: avoid unnecessary polling of `block_on` future ([#3582])
- runtime: fix memory leak/growth when creating many runtimes ([#3564])
- runtime: mark `EnterGuard` with `must_use` ([#3609])

### Documented

- chore: mention fix for building docs in contributing guide ([#3618])
- doc: add link to `PollSender` ([#3613])
- doc: alias sleep to delay ([#3604])
- sync: improve `Mutex` FIFO explanation ([#3615])
- timer: fix double newline in module docs ([#3617])

[#3564]: https://github.com/tokio-rs/tokio/pull/3564
[#3613]: https://github.com/tokio-rs/tokio/pull/3613
[#3618]: https://github.com/tokio-rs/tokio/pull/3618
[#3617]: https://github.com/tokio-rs/tokio/pull/3617
[#3582]: https://github.com/tokio-rs/tokio/pull/3582
[#3615]: https://github.com/tokio-rs/tokio/pull/3615
[#3603]: https://github.com/tokio-rs/tokio/pull/3603
[#3609]: https://github.com/tokio-rs/tokio/pull/3609
[#3604]: https://github.com/tokio-rs/tokio/pull/3604
[#3569]: https://github.com/tokio-rs/tokio/pull/3569

# 1.3.0 (March 9, 2021)

### Added

- coop: expose an `unconstrained()` opt-out ([#3547])
- net: add `into_std` for net types without it ([#3509])
- sync: add `same_channel` method to `mpsc::Sender` ([#3532])
- sync: add `{try_,}acquire_many_owned` to `Semaphore` ([#3535])
- sync: add back `RwLockWriteGuard::map` and `RwLockWriteGuard::try_map` ([#3348])

### Fixed

- sync: allow `oneshot::Receiver::close` after successful `try_recv` ([#3552])
- time: do not panic on `timeout(Duration::MAX)` ([#3551])

### Documented

- doc: doc aliases for pre-1.0 function names ([#3523])
- io: fix typos ([#3541])
- io: note the EOF behavior of `read_until` ([#3536])
- io: update `AsyncRead::poll_read` doc ([#3557])
- net: update `UdpSocket` splitting doc ([#3517])
- runtime: add link to `LocalSet` on `new_current_thread` ([#3508])
- runtime: update documentation of thread limits ([#3527])
- sync: do not recommend `join_all` for `Barrier` ([#3514])
- sync: documentation for `oneshot` ([#3592])
- sync: rename `notify` to `notify_one` ([#3526])
- time: fix typo in `Sleep` doc ([#3515])
- time: sync `interval.rs` and `time/mod.rs` docs ([#3533])

[#3348]: https://github.com/tokio-rs/tokio/pull/3348
[#3508]: https://github.com/tokio-rs/tokio/pull/3508
[#3509]: https://github.com/tokio-rs/tokio/pull/3509
[#3514]: https://github.com/tokio-rs/tokio/pull/3514
[#3515]: https://github.com/tokio-rs/tokio/pull/3515
[#3517]: https://github.com/tokio-rs/tokio/pull/3517
[#3523]: https://github.com/tokio-rs/tokio/pull/3523
[#3526]: https://github.com/tokio-rs/tokio/pull/3526
[#3527]: https://github.com/tokio-rs/tokio/pull/3527
[#3532]: https://github.com/tokio-rs/tokio/pull/3532
[#3533]: https://github.com/tokio-rs/tokio/pull/3533
[#3535]: https://github.com/tokio-rs/tokio/pull/3535
[#3536]: https://github.com/tokio-rs/tokio/pull/3536
[#3541]: https://github.com/tokio-rs/tokio/pull/3541
[#3547]: https://github.com/tokio-rs/tokio/pull/3547
[#3551]: https://github.com/tokio-rs/tokio/pull/3551
[#3552]: https://github.com/tokio-rs/tokio/pull/3552
[#3557]: https://github.com/tokio-rs/tokio/pull/3557
[#3592]: https://github.com/tokio-rs/tokio/pull/3592

# 1.2.0 (February 5, 2021)

### Added

- signal: make `Signal::poll_recv` method public ([#3383])

### Fixed

- time: make `test-util` paused time fully deterministic ([#3492])

### Documented

- sync: link to new broadcast and watch wrappers ([#3504])

[#3383]: https://github.com/tokio-rs/tokio/pull/3383
[#3492]: https://github.com/tokio-rs/tokio/pull/3492
[#3504]: https://github.com/tokio-rs/tokio/pull/3504

# 1.1.1 (January 29, 2021)

Forward ports 1.0.3 fix.

### Fixed
- io: memory leak during shutdown ([#3477]).

# 1.1.0 (January 22, 2021)

### Added

- net: add `try_read_buf` and `try_recv_buf` ([#3351])
- mpsc: Add `Sender::try_reserve` function ([#3418])
- sync: add `RwLock` `try_read` and `try_write` methods ([#3400])
- io: add `ReadBuf::inner_mut` ([#3443])

### Changed

- macros: improve `select!` error message ([#3352])
- io: keep track of initialized bytes in `read_to_end` ([#3426])
- runtime: consolidate errors for context missing ([#3441])

### Fixed

- task: wake `LocalSet` on `spawn_local` ([#3369])
- sync: fix panic in broadcast::Receiver drop ([#3434])

### Documented
- stream: link to new `Stream` wrappers in `tokio-stream` ([#3343])
- docs: mention that `test-util` feature is not enabled with full ([#3397])
- process: add documentation to process::Child fields ([#3437])
- io: clarify `AsyncFd` docs about changes of the inner fd ([#3430])
- net: update datagram docs on splitting ([#3448])
- time: document that `Sleep` is not `Unpin` ([#3457])
- sync: add link to `PollSemaphore` ([#3456])
- task: add `LocalSet` example ([#3438])
- sync: improve bounded `mpsc` documentation ([#3458])

[#3343]: https://github.com/tokio-rs/tokio/pull/3343
[#3351]: https://github.com/tokio-rs/tokio/pull/3351
[#3352]: https://github.com/tokio-rs/tokio/pull/3352
[#3369]: https://github.com/tokio-rs/tokio/pull/3369
[#3397]: https://github.com/tokio-rs/tokio/pull/3397
[#3400]: https://github.com/tokio-rs/tokio/pull/3400
[#3418]: https://github.com/tokio-rs/tokio/pull/3418
[#3426]: https://github.com/tokio-rs/tokio/pull/3426
[#3430]: https://github.com/tokio-rs/tokio/pull/3430
[#3434]: https://github.com/tokio-rs/tokio/pull/3434
[#3437]: https://github.com/tokio-rs/tokio/pull/3437
[#3438]: https://github.com/tokio-rs/tokio/pull/3438
[#3441]: https://github.com/tokio-rs/tokio/pull/3441
[#3443]: https://github.com/tokio-rs/tokio/pull/3443
[#3448]: https://github.com/tokio-rs/tokio/pull/3448
[#3456]: https://github.com/tokio-rs/tokio/pull/3456
[#3457]: https://github.com/tokio-rs/tokio/pull/3457
[#3458]: https://github.com/tokio-rs/tokio/pull/3458

# 1.0.3 (January 28, 2021)

### Fixed
- io: memory leak during shutdown ([#3477]).

[#3477]: https://github.com/tokio-rs/tokio/pull/3477

# 1.0.2 (January 14, 2021)

### Fixed
- io: soundness in `read_to_end` ([#3428]).

[#3428]: https://github.com/tokio-rs/tokio/pull/3428

# 1.0.1 (December 25, 2020)

This release fixes a soundness hole caused by the combination of `RwLockWriteGuard::map`
and `RwLockWriteGuard::downgrade` by removing the `map` function. This is a breaking
change, but breaking changes are allowed under our semver policy when they are required
to fix a soundness hole. (See [this RFC][semver] for more.)

Note that we have chosen not to do a deprecation cycle or similar because Tokio 1.0.0 was
released two days ago, and therefore the impact should be minimal.

Due to the soundness hole, we have also yanked Tokio version 1.0.0.

### Removed

- sync: remove `RwLockWriteGuard::map` and `RwLockWriteGuard::try_map` ([#3345])

### Fixed

- docs: remove stream feature from docs ([#3335])

[semver]: https://github.com/rust-lang/rfcs/blob/master/text/1122-language-semver.md#soundness-changes
[#3335]: https://github.com/tokio-rs/tokio/pull/3335
[#3345]: https://github.com/tokio-rs/tokio/pull/3345

# 1.0.0 (December 23, 2020)

Commit to the API and long-term support.

### Fixed

- sync: spurious wakeup in `watch` ([#3234]).

### Changed

- io: rename `AsyncFd::with_io()` to `try_io()` ([#3306])
- fs: avoid OS specific `*Ext` traits in favor of conditionally defining the fn ([#3264]).
- fs: `Sleep` is `!Unpin` ([#3278]).
- net: pass `SocketAddr` by value ([#3125]).
- net: `TcpStream::poll_peek` takes `ReadBuf` ([#3259]).
- rt: rename `runtime::Builder::max_threads()` to `max_blocking_threads()` ([#3287]).
- time: require `current_thread` runtime when calling `time::pause()` ([#3289]).

### Removed

- remove `tokio::prelude` ([#3299]).
- io: remove `AsyncFd::with_poll()` ([#3306]).
- net: remove `{Tcp,Unix}Stream::shutdown()` in favor of `AsyncWrite::shutdown()` ([#3298]).
- stream: move all stream utilities to `tokio-stream` until `Stream` is added to
  `std` ([#3277]).
- sync: mpsc `try_recv()` due to unexpected behavior ([#3263]).
- tracing: make unstable as `tracing-core` is not 1.0 yet ([#3266]).

### Added

- fs: `poll_*` fns to `DirEntry` ([#3308]).
- io: `poll_*` fns to `io::Lines`, `io::Split` ([#3308]).
- io: `_mut` method variants to `AsyncFd` ([#3304]).
- net: `poll_*` fns to `UnixDatagram` ([#3223]).
- net: `UnixStream` readiness and non-blocking ops ([#3246]).
- sync: `UnboundedReceiver::blocking_recv()` ([#3262]).
- sync: `watch::Sender::borrow()` ([#3269]).
- sync: `Semaphore::close()` ([#3065]).
- sync: `poll_recv` fns to `mpsc::Receiver`, `mpsc::UnboundedReceiver` ([#3308]).
- time: `poll_tick` fn to `time::Interval` ([#3316]).

[#3065]: https://github.com/tokio-rs/tokio/pull/3065
[#3125]: https://github.com/tokio-rs/tokio/pull/3125
[#3223]: https://github.com/tokio-rs/tokio/pull/3223
[#3234]: https://github.com/tokio-rs/tokio/pull/3234
[#3246]: https://github.com/tokio-rs/tokio/pull/3246
[#3259]: https://github.com/tokio-rs/tokio/pull/3259
[#3262]: https://github.com/tokio-rs/tokio/pull/3262
[#3263]: https://github.com/tokio-rs/tokio/pull/3263
[#3264]: https://github.com/tokio-rs/tokio/pull/3264
[#3266]: https://github.com/tokio-rs/tokio/pull/3266
[#3269]: https://github.com/tokio-rs/tokio/pull/3269
[#3277]: https://github.com/tokio-rs/tokio/pull/3277
[#3278]: https://github.com/tokio-rs/tokio/pull/3278
[#3287]: https://github.com/tokio-rs/tokio/pull/3287
[#3289]: https://github.com/tokio-rs/tokio/pull/3289
[#3298]: https://github.com/tokio-rs/tokio/pull/3298
[#3299]: https://github.com/tokio-rs/tokio/pull/3299
[#3304]: https://github.com/tokio-rs/tokio/pull/3304
[#3306]: https://github.com/tokio-rs/tokio/pull/3306
[#3308]: https://github.com/tokio-rs/tokio/pull/3308
[#3316]: https://github.com/tokio-rs/tokio/pull/3316

# 0.3.6 (December 14, 2020)

### Fixed

- rt: fix deadlock in shutdown ([#3228])
- rt: fix panic in task abort when off rt ([#3159])
- sync: make `add_permits` panic with usize::MAX >> 3 permits ([#3188])
- time: Fix race condition in timer drop ([#3229])
- watch: fix spurious wakeup ([#3244])

### Added

- example: add back udp-codec example ([#3205])
- net: add `TcpStream::into_std` ([#3189])

[#3159]: https://github.com/tokio-rs/tokio/pull/3159
[#3188]: https://github.com/tokio-rs/tokio/pull/3188
[#3189]: https://github.com/tokio-rs/tokio/pull/3189
[#3205]: https://github.com/tokio-rs/tokio/pull/3205
[#3228]: https://github.com/tokio-rs/tokio/pull/3228
[#3229]: https://github.com/tokio-rs/tokio/pull/3229
[#3244]: https://github.com/tokio-rs/tokio/pull/3244

# 0.3.5 (November 30, 2020)

### Fixed

- rt: fix `shutdown_timeout(0)` ([#3196]).
- time: fixed race condition with small sleeps ([#3069]).

### Added

- io: `AsyncFd::with_interest()` ([#3167]).
- signal: `CtrlC` stream on windows ([#3186]).

[#3069]: https://github.com/tokio-rs/tokio/pull/3069
[#3167]: https://github.com/tokio-rs/tokio/pull/3167
[#3186]: https://github.com/tokio-rs/tokio/pull/3186
[#3196]: https://github.com/tokio-rs/tokio/pull/3196

# 0.3.4 (November 18, 2020)

### Fixed

- stream: `StreamMap` `Default` impl bound ([#3093]).
- io: `AsyncFd::into_inner()` should deregister the FD ([#3104]).

### Changed

- meta: `parking_lot` feature enabled with `full` ([#3119]).

### Added

- io: `AsyncWrite` vectored writes ([#3149]).
- net: TCP/UDP readiness and non-blocking ops ([#3130], [#2743], [#3138]).
- net: TCP socket option (linger, send/recv buf size) ([#3145], [#3143]).
- net: PID field in `UCred` with solaris/illumos ([#3085]).
- rt: `runtime::Handle` allows spawning onto a runtime ([#3079]).
- sync: `Notify::notify_waiters()` ([#3098]).
- sync: `acquire_many()`, `try_acquire_many()` to `Semaphore` ([#3067]).

[#2743]: https://github.com/tokio-rs/tokio/pull/2743
[#3067]: https://github.com/tokio-rs/tokio/pull/3067
[#3079]: https://github.com/tokio-rs/tokio/pull/3079
[#3085]: https://github.com/tokio-rs/tokio/pull/3085
[#3093]: https://github.com/tokio-rs/tokio/pull/3093
[#3098]: https://github.com/tokio-rs/tokio/pull/3098
[#3104]: https://github.com/tokio-rs/tokio/pull/3104
[#3119]: https://github.com/tokio-rs/tokio/pull/3119
[#3130]: https://github.com/tokio-rs/tokio/pull/3130
[#3138]: https://github.com/tokio-rs/tokio/pull/3138
[#3143]: https://github.com/tokio-rs/tokio/pull/3143
[#3145]: https://github.com/tokio-rs/tokio/pull/3145
[#3149]: https://github.com/tokio-rs/tokio/pull/3149

# 0.3.3 (November 2, 2020)

Fixes a soundness hole by adding a missing `Send` bound to
`Runtime::spawn_blocking()`.

### Fixed

- rt: include missing `Send`, fixing soundness hole ([#3089]).
- tracing: avoid huge trace span names ([#3074]).

### Added

- net: `TcpSocket::reuseport()`, `TcpSocket::set_reuseport()` ([#3083]).
- net: `TcpSocket::reuseaddr()` ([#3093]).
- net: `TcpSocket::local_addr()` ([#3093]).
- net: add pid to `UCred` ([#2633]).

[#2633]: https://github.com/tokio-rs/tokio/pull/2633
[#3074]: https://github.com/tokio-rs/tokio/pull/3074
[#3083]: https://github.com/tokio-rs/tokio/pull/3083
[#3089]: https://github.com/tokio-rs/tokio/pull/3089
[#3093]: https://github.com/tokio-rs/tokio/pull/3093

# 0.3.2 (October 27, 2020)

Adds `AsyncFd` as a replacement for v0.2's `PollEvented`.

### Fixed

- io: fix a potential deadlock when shutting down the I/O driver ([#2903]).
- sync: `RwLockWriteGuard::downgrade()` bug ([#2957]).

### Added

- io: `AsyncFd` for receiving readiness events on raw FDs ([#2903]).
- net: `poll_*` function on `UdpSocket` ([#2981]).
- net: `UdpSocket::take_error()` ([#3051]).
- sync: `oneshot::Sender::poll_closed()` ([#3032]).

[#2903]: https://github.com/tokio-rs/tokio/pull/2903
[#2957]: https://github.com/tokio-rs/tokio/pull/2957
[#2981]: https://github.com/tokio-rs/tokio/pull/2981
[#3032]: https://github.com/tokio-rs/tokio/pull/3032
[#3051]: https://github.com/tokio-rs/tokio/pull/3051

# 0.3.1 (October 21, 2020)

This release fixes an use-after-free in the IO driver. Additionally, the `read_buf`
and `write_buf` methods have been added back to the IO traits, as the bytes crate
is now on track to reach version 1.0 together with Tokio.

### Fixed

- net: fix use-after-free ([#3019]).
- fs: ensure buffered data is written on shutdown ([#3009]).

### Added

- io: `copy_buf()` ([#2884]).
- io: `AsyncReadExt::read_buf()`, `AsyncReadExt::write_buf()` for working with
  `Buf`/`BufMut` ([#3003]).
- rt: `Runtime::spawn_blocking()` ([#2980]).
- sync: `watch::Sender::is_closed()` ([#2991]).

[#2884]: https://github.com/tokio-rs/tokio/pull/2884
[#2980]: https://github.com/tokio-rs/tokio/pull/2980
[#2991]: https://github.com/tokio-rs/tokio/pull/2991
[#3003]: https://github.com/tokio-rs/tokio/pull/3003
[#3009]: https://github.com/tokio-rs/tokio/pull/3009
[#3019]: https://github.com/tokio-rs/tokio/pull/3019

# 0.3.0 (October 15, 2020)

This represents a 1.0 beta release. APIs are polished and future-proofed. APIs
not included for 1.0 stabilization have been removed.

Biggest changes are:

- I/O driver internal rewrite. The windows implementation includes significant
  changes.
- Runtime API is polished, especially with how it interacts with feature flag
  combinations.
- Feature flags are simplified
  - `rt-core` and `rt-util` are combined to `rt`
  - `rt-threaded` is renamed to `rt-multi-thread` to match builder API
  - `tcp`, `udp`, `uds`, `dns` are combined to `net`.
  - `parking_lot` is included with `full`

### Changes

- meta: Minimum supported Rust version is now 1.45.
- io: `AsyncRead` trait now takes `ReadBuf` in order to safely handle reading
  into uninitialized memory ([#2758]).
- io: Internal I/O driver storage is now able to compact ([#2757]).
- rt: `Runtime::block_on` now takes `&self` ([#2782]).
- sync: `watch` reworked to decouple receiving a change notification from
  receiving the value ([#2814], [#2806]).
- sync: `Notify::notify` is renamed to `notify_one` ([#2822]).
- process: `Child::kill` is now an `async fn` that cleans zombies ([#2823]).
- sync: use `const fn` constructors as possible ([#2833], [#2790])
- signal: reduce cross-thread notification ([#2835]).
- net: tcp,udp,uds types support operations with `&self` ([#2828], [#2919], [#2934]).
- sync: blocking `mpsc` channel supports `send` with `&self` ([#2861]).
- time: rename `delay_for` and `delay_until` to `sleep` and `sleep_until` ([#2826]).
- io: upgrade to `mio` 0.7 ([#2893]).
- io: `AsyncSeek` trait is tweaked ([#2885]).
- fs: `File` operations take `&self` ([#2930]).
- rt: runtime API, and `#[tokio::main]` macro polish ([#2876])
- rt: `Runtime::enter` uses an RAII guard instead of a closure ([#2954]).
- net: the `from_std` function on all sockets no longer sets socket into non-blocking mode ([#2893])

### Added

- sync: `map` function to lock guards ([#2445]).
- sync: `blocking_recv` and `blocking_send` fns to `mpsc` for use outside of Tokio ([#2685]).
- rt: `Builder::thread_name_fn` for configuring thread names ([#1921]).
- fs: impl `FromRawFd` and `FromRawHandle` for `File` ([#2792]).
- process: `Child::wait` and `Child::try_wait` ([#2796]).
- rt: support configuring thread keep-alive duration ([#2809]).
- rt: `task::JoinHandle::abort` forcibly cancels a spawned task ([#2474]).
- sync: `RwLock` write guard to read guard downgrading ([#2733]).
- net: add `poll_*` functions that take `&self` to all net types ([#2845])
- sync: `get_mut()` for `Mutex`, `RwLock` ([#2856]).
- sync: `mpsc::Sender::closed()` waits for `Receiver` half to close ([#2840]).
- sync: `mpsc::Sender::is_closed()` returns true if `Receiver` half is closed ([#2726]).
- stream: `iter` and `iter_mut` to `StreamMap` ([#2890]).
- net: implement `AsRawSocket` on windows ([#2911]).
- net: `TcpSocket` creates a socket without binding or listening ([#2920]).

### Removed

- io: vectored ops are removed from `AsyncRead`, `AsyncWrite` traits ([#2882]).
- io: `mio` is removed from the public API. `PollEvented` and` Registration` are
  removed ([#2893]).
- io: remove `bytes` from public API. `Buf` and `BufMut` implementation are
  removed ([#2908]).
- time: `DelayQueue` is moved to `tokio-util` ([#2897]).

### Fixed

- io: `stdout` and `stderr` buffering on windows ([#2734]).

[#1921]: https://github.com/tokio-rs/tokio/pull/1921
[#2445]: https://github.com/tokio-rs/tokio/pull/2445
[#2474]: https://github.com/tokio-rs/tokio/pull/2474
[#2685]: https://github.com/tokio-rs/tokio/pull/2685
[#2726]: https://github.com/tokio-rs/tokio/pull/2726
[#2733]: https://github.com/tokio-rs/tokio/pull/2733
[#2734]: https://github.com/tokio-rs/tokio/pull/2734
[#2757]: https://github.com/tokio-rs/tokio/pull/2757
[#2758]: https://github.com/tokio-rs/tokio/pull/2758
[#2782]: https://github.com/tokio-rs/tokio/pull/2782
[#2790]: https://github.com/tokio-rs/tokio/pull/2790
[#2792]: https://github.com/tokio-rs/tokio/pull/2792
[#2796]: https://github.com/tokio-rs/tokio/pull/2796
[#2806]: https://github.com/tokio-rs/tokio/pull/2806
[#2809]: https://github.com/tokio-rs/tokio/pull/2809
[#2814]: https://github.com/tokio-rs/tokio/pull/2814
[#2822]: https://github.com/tokio-rs/tokio/pull/2822
[#2823]: https://github.com/tokio-rs/tokio/pull/2823
[#2826]: https://github.com/tokio-rs/tokio/pull/2826
[#2828]: https://github.com/tokio-rs/tokio/pull/2828
[#2833]: https://github.com/tokio-rs/tokio/pull/2833
[#2835]: https://github.com/tokio-rs/tokio/pull/2835
[#2840]: https://github.com/tokio-rs/tokio/pull/2840
[#2845]: https://github.com/tokio-rs/tokio/pull/2845
[#2856]: https://github.com/tokio-rs/tokio/pull/2856
[#2861]: https://github.com/tokio-rs/tokio/pull/2861
[#2876]: https://github.com/tokio-rs/tokio/pull/2876
[#2882]: https://github.com/tokio-rs/tokio/pull/2882
[#2885]: https://github.com/tokio-rs/tokio/pull/2885
[#2890]: https://github.com/tokio-rs/tokio/pull/2890
[#2893]: https://github.com/tokio-rs/tokio/pull/2893
[#2897]: https://github.com/tokio-rs/tokio/pull/2897
[#2908]: https://github.com/tokio-rs/tokio/pull/2908
[#2911]: https://github.com/tokio-rs/tokio/pull/2911
[#2919]: https://github.com/tokio-rs/tokio/pull/2919
[#2920]: https://github.com/tokio-rs/tokio/pull/2920
[#2930]: https://github.com/tokio-rs/tokio/pull/2930
[#2934]: https://github.com/tokio-rs/tokio/pull/2934
[#2954]: https://github.com/tokio-rs/tokio/pull/2954

# 0.2.22 (July 21, 2020)

### Fixes

- docs: misc improvements ([#2572], [#2658], [#2663], [#2656], [#2647], [#2630], [#2487], [#2621],
  [#2624], [#2600], [#2623], [#2622], [#2577], [#2569], [#2589], [#2575], [#2540], [#2564], [#2567],
  [#2520], [#2521], [#2493])
- rt: allow calls to `block_on` inside calls to `block_in_place` that are
  themselves inside `block_on` ([#2645])
- net: fix non-portable behavior when dropping `TcpStream` `OwnedWriteHalf` ([#2597])
- io: improve stack usage by allocating large buffers on directly on the heap
  ([#2634])
- io: fix unsound pin projection in `AsyncReadExt::read_buf` and
  `AsyncWriteExt::write_buf` ([#2612])
- io: fix unnecessary zeroing for `AsyncRead` implementors ([#2525])
- io: Fix `BufReader` not correctly forwarding `poll_write_buf` ([#2654])
- io: fix panic in `AsyncReadExt::read_line` ([#2541])

### Changes

- coop: returning `Poll::Pending` no longer decrements the task budget ([#2549])

### Added

- io: little-endian variants of `AsyncReadExt` and `AsyncWriteExt` methods
  ([#1915])
- task: add [`tracing`] instrumentation to spawned tasks ([#2655])
- sync: allow unsized types in `Mutex` and `RwLock` (via `default` constructors)
  ([#2615])
- net: add `ToSocketAddrs` implementation for `&[SocketAddr]` ([#2604])
- fs: add `OpenOptionsExt` for `OpenOptions` ([#2515])
- fs: add `DirBuilder` ([#2524])

[`tracing`]: https://crates.io/crates/tracing
[#1915]: https://github.com/tokio-rs/tokio/pull/1915
[#2487]: https://github.com/tokio-rs/tokio/pull/2487
[#2493]: https://github.com/tokio-rs/tokio/pull/2493
[#2515]: https://github.com/tokio-rs/tokio/pull/2515
[#2520]: https://github.com/tokio-rs/tokio/pull/2520
[#2521]: https://github.com/tokio-rs/tokio/pull/2521
[#2524]: https://github.com/tokio-rs/tokio/pull/2524
[#2525]: https://github.com/tokio-rs/tokio/pull/2525
[#2540]: https://github.com/tokio-rs/tokio/pull/2540
[#2541]: https://github.com/tokio-rs/tokio/pull/2541
[#2549]: https://github.com/tokio-rs/tokio/pull/2549
[#2564]: https://github.com/tokio-rs/tokio/pull/2564
[#2567]: https://github.com/tokio-rs/tokio/pull/2567
[#2569]: https://github.com/tokio-rs/tokio/pull/2569
[#2572]: https://github.com/tokio-rs/tokio/pull/2572
[#2575]: https://github.com/tokio-rs/tokio/pull/2575
[#2577]: https://github.com/tokio-rs/tokio/pull/2577
[#2589]: https://github.com/tokio-rs/tokio/pull/2589
[#2597]: https://github.com/tokio-rs/tokio/pull/2597
[#2600]: https://github.com/tokio-rs/tokio/pull/2600
[#2604]: https://github.com/tokio-rs/tokio/pull/2604
[#2612]: https://github.com/tokio-rs/tokio/pull/2612
[#2615]: https://github.com/tokio-rs/tokio/pull/2615
[#2621]: https://github.com/tokio-rs/tokio/pull/2621
[#2622]: https://github.com/tokio-rs/tokio/pull/2622
[#2623]: https://github.com/tokio-rs/tokio/pull/2623
[#2624]: https://github.com/tokio-rs/tokio/pull/2624
[#2630]: https://github.com/tokio-rs/tokio/pull/2630
[#2634]: https://github.com/tokio-rs/tokio/pull/2634
[#2645]: https://github.com/tokio-rs/tokio/pull/2645
[#2647]: https://github.com/tokio-rs/tokio/pull/2647
[#2654]: https://github.com/tokio-rs/tokio/pull/2654
[#2655]: https://github.com/tokio-rs/tokio/pull/2655
[#2656]: https://github.com/tokio-rs/tokio/pull/2656
[#2658]: https://github.com/tokio-rs/tokio/pull/2658
[#2663]: https://github.com/tokio-rs/tokio/pull/2663

# 0.2.21 (May 13, 2020)

### Fixes

- macros: disambiguate built-in `#[test]` attribute in macro expansion ([#2503])
- rt: `LocalSet` and task budgeting ([#2462]).
- rt: task budgeting with `block_in_place` ([#2502]).
- sync: release `broadcast` channel memory without sending a value ([#2509]).
- time: notify when resetting a `Delay` to a time in the past ([#2290])

### Added

- io: `get_mut`, `get_ref`, and `into_inner` to `Lines` ([#2450]).
- io: `mio::Ready` argument to `PollEvented` ([#2419]).
- os: illumos support ([#2486]).
- rt: `Handle::spawn_blocking` ([#2501]).
- sync: `OwnedMutexGuard` for `Arc<Mutex<T>>` ([#2455]).

[#2290]: https://github.com/tokio-rs/tokio/pull/2290
[#2419]: https://github.com/tokio-rs/tokio/pull/2419
[#2450]: https://github.com/tokio-rs/tokio/pull/2450
[#2455]: https://github.com/tokio-rs/tokio/pull/2455
[#2462]: https://github.com/tokio-rs/tokio/pull/2462
[#2486]: https://github.com/tokio-rs/tokio/pull/2486
[#2501]: https://github.com/tokio-rs/tokio/pull/2501
[#2502]: https://github.com/tokio-rs/tokio/pull/2502
[#2503]: https://github.com/tokio-rs/tokio/pull/2503
[#2509]: https://github.com/tokio-rs/tokio/pull/2509

# 0.2.20 (April 28, 2020)

### Fixes

- sync: `broadcast` closing the channel no longer requires capacity ([#2448]).
- rt: regression when configuring runtime with `max_threads` less than number of CPUs ([#2457]).

[#2448]: https://github.com/tokio-rs/tokio/pull/2448
[#2457]: https://github.com/tokio-rs/tokio/pull/2457

# 0.2.19 (April 24, 2020)

### Fixes

- docs: misc improvements ([#2400], [#2405], [#2414], [#2420], [#2423], [#2426], [#2427], [#2434], [#2436], [#2440]).
- rt: support `block_in_place` in more contexts ([#2409], [#2410]).
- stream: no panic in `merge()` and `chain()` when using `size_hint()` ([#2430]).
- task: include visibility modifier when defining a task-local ([#2416]).

### Added

- rt: `runtime::Handle::block_on` ([#2437]).
- sync: owned `Semaphore` permit ([#2421]).
- tcp: owned split ([#2270]).

[#2270]: https://github.com/tokio-rs/tokio/pull/2270
[#2400]: https://github.com/tokio-rs/tokio/pull/2400
[#2405]: https://github.com/tokio-rs/tokio/pull/2405
[#2409]: https://github.com/tokio-rs/tokio/pull/2409
[#2410]: https://github.com/tokio-rs/tokio/pull/2410
[#2414]: https://github.com/tokio-rs/tokio/pull/2414
[#2416]: https://github.com/tokio-rs/tokio/pull/2416
[#2420]: https://github.com/tokio-rs/tokio/pull/2420
[#2421]: https://github.com/tokio-rs/tokio/pull/2421
[#2423]: https://github.com/tokio-rs/tokio/pull/2423
[#2426]: https://github.com/tokio-rs/tokio/pull/2426
[#2427]: https://github.com/tokio-rs/tokio/pull/2427
[#2430]: https://github.com/tokio-rs/tokio/pull/2430
[#2434]: https://github.com/tokio-rs/tokio/pull/2434
[#2436]: https://github.com/tokio-rs/tokio/pull/2436
[#2437]: https://github.com/tokio-rs/tokio/pull/2437
[#2440]: https://github.com/tokio-rs/tokio/pull/2440

# 0.2.18 (April 12, 2020)

### Fixes

- task: `LocalSet` was incorrectly marked as `Send` ([#2398])
- io: correctly report `WriteZero` failure in `write_int` ([#2334])

[#2334]: https://github.com/tokio-rs/tokio/pull/2334
[#2398]: https://github.com/tokio-rs/tokio/pull/2398

# 0.2.17 (April 9, 2020)

### Fixes

- rt: bug in work-stealing queue ([#2387])

### Changes

- rt: threadpool uses logical CPU count instead of physical by default ([#2391])

[#2387]: https://github.com/tokio-rs/tokio/pull/2387
[#2391]: https://github.com/tokio-rs/tokio/pull/2391

# 0.2.16 (April 3, 2020)

### Fixes

- sync: fix a regression where `Mutex`, `Semaphore`, and `RwLock` futures no
  longer implement `Sync` ([#2375])
- fs: fix `fs::copy` not copying file permissions ([#2354])

### Added

- time: added `deadline` method to `delay_queue::Expired` ([#2300])
- io: added `StreamReader` ([#2052])

[#2052]: https://github.com/tokio-rs/tokio/pull/2052
[#2300]: https://github.com/tokio-rs/tokio/pull/2300
[#2354]: https://github.com/tokio-rs/tokio/pull/2354
[#2375]: https://github.com/tokio-rs/tokio/pull/2375

# 0.2.15 (April 2, 2020)

### Fixes

- rt: fix queue regression ([#2362]).

### Added

- sync: Add disarm to `mpsc::Sender` ([#2358]).

[#2358]: https://github.com/tokio-rs/tokio/pull/2358
[#2362]: https://github.com/tokio-rs/tokio/pull/2362

# 0.2.14 (April 1, 2020)

### Fixes

- rt: concurrency bug in scheduler ([#2273]).
- rt: concurrency bug with shell runtime ([#2333]).
- test-util: correct pause/resume of time ([#2253]).
- time: `DelayQueue` correct wakeup after `insert` ([#2285]).

### Added

- io: impl `RawFd`, `AsRawHandle` for std io types ([#2335]).
- rt: automatic cooperative task yielding ([#2160], [#2343], [#2349]).
- sync: `RwLock::into_inner` ([#2321]).

### Changed

- sync: semaphore, mutex internals rewritten to avoid allocations ([#2325]).

[#2160]: https://github.com/tokio-rs/tokio/pull/2160
[#2253]: https://github.com/tokio-rs/tokio/pull/2253
[#2273]: https://github.com/tokio-rs/tokio/pull/2273
[#2285]: https://github.com/tokio-rs/tokio/pull/2285
[#2321]: https://github.com/tokio-rs/tokio/pull/2321
[#2325]: https://github.com/tokio-rs/tokio/pull/2325
[#2333]: https://github.com/tokio-rs/tokio/pull/2333
[#2335]: https://github.com/tokio-rs/tokio/pull/2335
[#2343]: https://github.com/tokio-rs/tokio/pull/2343
[#2349]: https://github.com/tokio-rs/tokio/pull/2349

# 0.2.13 (February 28, 2020)

### Fixes

- macros: unresolved import in `pin!` ([#2281]).

[#2281]: https://github.com/tokio-rs/tokio/pull/2281

# 0.2.12 (February 27, 2020)

### Fixes

- net: `UnixStream::poll_shutdown` should call `shutdown(Write)` ([#2245]).
- process: Wake up read and write on `EPOLLERR` ([#2218]).
- rt: potential deadlock when using `block_in_place` and shutting down the
  runtime ([#2119]).
- rt: only detect number of CPUs if `core_threads` not specified ([#2238]).
- sync: reduce `watch::Receiver` struct size ([#2191]).
- time: succeed when setting delay of `$MAX-1` ([#2184]).
- time: avoid having to poll `DelayQueue` after inserting new delay ([#2217]).

### Added

- macros: `pin!` variant that assigns to identifier and pins ([#2274]).
- net: impl `Stream` for `Listener` types ([#2275]).
- rt: `Runtime::shutdown_timeout` waits for runtime to shutdown for specified
  duration ([#2186]).
- stream: `StreamMap` merges streams and can insert / remove streams at
  runtime ([#2185]).
- stream: `StreamExt::skip()` skips a fixed number of items ([#2204]).
- stream: `StreamExt::skip_while()` skips items based on a predicate ([#2205]).
- sync: `Notify` provides basic `async` / `await` task notification ([#2210]).
- sync: `Mutex::into_inner` retrieves guarded data ([#2250]).
- sync: `mpsc::Sender::send_timeout` sends, waiting for up to specified duration
  for channel capacity ([#2227]).
- time: impl `Ord` and `Hash` for `Instant` ([#2239]).

[#2119]: https://github.com/tokio-rs/tokio/pull/2119
[#2184]: https://github.com/tokio-rs/tokio/pull/2184
[#2185]: https://github.com/tokio-rs/tokio/pull/2185
[#2186]: https://github.com/tokio-rs/tokio/pull/2186
[#2191]: https://github.com/tokio-rs/tokio/pull/2191
[#2204]: https://github.com/tokio-rs/tokio/pull/2204
[#2205]: https://github.com/tokio-rs/tokio/pull/2205
[#2210]: https://github.com/tokio-rs/tokio/pull/2210
[#2217]: https://github.com/tokio-rs/tokio/pull/2217
[#2218]: https://github.com/tokio-rs/tokio/pull/2218
[#2227]: https://github.com/tokio-rs/tokio/pull/2227
[#2238]: https://github.com/tokio-rs/tokio/pull/2238
[#2239]: https://github.com/tokio-rs/tokio/pull/2239
[#2245]: https://github.com/tokio-rs/tokio/pull/2245
[#2250]: https://github.com/tokio-rs/tokio/pull/2250
[#2274]: https://github.com/tokio-rs/tokio/pull/2274
[#2275]: https://github.com/tokio-rs/tokio/pull/2275

# 0.2.11 (January 27, 2020)

### Fixes

- docs: misc fixes and tweaks ([#2155], [#2103], [#2027], [#2167], [#2175]).
- macros: handle generics in `#[tokio::main]` method ([#2177]).
- sync: `broadcast` potential lost notifications ([#2135]).
- rt: improve "no runtime" panic messages ([#2145]).

### Added

- optional support for using `parking_lot` internally ([#2164]).
- fs: `fs::copy`, an async version of `std::fs::copy` ([#2079]).
- macros: `select!` waits for the first branch to complete ([#2152]).
- macros: `join!` waits for all branches to complete ([#2158]).
- macros: `try_join!` waits for all branches to complete or the first error ([#2169]).
- macros: `pin!` pins a value to the stack ([#2163]).
- net: `ReadHalf::poll()` and `ReadHalf::poll_peak` ([#2151])
- stream: `StreamExt::timeout()` sets a per-item max duration ([#2149]).
- stream: `StreamExt::fold()` applies a function, producing a single value. ([#2122]).
- sync: impl `Eq`, `PartialEq` for `oneshot::RecvError` ([#2168]).
- task: methods for inspecting the `JoinError` cause ([#2051]).

[#2027]: https://github.com/tokio-rs/tokio/pull/2027
[#2051]: https://github.com/tokio-rs/tokio/pull/2051
[#2079]: https://github.com/tokio-rs/tokio/pull/2079
[#2103]: https://github.com/tokio-rs/tokio/pull/2103
[#2122]: https://github.com/tokio-rs/tokio/pull/2122
[#2135]: https://github.com/tokio-rs/tokio/pull/2135
[#2145]: https://github.com/tokio-rs/tokio/pull/2145
[#2149]: https://github.com/tokio-rs/tokio/pull/2149
[#2151]: https://github.com/tokio-rs/tokio/pull/2151
[#2152]: https://github.com/tokio-rs/tokio/pull/2152
[#2155]: https://github.com/tokio-rs/tokio/pull/2155
[#2158]: https://github.com/tokio-rs/tokio/pull/2158
[#2163]: https://github.com/tokio-rs/tokio/pull/2163
[#2164]: https://github.com/tokio-rs/tokio/pull/2164
[#2167]: https://github.com/tokio-rs/tokio/pull/2167
[#2168]: https://github.com/tokio-rs/tokio/pull/2168
[#2169]: https://github.com/tokio-rs/tokio/pull/2169
[#2175]: https://github.com/tokio-rs/tokio/pull/2175
[#2177]: https://github.com/tokio-rs/tokio/pull/2177

# 0.2.10 (January 21, 2020)

### Fixes

- `#[tokio::main]` when `rt-core` feature flag is not enabled ([#2139]).
- remove `AsyncBufRead` from `BufStream` impl block ([#2108]).
- potential undefined behavior when implementing `AsyncRead` incorrectly ([#2030]).

### Added

- `BufStream::with_capacity` ([#2125]).
- impl `From` and `Default` for `RwLock` ([#2089]).
- `io::ReadHalf::is_pair_of` checks if provided `WriteHalf` is for the same
  underlying object ([#1762], [#2144]).
- `runtime::Handle::try_current()` returns a handle to the current runtime ([#2118]).
- `stream::empty()` returns an immediately ready empty stream ([#2092]).
- `stream::once(val)` returns a stream that yields a single value: `val` ([#2094]).
- `stream::pending()` returns a stream that never becomes ready ([#2092]).
- `StreamExt::chain()` sequences a second stream after the first completes ([#2093]).
- `StreamExt::collect()` transform a stream into a collection ([#2109]).
- `StreamExt::fuse` ends the stream after the first `None` ([#2085]).
- `StreamExt::merge` combines two streams, yielding values as they become ready ([#2091]).
- Task-local storage ([#2126]).

[#1762]: https://github.com/tokio-rs/tokio/pull/1762
[#2030]: https://github.com/tokio-rs/tokio/pull/2030
[#2085]: https://github.com/tokio-rs/tokio/pull/2085
[#2089]: https://github.com/tokio-rs/tokio/pull/2089
[#2091]: https://github.com/tokio-rs/tokio/pull/2091
[#2092]: https://github.com/tokio-rs/tokio/pull/2092
[#2093]: https://github.com/tokio-rs/tokio/pull/2093
[#2094]: https://github.com/tokio-rs/tokio/pull/2094
[#2108]: https://github.com/tokio-rs/tokio/pull/2108
[#2109]: https://github.com/tokio-rs/tokio/pull/2109
[#2118]: https://github.com/tokio-rs/tokio/pull/2118
[#2125]: https://github.com/tokio-rs/tokio/pull/2125
[#2126]: https://github.com/tokio-rs/tokio/pull/2126
[#2139]: https://github.com/tokio-rs/tokio/pull/2139
[#2144]: https://github.com/tokio-rs/tokio/pull/2144

# 0.2.9 (January 9, 2020)

### Fixes

- `AsyncSeek` impl for `File` ([#1986]).
- rt: shutdown deadlock in `threaded_scheduler` ([#2074], [#2082]).
- rt: memory ordering when dropping `JoinHandle` ([#2044]).
- docs: misc API documentation fixes and improvements.

[#1986]: https://github.com/tokio-rs/tokio/pull/1986
[#2044]: https://github.com/tokio-rs/tokio/pull/2044
[#2074]: https://github.com/tokio-rs/tokio/pull/2074
[#2082]: https://github.com/tokio-rs/tokio/pull/2082

# 0.2.8 (January 7, 2020)

### Fixes

- depend on new version of `tokio-macros`.

# 0.2.7 (January 7, 2020)

### Fixes

- potential deadlock when dropping `basic_scheduler` Runtime.
- calling `spawn_blocking` from within a `spawn_blocking` ([#2006]).
- storing a `Runtime` instance in a thread-local ([#2011]).
- miscellaneous documentation fixes.
- rt: fix `Waker::will_wake` to return true when tasks match ([#2045]).
- test-util: `time::advance` runs pending tasks before changing the time ([#2059]).

### Added

- `net::lookup_host` maps a `T: ToSocketAddrs` to a stream of `SocketAddrs` ([#1870]).
- `process::Child` fields are made public to match `std` ([#2014]).
- impl `Stream` for `sync::broadcast::Receiver` ([#2012]).
- `sync::RwLock` provides an asynchronous read-write lock ([#1699]).
- `runtime::Handle::current` returns the handle for the current runtime ([#2040]).
- `StreamExt::filter` filters stream values according to a predicate ([#2001]).
- `StreamExt::filter_map` simultaneously filter and map stream values ([#2001]).
- `StreamExt::try_next` convenience for streams of `Result<T, E>` ([#2005]).
- `StreamExt::take` limits a stream to a specified number of values ([#2025]).
- `StreamExt::take_while` limits a stream based on a predicate ([#2029]).
- `StreamExt::all` tests if every element of the stream matches a predicate ([#2035]).
- `StreamExt::any` tests if any element of the stream matches a predicate ([#2034]).
- `task::LocalSet.await` runs spawned tasks until the set is idle ([#1971]).
- `time::DelayQueue::len` returns the number entries in the queue ([#1755]).
- expose runtime options from the `#[tokio::main]` and `#[tokio::test]` ([#2022]).

[#1699]: https://github.com/tokio-rs/tokio/pull/1699
[#1755]: https://github.com/tokio-rs/tokio/pull/1755
[#1870]: https://github.com/tokio-rs/tokio/pull/1870
[#1971]: https://github.com/tokio-rs/tokio/pull/1971
[#2001]: https://github.com/tokio-rs/tokio/pull/2001
[#2005]: https://github.com/tokio-rs/tokio/pull/2005
[#2006]: https://github.com/tokio-rs/tokio/pull/2006
[#2011]: https://github.com/tokio-rs/tokio/pull/2011
[#2012]: https://github.com/tokio-rs/tokio/pull/2012
[#2014]: https://github.com/tokio-rs/tokio/pull/2014
[#2022]: https://github.com/tokio-rs/tokio/pull/2022
[#2025]: https://github.com/tokio-rs/tokio/pull/2025
[#2029]: https://github.com/tokio-rs/tokio/pull/2029
[#2034]: https://github.com/tokio-rs/tokio/pull/2034
[#2035]: https://github.com/tokio-rs/tokio/pull/2035
[#2040]: https://github.com/tokio-rs/tokio/pull/2040
[#2045]: https://github.com/tokio-rs/tokio/pull/2045
[#2059]: https://github.com/tokio-rs/tokio/pull/2059

# 0.2.6 (December 19, 2019)

### Fixes

- `fs::File::seek` API regression ([#1991]).

[#1991]: https://github.com/tokio-rs/tokio/pull/1991

# 0.2.5 (December 18, 2019)

### Added

- `io::AsyncSeek` trait ([#1924]).
- `Mutex::try_lock` ([#1939])
- `mpsc::Receiver::try_recv` and `mpsc::UnboundedReceiver::try_recv` ([#1939]).
- `writev` support for `TcpStream` ([#1956]).
- `time::throttle` for throttling streams ([#1949]).
- implement `Stream` for `time::DelayQueue` ([#1975]).
- `sync::broadcast` provides a fan-out channel ([#1943]).
- `sync::Semaphore` provides an async semaphore ([#1973]).
- `stream::StreamExt` provides stream utilities ([#1962]).

### Fixes

- deadlock risk while shutting down the runtime ([#1972]).
- panic while shutting down the runtime ([#1978]).
- `sync::MutexGuard` debug output ([#1961]).
- misc doc improvements ([#1933], [#1934], [#1940], [#1942]).

### Changes

- runtime threads are configured with `runtime::Builder::core_threads` and
  `runtime::Builder::max_threads`. `runtime::Builder::num_threads` is
  deprecated ([#1977]).

[#1924]: https://github.com/tokio-rs/tokio/pull/1924
[#1933]: https://github.com/tokio-rs/tokio/pull/1933
[#1934]: https://github.com/tokio-rs/tokio/pull/1934
[#1939]: https://github.com/tokio-rs/tokio/pull/1939
[#1940]: https://github.com/tokio-rs/tokio/pull/1940
[#1942]: https://github.com/tokio-rs/tokio/pull/1942
[#1943]: https://github.com/tokio-rs/tokio/pull/1943
[#1949]: https://github.com/tokio-rs/tokio/pull/1949
[#1956]: https://github.com/tokio-rs/tokio/pull/1956
[#1961]: https://github.com/tokio-rs/tokio/pull/1961
[#1962]: https://github.com/tokio-rs/tokio/pull/1962
[#1972]: https://github.com/tokio-rs/tokio/pull/1972
[#1973]: https://github.com/tokio-rs/tokio/pull/1973
[#1975]: https://github.com/tokio-rs/tokio/pull/1975
[#1977]: https://github.com/tokio-rs/tokio/pull/1977
[#1978]: https://github.com/tokio-rs/tokio/pull/1978

# 0.2.4 (December 6, 2019)

### Fixes

- `sync::Mutex` deadlock when `lock()` future is dropped early ([#1898]).

[#1898]: https://github.com/tokio-rs/tokio/pull/1898

# 0.2.3 (December 6, 2019)

### Added

- read / write integers using `AsyncReadExt` and `AsyncWriteExt` ([#1863]).
- `read_buf` / `write_buf` for reading / writing `Buf` / `BufMut` ([#1881]).
- `TcpStream::poll_peek` - pollable API for performing TCP peek ([#1864]).
- `sync::oneshot::error::TryRecvError` provides variants to detect the error
  kind ([#1874]).
- `LocalSet::block_on` accepts `!'static` task ([#1882]).
- `task::JoinError` is now `Sync` ([#1888]).
- impl conversions between `tokio::time::Instant` and
  `std::time::Instant` ([#1904]).

### Fixes

- calling `spawn_blocking` after runtime shutdown ([#1875]).
- `LocalSet` drop infinite loop ([#1892]).
- `LocalSet` hang under load ([#1905]).
- improved documentation ([#1865], [#1866], [#1868], [#1874], [#1876], [#1911]).

[#1863]: https://github.com/tokio-rs/tokio/pull/1863
[#1864]: https://github.com/tokio-rs/tokio/pull/1864
[#1865]: https://github.com/tokio-rs/tokio/pull/1865
[#1866]: https://github.com/tokio-rs/tokio/pull/1866
[#1868]: https://github.com/tokio-rs/tokio/pull/1868
[#1874]: https://github.com/tokio-rs/tokio/pull/1874
[#1875]: https://github.com/tokio-rs/tokio/pull/1875
[#1876]: https://github.com/tokio-rs/tokio/pull/1876
[#1881]: https://github.com/tokio-rs/tokio/pull/1881
[#1882]: https://github.com/tokio-rs/tokio/pull/1882
[#1888]: https://github.com/tokio-rs/tokio/pull/1888
[#1892]: https://github.com/tokio-rs/tokio/pull/1892
[#1904]: https://github.com/tokio-rs/tokio/pull/1904
[#1905]: https://github.com/tokio-rs/tokio/pull/1905
[#1911]: https://github.com/tokio-rs/tokio/pull/1911

# 0.2.2 (November 29, 2019)

### Fixes

- scheduling with `basic_scheduler` ([#1861]).
- update `spawn` panic message to specify that a task scheduler is required ([#1839]).
- API docs example for `runtime::Builder` to include a task scheduler ([#1841]).
- general documentation ([#1834]).
- building on illumos/solaris ([#1772]).
- panic when dropping `LocalSet` ([#1843]).
- API docs mention the required Cargo features for `Builder::{basic, threaded}_scheduler` ([#1858]).

### Added

- impl `Stream` for `signal::unix::Signal` ([#1849]).
- API docs for platform specific behavior of `signal::ctrl_c` and `signal::unix::Signal` ([#1854]).
- API docs for `signal::unix::Signal::{recv, poll_recv}` and `signal::windows::CtrlBreak::{recv, poll_recv}` ([#1854]).
- `File::into_std` and `File::try_into_std` methods ([#1856]).

[#1772]: https://github.com/tokio-rs/tokio/pull/1772
[#1834]: https://github.com/tokio-rs/tokio/pull/1834
[#1839]: https://github.com/tokio-rs/tokio/pull/1839
[#1841]: https://github.com/tokio-rs/tokio/pull/1841
[#1843]: https://github.com/tokio-rs/tokio/pull/1843
[#1849]: https://github.com/tokio-rs/tokio/pull/1849
[#1854]: https://github.com/tokio-rs/tokio/pull/1854
[#1856]: https://github.com/tokio-rs/tokio/pull/1856
[#1858]: https://github.com/tokio-rs/tokio/pull/1858
[#1861]: https://github.com/tokio-rs/tokio/pull/1861

# 0.2.1 (November 26, 2019)

### Fixes

- API docs for `TcpListener::incoming`, `UnixListener::incoming` ([#1831]).

### Added

- `tokio::task::LocalSet` provides a strategy for spawning `!Send` tasks ([#1733]).
- export `tokio::time::Elapsed` ([#1826]).
- impl `AsRawFd`, `AsRawHandle` for `tokio::fs::File` ([#1827]).

[#1733]: https://github.com/tokio-rs/tokio/pull/1733
[#1826]: https://github.com/tokio-rs/tokio/pull/1826
[#1827]: https://github.com/tokio-rs/tokio/pull/1827
[#1831]: https://github.com/tokio-rs/tokio/pull/1831

# 0.2.0 (November 26, 2019)

A major breaking change. Most implementation and APIs have changed one way or
another. This changelog entry contains a highlight

### Changed

- APIs are updated to use `async / await`.
- most `tokio-*` crates are collapsed into this crate.
- Scheduler is rewritten.
- `tokio::spawn` returns a `JoinHandle`.
- A single I/O / timer is used per runtime.
- I/O driver uses a concurrent slab for allocating state.
- components are made available via feature flag.
- Use `bytes` 0.5
- `tokio::codec` is moved to `tokio-util`.

### Removed

- Standalone `timer` and `net` drivers are removed, use `Runtime` instead
- `current_thread` runtime is removed, use `tokio::runtime::Runtime` with
  `basic_scheduler` instead.

# 0.1.21 (May 30, 2019)

### Changed

- Bump `tokio-trace-core` version to 0.2 ([#1111]).

[#1111]: https://github.com/tokio-rs/tokio/pull/1111

# 0.1.20 (May 14, 2019)

### Added

- `tokio::runtime::Builder::panic_handler` allows configuring handling
  panics on the runtime ([#1055]).

[#1055]: https://github.com/tokio-rs/tokio/pull/1055

# 0.1.19 (April 22, 2019)

### Added

- Re-export `tokio::sync::Mutex` primitive ([#964]).

[#964]: https://github.com/tokio-rs/tokio/pull/964

# 0.1.18 (March 22, 2019)

### Added

- `TypedExecutor` re-export and implementations ([#993]).

[#993]: https://github.com/tokio-rs/tokio/pull/993

# 0.1.17 (March 13, 2019)

### Added

- Propagate trace subscriber in the runtime ([#966]).

[#966]: https://github.com/tokio-rs/tokio/pull/966

# 0.1.16 (March 1, 2019)

### Fixed

- async-await: track latest nightly changes ([#940]).

### Added

- `sync::Watch`, a single value broadcast channel ([#922]).
- Async equivalent of read / write file helpers being added to `std` ([#896]).

[#896]: https://github.com/tokio-rs/tokio/pull/896
[#922]: https://github.com/tokio-rs/tokio/pull/922
[#940]: https://github.com/tokio-rs/tokio/pull/940

# 0.1.15 (January 24, 2019)

### Added

- Re-export tokio-sync APIs ([#839]).
- Stream enumerate combinator ([#832]).

[#832]: https://github.com/tokio-rs/tokio/pull/832
[#839]: https://github.com/tokio-rs/tokio/pull/839

# 0.1.14 (January 6, 2019)

- Use feature flags to break up the crate, allowing users to pick & choose
  components ([#808]).
- Export `UnixDatagram` and `UnixDatagramFramed` ([#772]).

[#772]: https://github.com/tokio-rs/tokio/pull/772
[#808]: https://github.com/tokio-rs/tokio/pull/808

# 0.1.13 (November 21, 2018)

- Fix `Runtime::reactor()` when no tasks are spawned ([#721]).
- `runtime::Builder` no longer uses deprecated methods ([#749]).
- Provide `after_start` and `before_stop` configuration settings for
  `Runtime` ([#756]).
- Implement throttle stream combinator ([#736]).

[#721]: https://github.com/tokio-rs/tokio/pull/721
[#736]: https://github.com/tokio-rs/tokio/pull/736
[#749]: https://github.com/tokio-rs/tokio/pull/749
[#756]: https://github.com/tokio-rs/tokio/pull/756

# 0.1.12 (October 23, 2018)

- runtime: expose `keep_alive` on runtime builder ([#676]).
- runtime: create a reactor per worker thread ([#660]).
- codec: fix panic in `LengthDelimitedCodec` ([#682]).
- io: re-export `tokio_io::io::read` function ([#689]).
- runtime: check for executor re-entry in more places ([#708]).

[#660]: https://github.com/tokio-rs/tokio/pull/660
[#676]: https://github.com/tokio-rs/tokio/pull/676
[#682]: https://github.com/tokio-rs/tokio/pull/682
[#689]: https://github.com/tokio-rs/tokio/pull/689
[#708]: https://github.com/tokio-rs/tokio/pull/708

# 0.1.11 (September 28, 2018)

- Fix `tokio-async-await` dependency ([#675]).

[#675]: https://github.com/tokio-rs/tokio/pull/675

# 0.1.10 (September 27, 2018)

- Fix minimal versions

# 0.1.9 (September 27, 2018)

- Experimental async/await improvements ([#661]).
- Re-export `TaskExecutor` from `tokio-current-thread` ([#652]).
- Improve `Runtime` builder API ([#645]).
- `tokio::run` panics when called from the context of an executor
  ([#646]).
- Introduce `StreamExt` with a `timeout` helper ([#573]).
- Move `length_delimited` into `tokio` ([#575]).
- Re-organize `tokio::net` module ([#548]).
- Re-export `tokio-current-thread::spawn` in current_thread runtime
  ([#579]).

[#548]: https://github.com/tokio-rs/tokio/pull/548
[#573]: https://github.com/tokio-rs/tokio/pull/573
[#575]: https://github.com/tokio-rs/tokio/pull/575
[#579]: https://github.com/tokio-rs/tokio/pull/579
[#645]: https://github.com/tokio-rs/tokio/pull/645
[#646]: https://github.com/tokio-rs/tokio/pull/646
[#652]: https://github.com/tokio-rs/tokio/pull/652
[#661]: https://github.com/tokio-rs/tokio/pull/661

# 0.1.8 (August 23, 2018)

- Extract tokio::executor::current_thread to a sub crate ([#370])
- Add `Runtime::block_on` ([#398])
- Add `runtime::current_thread::block_on_all` ([#477])
- Misc documentation improvements ([#450])
- Implement `std::error::Error` for error types ([#501])

[#370]: https://github.com/tokio-rs/tokio/pull/370
[#398]: https://github.com/tokio-rs/tokio/pull/398
[#450]: https://github.com/tokio-rs/tokio/pull/450
[#477]: https://github.com/tokio-rs/tokio/pull/477
[#501]: https://github.com/tokio-rs/tokio/pull/501

# 0.1.7 (June 6, 2018)

- Add `Runtime::block_on` for concurrent runtime ([#391]).
- Provide handle to `current_thread::Runtime` that allows spawning tasks from
  other threads ([#340]).
- Provide `clock::now()`, a configurable source of time ([#381]).

[#340]: https://github.com/tokio-rs/tokio/pull/340
[#381]: https://github.com/tokio-rs/tokio/pull/381
[#391]: https://github.com/tokio-rs/tokio/pull/391

# 0.1.6 (May 2, 2018)

- Add asynchronous filesystem APIs ([#323]).
- Add "current thread" runtime variant ([#308]).
- `CurrentThread`: Expose inner `Park` instance.
- Improve fairness of `CurrentThread` executor ([#313]).

[#308]: https://github.com/tokio-rs/tokio/pull/308
[#313]: https://github.com/tokio-rs/tokio/pull/313
[#323]: https://github.com/tokio-rs/tokio/pull/323

# 0.1.5 (March 30, 2018)

- Provide timer API ([#266])

[#266]: https://github.com/tokio-rs/tokio/pull/266

# 0.1.4 (March 22, 2018)

- Fix build on FreeBSD ([#218])
- Shutdown the Runtime when the handle is dropped ([#214])
- Set Runtime thread name prefix for worker threads ([#232])
- Add builder for Runtime ([#234])
- Extract TCP and UDP types into separate crates ([#224])
- Optionally support futures 0.2.

[#214]: https://github.com/tokio-rs/tokio/pull/214
[#218]: https://github.com/tokio-rs/tokio/pull/218
[#224]: https://github.com/tokio-rs/tokio/pull/224
[#232]: https://github.com/tokio-rs/tokio/pull/232
[#234]: https://github.com/tokio-rs/tokio/pull/234

# 0.1.3 (March 09, 2018)

- Fix `CurrentThread::turn` to block on idle ([#212]).

[#212]: https://github.com/tokio-rs/tokio/pull/212

# 0.1.2 (March 09, 2018)

- Introduce Tokio Runtime ([#141])
- Provide `CurrentThread` for more flexible usage of current thread executor ([#141]).
- Add Lio for platforms that support it ([#142]).
- I/O resources now lazily bind to the reactor ([#160]).
- Extract Reactor to dedicated crate ([#169])
- Add facade to sub crates and add prelude ([#166]).
- Switch TCP/UDP fns to poll\_ -> Poll<...> style ([#175])

[#141]: https://github.com/tokio-rs/tokio/pull/141
[#142]: https://github.com/tokio-rs/tokio/pull/142
[#160]: https://github.com/tokio-rs/tokio/pull/160
[#166]: https://github.com/tokio-rs/tokio/pull/166
[#169]: https://github.com/tokio-rs/tokio/pull/169
[#175]: https://github.com/tokio-rs/tokio/pull/175

# 0.1.1 (February 09, 2018)

- Doc fixes

# 0.1.0 (February 07, 2018)

- Initial crate released based on [RFC](https://github.com/tokio-rs/tokio-rfcs/pull/3).


---

<!-- source: archive/library/rust/references/packages/tracing-core/CHANGELOG--000964.md -->

## Imported source: archive/library/rust/references/packages/tracing-core/CHANGELOG--000964.md

# 0.1.34 (June 6, 2025)

### Changed

- Bump MSRV to 1.65 ([#3033])

### Fixed

- Do not compare references to pointers to compare pointers ([#3236])

[#3033]: https://github.com/tokio-rs/tracing/pull/3033
[#3236]: https://github.com/tokio-rs/tracing/pull/3236

# 0.1.33 (November 25, 2024)

### Added

- Add index API for `Field` ([#2820])
- allow `&[u8]` to be recorded as event/span field ([#2954])

### Changed

- Bump MSRV to 1.63 ([#2793])
- Use const `thread_local`s when possible ([#2838])

### Fixed

- Fix missed `register_callsite` error ([#2938])
- Do not add `valuable/std` feature as dependency unless `valuable` is used ([#3002])
- prefix macro calls with ::core to avoid clashing with local macros ([#3024])

### Documented

- Fix incorrect (incorrectly updated) docs for LevelFilter ([#2767])

Thanks to new contributor @maddiemort for contributing to this release!

[#2767]: https://github.com/tokio-rs/tracing/pull/2767
[#2793]: https://github.com/tokio-rs/tracing/pull/2793
[#2820]: https://github.com/tokio-rs/tracing/pull/2820
[#2838]: https://github.com/tokio-rs/tracing/pull/2838
[#2938]: https://github.com/tokio-rs/tracing/pull/2938
[#2954]: https://github.com/tokio-rs/tracing/pull/2954
[#3002]: https://github.com/tokio-rs/tracing/pull/3002
[#3024]: https://github.com/tokio-rs/tracing/pull/3024

# 0.1.32 (October 13, 2023)

### Documented

- Fix typo in `field` docs ([#2611])
- Remove duplicate wording ([#2674])

### Changed

- Allow `ValueSet`s of any length ([#2508])

[#2611]: https://github.com/tokio-rs/tracing/pull/2611
[#2674]: https://github.com/tokio-rs/tracing/pull/2674
[#2508]: https://github.com/tokio-rs/tracing/pull/2508

# 0.1.31 (May 11, 2023)

This release of `tracing-core` fixes a bug that caused threads which call
`dispatcher::get_default` _before_ a global default subscriber is set to never
see the global default once it is set. In addition, it includes improvements for
instrumentation performance in some cases, especially when using a global
default dispatcher.

### Fixed

- Fixed incorrect thread-local caching of `Dispatch::none` if
  `dispatcher::get_default` is called before `dispatcher::set_global_default`
  ([#2593])

### Changed

- Cloning a `Dispatch` that points at a global default subscriber no longer
  requires an `Arc` reference count increment, improving performance
  substantially ([#2593])
- `dispatcher::get_default` no longer attempts to access a thread local if the
  scoped dispatcher is not in use, improving performance when the default
  dispatcher is global ([#2593])
- Added `#[inline]` annotations called by the `event!` and `span!` macros to
  reduce the size of macro-generated code and improve recording performance
  ([#2555])

Thanks to new contributor @ldm0 for contributing to this release!

[#2593]: https://github.com/tokio-rs/tracing/pull/2593
[#2555]: https://github.com/tokio-rs/tracing/pull/2555

# 0.1.30 (October 6, 2022)

This release of `tracing-core` adds a new `on_register_dispatch` method to the
`Subscriber` trait to allow the `Subscriber` to perform initialization after
being registered as a `Dispatch`, and a `WeakDispatch` type to allow a
`Subscriber` to store its own `Dispatch` without creating reference count
cycles.

### Added

- `Subscriber::on_register_dispatch` method ([#2269])
- `WeakDispatch` type and `Dispatch::downgrade()` function ([#2293])

Thanks to @jswrenn for contributing to this release!

[#2269]: https://github.com/tokio-rs/tracing/pull/2269
[#2293]: https://github.com/tokio-rs/tracing/pull/2293

# 0.1.29 (July 29, 2022)

This release of `tracing-core` adds `PartialEq` and `Eq` implementations for
metadata types, and improves error messages when setting the global default
subscriber fails.

### Added

- `PartialEq` and `Eq` implementations for `Metadata` ([#2229])
- `PartialEq` and `Eq` implementations for `FieldSet` ([#2229])

### Fixed

- Fixed unhelpful `fmt::Debug` output for `dispatcher::SetGlobalDefaultError`
  ([#2250])
- Fixed compilation with `-Z minimal-versions` ([#2246])

Thanks to @jswrenn and @CAD97 for contributing to this release!

[#2229]: https://github.com/tokio-rs/tracing/pull/2229
[#2246]: https://github.com/tokio-rs/tracing/pull/2246
[#2250]: https://github.com/tokio-rs/tracing/pull/2250

# 0.1.28 (June 23, 2022)

This release of `tracing-core` adds new `Value` implementations, including one
for `String`, to allow recording `&String` as a value without having to call
`as_str()` or similar, and for 128-bit integers (`i128` and `u128`). In
addition, it adds new methods and trait implementations for `Subscriber`s.

### Added

- `Value` implementation for `String` ([#2164])
- `Value` implementation for `u128` and `i28` ([#2166])
- `downcast_ref` and `is` methods for `dyn Subscriber + Sync`,
  `dyn Subscriber + Send`, and `dyn Subscriber + Send + Sync` ([#2160])
- `Subscriber::event_enabled` method to enable filtering based on `Event` field
  values ([#2008])
- `Subscriber` implementation for `Box<S: Subscriber + ?Sized>` and
  `Arc<S: Subscriber + ?Sized>` ([#2161])

Thanks to @jswrenn and @CAD97 for contributing to this release!

[#2164]: https://github.com/tokio-rs/tracing/pull/2164
[#2166]: https://github.com/tokio-rs/tracing/pull/2166
[#2160]: https://github.com/tokio-rs/tracing/pull/2160
[#2008]: https://github.com/tokio-rs/tracing/pull/2008
[#2161]: https://github.com/tokio-rs/tracing/pull/2161

# 0.1.27 (June 7, 2022)

This release of `tracing-core` introduces a new `DefaultCallsite` type, which
can be used by instrumentation crates rather than implementing their own
callsite types. Using `DefaultCallsite` may offer reduced overhead from callsite
registration.

### Added

- `DefaultCallsite`, a pre-written `Callsite` implementation for use in
  instrumentation crates ([#2083])
- `ValueSet::len` and `Record::len` methods returning the number of fields in a
  `ValueSet` or `Record` ([#2152])

### Changed

- Replaced `lazy_static` dependency with `once_cell` ([#2147])

### Documented

- Added documentation to the `callsite` module ([#2088], [#2149])

Thanks to new contributors @jamesmunns and @james7132 for contributing to this
release!

[#2083]: https://github.com/tokio-rs/tracing/pull/2083
[#2152]: https://github.com/tokio-rs/tracing/pull/2152
[#2147]: https://github.com/tokio-rs/tracing/pull/2147
[#2088]: https://github.com/tokio-rs/tracing/pull/2088
[#2149]: https://github.com/tokio-rs/tracing/pull/2149

# 0.1.26 (April 14, 2022)

This release adds a `Value` implementation for `Box<T: Value>` to allow
recording boxed values more conveniently. In particular, this should improve
the ergonomics of the implementations for `dyn std::error::Error` trait objects,
including those added in [v0.1.25].

### Added

- `Value` implementation for `Box<T> where T: Value` ([#2071])

### Fixed

- Broken documentation links ([#2068])

Thanks to new contributor @ben0x539 for contributing to this release!


[v0.1.25]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.25
[#2071]: https://github.com/tokio-rs/tracing/pull/2071
[#2068]: https://github.com/tokio-rs/tracing/pull/2068

# 0.1.25 (April 12, 2022)

This release adds additional `Value` implementations for `std::error::Error`
trait objects with auto trait bounds (`Send` and `Sync`), as Rust will not
auto-coerce trait objects. Additionally, it fixes a bug when setting scoped
dispatchers that was introduced in the previous release ([v0.1.24]).

### Added

- `Value` implementations for `dyn Error + Send + 'static`, `dyn Error + Send +
  Sync + 'static`, `dyn Error + Sync + 'static` ([#2066])

### Fixed

- Failure to use the global default dispatcher if a thread has set a scoped
  default prior to setting the global default, and unset the scoped default
  after setting the global default ([#2065])

Thanks to @lilyball for contributing to this release!

[v0.1.24]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.24
[#2066]: https://github.com/tokio-rs/tracing/pull/2066
[#2065]: https://github.com/tokio-rs/tracing/pull/2065

# 0.1.24 (April 1, 2022)

This release fixes a bug where setting `NoSubscriber` as the local default would
not disable the global default subscriber locally.

### Fixed

- Setting `NoSubscriber` as the local default now correctly disables the global
  default subscriber ([#2001])
- Fixed compilation warnings with the "std" feature disabled ([#2022])

### Changed

- Removed unnecessary use of `write!` and `format_args!` macros ([#1988])

[#1988]: https://github.com/tokio-rs/tracing/pull/1988
[#2001]: https://github.com/tokio-rs/tracing/pull/2001
[#2022]: https://github.com/tokio-rs/tracing/pull/2022

# 0.1.23 (March 8, 2022)

### Changed

- Removed `#[inline]` attributes from some `Dispatch` methods whose
  callers are now inlined ([#1974])
- Bumped minimum supported Rust version (MSRV) to Rust 1.49.0 ([#1913])

[#1913]: https://github.com/tokio-rs/tracing/pull/1913
[#1974]: https://github.com/tokio-rs/tracing/pull/1974

# 0.1.22 (February 3, 2022)

This release adds *experimental* support for recording structured field values
using the [`valuable`] crate. See [this blog post][post] for details on
`valuable`.

Note that `valuable` support currently requires `--cfg tracing_unstable`. See
the documentation for details.

### Added

- **field**: Experimental support for recording field values using the
  [`valuable`] crate ([#1608], [#1888], [#1887])
- **field**: Added `ValueSet::record` method ([#1823])
- **subscriber**: `Default` impl for `NoSubscriber` ([#1785])
- **metadata**: New `Kind::HINT` to support the `enabled!` macro in `tracing`
  ([#1883], [#1891])
### Fixed

- Fixed a number of documentation issues ([#1665], [#1692], [#1737])

Thanks to @xd009642, @Skepfyr, @guswynn, @Folyd, and @mbergkvist for
contributing to this release!

[`valuable`]: https://crates.io/crates/valuable
[post]: https://tokio.rs/blog/2021-05-valuable
[#1608]: https://github.com/tokio-rs/tracing/pull/1608
[#1888]: https://github.com/tokio-rs/tracing/pull/1888
[#1887]: https://github.com/tokio-rs/tracing/pull/1887
[#1823]: https://github.com/tokio-rs/tracing/pull/1823
[#1785]: https://github.com/tokio-rs/tracing/pull/1785
[#1883]: https://github.com/tokio-rs/tracing/pull/1883
[#1891]: https://github.com/tokio-rs/tracing/pull/1891
[#1665]: https://github.com/tokio-rs/tracing/pull/1665
[#1692]: https://github.com/tokio-rs/tracing/pull/1692
[#1737]: https://github.com/tokio-rs/tracing/pull/1737

# 0.1.21 (October 1, 2021)

This release adds support for recording `Option<T> where T: Value` as typed
`tracing` field values.

### Added

- **field**: `Value` impl for `Option<T> where T: Value` ([#1585])

### Fixed

- Fixed deprecation warnings when building with `default-features` disabled
  ([#1603], [#1606])
- Documentation fixes and improvements ([#1595], [#1601])

Thanks to @brianburgers, @DCjanus, and @matklad for contributing to this
release!

[#1585]: https://github.com/tokio-rs/tracing/pull/1585
[#1595]: https://github.com/tokio-rs/tracing/pull/1595
[#1601]: https://github.com/tokio-rs/tracing/pull/1601
[#1603]: https://github.com/tokio-rs/tracing/pull/1603
[#1606]: https://github.com/tokio-rs/tracing/pull/1606

# 0.1.20 (September 12, 2021)

This release adds support for `f64` as one of the `tracing-core`
primitive field values, allowing floating-point values to be recorded as
typed values rather than with `fmt::Debug`. Additionally, it adds
`NoSubscriber`, a `Subscriber` implementation that does nothing.

### Added

- **subscriber**: `NoSubscriber`, a no-op `Subscriber` implementation
  ([#1549])
- **field**: Added `Visit::record_f64` and support for recording
  floating-point values ([#1507])

Thanks to new contributors @jsgf and @maxburke for contributing to this
release!

[#1549]: https://github.com/tokio-rs/tracing/pull/1549 
[#1507]: https://github.com/tokio-rs/tracing/pull/1507

# 0.1.19 (August 17, 2021)
### Added

- `Level::as_str` ([#1413])
- `Hash` implementation for `Level` and `LevelFilter` ([#1456])
- `Value` implementation for `&mut T where T: Value` ([#1385])
- Multiple documentation fixes and improvements ([#1435], [#1446])

Thanks to @Folyd, @teozkr, and @dvdplm for contributing to this release!

[#1413]: https://github.com/tokio-rs/tracing/pull/1413
[#1456]: https://github.com/tokio-rs/tracing/pull/1456
[#1385]: https://github.com/tokio-rs/tracing/pull/1385
[#1435]: https://github.com/tokio-rs/tracing/pull/1435
[#1446]: https://github.com/tokio-rs/tracing/pull/1446

# 0.1.18 (April 30, 2021)

### Added

- `Subscriber` impl for `Box<dyn Subscriber + Send + Sync + 'static>` ([#1358])
- `Subscriber` impl for `Arc<dyn Subscriber + Send + Sync + 'static>` ([#1374])
- Symmetric `From` impls for existing `Into` impls on `Current` and `Option<Id>`
  ([#1335])
- `Attributes::fields` accessor that returns the set of fields defined on a
  span's `Attributes` ([#1331])


Thanks to @Folyd for contributing to this release!

[#1358]: https://github.com/tokio-rs/tracing/pull/1358
[#1374]: https://github.com/tokio-rs/tracing/pull/1374
[#1335]: https://github.com/tokio-rs/tracing/pull/1335
[#1331]: https://github.com/tokio-rs/tracing/pull/1331

# 0.1.17 (September 28, 2020)

### Fixed

- Incorrect inlining of `Event::dispatch` and `Event::child_of`, which could
  result in `dispatcher::get_default` being inlined at the callsite ([#994])

### Added

- `Copy` implementations for `Level` and `LevelFilter` ([#992])

Thanks to new contributors @jyn514 and @TaKO8Ki for contributing to this 
release!

[#994]: https://github.com/tokio-rs/tracing/pull/994
[#992]: https://github.com/tokio-rs/tracing/pull/992

# 0.1.16 (September 8, 2020)

### Fixed

- Added a conversion from `Option<Level>` to `LevelFilter`. This resolves a
  previously unreported regression where `Option<Level>` was no longer
  a valid LevelFilter. ([#966](https://github.com/tokio-rs/tracing/pull/966))

# 0.1.15 (August 22, 2020)

### Fixed

- When combining `Interest` from multiple subscribers, if the interests differ,
  the current subscriber is now always asked if a callsite should be enabled
  (#927)

## Added

- Internal API changes to support optimizations in the `tracing` crate (#943)
- **docs**: Multiple fixes and improvements (#913, #941)

# 0.1.14 (August 10, 2020)

### Fixed

- Incorrect calculation of global max level filter which could result in fast
  filtering paths not being taken (#908)
  
# 0.1.13 (August 4, 2020)

### Fixed

- Missing `fmt::Display` impl for `field::DisplayValue` causing a compilation
  failure when the "log" feature is enabled (#887)
  
Thanks to @d-e-s-o for contributing to this release!

# 0.1.12 (July 31, 2020)

### Added

- `LevelFilter` type and `LevelFilter::current()` for returning the highest level
  that any subscriber will enable (#853)
- `Subscriber::max_level_hint` optional trait method, for setting the value
  returned by `LevelFilter::current()` (#853)
  
### Fixed

- **docs**: Removed outdated reference to a Tokio API that no longer exists
  (#857)

Thanks to new contributor @dignati for contributing to this release!

# 0.1.11 (June 8, 2020)

### Changed

- Replaced use of `inner_local_macros` with `$crate::` (#729)

### Added

- `must_use` warning to guards returned by `dispatcher::set_default` (#686)
- `fmt::Debug` impl to `dyn Value`s (#696) 
- Functions to convert between `span::Id` and `NonZeroU64` (#770)
- More obvious warnings in documentation (#769)

### Fixed

- Compiler error when `tracing-core/std` feature is enabled but `tracing/std` is
  not (#760)
- Clippy warning on vtable address comparison in `callsite::Identifier` (#749)
- Documentation formatting issues (#715, #771)

Thanks to @bkchr, @majecty, @taiki-e, @nagisa, and @nvzqz for contributing to
this release!

# 0.1.10 (January 24, 2020)

### Added

- `field::Empty` type for declaring empty fields whose values will be recorded
  later (#548)
- `field::Value` implementations for `Wrapping` and `NonZero*` numbers (#538)

### Fixed

- Broken and unresolvable links in RustDoc (#595)

Thanks to @oli-cosmian for contributing to this release!

# 0.1.9 (January 10, 2020)

### Added

- API docs now show what feature flags are required to enable each item (#523)

### Fixed

- A panic when the current default subscriber subscriber calls
  `dispatcher::with_default` as it is being dropped (#522)
- Incorrect documentation for `Subscriber::drop_span` (#524)

# 0.1.8 (December 20, 2019)

### Added

- `Default` impl for `Dispatch` (#411)

### Fixed

- Removed duplicate `lazy_static` dependencies (#424)
- Fixed no-std dependencies being enabled even when `std` feature flag is set
  (#424)
- Broken link to `Metadata` in `Event` docs (#461)

# 0.1.7 (October 18, 2019)

### Added

- Added `dispatcher::set_default` API which returns a drop guard (#388)

### Fixed

- Added missing `Value` impl for `u8` (#392)
- Broken links in docs.

# 0.1.6 (September 12, 2019)

### Added

- Internal APIs to support performance optimizations (#326)

### Fixed

- Clarified wording in `field::display` documentation (#340)

# 0.1.5 (August 16, 2019)

### Added

- `std::error::Error` as a new primitive `Value` type (#277)
- `Event::new` and `Event::new_child_of` to manually construct `Event`s (#281)

# 0.1.4 (August 9, 2019)

### Added

- Support for `no-std` + `liballoc` (#256)

### Fixed

- Broken links in RustDoc (#259)

# 0.1.3 (August 8, 2019)

### Added

- `std::fmt::Display` implementation for `Level` (#194)
- `std::str::FromStr` implementation for `Level` (#195)

# 0.1.2 (July 10, 2019)

### Deprecated

- `Subscriber::drop_span` in favor of new `Subscriber::try_close` (#168)

### Added

- `Into<Option<&Id>>`, `Into<Option<Id>>`, and
  `Into<Option<&'static Metadata<'static>>>` impls for `span::Current` (#170)
- `Subscriber::try_close` method (#153)
- Improved documentation for `dispatcher` (#171)

# 0.1.1 (July 6, 2019)

### Added

- `Subscriber::current_span` API to return the current span (#148).
- `span::Current` type, representing the `Subscriber`'s view of the current
  span (#148).

### Fixed

- Typos and broken links in documentation (#123, #124, #128, #154)

# 0.1.0 (June 27, 2019)

- Initial release


---

<!-- source: archive/library/rust/references/packages/tracing/CHANGELOG--001049.md -->

## Imported source: archive/library/rust/references/packages/tracing/CHANGELOG--001049.md

# 0.1.41 (November 27, 2024)

[ [crates.io][crate-0.1.41] ] | [ [docs.rs][docs-0.1.41] ]

This release updates the `tracing-core` dependency to [v0.1.33][core-0.1.33] and
the `tracing-attributes` dependency to [v0.1.28][attrs-0.1.28].

### Added

- **core**: Add index API for `Field` ([#2820])
- **core**: Allow `&[u8]` to be recorded as event/span field ([#2954])

### Changed

- Bump MSRV to 1.63 ([#2793])
- **core**: Use const `thread_local`s when possible ([#2838])

### Fixed

- Removed core imports in macros ([#2762])
- **attributes**: Added missing RecordTypes for instrument ([#2781])
- **attributes**: Change order of async and unsafe modifier ([#2864])
- Fix missing field prefixes ([#2878])
- **attributes**: Extract match scrutinee ([#2880])
- Fix non-simple macro usage without message ([#2879])
- Fix event macros with constant field names in the first position ([#2883])
- Allow field path segments to be keywords ([#2925])
- **core**: Fix missed `register_callsite` error ([#2938])
- **attributes**: Support const values for `target` and `name` ([#2941])
- Prefix macro calls with ::core to avoid clashing with local macros ([#3024])

[#2762]: https://github.com/tokio-rs/tracing/pull/2762
[#2781]: https://github.com/tokio-rs/tracing/pull/2781
[#2793]: https://github.com/tokio-rs/tracing/pull/2793
[#2820]: https://github.com/tokio-rs/tracing/pull/2820
[#2838]: https://github.com/tokio-rs/tracing/pull/2838
[#2864]: https://github.com/tokio-rs/tracing/pull/2864
[#2878]: https://github.com/tokio-rs/tracing/pull/2878
[#2879]: https://github.com/tokio-rs/tracing/pull/2879
[#2880]: https://github.com/tokio-rs/tracing/pull/2880
[#2883]: https://github.com/tokio-rs/tracing/pull/2883
[#2925]: https://github.com/tokio-rs/tracing/pull/2925
[#2938]: https://github.com/tokio-rs/tracing/pull/2938
[#2941]: https://github.com/tokio-rs/tracing/pull/2941
[#2954]: https://github.com/tokio-rs/tracing/pull/2954
[#3024]: https://github.com/tokio-rs/tracing/pull/3024
[attrs-0.1.28]:
    https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.28
[core-0.1.33]:
    https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.33
[docs-0.1.41]: https://docs.rs/tracing/0.1.41/tracing/
[crate-0.1.41]: https://crates.io/crates/tracing/0.1.41

# 0.1.40 (October 19, 2023)

This release fixes a potential stack use-after-free in the
`Instrument::into_inner` method. Only uses of this method are affected by this
bug.

### Fixed

- Use `mem::ManuallyDrop` instead of `mem::forget` in `Instrument::into_inner`
  ([#2765])

[#2765]: https://github.com/tokio-rs/tracing/pull/2765

Thanks to @cramertj and @manishearth for finding and fixing this issue!

# 0.1.39 (October 12, 2023)

This release adds several additional features to the `tracing` macros. In
addition, it updates the `tracing-core` dependency to [v0.1.32][core-0.1.32] and
the `tracing-attributes` dependency to [v0.1.27][attrs-0.1.27].

### Added

- Allow constant field names in macros ([#2617])
- Allow setting event names in macros ([#2699])
- **core**: Allow `ValueSet`s of any length ([#2508])

### Changed

- `tracing-attributes`: updated to [0.1.27][attrs-0.1.27]
- `tracing-core`: updated to [0.1.32][core-0.1.32]
- **attributes**: Bump minimum version of proc-macro2 to 1.0.60 ([#2732])
-  **attributes**: Generate less dead code for async block return type hint ([#2709])

### Fixed

- Use fully qualified names in macros for items exported from std prelude
  ([#2621], [#2757])
- **attributes**: Allow [`clippy::let_with_type_underscore`] in macro-generated
  code ([#2609])
- **attributes**: Allow `unknown_lints` in macro-generated code ([#2626])
- **attributes**: Fix a compilation error in `#[instrument]` when the `"log"`
  feature is enabled ([#2599])

### Documented

- Add `axum-insights` to relevant crates. ([#2713])
- Fix link to RAI pattern crate documentation ([#2612])
- Fix docs typos and warnings ([#2581])
- Add `clippy-tracing` to related crates ([#2628])
- Add `tracing-cloudwatch` to related crates ([#2667])
- Fix deadlink to `tracing-etw` repo ([#2602])

[#2617]: https://github.com/tokio-rs/tracing/pull/2617
[#2699]: https://github.com/tokio-rs/tracing/pull/2699
[#2508]: https://github.com/tokio-rs/tracing/pull/2508
[#2621]: https://github.com/tokio-rs/tracing/pull/2621
[#2713]: https://github.com/tokio-rs/tracing/pull/2713
[#2581]: https://github.com/tokio-rs/tracing/pull/2581
[#2628]: https://github.com/tokio-rs/tracing/pull/2628
[#2667]: https://github.com/tokio-rs/tracing/pull/2667
[#2602]: https://github.com/tokio-rs/tracing/pull/2602
[#2626]: https://github.com/tokio-rs/tracing/pull/2626
[#2757]: https://github.com/tokio-rs/tracing/pull/2757
[#2732]: https://github.com/tokio-rs/tracing/pull/2732
[#2709]: https://github.com/tokio-rs/tracing/pull/2709
[#2599]: https://github.com/tokio-rs/tracing/pull/2599
[`let_with_type_underscore`]: http://rust-lang.github.io/rust-clippy/rust-1.70.0/index.html#let_with_type_underscore
[attrs-0.1.27]:
    https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.27
[core-0.1.32]:
    https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.32

# 0.1.38 (April 25th, 2023)

This `tracing` release changes the `Drop` implementation for `Instrumented`
`Future`s so that the attached `Span` is entered when dropping the `Future`. This
means that events emitted by the `Future`'s `Drop` implementation will now be
recorded within its `Span`. It also adds `#[inline]` hints to methods called in
the `event!` macro's expansion, for an improvement in both binary size and
performance.

Additionally, this release updates the `tracing-attributes` dependency to
[v0.1.24][attrs-0.1.24], which updates the [`syn`] dependency to v2.x.x.
`tracing-attributes` v0.1.24 also includes improvements to the `#[instrument]`
macro; see [the `tracing-attributes` 0.1.24 release notes][attrs-0.1.24] for
details.

### Added

- `Instrumented` futures will now enter the attached `Span` in their `Drop`
  implementation, allowing events emitted when dropping the future to occur
  within the span ([#2562])
- `#[inline]` attributes for methods called by the `event!` macros, making
  generated code smaller ([#2555])
- **attributes**: `level` argument to `#[instrument(err)]` and
  `#[instrument(ret)]` to override the level of
  the generated return value event ([#2335])
- **attributes**: Improved compiler error message when `#[instrument]` is added to a `const fn`
  ([#2418])

### Changed

- `tracing-attributes`: updated to [0.1.24][attrs-0.1.24]
- Removed unneeded `cfg-if` dependency ([#2553])
- **attributes**: Updated [`syn`] dependency to 2.0 ([#2516])

### Fixed

- **attributes**: Fix `clippy::unreachable` warnings in `#[instrument]`-generated code ([#2356])
- **attributes**: Removed unused "visit" feature flag from `syn` dependency ([#2530])

### Documented

- **attributes**: Documented default level for `#[instrument(err)]` ([#2433])
- **attributes**: Improved documentation for levels in `#[instrument]` ([#2350])

Thanks to @nitnelave, @jsgf, @Abhicodes-crypto, @LukeMathWalker, @andrewpollack,
@quad, @klensy, @davidpdrsn, @dbidwell94, @ldm0, @NobodyXu, @ilsv, and @daxpedda
for contributing to this release!

[`syn`]: https://crates.io/crates/syn
[attrs-0.1.24]:
    https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.24
[#2565]: https://github.com/tokio-rs/tracing/pull/2565
[#2555]: https://github.com/tokio-rs/tracing/pull/2555
[#2553]: https://github.com/tokio-rs/tracing/pull/2553
[#2335]: https://github.com/tokio-rs/tracing/pull/2335
[#2418]: https://github.com/tokio-rs/tracing/pull/2418
[#2516]: https://github.com/tokio-rs/tracing/pull/2516
[#2356]: https://github.com/tokio-rs/tracing/pull/2356
[#2530]: https://github.com/tokio-rs/tracing/pull/2530
[#2433]: https://github.com/tokio-rs/tracing/pull/2433
[#2350]: https://github.com/tokio-rs/tracing/pull/2350

# 0.1.37 (October 6, 2022)

This release of `tracing` incorporates changes from `tracing-core`
[v0.1.30][core-0.1.30] and `tracing-attributes` [v0.1.23][attrs-0.1.23],
including the new `Subscriber::on_register_dispatch` method for performing late
initialization after a `Subscriber` is registered as a `Dispatch`, and bugfixes
for the `#[instrument]` attribute. Additionally, it fixes instances of the
`bare_trait_objects` lint, which is now a warning on `tracing`'s MSRV and will
become an error in the next edition.

### Fixed

- **attributes**: Incorrect handling of inner attributes in `#[instrument]`ed
  functions ([#2307])
- **attributes**: Incorrect location of compiler diagnostic spans generated for
  type errors in `#[instrument]`ed `async fn`s ([#2270])
- **attributes**: Updated `syn` dependency to fix compilation with `-Z
  minimal-versions` ([#2246])
- `bare_trait_objects` warning in `valueset!` macro expansion ([#2308])

### Added

- **core**: `Subscriber::on_register_dispatch` method ([#2269])
- **core**: `WeakDispatch` type and `Dispatch::downgrade()` function ([#2293])

### Changed

- `tracing-core`: updated to [0.1.30][core-0.1.30]
- `tracing-attributes`: updated to [0.1.23][attrs-0.1.23]

### Documented

- Added [`tracing-web`] and [`reqwest-tracing`] to related crates ([#2283],
  [#2331])

Thanks to new contributors @compiler-errors, @e-nomem, @WorldSEnder, @Xiami2012,
and @tl-rodrigo-gryzinski, as well as @jswrenn and @CAD97, for contributing to
this release!

[core-0.1.30]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.30
[attrs-0.1.23]: https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.23
[`tracing-web`]: https://crates.io/crates/tracing-web/
[`reqwest-tracing`]: https://crates.io/crates/reqwest-tracing/
[#2246]: https://github.com/tokio-rs/tracing/pull/2246
[#2269]: https://github.com/tokio-rs/tracing/pull/2269
[#2283]: https://github.com/tokio-rs/tracing/pull/2283
[#2270]: https://github.com/tokio-rs/tracing/pull/2270
[#2293]: https://github.com/tokio-rs/tracing/pull/2293
[#2307]: https://github.com/tokio-rs/tracing/pull/2307
[#2308]: https://github.com/tokio-rs/tracing/pull/2308
[#2331]: https://github.com/tokio-rs/tracing/pull/2331

# 0.1.36 (July 29, 2022)

This release adds support for owned values and fat pointers as arguments to the
`Span::record` method, as well as updating the minimum `tracing-core` version
and several documentation improvements.

### Fixed

- Incorrect docs in `dispatcher::set_default` ([#2220])
- Compilation with `-Z minimal-versions` ([#2246])

### Added

- Support for owned values and fat pointers in `Span::record` ([#2212])
- Documentation improvements ([#2208], [#2163])

### Changed

- `tracing-core`: updated to [0.1.29][core-0.1.29]

Thanks to @fredr, @cgbur, @jyn514, @matklad, and @CAD97 for contributing to this
release!

[core-0.1.29]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.29
[#2220]: https://github.com/tokio-rs/tracing/pull/2220
[#2246]: https://github.com/tokio-rs/tracing/pull/2246
[#2212]: https://github.com/tokio-rs/tracing/pull/2212
[#2208]: https://github.com/tokio-rs/tracing/pull/2208
[#2163]: https://github.com/tokio-rs/tracing/pull/2163

# 0.1.35 (June 8, 2022)

This release reduces the overhead of callsite registration by using new
`tracing-core` APIs.

### Added

- Use `DefaultCallsite` to reduce callsite registration overhead ([#2083])

### Changed

- `tracing-core`: updated to [0.1.27][core-0.1.27]

[core-0.1.27]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.27
[#2088]: https://github.com/tokio-rs/tracing/pull/2083

# 0.1.34 (April 14, 2022)

This release includes bug fixes for the "log" support feature and for the use of
both scoped and global default dispatchers in the same program.

### Fixed

- Failure to use the global default dispatcher when a thread sets a local
  default dispatcher before the global default is set ([#2065])
- **log**: Compilation errors due to `async` block/fn futures becoming `!Send`
  when the "log" feature flag is enabled ([#2073])
- Broken links in documentation ([#2068])

Thanks to @ben0x539 for contributing to this release!

[#2065]: https://github.com/tokio-rs/tracing/pull/2065
[#2073]: https://github.com/tokio-rs/tracing/pull/2073
[#2068]: https://github.com/tokio-rs/tracing/pull/2068

# 0.1.33 (April 9, 2022)

This release adds new `span_enabled!` and `event_enabled!` variants of the
`enabled!` macro, for testing whether a subscriber would specifically enable a
span or an event.

### Added

- `span_enabled!` and `event_enabled!` macros ([#1900])
- Several documentation improvements ([#2010], [#2012])

### Fixed

- Compilation warning when compiling for <=32-bit targets (including `wasm32`)
  ([#2060])

Thanks to @guswynn, @arifd, @hrxi, @CAD97, and @name1e5s for contributing to
this release!

[#1900]: https://github.com/tokio-rs/tracing/pull/1900
[#2010]: https://github.com/tokio-rs/tracing/pull/2010
[#2012]: https://github.com/tokio-rs/tracing/pull/2012
[#2060]: https://github.com/tokio-rs/tracing/pull/2060

# 0.1.32 (March 8th, 2022)

This release reduces the overhead of creating and dropping disabled
spans significantly, which should improve performance when no `tracing`
subscriber is in use or when spans are disabled by a filter.

### Fixed

- **attributes**: Compilation failure with `--minimal-versions` due to a
  too-permissive `syn` dependency ([#1960])

### Changed

- Reduced `Drop` overhead for disabled spans ([#1974])
- `tracing-attributes`: updated to [0.1.20][attributes-0.1.20]

[#1974]: https://github.com/tokio-rs/tracing/pull/1974
[#1960]: https://github.com/tokio-rs/tracing/pull/1960
[attributes-0.1.20]: https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.20

# 0.1.31 (February 17th, 2022)

This release increases the minimum supported Rust version (MSRV) to 1.49.0. In
addition, it fixes some relatively rare macro bugs.

### Added

- Added `tracing-forest` to the list of related crates ([#1935])

### Changed

- Updated minimum supported Rust version (MSRV) to 1.49.0 ([#1913])

### Fixed

- Fixed the `warn!` macro incorrectly generating an event with the `TRACE` level
  ([#1930])
- Fixed macro hygiene issues when used in a crate that defines its own `concat!`
  macro, for real this time ([#1918])

Thanks to @QnnOkabayashi, @nicolaasg, and @teohhanhui for contributing to this
release!

[#1935]: https://github.com/tokio-rs/tracing/pull/1935
[#1913]: https://github.com/tokio-rs/tracing/pull/1913
[#1930]: https://github.com/tokio-rs/tracing/pull/1930
[#1918]: https://github.com/tokio-rs/tracing/pull/1918

# 0.1.30 (February 3rd, 2022)

This release adds *experimental* support for recording structured field
values using the [`valuable`] crate. See [this blog post][post] for
details on `valuable`.

Note that `valuable` support currently requires `--cfg tracing_unstable`. See
the documentation for details.

This release also adds a new `enabled!` macro for testing if a span or event
would be enabled.

### Added

- **field**: Experimental support for recording field values using the
  [`valuable`] crate ([#1608], [#1888], [#1887])
- `enabled!` macro for testing if a span or event is enabled ([#1882])

### Changed

- `tracing-core`: updated to [0.1.22][core-0.1.22]
- `tracing-attributes`: updated to [0.1.19][attributes-0.1.19]

### Fixed

- **log**: Fixed "use of moved value" compiler error when the "log" feature is
  enabled ([#1823])
- Fixed macro hygiene issues when used in a crate that defines its own `concat!`
  macro ([#1842])
- A very large number of documentation fixes and improvements.

Thanks to @@Vlad-Scherbina, @Skepfyr, @Swatinem, @guswynn, @teohhanhui,
@xd009642, @tobz, @d-e-s-o@0b01, and @nickelc for contributing to this release!

[`valuable`]: https://crates.io/crates/valuable
[post]: https://tokio.rs/blog/2021-05-valuable
[core-0.1.22]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.22
[attributes-0.1.19]: https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.19
[#1608]: https://github.com/tokio-rs/tracing/pull/1608
[#1888]: https://github.com/tokio-rs/tracing/pull/1888
[#1887]: https://github.com/tokio-rs/tracing/pull/1887
[#1882]: https://github.com/tokio-rs/tracing/pull/1882
[#1823]: https://github.com/tokio-rs/tracing/pull/1823
[#1842]: https://github.com/tokio-rs/tracing/pull/1842

# 0.1.29 (October 5th, 2021)

This release adds support for recording `Option<T> where T: Value` as typed
`tracing` field values. It also includes significant performance improvements
for functions annotated with the `#[instrument]` attribute when the generated
span is disabled.

### Changed

- `tracing-core`: updated to v0.1.21
- `tracing-attributes`: updated to v0.1.18

### Added

- **field**: `Value` impl for `Option<T> where T: Value` ([#1585])
- **attributes**: - improved performance when skipping `#[instrument]`-generated
  spans below the max level ([#1600], [#1605], [#1614], [#1616], [#1617])

### Fixed

- **instrument**: added missing `Future` implementation for `WithSubscriber`,
  making the `WithDispatch` extension trait actually useable ([#1602])
- Documentation fixes and improvements ([#1595], [#1601], [#1597])

Thanks to @brianburgers, @mattiast, @DCjanus, @oli-obk, and @matklad for
contributing to this release!

[#1585]: https://github.com/tokio-rs/tracing/pull/1585
[#1595]: https://github.com/tokio-rs/tracing/pull/1596
[#1597]: https://github.com/tokio-rs/tracing/pull/1597
[#1600]: https://github.com/tokio-rs/tracing/pull/1600
[#1601]: https://github.com/tokio-rs/tracing/pull/1601
[#1602]: https://github.com/tokio-rs/tracing/pull/1602
[#1605]: https://github.com/tokio-rs/tracing/pull/1605
[#1614]: https://github.com/tokio-rs/tracing/pull/1614
[#1616]: https://github.com/tokio-rs/tracing/pull/1616
[#1617]: https://github.com/tokio-rs/tracing/pull/1617

# 0.1.28 (September 17th, 2021)

This release fixes an issue where the RustDoc documentation was rendered
incorrectly. It doesn't include any actual code changes, and is very boring and
can be ignored.

### Fixed

- **docs**: Incorrect documentation rendering due to unclosed `<div>` tag
  ([#1572])

[#1572]: https://github.com/tokio-rs/tracing/pull/1572

# 0.1.27 (September 13, 2021)

This release adds a new [`Span::or_current`] method to aid in efficiently
propagating span contexts to spawned threads or tasks. Additionally, it updates
the [`tracing-core`] version to [0.1.20] and the [`tracing-attributes`] version to
[0.1.16], ensuring that a number of new features in those crates are present.

### Fixed

- **instrument**: Added missing `WithSubscriber` implementations for futures and
  other types ([#1424])

### Added

- `Span::or_current` method, to help with efficient span context propagation
  ([#1538])
- **attributes**: add `skip_all` option to `#[instrument]` ([#1548])
- **attributes**: record primitive types as primitive values rather than as
  `fmt::Debug` ([#1378])
- **core**: `NoSubscriber`, a no-op `Subscriber` implementation
  ([#1549])
- **core**: Added `Visit::record_f64` and support for recording floating-point
  values ([#1507], [#1522])
- A large number of documentation improvements and fixes ([#1369], [#1398],
  [#1435], [#1442], [#1524], [#1556])

Thanks to new contributors @dzvon and @mbergkvist, as well as @teozkr,
@maxburke, @LukeMathWalker, and @jsgf, for contributing to this
release!

[`Span::or_current`]: https://docs.rs/tracing/0.1.27/tracing/struct.Span.html#method.or_current
[`tracing-core`]: https://crates.io/crates/tracing-core
[`tracing-attributes`]: https://crates.io/crates/tracing-attributes
[`tracing-core`]: https://crates.io/crates/tracing-core
[0.1.20]: https://github.com/tokio-rs/tracing/releases/tag/tracing-core-0.1.20
[0.1.16]: https://github.com/tokio-rs/tracing/releases/tag/tracing-attributes-0.1.16
[#1424]: https://github.com/tokio-rs/tracing/pull/1424
[#1538]: https://github.com/tokio-rs/tracing/pull/1538
[#1548]: https://github.com/tokio-rs/tracing/pull/1548
[#1378]: https://github.com/tokio-rs/tracing/pull/1378
[#1507]: https://github.com/tokio-rs/tracing/pull/1507
[#1522]: https://github.com/tokio-rs/tracing/pull/1522
[#1369]: https://github.com/tokio-rs/tracing/pull/1369
[#1398]: https://github.com/tokio-rs/tracing/pull/1398
[#1435]: https://github.com/tokio-rs/tracing/pull/1435
[#1442]: https://github.com/tokio-rs/tracing/pull/1442
[#1524]: https://github.com/tokio-rs/tracing/pull/1524
[#1556]: https://github.com/tokio-rs/tracing/pull/1556

# 0.1.26 (April 30, 2021)

### Fixed

- **attributes**: Compatibility between `#[instrument]` and `async-trait`
  v0.1.43 and newer ([#1228])
- Several documentation fixes ([#1305], [#1344])
### Added

- `Subscriber` impl for `Box<dyn Subscriber + Send + Sync + 'static>` ([#1358])
- `Subscriber` impl for `Arc<dyn Subscriber + Send + Sync + 'static>` ([#1374])
- Symmetric `From` impls for existing `Into` impls on `span::Current`, `Span`,
  and `Option<Id>` ([#1335], [#1338])
- `From<EnteredSpan>` implementation for `Option<Id>`, allowing `EnteredSpan` to
  be used in a `span!` macro's `parent:` field ([#1325])
- `Attributes::fields` accessor that returns the set of fields defined on a
  span's `Attributes` ([#1331])


Thanks to @Folyd, @nightmared, and new contributors @rmsc and @Fishrock123 for
contributing to this release!

[#1227]: https://github.com/tokio-rs/tracing/pull/1228
[#1305]: https://github.com/tokio-rs/tracing/pull/1305
[#1325]: https://github.com/tokio-rs/tracing/pull/1325
[#1338]: https://github.com/tokio-rs/tracing/pull/1338
[#1344]: https://github.com/tokio-rs/tracing/pull/1344
[#1358]: https://github.com/tokio-rs/tracing/pull/1358
[#1374]: https://github.com/tokio-rs/tracing/pull/1374
[#1335]: https://github.com/tokio-rs/tracing/pull/1335
[#1331]: https://github.com/tokio-rs/tracing/pull/1331

# 0.1.25 (February 23, 2021)

### Added

- `Span::entered` method for entering a span and moving it into a guard by value
  rather than borrowing it ([#1252])

Thanks to @matklad for contributing to this release!

[#1252]: https://github.com/tokio-rs/tracing/pull/1252

# 0.1.24 (February 17, 2021)

### Fixed

- **attributes**: Compiler error when using `#[instrument(err)]` on functions
  which return `impl Trait` ([#1236])
- Fixed broken match arms in event macros ([#1239])
- Documentation improvements ([#1232])

Thanks to @bkchr and @lfranke for contributing to this release!

[#1236]: https://github.com/tokio-rs/tracing/pull/1236
[#1239]: https://github.com/tokio-rs/tracing/pull/1239
[#1232]: https://github.com/tokio-rs/tracing/pull/1232

# 0.1.23 (February 4, 2021)

### Fixed

- **attributes**: Compiler error when using `#[instrument(err)]` on functions
  with mutable parameters ([#1167])
- **attributes**: Missing function visibility modifier when using
  `#[instrument]` with `async-trait` ([#977])
- **attributes** Removed unused `syn` features ([#928])
- **log**: Fixed an issue where the `tracing` macros would generate code for
  events whose levels are disabled statically by the `log` crate's
  `static_max_level_XXX` features ([#1175])
- Fixed deprecations and clippy lints ([#1195])
- Several documentation fixes and improvements ([#941], [#965], [#981], [#1146],
  [#1215])
  
### Changed

- **attributes**: `tracing-futures` dependency is no longer required when using
  `#[instrument]` on async functions ([#808])
- **attributes**: Updated `tracing-attributes` minimum dependency to v0.1.12
  ([#1222])

Thanks to @nagisa, @Txuritan, @TaKO8Ki, @okready, and @krojew for contributing
to this release!

[#1167]: https://github.com/tokio-rs/tracing/pull/1167
[#977]: https://github.com/tokio-rs/tracing/pull/977
[#965]: https://github.com/tokio-rs/tracing/pull/965
[#981]: https://github.com/tokio-rs/tracing/pull/981
[#1215]: https://github.com/tokio-rs/tracing/pull/1215
[#808]: https://github.com/tokio-rs/tracing/pull/808
[#941]: https://github.com/tokio-rs/tracing/pull/941
[#1146]: https://github.com/tokio-rs/tracing/pull/1146
[#1175]: https://github.com/tokio-rs/tracing/pull/1175
[#1195]: https://github.com/tokio-rs/tracing/pull/1195
[#1222]: https://github.com/tokio-rs/tracing/pull/1222

# 0.1.22 (November 23, 2020)

### Changed

- Updated `pin-project-lite` dependency to 0.2 ([#1108])

[#1108]: https://github.com/tokio-rs/tracing/pull/1108

# 0.1.21 (September 28, 2020)

### Fixed

- Incorrect inlining of `Span::new`, `Span::new_root`, and `Span::new_child_of`,
  which could result in  `dispatcher::get_default` being inlined at the callsite
  ([#994])
- Regression where using a struct field as a span or event field when other
  fields on that struct are borrowed mutably would fail to compile ([#987])

### Changed

- Updated `tracing-core` to 0.1.17 ([#992])

### Added

- `Instrument` trait and `Instrumented` type for attaching a `Span` to a
  `Future` ([#808])
- `Copy` implementations for `Level` and `LevelFilter` ([#992])
- Multiple documentation fixes and improvements ([#964], [#980], [#981])

Thanks to @nagisa, and new contributors @SecurityInsanity, @froydnj, @jyn514 and
@TaKO8Ki for contributing to this release!

[#994]: https://github.com/tokio-rs/tracing/pull/994
[#992]: https://github.com/tokio-rs/tracing/pull/992
[#987]: https://github.com/tokio-rs/tracing/pull/987
[#980]: https://github.com/tokio-rs/tracing/pull/980
[#981]: https://github.com/tokio-rs/tracing/pull/981
[#964]: https://github.com/tokio-rs/tracing/pull/964
[#808]: https://github.com/tokio-rs/tracing/pull/808

# 0.1.20 (August 24, 2020)

### Changed

- Significantly reduced assembly generated by macro invocations (#943)
- Updated `tracing-core` to 0.1.15 (#943)

### Added 

- Documented minimum supported Rust version policy (#941)

# 0.1.19 (August 10, 2020)

### Fixed

- Updated `tracing-core` to fix incorrect calculation of the global max level
  filter (#908)

### Added

- **attributes**: Support for using `self` in field expressions when
  instrumenting `async-trait` functions (#875)
- Several documentation improvements (#832, #881, #896, #897, #911, #913)

Thanks to @anton-dutov, @nightmared, @mystor, and @toshokan for contributing to
this release!
  
# 0.1.18 (July 31, 2020)

### Fixed

- Fixed a bug where `LevelFilter::OFF` (and thus also the `static_max_level_off`
  feature flag) would enable *all* traces, rather than *none* (#853)
- **log**: Fixed `tracing` macros and `Span`s not checking `log::max_level`
  before emitting `log` records (#870)
  
### Changed

- **macros**: Macros now check the global max level (`LevelFilter::current`)
  before the per-callsite cache when determining if a span or event is enabled.
  This significantly improves performance in some use cases (#853)
- **macros**: Simplified the code generated by macro expansion significantly,
  which may improve compile times and/or `rustc` optimizatation of surrounding
  code (#869, #869)
- **macros**: Macros now check the static max level before checking any runtime
  filtering, improving performance when a span or event is disabled by a
  `static_max_level_XXX` feature flag (#868) 
- `LevelFilter` is now a re-export of the `tracing_core::LevelFilter` type, it
  can now be used interchangeably with the versions in `tracing-core` and
  `tracing-subscriber` (#853)
- Significant performance improvements when comparing `LevelFilter`s and
  `Level`s (#853)
- Updated the minimum `tracing-core` dependency to 0.1.12 (#853)

### Added

- **macros**: Quoted string literals may now be used as field names, to allow
  fields whose names are not valid Rust identifiers (#790)
- **docs**: Several documentation improvements (#850, #857, #841)
- `LevelFilter::current()` function, which returns the highest level that any
  subscriber will enable (#853)
- `Subscriber::max_level_hint` optional trait method, for setting the value
  returned by `LevelFilter::current()` (#853)
  
Thanks to new contributors @cuviper, @ethanboxx, @ben0x539, @dignati,
@colelawrence, and @rbtcollins for helping out with this release!

# 0.1.17 (July 22, 2020)

### Changed

- **log**: Moved verbose span enter/exit log records to "tracing::span::active"
  target, allowing them to be filtered separately (#833)
- **log**: All span lifecycle log records without fields now have the `Trace`
  log filter, to guard against `log` users enabling them by default with blanket
  level filtering (#833)
  
### Fixed

- **log**/**macros**: Fixed missing implicit imports of the
  `tracing::field::debug` and `tracing::field::display` functions inside the
  macros when the "log" feature is enabled (#835)

# 0.1.16 (July 8, 2020)

### Added

- **attributes**: Support for arbitrary expressions as fields in `#[instrument]` (#672)
- **attributes**: `#[instrument]` now emits a compiler warning when ignoring unrecognized
  input (#672, #786)
- Improved documentation on using `tracing` in async code (#769)

### Changed

- Updated `tracing-core` dependency to 0.1.11

### Fixed

- **macros**: Excessive monomorphization in macros, which could lead to
  longer compilation times (#787) 
- **log**: Compiler warnings in macros when `log` or `log-always` features
  are enabled (#753)
- Compiler error when `tracing-core/std` feature is enabled but `tracing/std` is
  not (#760)

Thanks to @nagisa for contributing to this release!

# 0.1.15 (June 2, 2020)

### Changed

- **macros**: Replaced use of legacy `local_inner_macros` with `$crate::` (#740)

### Added

- Docs fixes and improvements (#742, #731, #730)

Thanks to @bnjjj, @blaenk, and @LukeMathWalker for contributing to this release!

# 0.1.14 (May 14, 2020)

### Added

- **log**: When using the [`log`] compatibility feature alongside a `tracing`
  `Subscriber`, log records for spans now include span IDs (#613)
- **attributes**: Support for using `#[instrument]` on methods that are part of
  [`async-trait`] trait implementations (#711)
- **attributes**: Optional `#[instrument(err)]` argument to automatically emit
  an event if an instrumented function returns `Err` (#637) 
- Added `#[must_use]` attribute to the guard returned by
  `subscriber::set_default` (#685)
  
### Changed

- **log**: Made [`log`] records emitted by spans much less noisy when span IDs are
 not available (#613)
 
### Fixed

- Several typos in the documentation (#656, #710, #715)

Thanks to @FintanH, @shepmaster, @inanna-malick, @zekisharif, @bkchr, @majecty,
@ilana and @nightmared for contributing to this release! 

[`async-trait`]: https://crates.io/crates/async-trait 
[`log`]: https://crates.io/crates/log

# 0.1.13 (February 26, 2019)

### Added

- **field**: `field::Empty` type for declaring empty fields whose values will be
  recorded later (#548)
- **field**: `field::Value` implementations for `Wrapping` and `NonZero*`
  numbers (#538)
- **attributes**: Support for adding arbitrary literal fields to spans generated
  by `#[instrument]` (#569)
- **attributes**: `#[instrument]` now emits a helpful compiler error when
  attempting to skip a function parameter (#600)

### Changed

- **attributes**: The `#[instrument]` attribute was placed under an on-by-default
  feature flag "attributes" (#603)

### Fixed

- Broken and unresolvable links in RustDoc (#595)

Thanks to @oli-cosmian and @Kobzol for contributing to this release!

# 0.1.12 (January 11, 2019)

### Added

- `Span::with_subscriber` method to access the subscriber that tracks a `Span`
  (#503)
- API documentation now shows which features are required by feature-flagged
  items (#523)
- Improved README examples (#496)
- Documentation links to related crates (#507)

# 0.1.11 (December 20, 2019)

### Added

- `Span::is_none` method (#475)
- `LevelFilter::into_level` method (#470)
- `LevelFilter::from_level` function and `From<Level>` impl (#471)
- Documented minimum supported Rust version (#482)

### Fixed

- Incorrect parameter type to `Span::follows_from` that made it impossible to
  call (#467)
- Missing whitespace in `log` records generated when enabling the `log` feature
  flag (#484)
- Typos and missing links in documentation (#405, #423, #439)

# 0.1.10 (October 23, 2019)

### Added

- Support for destructuring in arguments to `#[instrument]`ed functions (#397)
- Generated field for `self` parameters when `#[instrument]`ing methods (#397)
- Optional `skip` argument to `#[instrument]` for excluding function parameters
  from generated spans (#359)
- Added `dispatcher::set_default` and `subscriber::set_default` APIs, which
  return a drop guard (#388)

### Fixed

- Some minor documentation errors (#356, #370)

# 0.1.9 (September 13, 2019)

### Fixed

- Fixed `#[instrument]`ed async functions not compiling on `nightly-2019-09-11`
  or newer (#342)

### Changed

- Significantly reduced performance impact of skipped spans and events when a
  `Subscriber` is not in use (#326)
- The `log` feature will now only cause `tracing` spans and events to emit log
  records when a `Subscriber` is not in use (#346)

### Added

- Added support for overriding the name of the span generated by `#[instrument]`
  (#330)
- `log-always` feature flag to emit log records even when a `Subscriber` is set
  (#346)

# 0.1.8 (September 3, 2019)

### Changed

- Reorganized and improved API documentation (#317)

### Removed

- Dev-dependencies on `ansi_term` and `humantime` crates, which were used only
  for examples (#316)

# 0.1.7 (August 30, 2019)

### Changed

- New (curly-brace free) event message syntax to place the message in the first
  field rather than the last (#309)

### Fixed

- Fixed a regression causing macro stack exhaustion when the `log` feature flag
  is enabled (#304)

# 0.1.6 (August 20, 2019)

### Added

- `std::error::Error` as a new primitive type (#277)
- Support for mixing key-value fields and `format_args` messages without curly
  braces as delimiters (#288)

### Changed

- `tracing-core` dependency to 0.1.5 (#294)
- `tracing-attributes` dependency to 0.1.2 (#297)

# 0.1.5 (August 9, 2019)

### Added

- Support for `no-std` + `liballoc` (#263)

### Changed

- Using the `#[instrument]` attribute on `async fn`s no longer requires a
  feature flag (#258)

### Fixed

- The `#[instrument]` macro now works on generic functions (#262)

# 0.1.4 (August 8, 2019)

### Added

- `#[instrument]` attribute for automatically adding spans to functions (#253)

# 0.1.3 (July 11, 2019)

### Added

- Log messages when a subscriber indicates that a span has closed, when the
  `log` feature flag is enabled (#180).

### Changed

- `tracing-core` minimum dependency version to 0.1.2 (#174).

### Fixed

- Fixed an issue where event macro invocations with a single field, using local
  variable shorthand, would recur infinitely (#166).
- Fixed uses of deprecated `tracing-core` APIs (#174).

# 0.1.2 (July 6, 2019)

### Added

- `Span::none()` constructor, which does not require metadata and
  returns a completely empty span (#147).
- `Span::current()` function, returning the current span if it is
  known to the subscriber (#148).

### Fixed

- Broken macro imports when used prefixed with `tracing::` (#152).

# 0.1.1 (July 3, 2019)

### Changed

- `cfg_if` dependency to 0.1.9.

### Fixed

- Compilation errors when the `log` feature is enabled (#131).
- Unclear wording and typos in documentation (#124, #128, #142).

# 0.1.0 (June 27, 2019)

- Initial release


---

<!-- source: archive/library/software-projects/references/polywell/Changelog--000176.md -->

## Imported source: archive/library/software-projects/references/polywell/Changelog--000176.md

# 0.9.5 / ???

* Experimental support for running in a terminal.

# 0.9.0 / 2020-10-27

* New alt-x `execute` command.
* Move handlers to `polywell.handlers` and commands to `polywell.cmd` tables.
* Massive deprecations and renames.
* Rewrite mode system to use modules instead of being imperative.
* Rewrite filesystem adapter to interface thru a handful of functions.
* Split out love-specific bits into frontend module.
* Rewrite much of the code in Fennel.

# 0.3.0 / 2018-02-17

* Fix completion for opening files off disk.
* Support reloading polywell from inside polywell.
* Screen splits (choose from 3 hard-coded layouts).
* Rudimentary Clojure mode and nrepl client.
* Add polywell.coroutines for background tasks.
* Support setting mouse cursors on a per-mode basis.
* Allow console's loadstring function to be customized.
* Support drawing minibuffer with custom draw function.
* Better support for drawing non-textual buffers.

# 0.2.0 / 2016-09-13

* Rename event handler functions to match LÖVE naming.
* Write reference manual.
* Add `with_output_to` function to redirect `print` and `write`.
* Add mouse handlers.
* Allow modes to define their own wrap functions for custom undo.
* Add Emacs-style prefix maps for key bindings.

# 0.1.0 / 2016-09-04

* Initial release as a standalone project.
