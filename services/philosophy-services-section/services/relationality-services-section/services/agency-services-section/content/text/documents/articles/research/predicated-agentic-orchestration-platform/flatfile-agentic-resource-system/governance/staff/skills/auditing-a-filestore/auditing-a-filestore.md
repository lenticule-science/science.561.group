---
name: auditing-a-filestore
description: Composite audit of a complete filestore — sequences per-kind audits across all entity kinds, emits a summary report entity to work/logs/, and records the overall auditing bilattice value.
title: auditing-a-filestore
---

Sequences the per-kind auditing skills across all seven auditable kinds:

1. structures
2. transformers
3. concepts
4. claims
5. questions
6. skills
7. rules

Collects all per-kind violation lines, writes a single composite report entity to `work/logs/<date>/`, and prints the final bilattice value.

The [auditing](../../../transformers/auditing.md) cell $(filestore, \mathtt{auditing}, \mathtt{auditing\text{-}a\text{-}filestore})$ is **true** if all per-kind audits pass, **false** if any violation was found in any kind.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

Per-kind per-entity violation lines (`<rel-path>: FAIL: <message>`), then a `report written: <path>` line, then `true` (exits 0) or `false` (exits 1).

The report entity written to `work/logs/<date>/` is a substrate-recorded witness of this audit.

## Script

`scripts/audit-filestore.mjs`
