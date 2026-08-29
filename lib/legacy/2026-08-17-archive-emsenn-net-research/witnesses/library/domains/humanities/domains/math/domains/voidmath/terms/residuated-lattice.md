---
title: "Residuated lattice"
description: "The underlying value algebra of the framework: a lattice equipped with a commutative monoid product (fusion) and its residual implication, related by the residuation adjunction. The chosen residuated lattice is what gets pair-doubled into the twist product to produce the voidmath bilattice."
defines:
  - residuated lattice
  - integral residuated lattice
  - bounded residuated lattice
symbol: "\\mathbf{L}"
related:
  - twist-product
  - bilattice
  - predication-fiber-algebra
date-created: 2026-04-29
---

A **commutative residuated lattice** is an algebra $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ in which $\langle L, \vee, \wedge \rangle$ is a lattice, $\langle L, \cdot, 1 \rangle$ is a commutative monoid, and the binary operations $\cdot$ (the *fusion product*) and $\to$ (the *residual*) satisfy the **residuation adjunction**:

$$x \cdot y \leq z \iff x \leq y \to z$$

for all $x, y, z \in L$.

A residuated lattice is *integral* when $1$ is the top element of the lattice, and *bounded* when a bottom element $0$ exists.

## Examples

- The Boolean lattice $\mathbf{2}$ with $\cdot = \wedge$ and classical implication $x \to y := \neg x \vee y$ is an integral commutative residuated lattice.
- Any Heyting algebra is an integral commutative residuated lattice (with $\cdot = \wedge$).
- MV-algebras are integral commutative residuated lattices in which $\cdot$ is the Łukasiewicz strong conjunction.

## Role in voidmath

The residuated lattice $\mathbf{L}$ is the *underlying* value structure that voidmath builds on: the [twist product](twist-product.md) construction $\mathbf{L}^\bowtie$ pairs $\mathbf{L}$ with itself to produce the voidmath [bilattice](bilattice.md), and the pointwise lift of $\mathbf{L}^\bowtie$ over the entity-pair index is the [predication fiber algebra](predication-fiber-algebra.md) $A_p$ at each predicate. The residuated structure is what gives the twist product its [fusion](twist-product-fusion.md) $\odot$ and [right residual](twist-product-right-residual.md) $\Rightarrow$ — the bilattice operations that lift the residuation adjunction to pairs.

The framework is parametric in $\mathbf{L}$. Choosing $\mathbf{L} = \mathbf{2}$ yields the classical four-valued Belnap–Ginsberg–Fitting bilattice $\mathbf{4}$. Choosing $\mathbf{L}$ a Heyting algebra yields an intuitionistic-flavored bilattice; choosing $\mathbf{L}$ an MV-algebra yields a many-valued/fuzzy bilattice. The framework's structural results are uniform over the choice of $\mathbf{L}$.

## See also

- [Twist product](twist-product.md) — the construction $\mathbf{L}^\bowtie$ that pair-doubles $\mathbf{L}$.
- [Bilattice](bilattice.md) — the structure produced by the twist product.
- [Twist-product fusion](twist-product-fusion.md), [Twist-product right residual](twist-product-right-residual.md) — the lifted residuation operations.
- [Predication fiber algebra](predication-fiber-algebra.md) — the pointwise lift over entity-pairs.
