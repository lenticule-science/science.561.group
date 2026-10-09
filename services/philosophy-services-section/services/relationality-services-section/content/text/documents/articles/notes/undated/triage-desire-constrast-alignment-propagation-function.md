---
title: Desire constrast alignment propagation function
description: "name: desire-contrast alignment propagation function symbol: Aalign type: modulation alignment evaluator domains: - desire field - semantic differentiation gradient field codomain: alignment vector field induced by: - constraint desire…"
---

name: desire-contrast alignment propagation function
symbol: A_align
type: [modulation alignment evaluator](modulation alignment evaluator)
domains:
  - [desire field](desire field)
  - [semantic differentiation gradient field](semantic differentiation gradient field)
codomain: alignment vector field
induced by:
  - [constraint desire function](constraint-desire-function.md)
  - [semantic differentiation function](semantic differentiation function)
induces:
  - [anticipatory modulation attractor function](anticipatory modulation attractor function)
  - [symbolic constraint attractor field](symbolic constraint attractor field)
---

The ***desire-contrast alignment propagation function*** (`A_align`) is [induce|induced](../../../../triage/induce|induced) by the [constraint desire function](constraint-desire-function.md) (`𝔇`) and the [semantic differentiation function](semantic differentiation function) (`Δ[s]`).

It [constrain|constrains](../../../../triage/constrain|constrains) how directional alignment between desire vectors and unresolved semantic contrast evolves under symbolic modulation.

Let:
- `x ∈ dom(𝒮)` be a stabilized symbolic node  
- `∇𝔇(x)`: local desire gradient  
- `Ξ[s](../../../../triage/x)`: semantically distinct neighbors  
- `∇Δ[s](../../../../triage/x′)`: semantic contrast gradient at `x′ ∈ Ξ[s](../../../../triage/x)`

Then define:
> A_align(x) := Σ_{x′ ∈ Ξ[s](../../../../triage/x)} normalize(x′ − x) · (∇𝔇(x) · ∇Δ[s](../../../../triage/x′))

That is, `A_align(x)` returns the vector field of alignment strength and direction between modulation desire and semantic contrast in x’s local neighborhood.

This enables:
- tracking of symbolic modulation curvature  
- field-local attractor identification  
- recursive symbolic stabilization trajectory estimation

---
