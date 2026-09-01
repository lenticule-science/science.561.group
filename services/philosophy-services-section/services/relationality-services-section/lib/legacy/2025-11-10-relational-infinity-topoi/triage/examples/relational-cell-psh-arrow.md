---
name: relational-cell-psh-arrow
type: example
class: relational-cell
status: verified-by-hand
instantiates: [relational-infinity-topos, ritm, kz-comonad-G]
depends-on:
  - relational-infinity-topos
  - kz-comonad-G
  - minimal-presheaf-cell
---

Refining the [minimal presheaf cell](minimal-presheaf-cell.md) with bilattice valuations: take $\mathcal{H} := \mathrm{PSh}(\{0 \to 1\})$ as the cohesive base, $\mathbf{B} := \mathbf{FOUR}$ (the [four-element bilattice](../../../../theories/predication-categories/objects/four-bilattice.md), Belnap's $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$) as the valuation bilattice, and $\mathcal{S} := \{0 \to 1\}$ with its trivial degree function as the SD ∞-site.

This makes $(\mathcal{H}, \mathbf{B}, \mathcal{S})$ a relational ∞-topos in the smallest possible non-degenerate way.

## What the [`KZ comonad`](../morphisms/kz-comonad-G.md) does on this cell

For a $\mathbf{FOUR}$-valued presheaf $X = (X_0 \to X_1)$ — i.e. an arrow in $\mathrm{Set}^{\mathbf{FOUR}}$ — the flow operator $G(X)$ is computable as

$$G(X) \;=\; \Box_r \Diamond_l (X_0 \to X_1) \;=\; \Box_r (X_1 \to X_1) \;=\; (X_1 \to X_1)$$

— i.e. the codiscrete embedding of the *target* $X_1$. The flow contracts every relational cell to its target's discrete double.

Iterating: $G^2(X) = G(X_1 \to X_1) = (X_1 \to X_1)$ — already a fixed point. Lax-idempotence is trivially confirmed.

## $G$-coalgebras

A $G$-coalgebra in this cell is exactly an $X = (X_0 \to X_1)$ with $X_0 \cong X_1$ via the structure morphism — i.e. a relational cell whose source and target are identified. These form the [field of existence](../objects/field-of-existence.md) in this minimal model.

## What the [`Heyting-closure shadow`](../theorems/heyting-closure-shadow.md) does on this cell

The Heyting algebra of subobjects $h(X)$ is a quotient of $\mathbf{FOUR}^2$ (one $\mathbf{FOUR}$ per stratum, with the structure morphism's compatibility factored out). The cohesive quadruple's shadow on this $h(X)$ is the four-operation closure of [Movement I](../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md) restricted to $\mathbf{FOUR}^2$ — a finite, fully checkable algebra.
