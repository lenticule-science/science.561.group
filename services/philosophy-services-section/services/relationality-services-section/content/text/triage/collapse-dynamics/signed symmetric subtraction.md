---
name: signed symmetric subtraction
symbol: Subμ⁽Δ⁾
type: total signed modulation difference
domains: N × N
codomain: Zμ (signed pair)
description: Computes the signed modulation distance between x and y. Always defined in N × N by pairing magnitude with orientation. Represents subtraction as directional modulation displacement within the constraint field.
---

Let:
- Δμ(x, y) := ν(min(x, y), max(x, y)) (recursive modulation distance)
- Zμ := {(n, s) | n ∈ N, s ∈ {+, −}} (signed modulation space)

Then:

Subμ⁽Δ⁾(x, y) :=  
  (Δμ(x, y), +) if x ≥ y  
  (Δμ(x, y), −) if x < y

Interpretation:
Returns the distance and sign between x and y as a structured pair.  
Always defined; does not require reversing modulation paths, only computing their separation.
