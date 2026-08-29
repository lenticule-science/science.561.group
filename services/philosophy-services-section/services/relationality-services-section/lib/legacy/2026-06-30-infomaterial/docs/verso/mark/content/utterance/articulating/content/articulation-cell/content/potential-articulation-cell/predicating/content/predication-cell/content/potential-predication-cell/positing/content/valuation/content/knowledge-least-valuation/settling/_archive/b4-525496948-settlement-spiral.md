---
name: settlement-spiral
description: "The logarithmic spiral carried by every strict-finite settlement: inflation by the plastic number ρ ≈ 1.3247 (the smallest Pisot number), governed by the Padovan/Perrin recurrence P(k) = P(k-2) + P(k-3). The finite-regime instance of the residuation-forced spiral; the shape any finite settling traces as it grows toward quiescence."
symbol: "ς_ρ"
realizes: [closure-drivenness, settling-monotonicity]
depends-on: [settlement, settling-endofunctor, step-n-substitution-recurrence, step-n-fixed-point, residuated-lattice]
derives-from: residuation
---

# Settlement spiral

The [residuation-forces-a-spiral](../../../../../../transfinite-predication-category/hacking/library/predication-fiber-algebra/docs/dev/theorems/residuation-forces-a-spiral.md)
theorem shows every residuation-driven settling carries a logarithmic spiral whose inflation
factor is the Pisot number selected by the regime band. The **settlement-spiral** is that
spiral in the **strict-finite** regime (`κ < ω`): inflation by the **plastic number**

$$\rho \;=\; \sqrt[3]{\tfrac{1}{2}+\tfrac{1}{6}\sqrt{\tfrac{23}{3}}} + \sqrt[3]{\tfrac{1}{2}-\tfrac{1}{6}\sqrt{\tfrac{23}{3}}} \;\approx\; 1.32472,$$

the unique real root of `x³ = x + 1` — the **smallest Pisot number**. Its recurrence is the
**Padovan/Perrin** law

$$P(k) \;=\; P(k-2) + P(k-3),$$

which skips the immediately-prior term (no `P(k-1)`), the signature of the minimal-Pisot
inflation. This is the row named in [pisot-accumulation-image-length-connection]
(Padovan image lengths `(1,1,2)`, Perron weighted-average `ρ ≈ 1.3247`).

## Why finite gets the plastic number

The four regimes are the four bands of closure ordinals; the finite band `κ < ω` is the
maximally collapsed one (nuclei trivialize — see the strict-finite-nuclear-collapse-shadow).
The Pisot spectrum has the plastic number `ρ` as its infimum: there is no Pisot number
between 1 and `ρ`. So the **tightest self-similar spiral that still closes** is the plastic
one, and that is exactly the spiral a strict-finite settling can afford. Ascending the tower
loosens the spiral: `ρ < φ < τ_{trib} < \cdots \to 2`.

| Regime | Spiral inflation | Recurrence |
|---|---|---|
| strict-finite (`κ<ω`) | `ρ ≈ 1.3247` (plastic) | Padovan `P(k)=P(k-2)+P(k-3)` |
| Scott-continuous (`κ=ω`) | `φ ≈ 1.6180` (golden) | Fibonacci `F(k)=F(k-1)+F(k-2)` |
| transfinite (`ω<κ<ω₁`) | `≈ 1.8393` (tribonacci) | Tribonacci `T(k)=T(k-1)+T(k-2)+T(k-3)` |
| aperiodic (`κ≥ω₁`) | `→ 2` (`n`-bonacci limit) | `n`-bonacci, `n→∞` |

## What it IS, concretely

For a strict-finite [settlement](../settlement/settlement.md) `(v_τ)_{τ<κ}` driven by a
[settling-endofunctor](../../../../../../../settling/hacking/library/settling-endofunctor/settling-endofunctor.md)
`F_U`, the settlement-spiral is the geometric realization in which the count of genuinely-new
cells fired at stage `k` (the `L_ns`-style increment, see non-scott-continuous-firing-ordinal)
follows the Padovan recurrence, so the cumulative content grows as `ρ^k` and the stage-`k`
generation is laid at radius `∝ ρ^k`, angle `∝ k·θ_ρ`. The settling reaches quiescence at
`κ < ω`; the spiral is therefore a **finite arc**, not an endless coil — the strict-finite
shadow of the unbounded aperiodic spiral.

## Position

`finite-settlement-algebra/hacking/library/settlement-spiral/`. Settling tier. `hacking/`
because the identification "closure-discipline ⟺ Pisot condition" is asserted from the
worked step-`n` cases, not yet proved in full generality.

## Used by

The Collatz orbit is a strict-finite settlement, so its growth/shape statistics spiral by
`ρ`, not `φ`. This is the correction the prior Collatz work needed — see
[[collatz-settlement]] and its `docs/dev/theorems/collatz-padovan-shape-law.md`.
