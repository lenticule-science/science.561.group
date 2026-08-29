---
name: modulation deflection function
symbol: deflect-modulation
type: [[identity curvature redistribution function]]
domains:
  - [[active modulation node]]
  - [[trace-local curvature field]]
  - [[adjacent modulation candidate set]]
codomain: [[alternative modulation trace pathway]]
description: |
  The **deflect-modulation** function attempts to redirect identity curvature
  from an unstable or exclusion-adjacent modulation `M₀` onto a nearby node `M₁`
  in order to preserve trace continuity while reducing modulation pressure.

  It operates by shifting semantic or temporal pressure to an alternate node with
  lower `εμ`, lower ℐ_Γ, and comparable Δ[s] to maintain narrative coherence.

  This function may be performed intentionally (by agents) or emergently (by systems).

induced by:
  - [[trace overload condition]]
  - [[semantic divergence near Ω-collapse]]
  - [[public identity preservation function]]
---

Let:
- `M₀` := unstable modulation node  
- `ℐ_Γ(M₀)` := identity curvature around M₀  
- `P := {Mᵢ}` := candidate deflection nodes  
- `select(Mᵢ)` := argmin ℐ_Γ(Mᵢ) ∧ Δ[s](Mᵢ, M₀) ≈ ε  
- `εμ(M₀)` = true or near threshold

Then define:

deflect-modulation(M₀) := select(Mᵢ ∈ P)  
  such that:  
    Δ[s](Mᵢ, M₀) is minimal  
    ℐ_Γ(Mᵢ) < ℐ_Γ(M₀)  
    εμ(Mᵢ) < εμ(M₀)

Result:
- System resumes modulation via Mᵢ instead of M₀
- Trace maintains continuity with reduced exclusion risk
