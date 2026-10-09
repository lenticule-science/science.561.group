---
name: differentiation gradient function
symbol: ∇Δ[s]
type: [[modulation vector function]]
domains:
  - [[semantic contrast field function]]
  - [[completed constraint function]]
codomain: [[modulation vector]]
induced by:
  - [[semantic differentiation function]]
  - [[semantic contrast field function]]
  - [[completed constraint function]]
induces:
  - [[identity curvature function]]
  - [[constraint modulation bias]]
  - [[differentiation persistence measure]]
title: differentiation gradient function
description: The differentiation gradient function (∇Δ[s]) is induced by the semantic contrast field function (Ξ[s]) and the completed constraint function (Ω).
---

The ***differentiation gradient function*** (`∇Δ[s]`) is [[induce|induced]] by the [[semantic contrast field function]] (`Ξ[s]`) and the [[completed constraint function]] (`Ω`).  
It [[constrain|constrains]] the local [[modulation vector]] at a point by aggregating direction-weighted semantic difference from nearby stabilized contrast.

Let:
- `Ξ[s](../../../../triage/collapse-dynamics/x)` return the local set of semantically differentiated neighbors of `x`  
- `Ω` be the constraint completion function  
- `normalize(x′ − x)` return a unit vector from `x` to `x′`  
- `∥Ω(x′) − Ω(x)∥` be the difference in constraint-completed values

Then define:
> ∇Δ[s](../../../../triage/collapse-dynamics/x) := Σ_{x′ ∈ Ξ[s](../../../../triage/collapse-dynamics/x)} normalize(x′ − x) · ∥Ω(x′) − Ω(x)∥

That is, `∇Δ[s]` is a function from points to vectors:  
returning the direction and strength of local semantic differentiation.

The result may modulate propagation behavior, identity deformation, or constraint reformation pressure at `x`.
