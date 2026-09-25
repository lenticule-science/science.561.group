---
title: lean/archive/ — congregation of prior Lean attempts
description: This directory gathers every distinct prior Lean attempt found across the repo (both the content/ submodule and the top-level archive/), deduplicated and flattened to clean names.
---
# `lean/_archive/` — congregation of prior Lean attempts

This directory gathers **every distinct prior Lean attempt** found across the repo (both the `content/` submodule and the top-level `_archive/`), deduplicated and flattened to clean names.
It is a graveyard / reference, not a build target.

The live library being built **downstream** of these attempts is `lean/Infomaterial` (dependency-free, no Mathlib).
These archived attempts are kept for their *math*, not their structure — most leaned on Mathlib and are therefore superseded by the dependency-free mandate.

## What was gathered

43 `.lean` files across 2 still-open attempts.
The source corpus held 926 `.lean` files, but the rest were **provenance duplicates**: the `gsu-ccs-20260313` RelationalHyperverse skeleton alone existed as 5 byte-identical copies scattered through `_archive/emsenn-archive-org/`, and `semiotic-universe` had degenerate 1-file stubs in two more places.
Only one canonical copy of each was kept.

On 2026-06-28, the predication / settling substrate buckets were deleted after review against the active `Infomaterial` tree.
Their FOUR, predicate-category, residuated-lattice, hyperdoctrine, projection-adjoint, closure, settling, and CRDT claims are now implemented better in the dependency-free active modules: `Infomaterial.
Positing.*`, `Infomaterial.
Predicating.*`, `Infomaterial.
Order.*`, `Infomaterial.
Closure.*`, and `Infomaterial.
Cohomology.
CRDTCohomologicalCALM`.

The empty topoi package and `gsu-ccs-20260313` hyperverse skeleton were also deleted as placeholder-only archive matter.
Inside the older `relational-hyperverse/` package, 138 `OPEN: not yet formalized` files with no declarations were removed; the remaining files are declaration-bearing math, import aggregators, or rename shims.

| Directory | `.lean` | Deps | Origin |
|---|---|---|---|
| `relational-hyperverse/` | 31 | **Mathlib + REPL** | `content/_archive/animating/.../proof/RelationalHyperverse` - most developed remaining attempt; stub-only `Conjecture*`, `Spectral*`, etc. files removed. |
| `semiotic-universe/` | 12 | Mathlib | `content/_archive/library/philosophy/relationality/.../semiotic-universe/.../lean`. |

Empty `void/` `new-void/` `voidmath-*` scaffolds (lakefile only, 0 `.lean`) were not copied.

## Toolchains the attempts targeted

`v4.28.0` (relational-hyperverse), `v4.29.0-rc4` (semiotic-universe).
The live machine has `v4.31.0`; `Infomaterial` targets that.

## Why these were superseded

- **Mathlib dependency.** The new mandate is dependency-free.
  The old predicate-category / hyperdoctrine Mathlib files have been retired into active dependency-free Infomaterial modules.
- **Free data everywhere.** These attempts postulate structures wherever convenient.
  `Infomaterial`'s rule: past `Mark` and `Articulating`, *nothing* is free — every stage is derived from the one before it.
- **Topical sprawl.** `relational-hyperverse` accreted ~40 `Conjecture*` and `Spectral*` modules with no inductive spine.
  `Infomaterial` follows the `content/` descent (`mark → utterance → articulating → … → settling → hyperdoctrine`) as its module order.
