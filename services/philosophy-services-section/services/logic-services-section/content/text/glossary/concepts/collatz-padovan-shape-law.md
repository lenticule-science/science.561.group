---
type: prediction
status: first-evidence-supports
depends-on: [collatz-settlement, settlement-spiral, residuation-forces-a-spiral, step-n-substitution-recurrence]
title: The Collatz shape law is Padovan, not Fibonacci
description: "The earlier programme (see docs/dev/notes/: collatz-normalization-correspondence.md and the predictions.py simulator) made a concrete combinatorial prediction: the number of distinct shortcut shapes at depth k — the admissible…"
---

# The Collatz shape law is Padovan, not Fibonacci

## What the prior work predicted, and that it failed

The earlier programme (see `docs/dev/notes/`: `collatz-normalization-correspondence.md` and
the `predictions.py` simulator) made a concrete combinatorial prediction: the number of
distinct **shortcut shapes** at depth `k` — the admissible expand/contract patterns of the
shortcut map `n ↦ (3n+1)/2^{v₂(3n+1)}` — grows like the Fibonacci numbers `F_{k+1}`, with
asymptotic growth rate the golden ratio `φ ≈ 1.618`.

The note records the verdict plainly: **"Fibonacci Prediction: Failed — shape-count does not
grow like `F_{k+1}`."**

## Why it failed: wrong regime

By [residuation-forces-a-spiral](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/transfinite-predication-category/hacking/library/predication-fiber-algebra/docs/dev/theorems/residuation-forces-a-spiral.md),
the growth law of a settling is its regime's Pisot inflation factor:

| Regime | inflation | recurrence |
|---|---|---|
| Scott-continuous (`κ=ω`) | golden `φ ≈ 1.618` | Fibonacci `F_k = F_{k-1}+F_{k-2}` |
| strict-finite (`κ<ω`) | plastic `ρ ≈ 1.3247` | Padovan `P_k = P_{k-2}+P_{k-3}` |

The Fibonacci/golden law is the **Scott-continuous** spiral. But the [[collatz-settlement]]
is **strict-finite** (its closure ordinal `κ < ω`). Predicting Fibonacci growth for a
finite-regime object is predicting in the wrong band — so the prediction had to fail. The
finite-regime spiral is the [[settlement-spiral]]: inflation by the **plastic number**.

## Corrected prediction

> The Collatz shortcut-shape count at depth `k` grows by the **plastic number `ρ ≈ 1.3247`**,
> following the **Padovan/Perrin** recurrence `P_k = P_{k-2} + P_{k-3}` (the minimal-Pisot,
> "skip the previous term" law), not the golden ratio.

Concretely, two falsifiable handles to re-run against the consolidated simulators:

1. **Growth-rate test.** `lim_k (S_{k+1}/S_k)` for the shape-count `S_k` should approach
   `ρ ≈ 1.3247`, not `φ ≈ 1.618`. (The old run already rejected `φ`; the new claim is it sits
   at `ρ`.)
2. **Recurrence test.** `S_k − S_{k-2} − S_{k-3}` should vanish (Padovan), whereas
   `S_k − S_{k-1} − S_{k-2}` (Fibonacci) should not.

This is the same `v₂(3n+1)` data the prior work measured (it found `v₂` geometric with
`p = 1/2`); the regime correction predicts the *aggregate shape count* it feeds is plastic,
because the halving-run structure `(1,1,2)`-image-length is exactly the Padovan substitution
profile named in `pisot-accumulation-image-length-connection`.

## First measurement (2026-05-29)

The harness now exists in ESM as `#shape-statistics` (`../../scripts/shape-statistics.mjs`,
the cream of the prior `predictions.py`) and is exercised by the settling tier's
`growth-rate-matches-regime-pisot.test.mjs`. Two statistics, two outcomes:

1. **Ω-binned shape count (the original statistic): matches NEITHER recurrence.** The
   cumulative distinct-shape count binned by `Ω(n)` *saturates* (ratio → 1) and is orders of
   magnitude larger than both `F_{k+1}` and `P_{k+2}`. This reproduces the prior Fibonacci
   failure and shows Ω-binning does not measure an inflation rate at all — it was the wrong
   statistic for *either* recurrence.

2. **Depth-binned shape count (the principled statistic): supports plastic.** Counting
   distinct shapes by trajectory depth `ℓ` (number of odd steps) is the substitution's
   word-growth, whose rate is the Perron/Pisot eigenvalue. The dominant-step growth ratios
   cluster on `ρ`: median up-ratio over `ℓ ∈ [30,90]` ≈ **1.317–1.325**, with
   `|Δρ| ≈ 0.007` vs `|Δφ| ≈ 0.30`. A clean **parity-2 oscillation** rides on top of it — the
   even/odd nucleus-shadow signature. (Test: `tests/collatz-predictions.test.mjs` asserts the
   dominant ratio sits nearer `ρ` than `φ`.)

So the regime correction holds where it should: on the inflation-rate statistic, Collatz
grows by the **plastic number**, not the golden ratio. The earlier failure was a wrong-regime
*and* wrong-statistic error.

## Status

`first-evidence-supports`. Derived (finite ⟹ plastic) and now backed by a first measurement on
the depth-binned statistic. Still open: a clean estimator that removes the finite-sample
envelope and the parity-2 oscillation (e.g. a 2-step geometric mean or a transfer-matrix
eigenvalue of the realized shape automaton) to pin the rate to `ρ` with error bars. If a
careful estimate instead lands on `φ`, the finite-regime placement of Collatz — not just this
prediction — is wrong, so it remains a genuine check on the whole framing.
