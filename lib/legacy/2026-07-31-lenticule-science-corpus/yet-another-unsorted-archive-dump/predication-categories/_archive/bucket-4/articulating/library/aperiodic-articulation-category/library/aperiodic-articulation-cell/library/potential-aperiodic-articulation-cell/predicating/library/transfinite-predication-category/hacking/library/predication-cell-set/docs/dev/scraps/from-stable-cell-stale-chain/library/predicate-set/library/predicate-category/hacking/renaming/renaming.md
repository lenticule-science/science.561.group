---
name: renaming
gerund: renaming
agent-noun: renamer
imperative: rename
description: Moving a file or directory to a new path and rewriting every reference to the old path across the repository.
---

A rename transformer changes a path: it performs `git mv` from old to new, then greps the repository for references to the old path (markdown links, frontmatter values, code imports, hook commands, JSON config entries) and rewrites each to the new path.

Rename's distinguishing feature is the cascade. A `git mv` alone leaves every reference to the old path stale; the rename transformer closes that cascade in one operation.

## Domain and codomain

- **Domain:** `(old-path, new-path)` where old-path exists and new-path does not.
- **Codomain:** the renamed path on disk, plus a report of every reference rewrite and any unmatched references that need manual attention.

## Morphological forms in naming grammar

- `gerund: renaming` heads skills built on this transformer: `renaming-a-file-path`.
- `agent-noun: renamer` heads agents that invoke such skills: `renamer-of-a-file-path`.
- `imperative: rename` heads scripts that body such skills: `rename-a-file-path.mjs`.
