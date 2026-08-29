---
title: Relational-Hyperverse Archive Recovery
description: Identifies mathematical research at risk from relational-hyperverse triage compression and catalogs content essential for archival preservation.
date-created: 2026-04-06
type: note
name: relational-hyperverse-archive-recovery
keywords:
  - archival-recovery
  - triage-compression
  - voidmath
  - partition-function
  - computational-discovery
specialization: plan
project: ordering-first-computation
serves-system: fars
owner: first-officer
priority: "2"
work-type: procedure
horizon: week
---

The relational-hyperverse repo on GitHub contains the original mathematical research that produced the voidmath, the predication paper, the partition function, and the nuclear quartet theory. It was imported into this repository's triage at `operations/engineering/triage/content/relationality/triage/relational-hyperverse/`, but triage imports compress — multiple drafts become one file, intermediate proofs are lost, exploratory computations survive only if they were in the latest state.

## What's at risk

The voidmath documents (finite-voidmath.md: 212 lines, infinite-voidmath.md: 239 lines) were compressed from earlier, more detailed drafts. Known prior versions in old-drafts/:
- `finite-nucleus.md`, `infinite-nucleus.md` — earlier nucleus-focused formulations
- `finite-relational-math.md`, `infinite-relational-math.md` — broader relational math
- `voidmath-20260325/`, `voidmath-20260325B/` — dated drafts with Lean lakefile.toml
- `void/`, `new-void/` — Lean formalization attempts with lake-manifest.json

The git history likely contains:
- Intermediate lemmas and abandoned proof strategies
- Earlier partition function derivations (before the Padovan correction)
- The computational notebooks that led to zeta.py discovering ρ instead of φ
- Exploratory work on RSA/quasicrystal factoring via bypass structure
- Music generation from the quartet structure
- The original Teraum MUD world design documents

## Known local content (already in triage)

| Category | Files | Status |
|----------|-------|--------|
| Current voidmath | finite-voidmath.md, infinite-voidmath.md, voidmath-ideas.md | Active, possibly compressed |
| Old drafts | 4 math files, 2 voidmath dated versions | Present but not audited |
| Lean attempts | void/, new-void/ with lakefile.toml | Present, formalization status unknown |
| Python toys | zeta.py, universe.py, void.py, bypass.py, engine.py, measure.py, strata.py | Present, contain discoveries (Padovan) |
| RSA sandbox | 8 Python files for bypass/zeta oracle factoring | Present, mathematical significance unknown |
| Art/music | 10+ visualization and sonification scripts | Present, lower priority |
| Teraum MUD world | Entire world directory tree | Present, relates to predication-world-sim |

## Why this matters now

The predication-world-sim document (826 lines) builds heavily on the voidmath. The partition function section had to be corrected from Fibonacci/φ to Padovan/ρ based on a Python toy (zeta.py) that could easily have been lost in compression. If one computational discovery survived by luck, others may not have. The archive must be secured before any further triage compression.
