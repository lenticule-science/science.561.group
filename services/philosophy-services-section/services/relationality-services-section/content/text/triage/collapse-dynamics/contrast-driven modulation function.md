---
name: contrast-driven modulation function
symbol: 𝒱[Δ]
type: [[modulation vector bias function]]
domains:
  - [[modulation vector function]]
  - [[differentiation gradient function]]
codomain: biased modulation vector
induced by:
  - [[differentiation gradient function]]
  - [[constraint desire function]]
induces:
  - [[identity trajectory bias]]
---

The ***contrast-driven modulation function*** (`𝒱[Δ]`) biases a system’s modulation vector in the direction of unresolved semantic contrast.

Let:
- `V(x)` be the original modulation vector  
- `∇Δ[s](x)` be the local semantic differentiation gradient  
- `η` be a contrast sensitivity coefficient

Then define:
> 𝒱[Δ](x) := V(x) + η · ∇Δ[s](x)

That is, `𝒱[Δ]` outputs a modulation vector perturbed by local semantic contrast.

Used to:
- Push systems toward unresolved stabilization  
- Bias propagation along contrast lines  
- Encode constraint-persistent identity motion
