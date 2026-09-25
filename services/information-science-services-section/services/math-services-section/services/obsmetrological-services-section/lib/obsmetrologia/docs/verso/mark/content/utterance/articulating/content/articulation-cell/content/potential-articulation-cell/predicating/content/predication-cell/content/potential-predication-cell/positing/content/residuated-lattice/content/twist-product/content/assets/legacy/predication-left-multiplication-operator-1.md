---
name: left-multiplication-operator
description: "For a fixed a ∈ L^⋈, the unary operator L_a(x) := a ⊙ x using twist-product fusion. Iterated application gives orbits (L_a^n(x))_n in the twist-product carrier — the formal setting for fusion-driven dynamics."
kind: unary-operator
symbol: "L_a"
domain: "L^⋈ (the twist-product carrier)"
codomain: "L^⋈ (same carrier)"
parameterized-by: "fixed element a ∈ L^⋈"
defined-as: "L_a(x) := a ⊙ x where ⊙ is twist-product-fusion"
depends-on: [twist-product, twist-product-fusion]
derives-from: docs/dev/scraps/left-multiplication-operator.md
---

# Left multiplication operator

For a fixed element `a ∈ L^⋈` of a twist-product, **left multiplication by `a`** is the unary operator

$$\mathrm{L}_a \;:\; \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie, \qquad \mathrm{L}_a(x) := a \odot x,$$

where `⊙` is the twist-product-fusion.

Iterated application gives **orbits** `(L_a^n(x))_n` in `L^⋈` — sequences of fusion-applied values.

## Explicit formula

For `a = ⟨a_+, a_−⟩` and `x = ⟨x_+, x_−⟩`, applying twist-product-fusion's formula:

$$\mathrm{L}_a(x) \;=\; \langle a_+, a_-\rangle \odot \langle x_+, x_-\rangle \;=\; \langle a_+ \cdot x_+,\; (a_+ \to x_-) \wedge (x_+ \to a_-) \rangle.$$

The first coordinate multiplies positive evidence by `a`'s positive component. The second coordinate cross-tests `a`'s positive against `x`'s negative and vice versa.

## Operator-theoretic properties

`L_a` inherits the **monoidal** structure of `⊙`:

- **Identity**: `L_⊤(x) = ⊤ ⊙ x = x`. Multiplying by the fusion-unit is the identity.
- **Composition**: `L_a ∘ L_b = L_{a ⊙ b}`. Composition of left-multiplications by `a` and `b` is left-multiplication by `a ⊙ b`. So left-multiplications form a representation of the fusion-monoid on `L^⋈`.
- **Monotone in `≤_k`**: if `x ≤_k x'`, then `L_a(x) ≤_k L_a(x')`. Inherited from `⊙`-monotonicity.

## Iterated orbits and `L_a^n`

The orbit `(L_a^n(x))_n` is determined by repeated fusion: `L_a^n(x) = a^{⊙ n} ⊙ x` (where `a^{⊙ n}` is the `n`-fold fusion power of `a`).

For `a` a fusion-idempotent (`a ⊙ a = a`), the orbit stabilizes after one step. For non-idempotent `a`, the orbit's behavior depends on `a`'s fusion-dynamics — periodic, growing, or otherwise.

This is one operational setting for the substrate's substitution-dynamics analyses: orbits of `L_a` on twist-product carriers exhibit substitution-recurrence structure when `a` carries appropriate fusion-shape.

## Position

`twist-product/library/left-multiplication-operator/`. Predicating tier — operator on the bilattice value-algebra. Sibling of `right-residuation-operator`, `twist-product-fusion`, `twist-product-right-residual`.

## Derivation source

Adapted from `predication-categories/morphisms/left-multiplication-operator.md`, preserved at `docs/dev/scraps/`. The archive scrap states the operator definition and notes that iterated application gives orbits; the operator-theoretic property analysis here is structural extrapolation from the twist-product-fusion's known properties.
