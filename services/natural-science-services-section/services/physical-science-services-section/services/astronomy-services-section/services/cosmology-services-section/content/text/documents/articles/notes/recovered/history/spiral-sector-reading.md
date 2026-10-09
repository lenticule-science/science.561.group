---
status: open-direction / derivation-shaped-target
flagged: exploratory-computation
supersedes-in-spirit: treats the recorded φ^(1/6) coincidence as an ANGLE, not a fitted exponent
---

# The spiral-sector reading — H₀(late)/H₀(early) as an arc, not a factor ratio

A follow-on to [`padovan-internal-fingerprint-ruled-out`](padovan-internal-fingerprint-ruled-out.md)
and [`phi-sixth-root-numerology`](phi-sixth-root-numerology.md). Exploratory; **flagged, not
claimed.** It does not prove the band-mismatch — it converts the recorded φ^(1/6) coincidence
into a *derivation-shaped target*.

## The move

Every prior attempt read `H₀(late)/H₀(early)` as a ratio of inflation **factors** (φ/ρ, or ρ at
two stages) — i.e. it subtracted magnitudes, and it kept failing. But
[[settlement-spiral]] gives the spiral *geometry*, not just a magnitude: "stage-`k` generation
laid at radius ∝ ρ^k, **angle ∝ k·θ**." The angular coordinate was unused.

Read the two pipelines as **two points on one logarithmic settlement spiral, separated by an
arc.** For `r(θ) = r₀ e^{kθ}`, the inflation over a full turn is `λ_full = e^{2πk}` and over an
arc `Δθ` it is `λ_full^{Δθ/2π}`. A **60° arc — exactly `2π/6` — gives `λ_full^{1/6}`.** The "6"
becomes an *angle*, not a fitted exponent.

## What the numbers say (canonical `R = 73.04/67.36 = 1.0843`)

**A. Assume a 60° (one mod-6 sector) separation; ask what full-turn inflation it implies:**

$$\left(\tfrac{73.04}{67.36}\right)^{6} = 1.6254 \;\approx\; \varphi\ (1.6180)\quad(\text{0.45\%}).$$

**B. Fix `λ_full = φ` (the Scott-continuous fundamental); ask what arc the data implies:**

$$\Delta\theta = 2\pi\,\frac{\ln R}{\ln\varphi} = 60.6^\circ \approx 60^\circ = \tfrac{2\pi}{6}.$$

**C. Only golden gives a clean angle** (this is what makes it non-arbitrary):

| full-turn inflation | implied arc for canonical R | clean? |
|---|---|---|
| **φ ≈ 1.618 (golden)** | **60.6° = 1/5.94 turn** | **yes — one mod-6 sector** |
| ρ ≈ 1.325 (plastic) | 103.6° = 1/3.47 turn | no |
| trib ≈ 1.839 | 47.8° = 1/7.53 turn | no |

## Why this is better than the bare φ^(1/6) coincidence

It derives, from one picture, the two items the negative-result note and
`cosmic-band-mismatch-law` (owed-item #2) said were owed:

1. **Why φ.** The full-turn inflation of the cosmic spiral comes out as the golden ratio — the
   Scott-continuous fundamental — *recovered, not assumed*. The early/CMB band's φ is the whole
   spiral's per-turn growth, not a separate input.
2. **Why 6.** The "6" is `2π / (π/3)`: the spiral advanced by **one hexagonal sector**, and the
   hexagon is the **mod-6 commuting modulus** `lcm(2, 3−1)` already in [[collatz-settlement]]
   (σ∘Δ = Δ∘σ surviving as mod-6). This is the link `phi-sixth-root-numerology`'s "two sixes"
   asked for: the exponent-6 and the modulus-6 are the *same* hexagonal sectoring of the
   settlement spiral.

It also explains **why the ρ-internal search had to fail**: the fingerprint was never a
magnitude on the plastic spiral. It is an angular sample of the *golden* spiral. ρ governs the
finite settling's internal word-growth (Collatz); the cosmic late/early comparison is the
φ-spiral read one sector along — distinct roles for the two Pisot numbers.

## Caveats (same discipline)

- **The H₀ spread still bites.** Implied arc runs 60.6° (canonical) → 69.9° (high-H₀ end). The
  data pins "roughly one sector," not exactly 60°. Sharper local H₀ is the observational test.
- **Beat the circularity.** The 60° was *chosen* because mod-6 is already in the system, then φ
  was recovered. The non-circular, falsifiable kernel — independent of any story — is the bare
  fact `(73.04/67.36)^6 ≈ φ` to 0.45%. The interpretation earns its keep only when the 60° arc
  is *derived*.

## Open obligation (the now-single load-bearing question)

Derive, from [[cosmic-settlement]]'s descent through its four-regime tower, that the arc
subtended between two adjacent regime bands is **`2π/6`** — i.e. that the inter-band angular step
of the settlement spiral is one mod-6 sector. This is a *structural* question about the tower's
angular geometry (the `angle ∝ k·θ` law of [[settlement-spiral]] and the mod-6 commuting square),
not a numerical fit. If derived, `H₀(late)/H₀(early) = φ^{1/6}` becomes a prediction; until then
it is a derivation-shaped target.

## Reproduce

`(73.04/67.36)**6` → `1.6254`; `2π·ln(73.04/67.36)/ln(φ)` → `1.0566 rad = 60.6°`.
