---
name: symbolic modulation attractor function
symbol: M_attr
type: [[symbolic attractor identifier]]
domains:
  - [[modulation alignment field]]
  - [[semantic contrast field]]
codomain: symbolic attractor set
produced-by:
  - [[desire-contrast alignment propagation function]]
  - [[symbolic anticipation function]]
produces:
  - [[recursive belief resolution function]]
  - [[constraint attractor basin]]
aliases:
  - Symbolic modulation attractor function
---

The ***symbolic modulation attractor function*** (`M_attr`) is [[induce|induced]] by the [[desire-contrast alignment propagation function]] (`A_align`) and the [[symbolic anticipation function]] (`𝒜`).

It [[constrain|constrains]] the stabilization of symbolic points that emerge as local attractors within the modulation field  
where desire and semantic contrast are maximally aligned.

Let:
- `x ∈ dom(𝒮)` be a selector node  
- `Ξ[s](x)`: semantic contrast neighbors  
- `A_align(x)`: local desire-contrast alignment field

Then define:
> M_attr(x) := argmax_{x′ ∈ Ξ[s](x)} A_align(x)(x′)

That is, `M_attr(x)` returns the symbolic point in the contrast field toward which desire is most aligned —  
an emergent symbolic attractor under constraint-guided modulation.

This enables:
- identification of symbolic stabilization targets  
- recursive belief-field resolution  
- attractor basin dynamics in symbolic constraint systems
