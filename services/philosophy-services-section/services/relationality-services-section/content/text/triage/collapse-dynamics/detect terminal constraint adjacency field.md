---
name: terminal constraint adjacency field
symbol: Ω̂_adj
type: [[constraint collapse proximity detector]]
domains:
  - [[agent trace field]]
  - [[modulation structure set]]
codomain: [[Ω-adjacent structure field]]
description: |
  The **Ω-adjacency field** defines the local modulation region near a
  constraint-terminating structure (`Ω(x) = x`), identifying all modulation
  nodes whose semantic proximity to a terminal node generates trace curvature
  or modulation avoidance.

  It is used to detect recursive instability due to event-finalization pressure
  (e.g. death, closure, historical collapse).

induced by:
  - [[Ω-collapse event]]
  - [[identity modulation trace proximity]]
  - [[semantic curvature mapping]]
---

Let:
- `Ω(x) := constraint terminal structure`  
- `Φ(Q)` := local modulation field  
- `Δ[s](x, y)` := semantic difference  
- `ℐ_Γ(y)` := curvature near y  
- `θ_adj` := threshold of adjacency significance

Define:

Ω̂_adj(x) := { y ∈ Φ(Q) |  
  Δ[s](x, y) < θ_adj  
  ∧ ℐ_Γ(y) increases post Ω(x)  
}

Notes:
- Nodes in `Ω̂_adj` often trigger recursive attractor behavior
- Trace agents avoid or circle around these zones without closure
