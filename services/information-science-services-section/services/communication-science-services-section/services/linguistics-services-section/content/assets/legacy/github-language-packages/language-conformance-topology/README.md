# language-editing

`@561-group/language-editing` is the prose-linting package in the paraconsistent language stack.

It runs style predicates over prose and represents each result as a bilattice charge. Violations are `f`, explicit compliance can be `t`, contradictions settle to `top`, and unresolved cases can stay `bottom`. Reporting shows violations and conflicts while leaving compliant and void cells quiet.

The package is authored as explicit ESM TypeScript in `src/*.mts` and distributes emitted `dist/*.mjs` runtime files with `.d.ts` declarations. Downstream packages should import `@561-group/language-editing` or its public subpaths instead of importing source files.

## Public Surface

- `lint(text)` runs detection and returns a document verdict.
- `detect(text)` returns the articulated base, charged cells, and implication graph.
- `report(result)` turns cells into diagnostics.
- `stripMarkdown(text)` hides Markdown scaffolding with spaces so offsets remain stable while preserving link text.
- Rule families cover weasel words, wordy phrases, jargon, passive voice, cliches, doublets, spelling consistency, nominalizations, sentence structure, expletive openings, acronyms, and register preferences.
- `ruleImplications(rules)` exposes the abstract predicate hierarchy: leaf rules propagate to parents such as `is-concise`, `is-direct`, `is-precise`, `is-consistent`, `register-consistent`, and `reads-clearly`.

## Archive Parity

The live package keeps the archived 2026-06-07 behavior that mattered: charged findings, implication closure, conflict surfacing, offset-preserving Markdown stripping, and a broader prose rule corpus. It is now typed and packaged around the directory name `language-editing`.
