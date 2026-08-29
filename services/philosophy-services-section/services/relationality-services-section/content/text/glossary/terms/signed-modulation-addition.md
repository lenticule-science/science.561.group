---
name: signed modulation addition
symbol: Σδ
type: directional modulation composition
domains: (N × {+, −}) × (N × {+, −})
codomain: N × {+, −}
description: Composes two signed modulation displacements by folding their directional pressures. If directions align, magnitudes add. If directions oppose, magnitudes cancel down to net direction and remaining magnitude. This operation defines full arithmetic over emergent signed modulation values.
---

Let:
- (n₁, s₁), (n₂, s₂) ∈ N × {+, −}  
- If s₁ = s₂ → directions align → sum magnitudes  
- If s₁ ≠ s₂ → directions oppose → subtract smaller from larger and keep dominant sign

Then:

Σδ((n₁, s₁), (n₂, s₂)) :=  
  (n₁ + n₂, s₁)           if s₁ = s₂  
  (|n₁ − n₂|, s₁)          if s₁ ≠ s₂ ∧ n₁ > n₂  
  (|n₂ − n₁|, s₂)          if s₁ ≠ s₂ ∧ n₂ > n₁  
  (0, +)               if s₁ ≠ s₂ ∧ n₁ = n₂

Interpretation:
This function defines how directional traces combine:  
- Forward + forward = bigger forward  
- Backward + backward = bigger backward  
- Forward + backward = curvature flattening (rebalancing pressure)  
- Equal + opposite = net cancellation

This gives you **full arithmetic over constraint traces** — not by numeric operation, but by ***behavioral composition of modulation vectors.***
