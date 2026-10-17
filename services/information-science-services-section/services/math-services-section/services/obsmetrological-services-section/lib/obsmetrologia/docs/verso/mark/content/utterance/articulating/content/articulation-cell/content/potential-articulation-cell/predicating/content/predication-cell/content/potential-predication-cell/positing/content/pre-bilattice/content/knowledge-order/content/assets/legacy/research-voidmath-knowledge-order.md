---
title: "Knowledge order"
description: "The knowledge axis of a bilattice — the partial order measuring how much evidence has accumulated, regardless of direction. Ranges from $\\bot$ (no information) to $\\top$ (full evidence in both directions). One of the two parallel orders that constitute the bilattice four-corner structure."
symbol: "\\leq_k"
date-created: 2026-04-28
---

The **knowledge order** $\leq_k$ is one of the two parallel orders on a [bilattice](bilattice.md). It ranges over evidential content: a value sits higher in $\leq_k$ when more evidence has accumulated, regardless of whether the evidence is affirming or denying. When the bilattice is bounded, the knowledge order has bottom $\bot$ (no information at all) and top $\top$ (full evidence in both directions). The knowledge order is independent of the [truth order](../../../../truth-order/truth-order.md), which measures *direction* rather than *amount*.

## In a twist product

Inside a [twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$ — the construction that produces bilattices from a pair of lattices — the knowledge order is defined componentwise:

$$\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle \quad \text{iff} \quad a_1 \leq_1 b_1 \text{ and } a_2 \leq_2 b_2.$$

The first component tracks affirming evidence; the second tracks denying evidence. The knowledge order raises both: adding more affirming evidence, more denying evidence, or both, all move a value upward in $\leq_k$. The knowledge axis does not distinguish between affirmation and denial — it only records *amount*.

## Negation is monotone in the knowledge order

In a bilattice equipped with negation $\sim$:

$$a \leq_k b \quad \Longrightarrow \quad \sim a \leq_k \sim b.$$

This is the formal expression of the asymmetry between negation and the knowledge axis: negating a value flips its truth-axis position but preserves its knowledge-axis position. Adding evidence to a claim and adding evidence to its negation are the same kind of motion along the knowledge axis.

## Settling monotonicity

In settings where bilattices are used to track evidential evolution over time — including the predication framework — the *settling monotonicity* condition asserts that knowledge values accumulate monotonically in $\leq_k$. As evidence is added, $\leq_k$-position rises and is never retracted. This makes $\leq_k$ the natural order along which temporal-knowledge structures evolve.

## In the relationality framework

The knowledge order is the math-side counterpart of the relationality framework's *absurd ↔ determination* axis: $\bot$ corresponds to absurd (no relational witnessing), $\top$ corresponds to determination (full relational witnessing). The four-cornered settlement structure that runs through the framework is exactly the joint structure of the truth and knowledge orders on the bilattice.

## See also

- [Truth order](../../../../truth-order/truth-order.md) — the orthogonal axis; independent of knowledge.
- [Bilattice](bilattice.md) — the algebraic structure with two parallel orders.
- [Twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) — the construction in which the knowledge order is componentwise.
