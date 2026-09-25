---
name: differentiation convergence function
symbol: Λ[Δ]
type: "[constraint trajectory convergence evaluator](constraint trajectory convergence evaluator)"
domains:
  - "[semantic contrast field function](semantic contrast field function)"
  - "[modulation path trace](modulation path trace)"
codomain: convergence measure (ℝ⁺)
induced by:
  - "[semantic contrast field function](semantic contrast field function)"
  - "[differentiation persistence function](differentiation persistence function)"
induces:
  - "[constraint cohesion metric](constraint cohesion metric)"
  - "[semantic collapse detector](semantic collapse detector)"
title: differentiation convergence function
description: The differentiation convergence function (Λ[Δ]) measures whether the local structure of semantic differentiation is resolving under propagation.
---

The ***differentiation convergence function*** (`Λ[Δ]`) measures whether the local structure of semantic differentiation is resolving under propagation.

Let:
- `Ξ[s](../../../../triage/x)` return contrast neighbors  
- `Π[Δ](x, x′)` track persistence of difference  
- `γ(t)` be a constraint-preserving path through space

Then define:
> Λ[Δ](../../../../triage/γ) := Σ_{t} Σ_{x′ ∈ Ξ[s](../../../../triage/γ(t))} decay(Π[Δ](../../../../triage/γ(t), x′))

That is, `Λ[Δ]` returns the summed (or averaged) decay of contrast persistence along a modulation trajectory.

Used to:
- Determine whether modulation flow resolves difference  
- Diagnose convergence vs. divergence  
- Feed into symbolic closure predicates
