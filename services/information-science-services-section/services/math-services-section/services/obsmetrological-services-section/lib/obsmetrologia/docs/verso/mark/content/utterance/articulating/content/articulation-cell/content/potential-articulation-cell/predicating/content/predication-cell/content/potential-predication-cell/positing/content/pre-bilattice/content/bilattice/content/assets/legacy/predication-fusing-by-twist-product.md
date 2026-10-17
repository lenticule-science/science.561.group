---
name: fusing-by-twist-product
description: A binary operation ⊙ on the twist product L^⋈ over an integral commutative residuated lattice L. Pairs the residuated-lattice fusion · on positive components with cross-implication tests between positive and negative components.
gerund: fusing-by-twist-product
agent-noun: fuser-by-twist-product
imperative: fuse-by-twist-product
domain: pair-of-twist-product
codomain: twist-product
references:
  - id: fitting1991
    type: article-journal
    title: Bilattices and the semantics of logic programming
    volume: 11
    issue: 2
    container-title: Journal of Logic Programming
    page: 91-116
    issued:
      - year: 1991
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

A binary operation $\odot$ on the carrier $L \times L$ of the [twist-product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated-lattice](../structures/residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \odot \langle z, v \rangle := \langle x \cdot z,\ (x \to v) \wedge (z \to y) \rangle.$$

The first component is the monoid product of positive-evidence components; the second component cross-tests each side's positive evidence against the other side's negative evidence.

Together with the [right residual](residuating-right-by-twist-product.md), the fusion forms an adjoint pair under the truth order. The monoidal unit is $\langle 1, 1 \rangle$ ([@busaniche-cignoli2014]).
