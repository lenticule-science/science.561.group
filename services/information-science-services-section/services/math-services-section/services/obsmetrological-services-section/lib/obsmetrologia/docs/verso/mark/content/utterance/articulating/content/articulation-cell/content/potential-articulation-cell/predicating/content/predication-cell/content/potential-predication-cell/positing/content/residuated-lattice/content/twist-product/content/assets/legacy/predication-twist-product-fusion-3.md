---
name: twist-product-fusion
description: "A binary operation ⊙ on the carrier L × L of L^⋈ over an integral commutative residuated lattice L. First component is the monoid product of positive-evidence; second component cross-tests each side's positive against the other's negative."
symbol: "⊙"
depends-on: [residuated-lattice, twist-product]
derives-from: docs/dev/scraps/twist-product-fusion.md
---

# Twist-product fusion

A binary operation `⊙` on the carrier `L × L` of the twist product `L^⋈` over an integral commutative residuated lattice `L = ⟨L, ∨, ∧, ·, →, 1⟩`:

$$\langle x, y\rangle \odot \langle z, v\rangle \;:=\; \langle x \cdot z,\; (x \to v) \wedge (z \to y)\rangle.$$

## Reading

- **First component**: monoid product `x · z` of the two positive-evidence parts.
- **Second component**: cross-test `(x → v) ∧ (z → y)` — each side's positive evidence tested against the other side's negative.

Fusion is the bilattice/twist-product analogue of "AND with multiplication-strength resource accounting," familiar from substructural logic.

## Position

`twist-product/library/twist-product-fusion/`. The fusion is an operator that twist-product carries when its underlying `L` is an integral commutative residuated lattice.

## Derivation source

Adapted from `predication-categories/morphisms/twist-product-fusion.md`, preserved at `docs/dev/scraps/`. Lean module: `PredicationCategories.Homebrew.Algebra.TwistProduct.fusion`.
