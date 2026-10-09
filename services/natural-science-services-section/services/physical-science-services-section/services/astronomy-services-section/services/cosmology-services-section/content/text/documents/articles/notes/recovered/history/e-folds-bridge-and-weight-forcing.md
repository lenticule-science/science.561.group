---
status: hacking / structural-result + honest-negative
extends: weighted-tropical-eigenvalue-duality-gap.md
depends-on: [benchmark-continuous-V-step-n, continuous-valued-step-n-cohomological-rank]
---

# The e-folds bridge: the tension is additive (and the weights are not yet forced)

Pushes two open bounds from the [weighted-tropical-eigenvalue duality-gap note](weighted-tropical-eigenvalue-duality-gap.md):
the additive↔multiplicative units bridge (closed, structurally) and whether the weights `w_a, w_b`
are *forced* by the substitution (open — a clean negative).

## 1. The units bridge is Maslov dequantization (grounded, not invented)

The benchmark runs the **same** continuous-V theorem over both the **multiplicative-real semiring
`R`** *and* the **tropical** semirings (benchmark §2D vs §2E). That relationship is exactly
**Maslov dequantization**: tropical (max-plus / min-plus, additive) is the `ln`-limit of
multiplicative-`R`. So the additive and multiplicative readings of the eigenvalue are not a
units-fudge — they are the two corpus value-categories of one theorem, related by `log`.

Cosmology supplies the matching physical fact: the **e-fold** number `N = ln a` is *the* additive
expansion variable, and `H = dN/dt` is an **e-fold rate** — already a log-space object. So:

- the **multiplicative-`R`** eigenvalue `λ_R` is a dimensionless growth *factor* (like φ);
- the **tropical** eigenvalue `λ_trop = ln λ_R` is an e-fold *rate* — the `H`-like, additive object.

**The same tension is a ratio multiplicatively and a difference additively.** Numerically, the
recorded "φ^(1/6)" coincidence is a *multiplicative* statement; its `log` is the additive one:

$$\ln\frac{H_{\text{late}}}{H_{\text{early}}} = \ln\frac{73.04}{67.36} = 0.0810
\quad\approx\quad \frac{\ln\varphi}{6} = 0.0802 \quad(0.9\%).$$

**Consequence (the reframe):** since `H` is natively an e-fold rate, the **fundamental** tension is
the *additive difference* `ΔH ≈ 5.7 km/s/Mpc`, and the multiplicative ratio `≈ φ^(1/6)` is its
`exp`-dual — a derived artifact, not the deep object. This also retires the φ^(1/6) "why a sixth
root" puzzle as a *multiplicative restatement* of an additive gap, which is the natural form here.
The verified tension closed form `λ^max − λ^min = |w_a − w_b|/2` is *already additive* — consistent
with `H` living in tropical/log space, no conversion needed.

## 2. Are the weights forced by the substitution? — honest negative

The obvious hope: the weights are not free but **fixed by the Fibonacci substitution itself** — its
Perron eigenvector (tile lengths `(φ, 1)`, or letter frequencies). Tested:

| weighting | `|w_a − w_b|/2` | additive target `(ln φ)/6 = 0.0802` |
|---|---|---|
| raw eigenvector `(φ, 1)` | 0.309 | scale-dependent (needs a normalization) |
| normalized to mean 1 | 0.236 | miss |
| normalized to sum 1 (frequencies) | 0.118 | miss |
| log-eigenvector `(ln φ, 0)` | 0.241 = `(ln φ)/2` | miss by a factor of exactly 3 |

**None of the natural substitution-canonical weightings hit the target.** So the weights are **not**
the bare tile lengths / frequencies; they carry an additional (unknown) scale-factor calibration.
This is a *clean negative*: it does not close the form into a number, but it **rules out** the
simplest weight-forcing and pins the residual to one specific unknown — the calibration between the
abstract skeleton weights and the physical scale-factor history.

(The log-weight case lands at `(ln φ)/2`, exactly 3× the target. The "3" is arithmetic — `(ln φ)/2`
vs `(ln φ)/6` — not a derived three-cycle, so I am **not** claiming it means anything. Flagged only
so a future pass doesn't re-discover it and over-read it.)

## Where this leaves the program

- **Closed:** the additive↔multiplicative bridge (Maslov; `H` = e-fold rate). The tension is
  fundamentally the **difference** `ΔH`, additive, matching the corpus's tropical eigenvalue — no
  units fudge. Standing bound #2 of the parent note is discharged.
- **Still open, now sharper:** the weights. Not the substitution's own eigenvector — so the residual
  is exactly *the scale-factor calibration map* from skeleton-letter weights to physical e-folds.
  That map is the remaining content of the "H₀ = λ_w" gap. Likely **past what the prior corpus
  covers** (it treats abstract substitutions; the physical calibration is cosmology-specific).
- **Untouched:** the continuous-L conflation analogue (parent bound #3) — still owed for rigor.

## What this advances

Discharges the units-bridge bound of the parent note via a grounded (Maslov / corpus-dual)
argument, and converts the "weights un-derived" bound from open-ended into a single named unknown
(the scale-factor calibration), with the naive weight-forcings ruled out.
