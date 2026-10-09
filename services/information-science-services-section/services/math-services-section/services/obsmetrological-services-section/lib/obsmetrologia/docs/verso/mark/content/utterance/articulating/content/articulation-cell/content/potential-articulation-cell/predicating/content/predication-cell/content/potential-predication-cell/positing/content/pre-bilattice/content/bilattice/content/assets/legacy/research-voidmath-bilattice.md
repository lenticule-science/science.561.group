---
title: "Bilattice"
description: "The voidmath bilattice — the algebraic structure of values that can be assigned at a predication cell, with two parallel orders (knowledge and truth) whose joint extremes give the four-cornered settlement structure."
date-created: 2026-04-28
---

In voidmath, a **bilattice** is the algebraic structure of values that can be held at a [predication cell](predication-cell.md). It is what makes voidmath's [settlement](settlement.md) four-cornered rather than bivalent: where classical logic gives two truth values and intuitionistic logic gives one truth direction with constructive grounding, the voidmath bilattice gives two *parallel* orders that compose to a four-corner shape.

The two parallel orders are:

- The [knowledge order](knowledge-order.md) $\leq_k$ — measures how much evidence has accumulated, with bottom $\bot$ (no evidence) and top $\top$ (full evidence in both directions). The math-side counterpart of the [absurd ↔ determination](../../../../philosophy/domains/relationality/terms/settlement.md) axis in the relationality framework.
- The [truth order](../../../../truth-order/truth-order.md) $\leq_t$ — measures direction of evidence (affirming vs denying), with bottom $\mathbf{f}$ (false) and top $\mathbf{t}$ (true). The math-side counterpart of the [false ↔ true](../../../../philosophy/domains/relationality/terms/settlement.md) axis.

The two orders are independent, and their joint extremes give the four corners of [settlement](settlement.md): $\mathbf{t}$ (true-only), $\mathbf{f}$ (false-only), $\top$ (both), $\bot$ (neither).

## Why voidmath needs a bilattice

The voidmath bilattice is not a free choice. It arises from taking [predication](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication.md) seriously: when one asks what truth-value structure is consistent with the directional triadic primitive at the bottom of the framework, the bilattice four-corner shape is what's forced. A bivalent structure cannot accommodate the difference between *no evidence* and *evidence in both directions*; voidmath needs to record both, because the [relationality](../../../../philosophy/domains/relationality/_index.md) framework treats absurd and both-determined as positively distinct settlement positions.

Bilattice logic was developed independently in the 1980s by Belnap, Ginsberg, and Fitting for AI reasoning under incomplete and contradictory information. Voidmath adopts that machinery as the formal articulation of the four-cornered settlement that the framework's philosophy already commits to — not as a borrowed convenience but as the structure forced by the framework's commitments.

## Concrete construction

The voidmath bilattice is the [twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}^\bowtie$ of a residuated lattice $\mathbf{L}$: pairs $\langle a, b \rangle \in L \times L$ where $a$ tracks affirming evidence and $b$ tracks denying evidence. The two orders are defined componentwise (knowledge order: both up) and component-asymmetrically (truth order: first up, second down). The pointwise lift of $\mathbf{L}^\bowtie$ over the entity-pair index $E \times E$ is the [predication fiber algebra](predication-fiber-algebra.md) $A_p$ — the structure that holds values across all the predication cells with predicate coordinate fixed at $p$.

## Operations

The bilattice carries five canonical operations:

- **Truth meet** $\wedge_t$ and **truth join** $\vee_t$ — combine values along the truth axis.
- **Knowledge meet** $\wedge_k$ and **knowledge join** $\vee_k$ — combine values along the knowledge axis.
- **Negation** $\sim$ — antitone in the truth order, monotone in the knowledge order; flips affirming evidence with denying evidence without changing how much evidence is present.

Two further operations come from the residuation structure of the underlying $\mathbf{L}$:

- **Twist-product fusion** $\odot$ — the monoidal multiplication on $\mathbf{L}^\bowtie$.
- **Twist-product right residual** $\Rightarrow$ — the right adjoint of $\odot$.

Together these give the bilattice its full residuated structure, which is what makes the [predicate category](predicate-category.md)'s four canonical generators *residuation-natural*.

## The Klein four-group of involutions

The bilattice has two natural involutions: negation $\sim$ (reverses the truth order, preserves the knowledge order) and *conflation* $-$ (preserves the truth order, reverses the knowledge order). Together they generate $\mathbb{Z}_2 \times \mathbb{Z}_2$, the Klein four-group, which is the symmetry group of the bilattice viewed as a square. The four corners of [settlement](settlement.md) are the four orbits of the trivial action; each non-trivial element of the Klein group permutes the corners in one of three patterns.

## See also

- [Knowledge order](knowledge-order.md), [Truth order](../../../../truth-order/truth-order.md) — the two parallel orders of the bilattice.
- [Twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) — the construction that builds the bilattice from a residuated lattice.
- [Predication fiber algebra](predication-fiber-algebra.md) — the pointwise lift of the bilattice over entity-pairs.
- [Settlement](settlement.md) — the four-cornered structure of joint axis extremes.
- [Bilattice (algebra)](../../algebra/terms/bilattice.md) — the abstract algebraic structure, of which voidmath's bilattice is a specific case in the predication context.
