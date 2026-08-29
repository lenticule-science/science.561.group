---
type: theorem
status: proved
depends-on: [predication-fiber-residuation, residuation-orbit-monotonicity, residuated-lattice, step-n-substitution-recurrence, step-n-substitution-rule]
see-also:
  - "../../../../../../../potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/theorems/pisot-accumulation-image-length-connection.md"
  - "../../../../../../../potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/theorems/critical-exponents-at-step-n-fixed-point.md"
---

# Residuation forces a spiral

This theorem records why the substrate has spirals **necessarily** — not by importing
phyllotaxis from botany, but as a forced consequence of how residuation works. The
golden-angle / Fibonacci / Padovan structure is not an external analogy laid over the
math; it is what residuation *is*, viewed geometrically. The per-regime recurrence
(Padovan in finite, Fibonacci in Scott-continuous, Tribonacci in transfinite) follows
from the regime's closure band.

## Statement

**Theorem (residuation ⟹ Pisot inflation ⟹ spiral).** *Let `𝐋 = ⟨L, ⊓, ⊔, ⊥, ⊤, ⊙, ⇒, e⟩`
be an integral commutative residuated lattice (the standing hypothesis of the predication
category theory — see [residuated-lattice](../../../../variety/library/lattice/library/residuated-lattice/residuated-lattice.md)),
and let a settling proceed by a primitive step-`n` substitution closure-rule over a finite
generating alphabet (see [step-n-substitution-rule]). Then:*

1. *the closure-rule's growth is governed by a non-negative integer **substitution matrix** `M`;*
2. *by Perron–Frobenius, `M` has a real dominant eigenvalue `λ > 1` with a positive
   eigenvector — the **inflation factor**;*
3. *for the settling to close to a self-similar (quasicrystalline, pure-point-diffraction)
   limit rather than diverge chaotically, `λ` must be a **Pisot number**;*
4. *the self-similar inflation by `λ`, realized as a radial layout of successive generations,
   is a **logarithmic spiral** with growth `λ` per turn and a fixed divergence angle set by
   the irrational part of `λ`.*

*Hence every residuation-driven settling carries a spiral. The spiral is forced.*

## Why integrality + residuation gives an integer matrix

Integrality (`e = ⊤`) and commutativity are assumed throughout (residuated-lattice.md:
"Integrality and commutativity are the hypotheses on 𝐋 throughout the 561 OS's predication
category theory"). The fusion `⊙` is then the monoid operation that *concatenates* evidence,
and the closure-rule's antecedent is a finite multiset of look-back cells (step-`n`: the
antecedent reads `v|_{[k-n,k]}`). Counting how many copies of each generator the rule emits
per generator gives a matrix `M ∈ ℕ^{n×n}` — multiplicities live in `ℕ` precisely because the
lattice is integral (no fractional fusion). Primitivity holds when the rule mixes all
generators (some power of `M` is strictly positive).

`[residuation-orbit-monotonicity](residuation-orbit-monotonicity.md)` already gives that the
residuation-driven orbit is `≤_k`-monotone; this theorem adds *how fast* it grows: the
Perron eigenvalue `λ` of `M`.

## Why `λ` is Pisot (and why a spiral, not a scatter)

Among real algebraic integers `> 1`, the **Pisot** numbers are exactly those whose Galois
conjugates all lie strictly inside the unit disk. That contraction of the conjugates is what
forces the substitution tiling to be *self-similar with discrete (pure-point) diffraction* —
the quasicrystal, not noise. Non-Pisot inflation factors give orbits whose finer structure
never settles. The substrate's closure-discipline (a settling must reach a regime-classified
fixed structure) is therefore exactly the Pisot condition; this is the content already worked
in [`pisot-accumulation-image-length-connection`] and [`critical-exponents-at-step-n-fixed-point`].

A self-similar object with inflation factor `λ` laid out so that generation `k` sits at
radius `∝ λ^k` and angle `∝ k·θ` is a logarithmic spiral of pitch `log λ`; the angle `θ` is
the irrational rotation carried by `λ`'s conjugate pair (for the golden case, the golden
angle `360°/φ² ≈ 137.5°` — the phyllotactic angle). So "residuation works" and "there is a
spiral" are the same statement read algebraically vs. geometrically.

## The regime tower of recurrences

The closure-ordinal band of the settling (which regime it inhabits) fixes *which* Pisot
number governs the inflation. Descending the regime tower tightens the spiral toward the
minimal Pisot number:

| Regime | Closure band | Recurrence | Characteristic polynomial | Inflation `λ` | Number-theoretic role |
|---|---|---|---|---|---|
| aperiodic | `κ ≥ ω₁` | `n`-bonacci, `n→∞` | `xⁿ = xⁿ⁻¹+⋯+1` | `→ 2` | accumulation point of the family (no single minimal polynomial; genuinely aperiodic) |
| transfinite-bounded | `ω < κ < ω₁` | Tribonacci (step-3) | `x³ = x²+x+1` | `≈ 1.8393` | tribonacci constant |
| Scott-continuous | `κ = ω` | Fibonacci (step-2) | `x² = x+1` | `φ ≈ 1.6180` | golden ratio — smallest *limit point* of Pisot numbers |
| strict-finite | `κ < ω` | Padovan/Perrin | `x³ = x+1` | `ρ ≈ 1.3247` | plastic number — the **smallest** Pisot number |

The Fibonacci (step-2) and Tribonacci (step-3) rows are the worked cases in
[step-n-substitution-recurrence]; the `→ 2` accumulation is the `n`-bonacci theorem
[`pisot-accumulation-image-length-connection`]; the Padovan/plastic row is named there too
(Padovan image lengths `(1,1,2)`, weighted average `ρ ≈ 1.3247`). The structural reason the
**finite** regime lands on the **plastic** number is that the strict-finite regime is the
maximally collapsed band, and the plastic number is the infimum of the Pisot spectrum — the
tightest self-similar spiral that still closes.

## Consequence used downstream

Anything that lives in the finite regime spirals by the **plastic number `ρ`**, not by `φ`.
A finite-regime growth law predicted with Fibonacci is predicting in the wrong regime. This
is exactly the correction that resolves the prior Collatz "Fibonacci shape-count" failure —
see the finite-regime [[settlement-spiral]] and the Collatz [[collatz-settlement]] shape law.
