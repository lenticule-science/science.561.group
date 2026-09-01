---
name: settlement-priestley-dual
description: "Given a settlement v over (L, C, E, λ), the dual representation v̂ = (v̂_τ(p))_{p, τ} obtained by applying Spec to each cell value v_τ(p) ∈ A_p. Each v̂_τ(p) is a paired-Priestley space. The Jung-Rivieccio dual side of the settlement, where cohomology is computed."
depends-on: [settlement, predication-fiber-algebra, twist-product, paired-priestley-space, knowledge-order]
derives-from: docs/dev/scraps/predication-priestley-dual.md
---

# Settlement Priestley dual

Given a settlement `v` over `(L, C, E, λ)`, at each settling step `τ < λ` and each predicate `p`, the valuation `v_τ(p) ∈ A_p = L^⋈^(E×E)` has a **Priestley dual**

$$\widehat{v_\tau(p)} \;:=\; \mathrm{Spec}\bigl(v_\tau(p)\bigr),$$

a paired-Priestley space obtained by applying `Spec` to each coordinate of the twist product. The family

$$\widehat{v} \;=\; \bigl(\widehat{v_\tau(p)}\bigr)_{p, \tau}$$

is the **Priestley dual representation** of the settlement `v`.

## Fiberwise duality

For each fixed `(p, τ)`, the correspondence `v_τ(p) ↦ v̂_τ(p)` is the object-level component of **Jung–Rivieccio duality** applied to the predication-fiber-algebra `A_p`. The map extends to bilattice-homomorphism morphisms on `A_p` covariantly (since `Spec` reverses arrow direction, hom in `BiLat(L)` becomes hom in `PairedPriSp` with reversed direction).

Fully `C`-closed settlements additionally satisfy a dual `C`-coherence whose full statement is downstream — the dual side of the predicate-category-naturality required of fully closed settlements on the algebraic side.

## Dual orbit shape

The primal settlement `v` is `≤_k`-monotone over the settling-bound `λ`: `v_σ ≤_k v_τ` whenever `σ ≤ τ`.

The dual representation `v̂` inherits the **dual ordering** under `Spec`. Since `Spec` is contravariant on the value direction, `v̂` is monotone in the *reverse* sense — the Priestley point-set carrying the dual representation **shrinks** as `τ` grows. The primal orbit accumulates evidence (more `≤_k`); the dual orbit eliminates Priestley points that no longer confirm (fewer points).

The two pictures of the same orbit:

| Primal side | Dual side |
|---|---|
| Values `v_τ(p) ∈ A_p` grow in `≤_k` | Point sets `v̂_τ(p) ∈ PairedPriSp` shrink |
| Evidence accumulates | Confirming-witnesses set narrows |
| Quiescence: `v_{τ*}` = `v_τ` for `τ ≥ τ*` | Quiescence: `v̂_{τ*}` = `v̂_τ` for `τ ≥ τ*` |

Quiescence happens at the same ordinal on both sides; the orbits stabilize together.

## Why this lives at settling tier

A settlement is a settling-tier object — `settlement` $thing at this same hacking/library/. Its Priestley dual is the *Priestley-side representation* of that same object — algebraic side ↔ topological side. The Priestley dual is therefore at the same tier as its primal.

## Cohomology is computed here

The Priestley side is where the **cohomological framework** (sibling $thing) is computed. Sheaves on the bitopological site of `v̂` carry the invariants the algebraic side `v` cannot see directly.

Specifically: invariants that are inaccessible via fixed-point reasoning (because the settlement's closure ordinal is too large) appear here as **sheaf cohomology classes**. This is the natural home for **aperiodic regime** content — orbits that don't quiesce within countable ordinals on the algebraic side often still have cleanly-defined cohomology on the Priestley side.

So the structural division is:

- **Algebraic side** (`v` at primal): fixed-point arguments, induction on `κ`, monotone closure.
- **Priestley side** (`v̂` here): sheaf cohomology, étale invariants, the aperiodic regime's natural representation.

The settlement-priestley-dual is the bridge between these two sides on the same orbit.

## Worked example: dual of FOUR at one cell

Take `L = 2`. Then `Spec(L) = {*}` (one point). The predication-fiber-algebra `A_p = L^⋈^(E×E)` has at each cell `(s, p, o)` a value in `L^⋈ = FOUR`. The Priestley dual of `FOUR` is the two-point paired Priestley space `{+, -}` with swap involution `σ: + ↔ -`.

For one cell `(s, p, o)` with value `t = ⟨1, 0⟩`:

- Primal: `v_τ(p)(s, o) = t`.
- Dual: `v̂_τ(p)(s, o) = {+}` (only the positive-component point survives; the negative-component point is excluded).

For the same cell at value `⊥`:

- Primal: `v_τ(p)(s, o) = ⊥`.
- Dual: `v̂_τ(p)(s, o) = {+, -}` (both points survive — no exclusion yet).

For value `⊤`:

- Primal: `v_τ(p)(s, o) = ⊤`.
- Dual: `v̂_τ(p)(s, o) = ∅` (both points excluded — contradiction collapses the point-set).

For value `f = ⟨0, 1⟩`:

- Primal: `v_τ(p)(s, o) = f`.
- Dual: `v̂_τ(p)(s, o) = {-}` (only the negative-component point survives).

The four-element bilattice corresponds to the four subsets of the two-point space `{+, -}`: the empty set (`⊤`), singleton-positive (`t`), singleton-negative (`f`), full (`⊥`). This is the smallest non-trivial paired Priestley space and the smallest non-trivial settlement-priestley-dual.

## Terminology note

The archive name was `predication-priestley-dual`, conflating "predication" (predicating-tier object) with the dual being of a **settling-tier orbit**. The settlement-priestley-dual is the Priestley dual of a **settlement**, not of a generic predication. Translated to current four-object grammar as `settlement-priestley-dual`.

## Position

`finite-settlement-algebra/hacking/library/settlement-priestley-dual/`. Settling tier.

## Derivation source

Adapted from `predication-categories/objects/predication-priestley-dual.md`, preserved verbatim at `docs/dev/scraps/predication-priestley-dual.md`.
