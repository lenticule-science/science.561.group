---
name: auditing-structures-in-a-filestore
description: Audits all structure entities in a filestore — runs linting across structures/, emits a witness report entity to work/logs/, and records the overall auditing bilattice value.
title: auditing-structures-in-a-filestore
---

A governance process, not just batch linting.
Sequences: (1) lint all structure entities, (2) collect findings, (3) write a report entity to `work/logs/<date>/`, (4) print the auditing result.

The [auditing](../../../transformers/auditing.md) cell $(filestore, \mathtt{auditing}, \mathtt{auditing\text{-}structures\text{-}in\text{-}a\text{-}filestore})$ is **true** if no violations were found, **false** if violations were found.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

One `<rel-path>: FAIL: <message>` line per violation, then a `report written: <path>` line, then `true` (exits 0) or `false` (exits 1).

The report entity written to `work/logs/<date>/` is a substrate-recorded witness of this audit.

## Script

`scripts/audit-structures.mjs`
