---
title: "variety/ re-derivation against the four-regime grammar"
date: 2026-05-28
prior-location: "lab/hacking/articulating/library/stable-articulation-cell/predicating/hacking/library/predication-cell-set/library/predicate-set/library/predicate-category/library/variety/"
---

# variety/ re-derivation

## What this subtree was trying to say

The `variety/` subtree, written before the 2026-05-27 four-regime grammar stabilized, is the construction of the **value-algebra carrier that predication cells take their values in**. It is one mathematical chain doing one mathematical job:

- `lattice/` — the bounded distributive lattice algebra `⟨L, ⊓, ⊔, ⊥, ⊤⟩` that supplies the underlying carrier.
- `lattice/library/twist-product/` — the construction `L ⋈ L` (with `L = L`) producing a pre-bilattice; equipping with swap-negation produces a bilattice; specializing to `L = 2` gives `FOUR`.
- `lattice/library/sigma-algebra/` — the σ-complete Boolean specialization (used to type measure-theoretic predications).
- `lattice/library/residuated-lattice/` — the bounded integral commutative residuated lattice `⟨L, ⊓, ⊔, ⊥, ⊤, ⊗, →, e⟩` that parameterizes the predication-fiber algebra `A_p = L^⋈^(E×E)`.
- `lattice/library/closure-operator/` — the abstract extensive-monotone-idempotent endomap whose fixed-point sub-poset is coreflective.

## Why predicating tier

The whole chain is **the codomain-algebra of predicating**. The predicating morphism's result lives in a bilattice on a residuated-lattice carrier, with FOUR as the canonical specialization. None of these terms presuppose the regime hierarchy; they ARE the value-algebra the regime hierarchy classifies. They are therefore terms of `transfinite-predication-category` — that being the regime category at the predicating level.

## Why the move was needed

The prior path placed `variety/` under `predicate-category/library/`, which read it as "varieties are terms of predicate-category." But `predicate-category` (in current grammar) is the category whose objects are *predicates as labels* (each predicate carries its `specializing`/`conversing`/`projecting-to-subject`/`projecting-to-object` morphism class). The value-algebra of a predication is not a predicate; it is the codomain of predicating. The placement was claiming the wrong theorem.

In the 2026-05-27 grammar, predicating's generated category is `transfinite-predication-category`. The value-algebra (lattice, bilattice, twist-product, residuated-lattice) lives as a term of that category. This subtree's placement now reflects that.

## Note on `closure-operator`

`closure-operator/` is housed under `lattice/library/` because closure operators on lattices is the natural mathematical setting. But the abstract closure-operator is *operationally* the structure that the **settling morphism** realizes at its strict-finite regime (and positing realizes at Scott-continuous, predicating at transfinite-bounded, articulating at aperiodic). The four-regime tower IS the classification of closure operators by stabilizing ordinal. The placement under `variety/library/lattice/library/closure-operator/` is the *algebraic-structure* reading; the operational specialization of closure-operator at each regime lives at that regime's category, downstream.

## Untouched internal structure

The internal organization of `variety/library/lattice/...` was preserved by this move (single `git mv variety` from the old location). No re-derivation has been done yet of:

- `variety/library/lattice/library/twist-product/residuating-right-by-twist-product/`
- `variety/library/lattice/library/twist-product/fusing-by-twist-product/`
- `variety/library/lattice/library/twist-product/library/bilattice-value/library/knowledge-order/`
- `variety/library/lattice/library/sigma-algebra/library/measurable-space/library/measure-space/`
- `variety/library/lattice/library/closure-operator/library/closure-rule-system/`

Each of these is a downstream term inside the value-algebra chain. Their placements are inherited from `variety/`'s move; their substantive content has not been re-read against the current grammar.
