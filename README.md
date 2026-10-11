# Lenticule Science

The [561 Group](https://561.group) operates Lenticule Science.

Lenticule Science conducts research for the 561 Group. Red Cup Engineering turns accepted research into technology. Coesite Operations turns accepted technology into operating practice. Causeway Services turns accepted practice into services.

## Writing standard

Lenticule Science uses Plain Technical General American English (PTGAE) for technical prose. State the proposition first. Encode uncertainty as a precise claim status when it changes meaning, action, safety, or evidence.

The existing PTGAE writing standard is in `docs/plain-technical-general-american-english.md`. The new [PlainEng/PTGAE science research section](services/information-science-services-section/services/language-science-services-section/services/english-science-services-section/services/ptgae-science-services-section/README.md) develops its scientific basis and evidence with Red Cup Engineering, without silently replacing the current standard.

- Run `node tools/ptgae-lint.mjs FILE [...]` to lint specific files.
- Run `node tools/ptgae-corpus-scan.mjs PATH [...]` to scan a text corpus.
- Run `node tools/ptgae-corpus-scan.mjs --literal='TEXT' PATH [...]` to verify exact occurrences before a migration.
- Run `node tools/ptgae-rewrite.mjs FILE [...]` only for allow-listed semantics-preserving rewrites.
- Run `node tools/ptgae-corpus-rewrite.mjs PATH [...]` for a dry-run corpus rewrite report; add `--write` only after reviewing the proposed changes.

The linter ignores Markdown code and quoted source text. Automatic rewriting is narrower than linting: a flagged phrase is not permission to change substantive meaning. Automatic rewriting also preserves Markdown blockquotes and straight or curly quoted source text. Corpus scanning does not follow symbolic links.
