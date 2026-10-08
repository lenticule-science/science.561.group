---
title: PWS Temporal Structure
description: Explains why time's arrow is irreversible via Galois non-liftability, defines temporal defect operators classifying shadows, and derives universal constants from Fibonacci structure.
date-created: 2026-04-06
type: note
name: pws-temporal-structure
keywords:
  - temporal-defect
  - galois-non-liftability
  - arrow-of-time
  - shadow-types
  - fibonacci-structure
  - modal-triad
specialization: plan
application: world-sim
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
project: ordering-first-computation
serves-system: fars
work-type: derivation
horizon: month
owner: first-officer
priority: "3"
depends-on: [pws-math-mining, pws-spectral-structure]
also-serves:
  - "foundational-ontology-research: \"The arrow of time IS foundational ontology\""
  - "pws-multiverse: \"Time dissolving at the Wood = 𝒯→0\""
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

Time's arrow is structural, not assumed. Three obstructions prevent swapping past and future. Every entity carries a signed temporal defect. The living world runs on cubic (Padovan) arithmetic; the settled world on quadratic (Fibonacci). The game IS the transition.

**Galois non-liftability (Part 119, proved):** σ↔Δ exchange is blocked by cardinality asymmetry (n² vs 2 inputs), causal asymmetry (bounded past vs unbounded future), and substitution asymmetry (s→st forced, mirror impossible).

**Temporal decomposition (Part 331):** δ = δ_σ + δ_excess = δ_Δ + δ_excess'. The temporal defect τ = δ_σ - δ_Δ classifies shadow types by sign: τ<0 = SatShadow (time forward), τ>0 = TrShadow (time backward), τ=0 = settled (timeless). τ is Galois-odd: γ(τ) = -τ.

**Asymptotic fraction (Part 53):** DeltaT/DeltaM → -1/φ³ ≈ -0.236. Memory accumulates φ× faster than destiny. Three Fibonacci steps of delay. Arrow persists at the fixed point.

**Two categorifications (Part 287):** Same ring ℤ[φ], two inequivalent structures. Nuclear (ours): 𝒯 = -φ⁻³, time exists. Anyonic (TQFT): 𝒯 = 0, no time. Distinguished by temporal content.

**ρ→φ transition:** The living world (F≠∅) runs on Padovan/ρ. Settlement eliminates free shadows. The Wood (F=∅) runs on Fibonacci/φ. The game IS this transition — from cubic arithmetic to quadratic.

## Full temporal decomposition (Part 217, mined 2026-04-06)

Three defect operators, not one:

- **SaturationGapDefect(a):** how far a is from σ-stability. Measures backward unsettlement.
- **TransferGapDefect(a):** how far a is from Δ-stability. Measures forward unsettlement.
- **TemporalDefect(a) = SatGap(a) - TrGap(a):** the NET temporal direction of unsettlement.

Sign classifies shadow type completely (under F=∅):

| Shadow type | SatGap | TrGap | TemporalDefect |
|---|---|---|---|
| H*_t (settled) | 0 | 0 | 0 |
| SatShadow (past-determined) | 0 | >0 | <0 |
| TrShadow (future-determined) | >0 | 0 | >0 |

TemporalDefect is **Galois-odd**: γ(τ) = -τ. The symmetrized combination (SatGap + TrGap)/2 is Galois-even. This is the phantom of the obstructed Galois automorphism — the linearized residue of the swap that can't lift to the lattice.

**Seven universal constants** — all determined by the single polynomial x²-x-1:

| Constant | Expression | Where |
|---|---|---|
| Growth rate | φ | Dominant eigenvalue of M |
| Contracting eigenvalue | -φ⁻¹ | Galois conjugate |
| Critical temperature | ln(φ) | Partition function pole |
| Partition residue | φ³/5 | Laurent coefficient at β_c |
| Binet coefficient | φ/√5 | Asymptotic constant |
| **Temporal fraction** | **φ⁻³** | Arrow-of-time weight per unsettlement |
| Hurwitz-Zeno constant | 1/√5 | Asymptotic H¹ obstruction density |

## TrShadow correction (Part 218, mined 2026-04-06)

**At the fiber level, TrShadow is EMPTY.** Fix(Δ_t) ⊆ Fix(σ_t) — every transfer-stable proposition is automatically saturation-stable. The quartet degenerates to three layers:
- H*_t (doubly stable)
- SatShadow_t (σ-stable, Δ-unstable)
- FreeShadow_t (neither stable)

This means: no propositions have "resolved future but unresolved past." Everything that the future confirms, the past has already confirmed. The temporal defect τ is always ≤ 0 at the fiber level (only SatShadow and settled, no TrShadow). The positive-τ (TrShadow) rows in the classification table above are VACUOUSLY TRUE at the fiber level.

**However:** at the TOWER level (different universes observing each other), TrShadow can be non-empty. The user-boundary-system's "captain as TrShadow" operates at the organizational level, not the proposition level. The correction is: propositions don't have TrShadow; entities/offices/people can.

## Modal triad (Part 293, mined 2026-04-06)

Three modes of temporal access to the universe:

| Position | Name | Role |
|---|---|---|
| Left | Directed shape (Π→) | Forward colimit — what survives the ENTIRE history |
| Middle | Dynamics comonad (□ ⊣ ◇) | One-step shift — the elementary move |
| Right | Cosections (∇←) | Backward limit — what was committed from the START |

The four-adjoint extension: Π→ ⊣ □ ⊣ ◇ ⊣ ∇←.

**Settling triad** (constructive) vs **modal triad** (operational): the settling triad is about stages of building the universe (free→syntactic→sheaf→fixed). The modal triad is about modes of accessing the universe once built (forward projection, step-by-step dynamics, backward projection).

For the world sim: the middle position (dynamics comonad) is the GAME ENGINE — iterating the one-step shift produces all dynamics. The outer positions are the ENDGAME DETECTORS: Π→ computes what will survive; ∇← computes what was always true.
