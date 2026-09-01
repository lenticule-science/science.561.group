---
title: "Bibliography automation"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
status: draft
priority: low
depends-on: []
goal: "003"
---

## Summary

Generate `bibliography.bib` on demand from `references:` frontmatter
fields distributed across the vault. The per-file `references:` field
is the source of truth for bibliographic data; the consolidated .bib
file is a derived artifact.

## Motivation

A hand-maintained bibliography is fragile and disconnects from the
content that uses it. The citation spec (semiotic-markdown/citations.md)
now specifies that `references:` frontmatter fields carry structured
bibliographic data per-file, and that `bibliography.bib` SHOULD be
generated from these fields. This plan implements that specification.

Each file's `references:` field makes the file self-standing — a
reader does not need the centralized .bib to understand what is cited.
The generated .bib file serves build-time tools (pandoc-citeproc) and
cross-vault aggregation.

## Steps

1. Write `generate-bibliography.py` alongside existing scripts in
   `technology/specifications/agential-semioverse-repository/scripts/`.
   Reuse the `parse_frontmatter` function from `predicate-graph.py`.
2. The script should:
   - Scan all `.md` files for `references:` frontmatter fields
   - Extract structured bibliographic data (authors, title, year, etc.)
   - Detect and report conflicts (same citekey, different data)
   - Generate `bibliography.bib` in BibTeX format
   - Report audit findings: orphaned `[@citekey]` references,
     unresolvable `cites:` entries, inconsistent duplicates
3. Write a companion SKILL.md for the generation/audit.
4. Migrate existing `bibliography.bib` entries into `references:`
   fields on the files that use them (incremental, highest-cited first).
5. Migrate free-text `cites:` entries to resolvable format where
   possible (citekey or structured "Author. Title. Year." format).

## Done when

- [ ] generate-bibliography.py compiles `references:` into valid BibTeX
- [ ] Audit mode reports orphaned citekeys and unresolvable cites
- [ ] SKILL.md exists for generation and audit
- [ ] Top 20 most-cited sources have `references:` entries on their files
- [ ] bibliography.bib matches generated output (or is replaced by it)

## Dependencies

- `predicate-graph.py` (for frontmatter parsing infrastructure)
- Citation spec (semiotic-markdown/citations.md) for field definitions

## Log

**2026-03-07** — Created. Prompted by emsenn observing that hand-coded
bibliography.bib is fragile and disconnected from content.

**2026-03-07** — Revised. Direction clarified: `references:` frontmatter
is the source of truth, bibliography.bib is a generated artifact.
Citation spec (semiotic-markdown/citations.md) updated to specify
on-demand bibliography generation, resolvable `cites:` formats, and
audit capabilities. The open question (per-file vs centralized) is
resolved: per-file `references:` is the source of truth; centralized
.bib is generated from it.
