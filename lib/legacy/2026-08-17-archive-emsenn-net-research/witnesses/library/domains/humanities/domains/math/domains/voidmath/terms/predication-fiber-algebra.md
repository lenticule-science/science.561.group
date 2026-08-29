---
title: "Predication fiber algebra"
description: "The algebra of values held at the cells of a single predicate — the pointwise twist product of a residuated lattice over the entity-pair index. Bilattice-residuated, with two parallel orders (knowledge and truth) and the operations that lift from the underlying lattice."
defines:
  - predication fiber algebra
symbol: "A_p"
related:
  - predication-cell
  - predicate-category
  - predication
  - predication-valuation
date-created: 2026-04-28
---

The **predication fiber algebra** at a [predicate](predicate-category.md) $p$, denoted $A_p$, is the algebra of values that can be held at every [predication cell](predication-cell.md) with predicate coordinate fixed at $p$. Concretely, it is the pointwise [twist product](twist-product.md) of a residuated lattice $\mathbf{L}$ over the entity-pair index $E \times E$:

$$A_p := \mathbf{L}^{\bowtie\, E \times E}.$$

An element of $A_p$ is a function $E \times E \to L \times L$ — at each subject–object pair $(s, o)$, a value $v(s, o) \in \mathbf{L}^\bowtie$ in the bilattice. As an abstract algebra, $A_p$ is the same for every predicate; the subscript $p$ records *which* predicate's values are being held, not a difference in the algebra's structure.

## Two parallel orders

The fiber algebra is a [bilattice](bilattice.md) at every cell: a structure with two distinct partial orders, the [knowledge order](knowledge-order.md) $\leq_k$ and the [truth order](truth-order.md) $\leq_t$. Each value $v(s, o) \in \mathbf{L}^\bowtie$ sits in the joint space of these two axes — its position is its [settlement](settlement.md) at that cell.

- $\leq_k$ measures *how much* evidence has accumulated. Bottom $\bot$ is no information; top $\top$ is full evidence in both directions. This is the math-side counterpart of the [absurd](../../../../philosophy/domains/relationality/terms/absurd.md) ↔ [determination](../../../../philosophy/domains/relationality/terms/determination.md) axis.
- $\leq_t$ measures *which direction* the evidence tilts. Bottom $\mathbf{f}$ is denial; top $\mathbf{t}$ is affirmation. This is the math-side counterpart of the [false](../../../../philosophy/domains/relationality/terms/false.md) ↔ [true](../../../../philosophy/domains/relationality/terms/true.md) axis.

The two orders are independent. A value's joint position is its [settlement](settlement.md); the four extremal positions $\mathbf{t}, \mathbf{f}, \top, \bot$ are the four corners of the joint structure.

## Operations

The bilattice operations $(\wedge_t, \vee_t, \wedge_k, \vee_k, \sim)$ lift pointwise from $\mathbf{L}^\bowtie$ to $A_p$: for example, $(v \wedge_k v')(s, o) := v(s, o) \wedge_k v'(s, o)$. When $\mathbf{L}$ is distributive, so is $A_p$.

Two further operations from the residuation structure are central:

- **Twist-product fusion** $\odot$ — the monoidal multiplication on $\mathbf{L}^\bowtie$, lifted pointwise. Combines values at the same cell.
- **Twist-product right residual** $\Rightarrow$ — the right adjoint of fusion, giving the implication structure on the bilattice.

These are what make $A_p$ a *residuated* bilattice rather than just a bilattice, and what give the [predicate category](predicate-category.md)'s four generator classes the residuation-natural property: each reindexing preserves $\odot$ and $\Rightarrow$ pointwise.

## Why one algebra per predicate

Because $A_p$ is structurally the same for every predicate, the differences between predicates live entirely in the morphisms of the [predicate category](predicate-category.md), not in the value algebras themselves. Specialization, converse, and the projections give the structural relationships between predicates; the fiber algebra gives the value structure that those relationships preserve. This separation — uniform fibers, structured base — is what makes the predication fibration cleanly fibrational.

## See also

- [Predication cell](predication-cell.md) — the unit at which fiber-algebra elements assign values.
- [Predicate category](predicate-category.md) — the structural relationships between predicates that the fiber algebra is uniform over.
- [Predication](predication.md) — the activity that takes place at cells with values in fiber algebras.
- [Bilattice](bilattice.md) — the underlying value structure with two parallel orders.
- [Knowledge order](knowledge-order.md), [Truth order](truth-order.md) — the two axes of the bilattice.
- [Settlement](settlement.md) — the joint four-cornered structure within which each value sits.
- [Twist product](twist-product.md) — the construction $\mathbf{L}^\bowtie$ that lifts a residuated lattice into a bilattice.
