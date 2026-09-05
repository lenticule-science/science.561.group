---
name: twist-product-right-residual
description: "A binary operation ⇒ on the carrier L × L of L^⋈ over an integral commutative residuated lattice L. The right residual of twist-product-fusion: ⟨x, y⟩ ⇒ ⟨z, v⟩ := ⟨(x → z) ∧ (v → y), x · v⟩."
symbol: "⇒"
depends-on: [residuated-lattice, twist-product]
derives-from: docs/dev/scraps/twist-product-right-residual.md
---

# Twist-product right residual

A binary operation `⇒` on the carrier `L × L` of the twist product `L^⋈` over an integral commutative residuated lattice `L = ⟨L, ∨, ∧, ·, →, 1⟩`:

$$\langle x, y\rangle \Rightarrow \langle z, v\rangle \;:=\; \langle (x \to z) \wedge (v \to y),\; x \cdot v\rangle.$$

## Reading

- **First component**: tests implication in both directions of the residuated-lattice structure — antecedent's positive evidence to consequent's positive, consequent's negative to antecedent's negative.
- **Second component**: monoid product of antecedent's positive with consequent's negative.

The residual is the right adjoint of fusion: `a ⊙ b ≤ c ⟺ a ≤ b ⇒ c`. This is the substructural-logic implication-via-resource-accounting on the twist product.

## Position

`twist-product/library/twist-product-right-residual/`. Sibling of `twist-product-fusion/`. Both require an integral commutative residuated lattice as the underlying `L`.

## Derivation source

Adapted from `predication-categories/morphisms/twist-product-right-residual.md`, preserved at `docs/dev/scraps/`. Lean module: `PredicationCategories.Homebrew.Algebra.TwistProduct.twResiduum`.
