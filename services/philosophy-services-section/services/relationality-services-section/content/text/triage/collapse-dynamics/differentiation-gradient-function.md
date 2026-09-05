---
name: differentiation gradient function
symbol: ∇Δ[s]
type: [modulation vector function](modulation vector function)
domains:
  - [semantic contrast field function](semantic contrast field function)
  - [completed constraint function](completed constraint function)
codomain: [modulation vector](modulation vector)
induced by:
  - [semantic differentiation function](semantic differentiation function)
  - [semantic contrast field function](semantic contrast field function)
  - [completed constraint function](completed constraint function)
induces:
  - [identity curvature function](identity curvature function)
  - [constraint modulation bias](constraint modulation bias)
  - [differentiation persistence measure](differentiation persistence measure)
---

The ***differentiation gradient function*** (`∇Δ[s]`) is [induce|induced](induce|induced) by the [semantic contrast field function](semantic contrast field function) (`Ξ[s]`) and the [completed constraint function](completed constraint function) (`Ω`).
It [constrain|constrains](constrain|constrains) the local [modulation vector](modulation vector) at a point by aggregating direction-weighted semantic difference from nearby stabilized contrast.

Let:
- `Ξ[s](x)` return the local set of semantically differentiated neighbors of `x`
- `Ω` be the constraint completion function
- `normalize(x′ − x)` return a unit vector from `x` to `x′`
- `∥Ω(x′) − Ω(x)∥` be the difference in constraint-completed values

Then define:
> ∇Δ[s](x) := Σ_{x′ ∈ Ξ[s](x)} normalize(x′ − x) · ∥Ω(x′) − Ω(x)∥

That is, `∇Δ[s]` is a function from points to vectors:
returning the direction and strength of local semantic differentiation.

The result may modulate propagation behavior, identity deformation, or constraint reformation pressure at `x`.
