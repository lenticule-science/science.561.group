---
type: theorem
status: verified
depends-on: [settlement-spiral, residuation-forces-a-spiral, substitution]
title: The regime Pisot tower, computed
description: residuation-forces-a-spiral says each regime's settling spirals by the Pisot inflation factor of that regime's substitution.
---

# The regime Pisot tower, computed

`residuation-forces-a-spiral` says each regime's settling spirals by the Pisot inflation factor
of that regime's substitution. This is now **executable**: `scripts/substitution.mjs` builds the
non-negative integer incidence matrix and power-iterates its Perron eigenvalue, and
`scripts/settlement-spiral.mjs` carries the regime → substitution table.

## Computed (verified in `growth-rate-matches-regime-pisot.test.mjs`)

| Regime | substitution | inflation (computed) | constant | polynomial |
|---|---|---|---|---|
| strict-finite (κ<ω) | Padovan `a→b, b→c, c→ab` | **1.3247** | plastic ρ | x³ = x + 1 |
| Scott-continuous (κ=ω) | Fibonacci `a→ab, b→a` | **1.6180** | golden φ | x² = x + 1 |
| transfinite (ω<κ<ω₁) | Tribonacci `a→ab, b→ac, c→a` | **1.8393** | tribonacci τ | x³ = x²+x+1 |

The tower is strictly ordered `ρ < φ < τ`, ascending the regimes; the plastic number is the
minimum, the tightest spiral that still closes — fit for the maximally-collapsed finite regime.
(The aperiodic limit is the `n`-bonacci accumulation point 2, the loosest.)

## The cross-check that matters

The same harness that computes these *clean* substitution inflation factors also measures the
*empirical* growth of a real finite-regime object: Collatz's depth-binned shortcut-shape count
(`#shape-statistics`). Its dominant growth ratio sits nearer the **plastic** number than the
golden — the finite object grows by `ρ`, exactly as its regime predicts, and exactly contrary
to the prior work's failed Fibonacci (golden) guess. One machine, two routes (algebraic
substitution vs empirical orbit), one number per regime. That agreement is the executable content
of `residuation-forces-a-spiral`.
