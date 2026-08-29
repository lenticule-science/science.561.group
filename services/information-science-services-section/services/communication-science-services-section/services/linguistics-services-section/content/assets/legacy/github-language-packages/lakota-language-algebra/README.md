# language-parsing-lakota

`@561-group/language-parsing-lakota` is the Lakota language bundle for `@561-group/language-parsing`.

It records SOV order, postposed articles, postpositions represented through the current bundle schema, common verb stems, and Lakota pronoun/reference data. Productive prefixal verb morphology is intentionally left void rather than approximated with suffix rules.

This package is useful as a pressure test for language-parsing's bundle-driven attachment behavior because determiners and objects attach in directions English does not use.

The package is authored as `.mts` TypeScript and consumed from emitted
`dist/*.mjs` files with declarations. Use the package root for the compiled
bundle and `@561-group/language-parsing-lakota/bundle` for the raw bundle data.
