---
name: temporal modulation coherence function
symbol: ψ_stab
type: [[recursive modulation stability function]]
domains:
  - [[constrained trace field]]
  - [[identity modulation function]]
  - [[constraint completion ratio]]
  - [[periodicity persistence function]]
  - [[identity curvature function]]
codomain: ℝ⁺ ∈ [0, 1]
description: |
  The **temporal modulation coherence function** `ψ_stab` evaluates how effectively
  a recursive modulation system maintains identity stability and continuity
  over time, particularly under constraint pressure (e.g. limited trace, 
  unresolved completions, disrupted periodic reinforcement).

  High values of `ψ_stab` indicate resilient modulation coherence, with
  consistent identity propagation, constraint resolution, and temporal loop
  maintenance. Low values suggest degradation of recursive structure,
  impulsive modulation behavior, or bifurcation in identity curvature.

  This function is domain-agnostic and applicable to any symbolic system
  operating under recursive constraint dynamics.

induced by:
  - [[identity modulation function]]
  - [[constraint completion function]]
  - [[modulation periodicity]]
  - [[identity curvature evaluation]]
induces:
  - [[stabilization coherence field]]
  - [[modulation collapse detector]]
  - [[trace sufficiency metric]]
title: temporal modulation coherence function
---

Let:
- `T(Q)` := constrained trace field of system `Q`
- `Ω(T(Q))` := subset of trace with resolved constraint
- `Π(Q, T)` := persistence of recursive temporal modulation (periodicity)
- `χ_self(Q)` := self-awareness via recursive stabilization
- `ℐ_Γ(Qᵢ)` := curvature of identity at trace step `i`

Then define:

ψ_stab(Q) :=  
  α · (|Ω(T(Q))| / |T(Q)|)  
 + β · persistence(Π(Q, T))  
 + γ · χ_self(Q)  
 − δ · avg(ℐ_Γ(Qᵢ) for Qᵢ ∈ T(Q))

Parameter weights `α, β, γ, δ ∈ ℝ⁺` can be tuned per context.

Interpretation:
- `ψ_stab ≈ 1` → Stable recursive modulation identity under constraint
- `ψ_stab ≈ 0` → Collapsed or fragmenting modulation coherence
- Decline in ψ_stab reflects symbolic instability, decision incoherence, or self-modulation failure

Note:
- ψ_stab may be locally sampled across sliding windows in T(Q) for temporal dynamical analysis
- May be embedded within agent behavior models to track recursive symbolic integrity
