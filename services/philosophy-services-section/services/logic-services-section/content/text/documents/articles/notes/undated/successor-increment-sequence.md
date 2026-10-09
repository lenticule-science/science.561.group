---
name: successor-increment-sequence
description: "The successor n ↦ n+1 as an increment-sequence. Its settlement orbit IS ℕ: the stages are the ordinals, v_τ's reached-set is {0,…,τ}, and the orbit never finitely quiesces (κ=ω, Scott-continuous). Peano arithmetic is the shadow of this orbit."
symbol: "U_S"
realizes: [evidence]
depends-on: [increment-sequence]
derives-from: increment-sequence
title: successor-increment-sequence
---

# Successor increment-sequence

The simplest increment-sequence: `S(n) = n+1`, always an expansion (transferring-shadow), never
a contraction. `scripts/successor.mjs` default-exports it.

## ℕ is the orbit; arithmetic is the shadow

Run `#settling-endofunctor` on `successor(0)`:

- every step reaches a **genuinely new cell**, so `v_τ`'s reached-set is exactly `{0,1,…,τ}`;
- the **stages are the ordinals** — `value at stage τ = τ` (verified in
  `successor-orbit-is-the-number-line.test.mjs`);
- the orbit **never finitely closes**: no value ever repeats, so the closure ordinal is `ω` and
  ℕ sits in the **Scott-continuous** regime (`κ = ω`).

This is shadowmancy on arithmetic itself. Peano's axioms read off the orbit: `0` is the seed (the
unique cell with no predecessor in the orbit); `S` is the step; induction is the statement that the
orbit exhausts ℕ (every cell is reached at some finite stage). The number line is not assumed — it
is *generated* as the settling orbit of the successor, and it lands one regime above the finite
shadow (κ=ω, not κ<ω) precisely because it never quiesces.

## Contrast with the finite shadows

| Generator | value monotone? | knowledge monotone? | regime |
|---|---|---|---|
| successor | yes (never falls) | yes | Scott-continuous (κ=ω) |
| Collatz / affine | **no** (bounces) | yes | strict-finite (κ<ω) |
| residue Z/m | no (cycles) | yes | strict-finite (κ≤m) |

ℕ is the *clean* case where value and knowledge order coincide as monotone; the finite shadows are
where the value decouples from the knowledge order — which is exactly why their well-founded measure
(κ) is invisible to the arithmetic of values.

Position: `increment-sequence/library/successor-increment-sequence/`.
