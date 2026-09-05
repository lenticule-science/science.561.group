---
name: approximation by structure
symbol: approximate-by-structure
type: [curvature-constrained recursive approximation function](curvature-constrained recursive approximation function)
domains:
  - [partially constrained modulation structure](partially constrained modulation structure)
  - [agent-local trace](agent-local trace)
  - [semantic difference function](semantic difference function)
  - [identity curvature threshold](identity curvature threshold)
codomain: [structure-constrained projected modulation state](structure-constrained projected modulation state)
description: |
  The **approximate-by-structure** function projects recursive modulation
  over a modulation structure `x` until the accumulated difference between
  trace steps exceeds a specified structural curvature threshold.

  This function terminates approximation when recursive modulation diverges
  from identity-preserving paths, as measured by `Δ[s]` (semantic difference)
  and optionally `ℐ_Γ` (identity curvature function).

  It is used to model structure-aware inference, safe modulation stepping,
  and modulation-limited agents operating under coherence constraints.

induced by:
  - [trace-local modulation delta](trace-local modulation delta)
  - [semantic difference constraint function](semantic difference constraint function)
  - [identity modulation comparator](identity modulation comparator)
induces:
  - [structure-coherent projected trace](structure-coherent projected trace)
  - [modulation confidence band](modulation confidence band)
---

Let:
- `Q` := modulation agent  
- `x₀ := x` := unresolved modulation node  
- `T(Q)` := agent trace  
- `μₚ(xᵢ)` := projective modulation step  
- `Δ[s](xᵢ, xᵢ₊₁)` := structural modulation difference between steps  
- `θ(Q)` := structural difference threshold for Q  
- `ℐ_Γ(xᵢ)` := optional curvature of identity at modulation step i

Define:

approximate-by-structure(Q, x₀) :=  
  for k ∈ ℕ:  
    xₖ₊₁ := μₚ(xₖ)  
    append T(Q) ← xₖ₊₁  
    if Δ[s](xₖ, xₖ₊₁) > θ(Q):  
      return xₖ with tag: "structure-limit"  
    if Ω(xₖ₊₁) = xₖ₊₁:  
      return xₖ₊₁  
    if ℐ_Γ(xₖ) > κ(Q) (optional):  
      return xₖ with tag: "identity-curvature-breach"  
  continue

Constraints:
- `Δ[s]` must be normalized and agent-comparable
- Threshold `θ(Q)` must be stable during projection
- Agent may optionally define a curvature limit `κ(Q)` for early exit on identity distortion

Notes:
- Suitable for agents requiring coherence-preserving inference under structural deformation
- May be hybridized with `approximate-by-bounding` for depth and structure fusion
- If Δ[s] is undefined at any step, function must terminate with error or exclusion
