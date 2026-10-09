---
name: visible-settlement-fiber-groupoid
description: "The quotient of the settlement-fiber-groupoid by the normal subgroupoid of invisible automorphisms. KP^vis(B) := KP^≃(B)/N. Automorphism groups become the visible automorphism quotient Aut^vis(v) = Aut^≃(v)/N(v) — the symmetries that act non-trivially on the associated sheaf."
kind: groupoid
symbol: "KP^vis(B)"
defined-as: "KP^≃(B) / N (quotient by invisible automorphism subgroupoid)"
zero-cells: "settlements over B (same as un-quotiented)"
one-cells: "biequivalences modulo invisible automorphisms"
automorphism-groups: "Aut^vis(v) = Aut^≃(v)/N(v), via semidirect-product decomposition"
realizes: [invisible-automorphism-subgroup]
depends-on: [settlement-fiber-groupoid, invisible-automorphism-subgroup]
derives-from: docs/dev/scraps/visible-settling-fiber-groupoid.md
---

# Visible settlement fiber groupoid

The **quotient of the settlement-fiber-groupoid by the normal subgroupoid of invisible automorphisms**:

$$\mathrm{KP}^{\mathrm{vis}}(B) \;:=\; \mathrm{KP}^\simeq(B) \,/\, N.$$

Concretely:

- **0-cells**: settlements over `B` (same as the unquotiented groupoid).
- **1-cells**: biequivalences modulo invisible automorphisms — two biequivalences `φ, ψ: v → v'` are identified iff they differ by an invisible automorphism `n ∈ N(v)` (i.e., `ψ = φ ∘ n` for some `n ∈ N(v)`).
- **Automorphism groups** at each `v`:

$$\mathrm{Aut}^{\mathrm{vis}}(v) \;:=\; \mathrm{Aut}^\simeq(v) \,/\, N(v),$$

with the semidirect-product decomposition `Aut^≃(v) ≅ N(v) ⋊ Aut^vis(v)`.

## Why quotient by invisible automorphisms

The invisible-automorphism subgroup `N(v)` consists of automorphisms that act **trivially on the settling-associated-sheaf** — they're "invisible to cohomology." When the goal is to classify settlements **up to cohomological data**, the invisible automorphisms should be quotiented out.

The visible quotient `KP^vis(B)` keeps exactly the symmetries that distinguish cohomological classes:

- Invisible: forgotten.
- Visible: retained as automorphism data.

This is the structurally-correct groupoid for moduli-classification: the un-quotiented groupoid carries irrelevant noise; the visible quotient carries only the data the classification cares about.

## Components

The component structure of `KP^vis(B)` is **the same as** that of `KP^≃(B)`:

$$\pi_0\bigl(\mathrm{KP}^{\mathrm{vis}}(B)\bigr) \;=\; \pi_0\bigl(\mathrm{KP}^\simeq(B)\bigr) \;=\; \mathrm{KP}(B) \,/\, {\sim_{\mathrm{MLD}}}.$$

Both groupoids have MLD-classes as components. The difference is at the automorphism level: visible groupoid has smaller automorphism groups.

## What the moduli prestack lands in

The settlement-moduli-prestack `M^pre: B^op → Gpd` lands in `KP^vis(B)`, NOT in `KP^≃(B)`:

$$\mathscr{M}^{\mathrm{pre}}(B) \;=\; \mathrm{KP}^{\mathrm{vis}}(B).$$

This is the right choice because moduli classification cares about cohomological-distinct points; invisible symmetries don't separate cohomological data, so the visible quotient is the right groupoid.

## Position

`finite-settlement-algebra/hacking/library/visible-settlement-fiber-groupoid/`. Settling tier — the visible-quotient groupoid that the moduli prestack lands in.

## Derivation source

Adapted from `predication-categories/objects/visible-settling-fiber-groupoid.md`, preserved at `docs/dev/scraps/`. Renamed per the four-object grammar.
