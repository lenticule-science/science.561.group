---
name: pre-bilattice
description: "An algebra ⟨B, ∧_t, ∨_t, ∧_k, ∨_k⟩ in which both ⟨B, ∧_t, ∨_t⟩ and ⟨B, ∧_k, ∨_k⟩ are lattices. The structure twist-product produces, BEFORE negation is added. The intermediate step in the chain lattice → twist-product → pre-bilattice → bilattice → four-bilattice."
symbol: "B"
realizes: [knowledge-order, truth-order]
depends-on: [lattice, twist-product]
derives-from: docs/dev/scraps/pre-bilattice.md
---

# Pre-bilattice

An algebra

$$\mathbf{B} \;=\; \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$$

in which BOTH `⟨B, ∧_t, ∨_t⟩` AND `⟨B, ∧_k, ∨_k⟩` are lattices on the same carrier `B`. The carrier supports two distinct lattice structures with separate meet/join operations for each.

## Induced orders

The two lattice structures induce two orders:

- **Truth order `≤_t`**: associated with `⟨B, ∧_t, ∨_t⟩`. `a ≤_t b` iff `a ∧_t b = a`.
- **Knowledge order `≤_k`**: associated with `⟨B, ∧_k, ∨_k⟩`. `a ≤_k b` iff `a ∧_k b = a`.

When both lattices are bounded, the extremes are distinguished:

- `⟨B, ∧_t, ∨_t⟩` bounded: bottom `f` (most-false), top `t` (most-true).
- `⟨B, ∧_k, ∨_k⟩` bounded: bottom `⊥` (no evidence), top `⊤` (contradictory evidence).

The four distinguished elements `{f, t, ⊥, ⊤}` form the corners of the bilattice's two-axis structure. On `FOUR` they ARE the four values.

## Interlaced vs. non-interlaced

A pre-bilattice is **interlaced** if each of the four lattice operations is monotone with respect to BOTH orders. Concretely, for each `∘ ∈ {∧_t, ∨_t, ∧_k, ∨_k}`:

$$a \leq_t b, \;a' \leq_t b' \quad \Longrightarrow \quad a \circ a' \leq_t b \circ b',$$
$$a \leq_k b, \;a' \leq_k b' \quad \Longrightarrow \quad a \circ a' \leq_k b \circ b'.$$

So every operation respects both orders simultaneously. The four operations work coherently under the two-order structure.

Non-interlaced pre-bilattices exist mathematically (the operations can be chosen to break monotonicity in one order while respecting the other), but they are pathological for predication: the structural coherence required by Avron's representation theorem and the predicate-category morphisms fails. The substrate's pre-bilattices are all interlaced.

## Distributive vs. non-distributive

A pre-bilattice is **distributive** if all twelve distributive laws hold:

$$x \circ (y \bullet z) \;\approx\; (x \circ y) \bullet (x \circ z)$$

for distinct `∘, • ∈ {∧_t, ∨_t, ∧_k, ∨_k}`. The 12 = `C(4, 2) × 2` choice counts twelve distinct distributivity pairs.

Distributivity is desirable: it makes the algebra well-behaved under transformation. The substrate's pre-bilattices are all distributive when their underlying lattice `L` is.

## Twist-product produces exactly the pre-bilattices

By Avron's representation theorem, every **interlaced bounded** pre-bilattice (with negation added) is isomorphic to `L^⋈` for some bounded lattice `L`. Without negation, every interlaced bounded pre-bilattice is isomorphic to `L₁ ⋈ L₂` for two bounded lattices.

So the twist-product construction `⋈` is universal among the interlaced bounded pre-bilattices: every such pre-bilattice arises this way.

This is structurally important. It means the substrate's choice to build value-algebras as `L^⋈` is not a restrictive choice; it generates the full universe of interlaced bounded structures.

## Relation to bilattice — what negation adds

A pre-bilattice equipped with a unary **negation** `~` (antitone in `≤_t`, monotone in `≤_k`, involutive) is a **bilattice**. The structural step:

$$\text{pre-bilattice} \;+\; \text{negation} \;=\; \text{bilattice}.$$

The intermediate `pre-bilattice` step makes the structure-before-negation explicit. The earlier chain version skipped it and went directly from twist-product to bilattice; the corrected chain is:

```
variety → lattice → twist-product → pre-bilattice → bilattice → four-bilattice
                                       ↑                ↑
                          structure twist-product       pre-bilattice
                          produces before negation      + negation
```

The path `…/twist-product/library/pre-bilattice/` says exactly: a pre-bilattice is a term of twist-product (it IS what twist-product produces).

## Worked example: pre-FOUR

Take `L₁ = L₂ = 2 = {0, 1}`. Then `2 ⋈ 2` has carrier `{0, 1} × {0, 1} = {(0,0), (0,1), (1,0), (1,1)}` — the four-bilattice's carrier, but WITHOUT negation yet.

Lattice operations:

- `∧_k`: componentwise minimum. `(a, b) ∧_k (a', b') = (min(a, a'), min(b, b'))`.
- `∨_k`: componentwise maximum.
- `∧_t`: first component min, second component max. `(a, b) ∧_t (a', b') = (min(a, a'), max(b, b'))`.
- `∨_t`: first component max, second component min.

These are the same four operations the bilattice has — pre-bilattice and bilattice differ only in whether `~` is present. The pre-bilattice carries the lattice structure but not the negation that exchanges positive and negative evidence.

So `pre-FOUR` is `FOUR` without the negation operator — a four-element interlaced distributive bounded pre-bilattice. Adding negation produces `FOUR`.

## Position

`twist-product/library/pre-bilattice/`. The path: pre-bilattice is a term of twist-product (twist-product produces it). Sibling of `bilattice` (which adds negation) and `evidence` (which interprets the coordinates).

## Derivation source

Adapted from `predication-categories/objects/pre-bilattice.md`, preserved at `docs/dev/scraps/`. The archive's Lean module reference: `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
