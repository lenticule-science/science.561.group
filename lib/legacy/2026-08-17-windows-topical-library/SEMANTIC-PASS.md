# Semantic consolidation pass

> **Normalization status:** This routing pass is complete, but its 7,613 active
> destinations are not accepted as fully canonical. Exact, normalized-text,
> metadata-only, and flattened-name residue is quantified in
> [`NORMALIZATION-AUDIT.md`](NORMALIZATION-AUDIT.md) and requires finer reviewed
> passes.

The second pass over the mixed Windows library was completed after the
lossless staging move. It grouped path-flattened and textual near-duplicates
by canonical destination and merged distinct claims into the surviving file;
each appended variant carries its original staged source path in a source
comment and heading.

| Result | Count |
| --- | ---: |
| Source text payloads integrated | 9,483 |
| Distinct canonical destination files receiving integrated text | 7,613 |
| Exact-byte duplicates consolidated | 739 |
| Source payload files retained as archival code, assets, or structured source trees | 1,039 |
| Source branch descriptors retained with the migration record | 6 |

Text was routed according to its role: `terms`, `concepts`, and `topics`
became the owning science glossary material; other explanatory text became
that service's text triage. Explicit ownership cues were honored for emsenn
personal material, Sigmund Vexler, Koios News, Cassia Lorne, and Teraum/MUD
material, sending them to their existing personal, persona, or service homes.
The retained set is principally HTML applications, programming-language
source, generated/static assets, and their necessary supporting files; it was
not left in legacy merely because its source directory was called `archive`.

No sibling archive corpus was included in this pass. The complete path-level
accounting is in [`MIGRATION-LEDGER.tsv`](MIGRATION-LEDGER.tsv); its 9
generated duplicate-provenance rows and 7 migration-metadata rows are
explicitly labelled rather than mixed into the source-payload counts.
