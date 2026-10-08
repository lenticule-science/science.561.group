---
name: stabilization depth function  
symbol: 𝒮  
type: [[constraint resolution index]]  
domains:  
  - [[recursive evolution function]]  
codomain: ℕ  
produced-by:  
  - [[stabilization target predicate]]  
produces:  
  - [[modulation persistence mapping]]  
"induced by":
  - "[stabilization target predicate](stabilization target predicate)"
induces:
  - "[modulation persistence mapping](modulation persistence mapping)"
---

The ***stabilization depth function*** (`𝒮`) returns the number of recursive steps required for a constraint field to resolve to a stable state `ω`.

Let:
> 𝒮(x) := min i ∈ ℕ : f⁽ⁱ⁾(x) = ω

This quantifies ***constraint field persistence*** — how long a system resists stabilization.

