---
name: resolving-a-skill-name
description: Parses a skill's directory slug as `<gerund>(-a|-an|-the)?-<noun>(-<modifier>)*`, verifies the gerund resolves to a transformer record and the noun to a structure record, and reports whether the expected script file exists. Use to audit a skill's name before dispatch or to find skills whose names no longer parse after vocabulary changes.
title: resolving-a-skill-name
---

## Requirements

- `slug` (string) — the skill directory name (e.g. `writing-a-resource-file`). Alternative: pass `path` and the script derives the slug.
- `path` (optional string) — path to a skill directory or its `SKILL.md`. If supplied, the slug is the directory basename.
- `check_script` (optional boolean, default `true`) — whether to also verify the expected `scripts/<imperative>-<noun>.mjs` exists.
- `repo_root` (optional, default CWD).

## Steps

1. Resolve the slug from either `slug` or `path`.
2. Load the names registry: every transformer's `gerund` and `imperative`, every structure stem.
3. Greedy-consume the longest head of the slug that matches a known gerund. Strip any `a|an|the` article. The remaining tokens form the structure noun.
4. Verify the structure noun resolves to a `code/structures/<noun>.md` record.
5. If `check_script`, compute the expected script name `<imperative>-<modifiers...>-<noun>.mjs` and check it exists under `scripts/`.
6. Return `{ ok, slug, gerund?, transformer?, structure?, modifier_tail?, expected_script?, script_exists?, reason? }`.

## Outcomes

- Returns `ok: true` with the parsed components when the slug resolves and the script (if checked) is present.
- Returns `ok: false` with `reason` when the head does not resolve, the structure noun does not resolve, or the script file is missing.
- Read-only; never writes.
