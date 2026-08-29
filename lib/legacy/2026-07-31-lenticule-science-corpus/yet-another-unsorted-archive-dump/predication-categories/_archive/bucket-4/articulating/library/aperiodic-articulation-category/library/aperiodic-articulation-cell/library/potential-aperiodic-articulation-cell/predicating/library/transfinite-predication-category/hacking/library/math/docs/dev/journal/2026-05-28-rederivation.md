---
title: "math/ re-derivation against the four-regime grammar"
date: 2026-05-28
prior-location: "lab/hacking/articulating/library/stable-articulation-cell/predicating/hacking/library/predication-cell-set/library/predicate-set/library/predicate-category/hacking/library/math/"
---

# math/ re-derivation

## What this subtree was trying to say

The `math/` namespace was written before the 2026-05-27 grammar stabilized. Its contents are exclusively **record schemas** typing specific kinds of mathematical predication cells:

- `admm-consensus-variable-record` — a federated consensus-variable cell shared across the drone collective.
- `bottom-as-privacy-record` — a cell whose ⊥ value carries privacy semantics.
- `entangled-pair-record` — a cell typing a quantum-style entangled pair.
- `indeterminacy-source-record` — a cell recording the source of indeterminacy in a predication.
- `infinite-alternation-record` — a cell typing an infinite alternation pattern.
- `replay-determinism-vector-record` — a cell typing the replay-determinism vector.
- `rigidity-constraint-record` — a cell typing a rigidity constraint on the predication-fiber algebra.
- `rsc-quiescent` — a settled-state record (despite the name, this looks like a settling-tier artifact).
- `strange-mood-as-non-confluence-record` — a cell encoding a non-confluence in the predication tower.
- `typed-kind-promotion-record` — a cell typing a kind-promotion event.

All of these are **kinds of predication cells**. They live as record-types of `transfinite-predication-cell`. The `math/` namespace is therefore a sub-library of "predication cells used by mathematical content."

## Why predicating tier

Each record is a typed cell schema. Cells live at the predicating tier (they are produced by predicating's evidence-injection function, and their values live in FOUR / the bilattice). The `math/` namespace is therefore a hacked term of `transfinite-predication-category`.

It is `hacking/` because no derivation has been written showing that `math` as a namespace is earned by predication-category — it is admitted at this position.

## Note on `rsc-quiescent`

The name `rsc-quiescent` carries settling-tier vocabulary ("quiescent" = the settled state). If the record actually types a settling-tier artifact and not a predication cell, it belongs at `finite-settlement-algebra/hacking/library/` rather than here. This was not re-checked during the move; the record's substance needs reading.

## Why the move was needed

The prior path placed `math/` under `predicate-category/hacking/library/`. That said "math is a hacked term of predicate-category." But predicate-category (in current grammar) is the category whose objects are *predicates as labels* (each predicate type — `relative-of`, `wise`, etc.). The records inside `math/` are not labels; they are cell schemas. The placement conflated predicate-as-label with cell-as-typed-value.

## Untouched internal content

The record schemas inside `math/library/` were preserved verbatim. Their content has not been re-read against current grammar; the move only fixes the categorical placement. Each record may need further sub-tier audit:

- Records about *cell values* → stay at predicating tier here.
- Records about *closure rules or settled state* → should move down to settling tier.
- Records about *positing events or claim records* → should move to positing tier.

The `rsc-quiescent` record is the immediate next candidate for sub-tier audit.
