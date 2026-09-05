---
name: settling-coalgebra-structure
description: "The 2-categorical realization of a settlement. A pair (E, c) where E is a predication-hyperdoctrine and c: E → F_U(E) is a coalgebra for the settling-endofunctor F_U, parameterized by an increment-sequence U, with the orbit (v_τ)_τ derived from c satisfying settling-monotonicity. The 1-truncation recovers the ordinary settlement; the 2-categorical version is the full structure."
realizes: [closure-drivenness]
depends-on: [predication-hyperdoctrine, settling-bound, settling-monotonicity, predication-fiber-algebra, knowledge-order, increment-sequence, settling-endofunctor]
derives-from: docs/dev/scraps/settling-coalgebra-structure.md
---

# Settling-equipped predication-hyperdoctrine (settling-coalgebra-structure)

The 2-categorical realization of a settlement. Over base `(L, C, E, λ)`, a **settling-equipped predication-hyperdoctrine** is a pair `(E, c)` satisfying:

**(C1) Base structure.** `E` is a predication-hyperdoctrine.

**(C2) Coalgebra map.** `c: E → F_U(E)` is a coalgebra for the settling-endofunctor `F_U` on the 2-category `PrFib(L, C, E)`, parameterized by an increment-sequence `U = (u_τ)_{τ<λ}`.

**(C3) Settling monotonicity.** The orbit `(v_τ)_{τ<λ}` derived from `c` satisfies `σ ≤ τ ⟹ v_σ ≤_k v_τ` pointwise at every predicate `p` and cell `(s, o)`.

The orbit is constructed:
- `v_0 = E`.
- `v_{τ+1} = F_U^{τ+1}(E)` at successor ordinals.
- `v_μ = ⋁_k {v_σ : σ < μ}` at limit ordinals (settling-continuity built in).

## Why coalgebra structure

A **coalgebra** for an endofunctor `F` is an object `X` with a map `X → F(X)`. The coalgebra map captures the "step-forward" structure: the object provides itself as input to `F`, which produces the next-state.

For the settling-endofunctor:

$$c \;:\; \mathcal{E} \to F_U(\mathcal{E}) \;=\; \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$$

The coalgebra structure says: `E` knows how to be its own step-forward target via `c`. Iterating `c` produces the orbit.

This is the **2-categorical** picture of what settling does. The 1-truncated picture is the family `(v_τ)_τ`. The 2-categorical picture is `(E, c)` — the structure with all its 2-cells coherence.

## Why this lives at settling tier

A settling-equipped predication-hyperdoctrine is the **full 2-categorical realization** of a settlement. It carries:

- The hyperdoctrine structure (positing-tier categorical machinery, now at settling tier in its settled form).
- The coalgebra structure (settling's operational signature).
- The monotonicity condition (the orbit's `≤_k`-growth).

Together this is the **most structurally complete** form of a settlement object. The simpler `settlement` $thing is the 1-truncated projection; this $thing is the full 2-categorical structure.

## 1-truncation: recovery of the ordinary settlement

In the strict and Scott-continuous regimes (`κ ≤ ω`), the 2-categorical structure **collapses**:

- The predication-hyperdoctrine reduces to the predication-fiber-functor of the 1-truncation.
- The coalgebra map `c` reduces to the orbit family `(v_τ)`.
- (C3) reduces to settling-monotonicity of the orbit.

So the 1-truncated definition of `settlement` IS the 1-categorical projection of this 2-categorical structure. The two forms are equivalent for low-regime work; the 2-categorical form becomes essential in higher regimes where the coherence is genuinely 2-dimensional.

## Closure-drivenness realized

A settling-coalgebra-structure **realizes** closure-drivenness: the coalgebra map `c` is precisely the `Cl(E) ∨_k u_τ` construction at each step. Every settling-coalgebra-structure is closure-driven by construction; closure-drivenness is the property that makes the coalgebra structure work.

This is the formal sense in which closure-drivenness is intrinsic to settling: settling structures ARE coalgebras of the closure-and-merge endofunctor.

## Position

`finite-settlement-algebra/hacking/library/settling-coalgebra-structure/`. Settling tier — the 2-categorical realization of a settlement. Sibling of `settlement` (the 1-truncated form) and `settlement-priestley-dual` (the Priestley-side form).

## Derivation source

Adapted from `predication-categories/objects/settling-coalgebra-structure.md`, preserved at `docs/dev/scraps/`.
