---
name: mutually-locally-derivable
description: "The equivalence relation on aperiodic-regime settlements classified by the aperiodic-classifying-invariant. Two aperiodic settlings v, v' over a common base are MLD iff there exists an invertible settling-morphism v → v'."
symbol: "∼_MLD"
depends-on: [settlement, settling-morphism, aperiodic-settling]
derives-from: docs/dev/scraps/mutually-locally-derivable.md
---

# Mutually locally derivable settlings

The equivalence relation on **aperiodic-regime** settlements classified by the aperiodic-classifying-invariant.

Two aperiodic settlings `v, v'` over a common base `(L, C, E, λ)` are **mutually locally derivable** — written `v ∼_MLD v'` — iff there exists an invertible settling-morphism `v → v'`.

## What MLD captures

- **Settling-shift**: two settlings differing only in starting ordinal are MLD.
- **Structural equivalence**: the settling-morphism family `φ_{q, τ}` must commute with both settlings' endofunctors. Any MLD-equivalence respects the *structural closure pattern*, not just static values.

## What MLD does NOT capture

- **Arbitrary relabelling**: the equivariance requirement constrains the morphism enough to forbid arbitrary value-renaming.
- **Cross-regime equivalence**: MLD is defined ONLY for aperiodic settlings (`κ ≥ ω₁`). Lower-regime settlings have other equivalence notions (e.g., settlement-preorder-morphism for `PS` is `≤_k`-preorder).

## Why this lives at articulating tier

MLD is defined for **aperiodic settlings** specifically — the regime articulating opens. Lower regimes use weaker equivalence notions. MLD is therefore an articulating-tier concept: it is the right equivalence to use *when* you are in the aperiodic regime, and only there.

The MLD equivalence classes are what the aperiodic-classifying-invariant separates — that invariant is the cohomological data that distinguishes MLD-classes from each other.

## Position

`aperiodic-articulation-category/hacking/library/mutually-locally-derivable/`. Articulating tier (aperiodic regime).

## Derivation source

Adapted from `predication-categories/concepts/mutually-locally-derivable.md`, preserved at `docs/dev/scraps/`.
