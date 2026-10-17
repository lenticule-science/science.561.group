---
title: RelMath archive
description: RelMath's lean/_archive/ congregated 364 .lean files across 9 deduplicated prior Lean attempts found across the repo, kept for their math since most leaned on Mathlib and were superseded by the dependency-free mandate.
---
# RelMath archive

RelMath's `lean/_archive/` gathered every distinct prior Lean attempt found across the repo (both the `content/` submodule and the top-level `_archive/`), deduplicated and flattened to clean names. It was a graveyard/reference, not a build target — the live library built downstream of these attempts was `lean/RelMath` (dependency-free, no Mathlib); the archived attempts were kept for their math, not their structure, since most leaned on Mathlib and were superseded by the dependency-free mandate.

## What was gathered

364 `.lean` files across 9 distinct attempts. The source corpus held 926 `.lean` files, but the rest were provenance duplicates: the `gsu-ccs-20260313` RelationalHyperverse skeleton alone existed as 5 byte-identical copies scattered through `_archive/emsenn-archive-org/`, and `semiotic-universe` had degenerate 1-file stubs in two more places. Only one canonical copy of each was kept.

| Directory | `.lean` files | Deps | Origin |
|---|---|---|---|
| `relational-hyperverse/` | 169 | Mathlib + REPL | `content/_archive/animating/.../proof/RelationalHyperverse` — the most developed attempt; sprawling (Conjecture*, Spectral*, Fischer-Rao, cohomology). |
| `relational-hyperverse-gsu-ccs-20260313/` | 140 | Mathlib + REPL | An earlier skeleton (~330 B/file stubs) from `from-gsu-ccs-20260313/proof/RelationalHyperverse`; 5 identical provenance copies collapsed to 1. |
| `spatiotemporal-knowledge-system/` | 19 | partly dependency-free | `_archive/emsenn-archive-code/.../predication-categories/bucket-3-lean`. Contains a `Homebrew/` subtree (`Order/Basic`, `Algebra/ResiduatedLattice`, `Predication/FiberAlgebra`, `Settling/{Closure,CRDT,SKP}`) — the most relevant prior art for a dependency-free build. |
| `semiotic-universe/` | 12 | dependency-free | `content/_archive/library/philosophy/relationality/.../semiotic-universe/.../lean`. |
| `from-predicate-category/` | 13 | Mathlib | The `.lean` files extracted from `content/_archive/from-predicate-category` (the surrounding 261-file prose corpus was not copied); predicate-category / fiber-algebra / four-theorems. |
| `predication-hyperdoctrine/` | 7 | Mathlib | Orphan `.lean` from `content/mark/.../settling/...` — the hyperdoctrine / settling categorical archive (converse-quantifier adjoints, Frobenius, residuated lattice, closure). |
| `relational-infinity-topoi/` | 2 | dependency-free | `_archive/emsenn-archive-org/.../relational-infinity-topoi/triage/lean`. |
| `predication-categories-bucket-2/` | 1 | Mathlib | `content/_archive/.../predication-categories/_archive/bucket-2/lean`. |
| `misc-distributed-systems/` | 1 | — | `predication-categorical-archive-predication-crdt.lean` from a distributed-systems archive. |

Empty `void/`, `new-void/`, `voidmath-*` scaffolds (lakefile only, 0 `.lean`) were not copied. The attempts targeted toolchains `v4.28.0` (relational-hyperverse), `v4.29.0-rc4` (semiotic-universe), and `v4.30.0-rc2` (spatiotemporal, infinity-topoi, bucket-2).

## Why these were superseded

Mathlib dependency: the dependency-free mandate ruled most of them out; the `Homebrew/` subtree of `spatiotemporal-knowledge-system` was the seed of how to do it without Mathlib. Free data everywhere: these attempts postulated structures wherever convenient, where RelMath's (and now Obsmetrologia's) rule is that past `Mark` and `Articulating`, nothing is free. Topical sprawl: `relational-hyperverse` accreted roughly 40 `Conjecture*` and `Spectral*` modules with no inductive spine, where RelMath followed the `content/` descent (`mark → utterance → articulating → … → settling → hyperdoctrine`) as its module order.

A sibling fork, Infomaterial, kept its own reduced archive (43 files across 2 still-open attempts, after a 2026-06-28 review deleted the predication/settling substrate buckets once their claims were implemented better in Infomaterial's active modules); RelMath's archive above is the fuller, earlier inventory of the same underlying prior-attempt corpus.
