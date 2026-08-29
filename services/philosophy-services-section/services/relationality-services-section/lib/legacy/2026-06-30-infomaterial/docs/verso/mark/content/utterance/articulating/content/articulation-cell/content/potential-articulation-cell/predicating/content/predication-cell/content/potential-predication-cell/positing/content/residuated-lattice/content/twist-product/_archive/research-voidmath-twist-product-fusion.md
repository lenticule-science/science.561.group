---
title: "Twist-product fusion"
description: "The monoidal multiplication ⊙ on the twist product L^⋈, lifting the residuated lattice's fusion product to evidence pairs. Combines values at the same cell: positive components multiply directly; negative components arise from cross-residuation."
defines:
  - twist-product fusion
symbol: "\\odot"
related:
  - twist-product
  - residuated-lattice
  - twist-product-right-residual
  - predication-fiber-algebra
date-created: 2026-04-29
---

The **twist-product fusion** is a binary operation $\odot$ on the carrier $L \times L$ of the [twist product](twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated lattice](residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \odot \langle z, v \rangle := \langle x \cdot z,\ (x \to v) \wedge (z \to y) \rangle.$$

The first component is the monoid product of positive-[evidence](evidence.md) components: affirming evidence multiplies directly. The second component cross-tests each side's positive evidence against the other side's negative evidence: the $x \to v$ term measures how much the first side's affirmation is challenged by the second side's denial, and the $z \to y$ term symmetrically.

The monoidal unit is $\langle 1, 1 \rangle$.

## Adjoint pair

Together with the [twist-product right residual](twist-product-right-residual.md) $\Rightarrow$, the fusion forms an adjoint pair under the [truth order](truth-order.md) $\leq_t$:

$$a \odot b \leq_t c \iff a \leq_t b \Rightarrow c.$$

This residuation adjunction is the lift of the underlying residuated lattice's $x \cdot y \leq z \iff x \leq y \to z$ from $L$ to the pair carrier $L \times L$, performed by the Busaniche–Cignoli construction. It is what makes the twist product a *residuated bilattice* rather than just a bilattice.

## Role in the predication fiber algebra

The twist-product fusion lifts pointwise from $\mathbf{L}^\bowtie$ to the [predication fiber algebra](predication-fiber-algebra.md) $A_p$: $(v \odot v')(s, o) := v(s, o) \odot v'(s, o)$. The [predicate category](predicate-category.md)'s four canonical generator classes preserve $\odot$ pointwise — the residuation-natural property — which is what makes the residuation structure compatible with reindexing across predicates.

## See also

- [Twist product](twist-product.md) — the carrier $L \times L$ on which $\odot$ acts.
- [Twist-product right residual](twist-product-right-residual.md) — the right adjoint of $\odot$ in $\leq_t$.
- [Residuated lattice](residuated-lattice.md) — the underlying $\mathbf{L}$ whose fusion $\cdot$ this lifts.
- [Predication fiber algebra](predication-fiber-algebra.md) — the algebra to which $\odot$ lifts pointwise.
