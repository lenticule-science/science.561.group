---
kind: theorem
status: proved
depends-on: [pairwise-stone-space, priestley-space, paired-priestley-space]
---

# Bitopological Stone duality

The category $\mathbf{PStone}$ of [pairwise Stone spaces](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/pairwise-stone-space/pairwise-stone-space.md) is isomorphic to the category $\mathbf{Spec}$ of spectral spaces and to the category $\mathbf{Pries}$ of [Priestley spaces](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/priestley-space.md):

$$\mathbf{PStone} \;\cong\; \mathbf{Spec} \;\cong\; \mathbf{Pries}.$$

## Proof

[@bezhanishvili-et-al2010] (Theorems 2.9, 3.4). $\square$

## Why this matters here

The bitopological framing is mathematically equivalent to the Priestley framing but treats the two topologies symmetrically.
For the [paired Priestley space](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md) duals of the [predication fiber algebras](../objects/predication-fiber-algebra.md) — where the two topologies arise naturally from the positive and negative coordinates of the [twist product](../../../../../../../residuated-lattice/content/twist-product/twist-product.md) — pairwise-Stone is the natural framing for sheaf-theoretic constructions.
Covers can be specified pairwise-open without privileging either coordinate, and dualization of [predicate](../concepts/predicate.md) generators (specialization, converse, subject- and object-projection) acts symmetrically on both topologies.
