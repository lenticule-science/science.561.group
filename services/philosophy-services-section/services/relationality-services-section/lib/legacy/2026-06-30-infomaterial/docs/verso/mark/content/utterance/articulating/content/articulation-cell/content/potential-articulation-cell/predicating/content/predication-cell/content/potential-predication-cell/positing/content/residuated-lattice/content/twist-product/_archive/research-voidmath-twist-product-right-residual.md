---
title: "Twist-product right residual"
description: "The right adjoint ⇒ of twist-product fusion, lifting the residuated lattice's residual implication to evidence pairs. The implication structure on the bilattice."
defines:
  - twist-product right residual
symbol: "\\Rightarrow"
related:
  - twist-product
  - residuated-lattice
  - twist-product-fusion
  - predication-fiber-algebra
date-created: 2026-04-29
---

The **twist-product right residual** is a binary operation $\Rightarrow$ on the carrier $L \times L$ of the [twist product](twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated lattice](residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \Rightarrow \langle z, v \rangle := \langle (x \to z) \wedge (v \to y),\ x \cdot v \rangle.$$

The first component tests implication in both directions of the residuated-lattice structure: the $x \to z$ term measures how much the antecedent's affirmation suffices for the consequent's affirmation, and the $v \to y$ term measures how much the consequent's denial suffices for the antecedent's denial (the contrapositive direction). The second component collects the product of the antecedent's affirming [evidence](evidence.md) with the consequent's denying evidence — the "support for refutation" carried by the implication.

## Adjoint pair

Together with the [twist-product fusion](twist-product-fusion.md) $\odot$, the right residual forms an adjoint pair under the [truth order](truth-order.md) $\leq_t$:

$$a \odot b \leq_t c \iff a \leq_t b \Rightarrow c.$$

This is the lift of the underlying residuated lattice's residuation adjunction $x \cdot y \leq z \iff x \leq y \to z$ from $L$ to $L \times L$, performed by the Busaniche–Cignoli construction.

## Role

The right residual is the implication operation on the bilattice. Its presence is what lets the [predication fiber algebra](predication-fiber-algebra.md) $A_p$ — and hence the framework's predication structure as a whole — interpret implicational claims, conditional witnessings, and the consequence relation that closure operators implement.

## See also

- [Twist-product fusion](twist-product-fusion.md) — the left adjoint of $\Rightarrow$.
- [Twist product](twist-product.md) — the carrier $L \times L$ on which $\Rightarrow$ acts.
- [Residuated lattice](residuated-lattice.md) — the underlying $\mathbf{L}$ whose residual $\to$ this lifts.
- [Predication fiber algebra](predication-fiber-algebra.md) — the algebra to which $\Rightarrow$ lifts pointwise.
