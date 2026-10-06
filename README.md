# Lenticule Science

The [561 Group](https://561.group) operates Lenticule Science.

Lenticule Science conducts scientific research for the 561 Group. It coordinates with Red Cup Engineering, Coesite Operations, and Causeway Services.

## Writing standard

Lenticule Science uses Plain Technical General American English (PTGAE) for technical prose. State the proposition first. Encode uncertainty as a precise claim status when it changes meaning, action, safety, or evidence.

The current PTGAE standard is in `docs/plain-technical-general-american-english.md`.

- Run `node tools/ptgae-lint.mjs FILE [...]` to lint specific files.
- Run `node tools/ptgae-corpus-scan.mjs PATH [...]` to scan a text corpus.
- Run `node tools/ptgae-rewrite.mjs FILE [...]` only for allow-listed semantics-preserving rewrites.
- Run `node tools/ptgae-corpus-rewrite.mjs PATH [...]` for a dry-run corpus rewrite report; add `--write` only after reviewing the proposed changes.

The linter ignores Markdown code examples. Automatic rewriting is narrower than linting: a flagged phrase is not permission to change substantive meaning. Automatic rewriting also preserves Markdown blockquotes and straight or curly quoted source text. Corpus scanning does not follow symbolic links.
