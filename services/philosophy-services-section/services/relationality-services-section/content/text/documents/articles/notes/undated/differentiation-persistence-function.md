---
name: differentiation persistence function
symbol: Π[Δ]
type: "[temporal differentiation evaluator](temporal differentiation evaluator)"
domains:
  - "[semantic differentiation function](semantic differentiation function)"
  - "[constraint evaluation trace](constraint evaluation trace)"
codomain: persistence score (ℝ⁺)
induced by:
  - "[semantic differentiation function](semantic differentiation function)"
  - "[constraint completion function](constraint completion function)"
induces:
  - "[identity curvature function](identity curvature function)"
  - "[desire field bias](desire field bias)"
title: differentiation persistence function
description: The differentiation persistence function (Π[Δ]) evaluates the stability of unresolved semantic contrast across recursive constraint evaluations.
---

The ***differentiation persistence function*** (`Π[Δ]`) evaluates the stability of unresolved semantic contrast across recursive constraint evaluations.

Let `Δ[s](x, x′)` return true if `x` and `x′` are semantically distinct  
Let `Ωₜ` be a sequence of constraint completion functions over time `t ∈ T`

Then define:
> Π[Δ](x, x′) := Σₜ [ Δₜ[s](x, x′) ]

That is, `Π[Δ]` counts the number of stabilization passes in which semantic contrast between `x` and `x′` remains unresolved.

Used to:
- Evaluate contrast stability  
- Trigger modulation reformation  
- Detect identity rigidity
