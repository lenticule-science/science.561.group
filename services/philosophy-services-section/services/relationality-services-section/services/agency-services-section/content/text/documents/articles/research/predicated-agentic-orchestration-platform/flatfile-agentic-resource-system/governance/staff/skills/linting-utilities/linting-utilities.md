---
name: linting-utilities
description: Shared ESM library providing frontmatter parsing, transformer-slug resolution, universal-rule checking, argument parsing, and result reporting for all linting scripts in the FARS skill suite.
title: linting-utilities
---

This skill provides no standalone executable.
It is a library dependency for all `linting-a-*-in-a-filestore` and `linting-*s-in-a-filestore` skills.

## Scripts

`scripts/linting-lib.mjs` — exports the following functions:

- `parseFrontmatter(content)` — parses a markdown file's YAML frontmatter block, returning `{ keys, body }` where `keys` is the flat key→value map and `body` is everything after the closing `---`.
- `getTransformerSlugs(filestore)` — reads `<filestore>/transformers/*.md` (excluding `_index.md`) and returns a `Set<string>` of transformer slugs (filename stems).
  This is Ob(C) in the predication fibration.
- `checkUniversalRules(keys, body, entityPath, filestore)` — checks R9, R7/R10, and R13 and returns an array of violation strings.
- `parseArgs(argv)` — parses `--key value` argument pairs from a string array.
- `printResult(violations)` — prints `true` (no violations) or `FAIL: <violation>` lines then `false`, and calls `process.exit(0|1)`.

## Importing

```javascript
import { parseFrontmatter, getTransformerSlugs, checkUniversalRules, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
```

The relative import path assumes the caller script is in `governance/staff/skills/<skill>/scripts/`.
Adjust if the caller is at a different depth.
