---
title: Partition Function Thermodynamics and Galois Decomposition
description: Develops partition function thermodynamic model classifying gameplay phases by temperature, derives key mathematical results for critical phenomena, and decomposes via Galois theory to analyze temporal asymmetry.
date-created: 2026-04-06
type: note
name: pws-thermodynamics
keywords:
  - partition-function
  - game-phases
  - temperature
  - galois-decomposition
  - temporal-asymmetry
  - critical-point
specialization: plan
application: world-sim
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
project: ordering-first-computation
serves-system: fars
work-type: derivation
horizon: month
owner: first-officer
priority: "2"
depends-on: [pws-math-mining]
also-serves:
  - "convergent-enrichment-plan: \"Enrichment IS heating toward the critical temperature\""
  - "web-ui-foundation: \"The temperature zoom IS the bridge dashboard's depth slider\""
  - "mash-live-web-service: \"The four phases ARE the four dashboard modes\""
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

The world has a temperature β that determines what depths are playable. The partition function Z(q) weights entities by exp(-β·depth). At high β (cold), only shallow entities are accessible. At low β (hot), all depths contribute. The critical point β_c = ln(ρ) ≈ 0.281 is where vocabulary generation diverges — the transition from "Crystallizing" to "Living."

**Key results from the idea file:**

**The partition function** (Part 330, proved for F=∅): Z(q) = (1+q²)/(1-q-q²)² with double pole at q = 1/φ. The Padovan correction (zeta.py, computational): when F≠∅, the PS pole moves to q = 1/ρ where ρ³ = ρ+1. Four poles correspond to four game phases.

**Four temperatures, four phases:**
| Phase | β range | What's accessible | Game character |
|-------|---------|-------------------|----------------|
| Frozen | β > ln(3) | Nothing | Pre-game |
| Thawing | ln(2) < β < ln(3) | Histories but no settlement | Chaos, pure paidia |
| Crystallizing | ln(ρ) < β < ln(2) | Settled entities but no vocabulary | Strategy without depth |
| Living | β < ln(ρ) | Full tower | Self-sustaining vocabulary generation |

**The Padovan staircase:** P(n) = P(n-2) + P(n-3). Three-level lookback. Slower than Fibonacci but deeper memory. Early game flat (1,1,1,2,2,3), late game accelerating.

**The Hadamard product:** Z = f_T × f_H. Site factor (spatial richness) and topos factor (structural depth) are independent. Critical temperature set by topos alone.

**The Verlinde prediction** (Part 332): quantum topology predicts growth rate φ model-independently via the Fibonacci fusion ring. The gap between Verlinde's φ (ideal, F=∅) and computation's ρ (actual, F≠∅) measures the free-shadow contribution. The game IS the transition from ρ-arithmetic to φ-arithmetic.

**Enrichment IS heating:** adding predicates lowers β. The convergent enrichment strategy IS heating the world toward criticality.

**Temperature zoom:** the captain/player can set β to see different depths. High β = strategic overview. Low β = operational detail. The slider IS the partition function evaluated at different β.

## Galois decomposition of the partition function (Part 302, mined 2026-04-06)

The temporal decomposition (Part 217) splits the defect into backward (δ^σ) and forward (δ^Δ) components. Their symmetrized and anti-symmetrized combinations give two partition functions:

**Z = Z⁺ + Z⁻** where:
- **Z⁺** (Galois-even): weights entities by the symmetrized defect λ⁺ = (λ^σ + λ^Δ)/2. Invariant under σ↔Δ swap.
- **Z⁻** (Galois-odd): weights entities by the temporal defect τ = λ^σ - λ^Δ. Changes sign under σ↔Δ swap.

**The asymptotic ratio:** Z⁻/Z⁺ → -φ⁻³ as β → β_c⁺. The temporal asymmetry persists at criticality — the partition function "knows which direction time points."

**Dedekind factorization correspondence:**

| Number field Q(√5) | Relational universe R |
|---|---|
| ζ_K = ζ · L(·, χ₅) | Z = Z⁺ + Z⁻ |
| Galois-even: Riemann ζ | Z⁺ (symmetrized defect) |
| Galois-odd: L(·, χ₅) | Z⁻ (temporal defect τ) |
| χ₅ detects prime splitting | τ_t detects shadow-type direction |
| L(·, χ₅) ≠ 1 | Z⁻/Z⁺ → -φ⁻³ ≠ 0 |

**No functional equation for Z:** The swap λ^σ ↔ λ^Δ is NOT a symmetry of the spectrum (because Galois non-liftability). Therefore Z(β) has no β↔(2β_c - β) reflection. The settled regime and unsettled regime are genuinely different. However, Z⁺ alone MAY have a partial functional equation (open conjecture).

**Game implication:** The Galois decomposition gives TWO temperature readings:
- Z⁺(β) = "how settled is the world?" (direction-independent)
- Z⁻(β) = "which way is the world going?" (direction-dependent)

The bridge dashboard should show both. The ratio Z⁻/Z⁺ is the "temporal compass" — always pointing toward φ⁻³ at criticality.
