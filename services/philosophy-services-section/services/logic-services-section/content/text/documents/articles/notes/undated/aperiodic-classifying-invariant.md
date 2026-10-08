---
name: aperiodic-classifying-invariant
description: "The cohomology class in H^1 that classifies aperiodic-regime settlements up to mutually-locally-derivable (MLD) equivalence. cl-inv(v) := [1_{F_U}] ∈ H^1(T*_{≤κ}, F_U), the canonical identity class of the settling-associated-sheaf. Separates aperiodic settlements iff cl-inv distinguishes their MLD-classes."
symbol: "cl-inv(v)"
realizes: [cohomological-equivalence]
depends-on: [settling-cohomology, settling-associated-sheaf, mutually-locally-derivable, closure-ordinal, settlement-morphism]
derives-from: docs/dev/scraps/aperiodic-classifying-invariant.md
title: aperiodic-classifying-invariant
---

# Aperiodic classifying invariant

The **cohomology class in `H^1`** that classifies aperiodic-regime settlements up to mutually-locally-derivable (MLD) equivalence.

For an aperiodic settlement `v` over `(L, C, E, λ)` with closure-ordinal `κ ≥ ω₁` and increment-sequence `U`:

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;:=\; [\mathbf{1}_{\mathcal{F}_U}] \;\in\; H^1\bigl(\mathbf{T}^*_{\leq \kappa},\, \mathcal{F}_U\bigr),$$

where `1_{F_U}` is the **canonical identity class** of the settling-associated-sheaf — the cohomology class of the identity cochain assigning to each object `(q, τ, U) ∈ T*_{≤ κ}` the sum of generator elements in `F_U(q, τ, U)` indexed by newly-added designated cells at stage `τ`.

## Why `H^1` and not `H^0`

The classifying invariant lives in `H^1`, not `H^0`. The reason:

- `H^0` captures **rank** — how many independent designated cells the settlement accumulates. This is a coarse invariant; two settlements can have the same `H^0` rank but be MLD-distinct (different inferential structures producing the same cell-count).

- `H^1` captures **classifying class** — the equivalence-class of the orbit's structural pattern. Two settlements `v ~_MLD v'` iff their `H^1`-classes agree. The `H^1`-class is fine enough to separate MLD-classes (in the aperiodic regime), where `H^0` is too coarse.

This is parallel to how `H^1(BG)` classifies `G`-torsors: rank `H^0` is too coarse; cohomological-class `H^1` separates fine structure.

## What "canonical identity class" means

The identity cochain on `F_U` is the cocycle that, at each `(q, τ, U)`, assigns the sum of generator elements indexed by newly-added designated cells at stage `τ`. Formally, if `Δ^+_τ(q)` is the set of newly-designated cells at stage `τ`, the cochain value is

$$\sum_{(s, o) \in \Delta^+_\tau(q)} \mathrm{gen}_{(s, o)} \;\in\; \mathcal{F}_U(q, \tau, U).$$

This cocycle is **canonical** — uniquely determined by the settlement's structure. Its cohomology class in `H^1` is the classifying invariant.

## Why this lives at articulating tier

The aperiodic-classifying-invariant is defined for **aperiodic-regime settlements only** — settlements whose closure-ordinal `κ ≥ ω₁`. Lower-regime settlements use weaker invariants (rank, or finite-step matching). Only at the aperiodic tier does `H^1` become the **necessary** classification — because fixed-point arguments cannot extract MLD-classes when `κ ≥ ω₁`, so cohomology is the only available tool.

The articulating-tier regime (`aperiodic-articulation-category`) is where this invariant operationally lives. The articulating-tier hacking/library/ houses it as the invariant separating articulation-orbit classes.

## Separation theorem (archive)

**Theorem (aperiodic-regime classification, sketch).** For aperiodic settlements `v, v'`:

$$v \;\sim_{\mathrm{MLD}}\; v' \quad \Longleftrightarrow \quad \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') \in H^1.$$

The classifying invariant **separates** MLD-classes (forward direction is straightforward; the reverse direction is the substantive content).

The separation is **strict for the aperiodic regime** — in lower regimes (where MLD might be undefined or trivial), the analogous theorem doesn't hold.

## Cosheaf-homology dual

The sibling `aperiodic-co-classifying-invariant` is the cosheaf-homology dual. `cl-inv(v) ∈ H^1` (cocycles on sheaf side); `čl-inv(v) ∈ H_1` (cycles on cosheaf side). The two are related by Verdier duality on the bitopological settling site; they encode the same data in dual forms.

## Position

`aperiodic-articulation-category/hacking/library/aperiodic-classifying-invariant/`. Articulating tier — the cohomological invariant separating aperiodic-regime settlements.

## Derivation source

Adapted from `predication-categories/objects/aperiodic-classifying-invariant.md`, preserved at `docs/dev/scraps/`. The archive frontmatter cites cohomological-equivalence (it realizes `~_H`), settling-cohomology, settling-associated-sheaf, and depends-on aperiodic-settling (translated to articulating regime in current grammar).
