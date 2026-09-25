---
title: "Truth order"
description: "The truth axis of a bilattice — the partial order measuring direction of evidence (affirming vs denying). Ranges from $\\mathbf{f}$ (false) to $\\mathbf{t}$ (true). One of the two parallel orders that constitute the bilattice four-corner structure, independent of the knowledge order."
symbol: "\\leq_t"
date-created: 2026-04-28
---

The **truth order** $\leq_t$ is one of the two parallel orders on a [bilattice](bilattice.md). It ranges over the *direction* of evidence: a value sits higher in $\leq_t$ when its evidential content tilts toward affirmation rather than denial. When the bilattice is bounded, the truth order has bottom $\mathbf{f}$ (false) and top $\mathbf{t}$ (true). The truth order is independent of the [knowledge order](knowledge-order.md), which measures *amount* rather than *direction*.

## In a twist product

Inside a [twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the truth order is defined component-asymmetrically:

$$\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle \quad \text{iff} \quad a_1 \leq_1 b_1 \text{ and } b_2 \leq_2 a_2.$$

The first component (affirming evidence) follows the order; the second component (denying evidence) is *reversed*. The truth order raises positive evidence and lowers negative evidence simultaneously. The reversal in the second component is what distinguishes the truth order from the knowledge order, and what gives the bilattice its two-axis structure.

## Negation is antitone in the truth order

In a bilattice equipped with negation $\sim$:

$$a \leq_t b \quad \Longrightarrow \quad \sim b \leq_t \sim a.$$

Negation reverses direction along the truth axis: the more affirmative a value, the less affirmative its negation, and vice versa. This is the standard logical behavior of negation, recovered structurally from the bilattice rather than imposed as an axiom.

## In the relationality framework

The truth order is the math-side counterpart of the relationality framework's *false ↔ true* axis: $\mathbf{f}$ corresponds to denial, $\mathbf{t}$ corresponds to affirmation. Where the [knowledge order](knowledge-order.md) records how much witnessing has occurred, the truth order records which direction the witnessing tilts. Together they compose the four-cornered settlement structure: $\mathbf{t}$ (true-only), $\mathbf{f}$ (false-only), $\top$ (both, full witnessing without truth-axis tilt), $\bot$ (neither, no witnessing).

## See also

- [Knowledge order](knowledge-order.md) — the orthogonal axis; independent of truth.
- [Bilattice](bilattice.md) — the algebraic structure with two parallel orders.
- [Twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) — the construction in which the truth order is component-asymmetric.
