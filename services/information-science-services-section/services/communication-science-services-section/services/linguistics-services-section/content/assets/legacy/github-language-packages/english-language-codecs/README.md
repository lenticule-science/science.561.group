# language-generation

`@561-group/language-generation` is the language-generation package in the paraconsistent language stack.

It realizes meaning back into prose. Inputs can be role frames, clause specs, settled sections, or an append-only settling trace. The package preserves bilattice regimes in output: affirmed cells become asserted clauses, denied cells become negated clauses, void cells are omitted but auditable, and contradictions realize a calm default while keeping audit evidence.

The package is authored as explicit ESM TypeScript in `src/*.mts` and distributes emitted `dist/*.mjs` runtime files with `.d.ts` declarations. Downstream packages should import `@561-group/language-generation` or its public subpaths instead of importing source files.

## Public Surface

- `realizeClause(spec)` realizes one clause with language-parsing-backed English morphology.
- `plan(frames)` and `generate(frames)` turn role frames into prose.
- `realizeSection(section)` realizes settled charged cells into prose, drops, and audit records.
- `sectionFromText(text)` bridges a language-parsing parse into a language-generation section for round-trip checks.
- `model()`, `ingest()`, `predict()`, and `settleNext()` provide the append-only settling model.

## Archive Parity

The live package keeps the archived 2026-06-07 generation ideas: inverse parse/realize flow, four-valued output discipline, honest abstention, held contradictions, round-trip sectioning, and an online trace model. It is now typed and packaged around the directory name `language-generation`.
