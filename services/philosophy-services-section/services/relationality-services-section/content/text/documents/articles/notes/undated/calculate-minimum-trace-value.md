---
name: minimum trace value
symbol: minμ
type: structural minimum selector
domains: N × N
codomain: N
description: Returns the structurally smaller of x and y, based on modulation trace asymmetry. Uses LTμ and structural equality to evaluate which value occurs earlier in recursive space.
title: minimum trace value
aliases:
  - Calculate Minimum Trace Value
introduces: structural minimum selector
---

Let:
- LTμ(x, y) := less-than predicate  
- Δ[s](x, y) := structural equality check

Then:

minμ(x, y) :=  
  x  if LTμ(x, y) ∨ (Δ[s](x, y) = 0)  
  y  otherwise

Interpretation:
- If x comes before y, or x = y → return x  
- If y comes before x → return y

Used for:
- Defining lower bounds  
- Sorting  
- Conditional propagation in trace space
