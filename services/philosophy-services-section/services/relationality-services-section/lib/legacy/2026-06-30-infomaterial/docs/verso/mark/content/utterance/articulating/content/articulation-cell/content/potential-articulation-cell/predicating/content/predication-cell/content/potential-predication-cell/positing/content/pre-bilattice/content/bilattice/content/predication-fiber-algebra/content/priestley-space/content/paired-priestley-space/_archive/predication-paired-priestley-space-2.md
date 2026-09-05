---
name: paired-priestley-space
description: "A Priestley space X equipped with an order-reversing involution σ: X → X (the swap). Morphisms are continuous order-preserving maps that commute with σ. The category PairedPriSp is the spatial side of Jung-Rivieccio duality."
depends-on: [priestley-space, negation]
derives-from: docs/dev/scraps/paired-priestley-space.md
---

# Paired Priestley space

A **paired Priestley space** is a Priestley space `X` equipped with an order-reversing involution `σ: X → X` — the *swap*. Morphisms are continuous, order-preserving maps that commute with `σ`. The category is denoted `PairedPriSp`.

## Role in Jung-Rivieccio duality

Paired Priestley spaces are the **spatial side** of Jung-Rivieccio duality:

- The swap `σ` encodes the bilattice **negation**.
- The underlying Priestley order encodes one of the two bilattice orders.
- The other bilattice order is recovered by post-composing with `σ`.

## Distinguished example: dual of FOUR

For `L = 2`, `Spec(L)` is a point, so the dual of `FOUR` is the **two-point space** `{+, -}` with `σ: + ↔ -`. This is the smallest non-trivial paired Priestley space — the spatial mirror of the smallest non-trivial bilattice.

## Position

`finite-settlement-algebra/hacking/library/paired-priestley-space/`. Settling tier — paired-Priestley-spaces are the codomain of the settlement-priestley-dual representation (sibling $thing), which is itself the Priestley side of a settlement.

## Derivation source

Adapted from `predication-categories/objects/paired-priestley-space.md`, preserved at `docs/dev/scraps/`.
