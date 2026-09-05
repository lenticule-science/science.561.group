---
name: residuating-right-by-twist-product
description: A binary operation ⇒ on the twist product L^⋈ over an integral commutative residuated lattice L. Adjoint to fusing-by-twist-product under the truth order.
gerund: residuating-right-by-twist-product
agent-noun: residuator-right-by-twist-product
imperative: residuate-right-by-twist-product
domain: pair-of-twist-product
codomain: twist-product
references:
  - id: busaniche-cignoli2014
    type: article-journal
    title: Residuated lattices as an algebraic semantics for paraconsistent Nelson logic
    volume: 24
    issue: 6
    container-title: Journal of Logic and Computation
    page: 1379-1394
    issued:
      - year: 2014
---

A binary operation $\Rightarrow$ on the carrier $L \times L$ of the [twist-product](../structures/twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated-lattice](../structures/residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \Rightarrow \langle z, v \rangle := \langle (x \to z) \wedge (v \to y),\ x \cdot v \rangle.$$

The first component tests implication in both directions of the residuated-lattice structure; the second component collects the product of the antecedent's positive evidence with the consequent's negative evidence.

Together with the [fusion](fusing-by-twist-product.md), the right residual forms an adjoint pair under the truth order ([Busaniche & Cignoli 2014]).
