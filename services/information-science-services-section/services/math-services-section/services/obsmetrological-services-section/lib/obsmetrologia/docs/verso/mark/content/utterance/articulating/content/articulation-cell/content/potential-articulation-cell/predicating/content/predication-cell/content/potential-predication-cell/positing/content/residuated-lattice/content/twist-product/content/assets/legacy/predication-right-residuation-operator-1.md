---
name: right-residuation-operator
description: "For a fixed a ∈ L^⋈, the unary operator R_a(x) := a ⇒ x using twist-product right-residual. The right-adjoint pair to L_a: a ⊙ x ≤_k y iff x ≤_k R_a(y), giving the substructural-implication action of a on the twist-product carrier."
kind: unary-operator
symbol: "R_a"
domain: "L^⋈ (the twist-product carrier)"
codomain: "L^⋈ (same carrier)"
parameterized-by: "fixed element a ∈ L^⋈"
defined-as: "R_a(x) := a ⇒ x where ⇒ is twist-product-right-residual"
adjoint-pair: "L_a ⊣ R_a — a ⊙ x ≤_k y iff x ≤_k R_a(y)"
depends-on: [twist-product, twist-product-right-residual]
derives-from: docs/dev/scraps/right-residuation-operator.md
---

# Right residuation operator

For a fixed element `a ∈ L^⋈` of a twist-product, **right residuation by `a`** is the unary operator

$$\mathrm{R}_a \;:\; \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie, \qquad \mathrm{R}_a(x) := a \Rightarrow x,$$

where `⇒` is the twist-product-right-residual.

Iterated application gives orbits `(R_a^n(x))_n` in `L^⋈`.

## Explicit formula

For `a = ⟨a_+, a_−⟩` and `x = ⟨x_+, x_−⟩`, applying twist-product-right-residual's formula:

$$\mathrm{R}_a(x) \;=\; \langle a_+, a_-\rangle \Rightarrow \langle x_+, x_-\rangle \;=\; \langle (a_+ \to x_+) \wedge (x_- \to a_-),\; a_+ \cdot x_- \rangle.$$

The first coordinate tests `a`'s positive against `x`'s positive (positive implication) AND `x`'s negative against `a`'s negative (negative implication). The second coordinate multiplies `a`'s positive by `x`'s negative.

## The fundamental adjunction

`L_a` and `R_a` form a **right-adjoint pair** in the knowledge-order enrichment:

$$a \odot x \;\leq_k\; y \quad \Longleftrightarrow \quad x \;\leq_k\; a \Rightarrow y.$$

Equivalently: `L_a ⊣ R_a`. This is the substructural-logic adjunction lifted to the twist-product setting — the operational content of "fusion is left-adjoint to right-residual."

The adjunction is what makes substructural reasoning work: deriving `a ⊙ x ≤ y` is equivalent to deriving `x ≤ a ⇒ y`. So `R_a` is the **implication-by-`a`** operator dual to `L_a`'s multiplication-by-`a`.

## Operator-theoretic properties

`R_a` inherits its adjoint structure from `⇒`:

- **Identity**: `R_⊤(x) = ⊤ ⇒ x = x`. Residuating by the residual-unit is the identity.
- **Composition with `L_a`**: `L_a ∘ R_a(x) = a ⊙ (a ⇒ x) ≤_k x`. The counit of the adjunction: applying multiplication after residuation gives a lower-bounded result.
- **Antitone in first argument**: for fixed `x`, the assignment `a ↦ R_a(x)` is antitone in `≤_k` — larger `a` produces stronger constraints, hence smaller `R_a(x)`.

## Position

`twist-product/library/right-residuation-operator/`. Predicating tier — operator on the bilattice value-algebra, dual to `left-multiplication-operator`.

## Derivation source

Adapted from `predication-categories/morphisms/right-residuation-operator.md`, preserved at `docs/dev/scraps/`. The archive scrap is brief; the operator-theoretic properties and the explicit adjunction with `L_a` are structural extrapolation from the twist-product-right-residual's right-adjoint property.
