---
name: auditing-skills-in-a-filestore
description: Audits all skill entities in a filestore — runs linting across governance/staff/skills/, emits a witness report entity to work/logs/, and records the overall auditing bilattice value.
title: auditing-skills-in-a-filestore
---

A governance process, not just batch linting.
Sequences: (1) lint all skill entities, (2) collect findings, (3) write a report entity to `work/logs/<date>/`, (4) print the auditing result.

Skill entities live under `governance/staff/skills/` in either flat form (`<skill>.md`) or directory form (`<skill>/<skill>.md`).
Both layouts are found and audited.

The [auditing](../../../transformers/auditing.md) cell $(filestore, \mathtt{auditing}, \mathtt{auditing\text{-}skills\text{-}in\text{-}a\text{-}filestore})$ is **true** if no violations were found, **false** if violations were found.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

One `<rel-path>: FAIL: <message>` line per violation, then a `report written: <path>` line, then `true` (exits 0) or `false` (exits 1).

The report entity written to `work/logs/<date>/` is a substrate-recorded witness of this audit.

## Script

`scripts/audit-skills.mjs`
