---
name: reformatting
gerund: reformatting
agent-noun: reformatter
imperative: reformat
description: Applying mechanical normalization fixes to a file's content (frontmatter key order, whitespace, line endings) without changing meaning.
---

A reformat transformer reads a file and rewrites its bytes in a normalized form. The output is byte-equivalent in meaning but mechanically tidier: frontmatter keys in canonical order, no trailing whitespace, final newline present, predictable spacing.

Reformat is the auto-fix companion to lint. Where the linter reports a defect the author could fix locally, the reformatter fixes the subset that is unambiguously safe to fix without intervention (the way `gofmt` or `prettier` does).

## Domain and codomain

- **Domain:** a file path and its current bytes.
- **Codomain:** the file rewritten in normalized form, plus a report of what was changed.

## Morphological forms in naming grammar

- `gerund: reformatting` heads skills built on this transformer: `reformatting-a-resource-file`.
- `agent-noun: reformatter` heads agents that invoke such skills: `reformatter-of-a-resource-file`.
- `imperative: reformat` heads scripts that body such skills: `reformat-a-resource-file.mjs`.
