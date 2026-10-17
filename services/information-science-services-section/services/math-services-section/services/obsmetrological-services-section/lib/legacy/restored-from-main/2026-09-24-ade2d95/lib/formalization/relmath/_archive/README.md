# `lean/_archive/` — congregation of prior Lean attempts

This directory gathers **every distinct prior Lean attempt** found across the repo
(both the `content/` submodule and the top-level `_archive/`), deduplicated and
flattened to clean names. It is a graveyard / reference, not a build target.

The live library being built **downstream** of these attempts is `lean/RelMath`
(dependency-free, no Mathlib). These archived attempts are kept for their *math*,
not their structure — most leaned on Mathlib and are therefore superseded by the
dependency-free mandate.

## What was gathered

364 `.lean` files across 9 distinct attempts. The source corpus held 926 `.lean`
files, but the rest were **provenance duplicates**: the `gsu-ccs-20260313`
RelationalHyperverse skeleton alone existed as 5 byte-identical copies scattered
through `_archive/emsenn-archive-org/`, and `semiotic-universe` had degenerate
1-file stubs in two more places. Only one canonical copy of each was kept.

| Directory | `.lean` | Deps | Origin |
|---|---|---|---|
| `relational-hyperverse/` | 169 | **Mathlib + REPL** | `content/_archive/animating/.../proof/RelationalHyperverse` — most developed attempt; sprawling (Conjecture*, Spectral*, Fischer-Rao, cohomology). |
| `relational-hyperverse-gsu-ccs-20260313/` | 140 | **Mathlib + REPL** | earlier skeleton (~330 B/file stubs); from `from-gsu-ccs-20260313/proof/RelationalHyperverse`. 5 identical provenance copies collapsed to 1. |
| `spatiotemporal-knowledge-system/` | 19 | **partly dep-free** | `_archive/emsenn-archive-code/.../predication-categories/bucket-3-lean`. Contains a `Homebrew/` subtree (`Order/Basic`, `Algebra/ResiduatedLattice`, `Predication/FiberAlgebra`, `Settling/{Closure,CRDT,SKP}`) — **the most relevant prior art** for a dependency-free build. |
| `semiotic-universe/` | 12 | dep-free | `content/_archive/library/philosophy/relationality/.../semiotic-universe/.../lean`. |
| `from-predicate-category/` | 13 | Mathlib | the `.lean` files extracted from `content/_archive/from-predicate-category` (the surrounding 261-file prose corpus was *not* copied). predicate-category / fiber-algebra / four-theorems. |
| `predication-hyperdoctrine/` | 7 | Mathlib | orphan `.lean` from `content/mark/.../settling/...` — the hyperdoctrine / settling categorical archive (converse-quantifier adjoints, Frobenius, residuated lattice, closure). |
| `relational-infinity-topoi/` | 2 | dep-free | `_archive/emsenn-archive-org/.../relational-infinity-topoi/triage/lean`. |
| `predication-categories-bucket-2/` | 1 | Mathlib | `content/_archive/.../predication-categories/_archive/bucket-2/lean`. |
| `misc-distributed-systems/` | 1 | — | `predication-categorical-archive-predication-crdt.lean` from a distributed-systems archive. |

Empty `void/` `new-void/` `voidmath-*` scaffolds (lakefile only, 0 `.lean`) were
not copied.

## Toolchains the attempts targeted

`v4.28.0` (relational-hyperverse), `v4.29.0-rc4` (semiotic-universe),
`v4.30.0-rc2` (spatiotemporal, infinity-topoi, bucket-2). The live machine has
`v4.31.0`; `RelMath` targets that.

## Why these were superseded

- **Mathlib dependency.** The new mandate is dependency-free. The `Homebrew/`
  subtree of `spatiotemporal-knowledge-system` is the seed of how to do this
  without Mathlib.
- **Free data everywhere.** These attempts postulate structures wherever
  convenient. `RelMath`'s rule: past `Mark` and `Articulating`, *nothing* is
  free — every stage is derived from the one before it.
- **Topical sprawl.** `relational-hyperverse` accreted ~40 `Conjecture*` and
  `Spectral*` modules with no inductive spine. `RelMath` follows the `content/`
  descent (`mark → utterance → articulating → … → settling → hyperdoctrine`)
  as its module order.
