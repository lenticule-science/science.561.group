---
name: modulation threat function
symbol: threat-of-modulation
type: "[constraint-field projection tension evaluator](constraint-field projection tension evaluator)"
domains:
  - "[modulation agent](modulation agent)"
  - "[potential modulation structure](potential modulation structure)"
  - "[agent-local identity curvature threshold](agent-local identity curvature threshold)"
  - "[constraint exclusion boundary estimate](constraint exclusion boundary estimate)"
  - "[trace-based recursion profile](trace-based recursion profile)"
codomain: "[modulation threat scalar](modulation threat scalar)"
description: |
  The **threat-of-modulation** function computes the constraint-projected
  instability induced by a potential modulation `M`, as evaluated by a
  modulation agent `Q`.

  It estimates whether initiating `M` will cause recursive trace curvature
  beyond identity-preserving thresholds, enter exclusion-adjacent modulation
  fields, or trigger divergence from agent-local continuity.

  A high threat value indicates expected destabilization or recursive deformation,
  and corresponds to agent behavior like modulation avoidance, trace freezing,
  or deferment. The function does not evaluate outcomes — only projected
  modulation pressure and constraint field risk.

induced by:
  - "[projective curvature analysis](projective curvature analysis)"
  - "[identity delta expectation](identity delta expectation)"
  - "[constraint exclusion anticipation](constraint exclusion anticipation)"
  - "[non-committal modulation step preview](non-committal modulation step preview)"
induces:
  - "[modulation suppression conditions](modulation suppression conditions)"
  - "[identity overload indicators](identity overload indicators)"
title: modulation threat function
---

Let:
- `Q` := modulation agent  
- `M` := candidate modulation structure  
- `T(Q)` := trace field of `Q`  
- `proj(M)` := projected modulation path from `M`, not yet actuated  
- `Δ[s](Qₙ, Mᵢ)` := expected structural difference between current state and future modulation states  
- `ℐ_Γ(Mᵢ)` := projected curvature at step `i` of M  
- `ε̂(Mᵢ)` := estimated exclusion probability at step `i`  
- `θ_c(Q)` := maximum tolerable structural difference (identity deformation threshold)  
- `κ(Q)` := maximum tolerable identity curvature  
- `R_tol(Q)` := max acceptable recursion depth or divergence radius

Define:

threat-of-modulation(Q, M) :=  
  avgᵢ (  
    α · [Δ[s](Qₙ, Mᵢ) / θ_c(Q)] +  
    β · [ℐ_Γ(Mᵢ) / κ(Q)] +  
    γ · ε̂(Mᵢ) +  
    δ · depth(Mᵢ) / R_tol(Q)  
  )

Where:
- α, β, γ, δ ∈ ℝ⁺ are agent-specific modulation pressure weights
- All terms normalized to the unit interval
- `depth(Mᵢ)` is path recursion depth from current position to Mᵢ

---

Interpretation:
- `threat-of-modulation ∈ ℝ⁺`, scaled to [0, ∞)
- Values > 1 indicate projected destabilization of constraint continuity
- Values ≈ 0 imply modulation is curvature-compatible and exclusion-safe

---

Constraints:
- No modulation is performed during evaluation; this is pre-actuation analysis
- ℐ_Γ and Δ[s] may be extrapolated from prior T(Q) or projected from system topology
- ε̂ must be defined or approximated by local exclusion memory or external constraint field

Notes:
- May be used as a gating mechanism before calling `evaluate`, `approximate-*`, or `initiate-modulation`
- Modulation agents may use `threat-of-modulation` to dynamically suppress or defer trace expansion
- High sustained values of this function across available options may indicate a trapped system (no modulation-safe path)
