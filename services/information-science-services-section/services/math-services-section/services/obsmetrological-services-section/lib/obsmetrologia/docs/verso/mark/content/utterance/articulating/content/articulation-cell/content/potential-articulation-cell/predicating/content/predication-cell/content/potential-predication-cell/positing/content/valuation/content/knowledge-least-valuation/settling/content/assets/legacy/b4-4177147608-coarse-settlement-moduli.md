---
name: coarse-settlement-moduli
description: "For a fixed base B, the set of components of the visible-settlement-fiber-groupoid: |KP^vis(B)| := π_0(KP^vis(B)) = KP(B)/~_MLD. Points of the coarse moduli are MLD-equivalence classes of settlements over B. The 0-truncation of the moduli groupoid."
kind: set
symbol: "|KP^vis(B)|"
defined-as: "π_0(KP^vis(B))"
points-of: "MLD-classes of settlements over B"
realizes: [orbifold-moduli-point, rigid-moduli-point]
depends-on: [visible-settlement-fiber-groupoid, mutually-locally-derivable]
derives-from: docs/dev/scraps/coarse-settling-moduli.md
---

# Coarse settlement moduli

For a fixed base `B = (L, C, E, λ)`, the **coarse settlement moduli** is the set of components of the visible-settlement-fiber-groupoid:

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;:=\; \pi_0\bigl(\mathrm{KP}^{\mathrm{vis}}(B)\bigr) \;=\; \mathrm{KP}(B) \,/\, {\sim_{\mathrm{MLD}}}.$$

A **point of the coarse moduli** is an MLD-equivalence class of settlements over `B`. The 0-truncation functor `|·|: Gpd → Set` — sending a groupoid to its set of connected components — produces the underlying point-set of the moduli.

## What lives on the coarse moduli

Several substrate invariants are *functions on the coarse moduli*:

- The **aperiodic-classifying-invariant** `cl-inv: |KP^vis(B)| → H^1(T*, F_U)/~` (modulo sheaf-iso).
- The **moduli-classifying-function** `I_B: |KP^vis(B)| → sheaf-iso-classes` (this is the well-defined-on-coarse-moduli function discussed at moduli-classifying-function).
- The **rank function** `rank: |KP^vis(B)| → Z` sending each MLD-class to its `H^0` rank.
- The **growth-rate function** `growth: |KP^vis(B)| → R_{≥1}` (for substitution settlements).

Each invariant is defined per-settlement but factors through the MLD-equivalence relation, hence is well-defined on the coarse moduli.

## Orbifold vs rigid points

The coarse moduli has **two kinds of points** depending on the settlement's automorphism structure:

- **Rigid points**: the MLD-class `[v]` has trivial automorphism group `Aut^vis(v) = {id}`. The groupoid `KP^vis(B)` has only the identity around the class. These are "well-behaved" moduli points.
- **Orbifold points**: `Aut^vis(v)` is non-trivial. The class has internal symmetry; the coarse moduli's point is decorated by `Aut^vis(v)`.

The orbifold structure is what gets remembered when the coarse moduli is refined to a *moduli stack* (the moduli-prestack of which the coarse-moduli is the truncation).

## Functoriality

The coarse moduli is *functorial in `B`*: a base-change `(ℓ, e, π, φ_λ): B → B'` induces a function

$$|f|^* : |\mathrm{KP}^{\mathrm{vis}}(B')| \to |\mathrm{KP}^{\mathrm{vis}}(B)|$$

via the base-change-and-restrict construction. This makes `B ↦ |KP^vis(B)|` a contravariant functor `B^op → Set`.

The functor is the **0-truncation** of the settlement-moduli-prestack `M^pre`: where `M^pre` lands in `Gpd`, the coarse moduli function lands in `Set` by taking components.

## Position

`finite-settlement-algebra/hacking/library/coarse-settlement-moduli/`. Settling tier — the 0-truncated moduli of settlements over a fixed base.

## Derivation source

Adapted from `predication-categories/objects/coarse-settling-moduli.md`, preserved at `docs/dev/scraps/coarse-settling-moduli.md`. Renamed from `coarse-settling-moduli` to `coarse-settlement-moduli` per the four-object grammar.
