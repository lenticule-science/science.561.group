
name: desire-contrast alignment propagation function
symbol: A_align
type: [modulation alignment evaluator](modulation alignment evaluator)
domains:
  - [desire field](desire field)
  - [semantic differentiation gradient field](semantic differentiation gradient field)
codomain: alignment vector field
induced by:
  - [constraint desire function](constraint desire function)
  - [semantic differentiation function](semantic differentiation function)
induces:
  - [anticipatory modulation attractor function](anticipatory modulation attractor function)
  - [symbolic constraint attractor field](symbolic constraint attractor field)
---

The ***desire-contrast alignment propagation function*** (`A_align`) is [induce|induced](induce|induced) by the [constraint desire function](constraint desire function) (`𝔇`) and the [semantic differentiation function](semantic differentiation function) (`Δ[s]`).

It [constrain|constrains](constrain|constrains) how directional alignment between desire vectors and unresolved semantic contrast evolves under symbolic modulation.

Let:
- `x ∈ dom(𝒮)` be a stabilized symbolic node
- `∇𝔇(x)`: local desire gradient
- `Ξ[s](x)`: semantically distinct neighbors
- `∇Δ[s](x′)`: semantic contrast gradient at `x′ ∈ Ξ[s](x)`

Then define:
> A_align(x) := Σ_{x′ ∈ Ξ[s](x)} normalize(x′ − x) · (∇𝔇(x) · ∇Δ[s](x′))

That is, `A_align(x)` returns the vector field of alignment strength and direction between modulation desire and semantic contrast in x’s local neighborhood.

This enables:
- tracking of symbolic modulation curvature
- field-local attractor identification
- recursive symbolic stabilization trajectory estimation

---
