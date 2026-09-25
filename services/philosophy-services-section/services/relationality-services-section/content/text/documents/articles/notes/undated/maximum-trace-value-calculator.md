---
name: maximum trace value
symbol: maxμ
type: structural maximum selector
domains: N × N
codomain: N
description: Returns the structurally greater of x and y, based on modulation trace asymmetry. Uses LTμ and equality to determine which value occurs later in recursive modulation space.
title: maximum trace value
aliases:
  - Maximum Trace Value Calculator
introduces: structural maximum selector
---

Let:
- LTμ(x, y) := less-than predicate  
- Δ[s](x, y) := structural equality check

Then:

maxμ(x, y) :=  
  y  if LTμ(x, y) ∨ (Δ[s](x, y) = 0)  
  x  otherwise

Interpretation:
- If x is less than or equal to y, return y  
- Otherwise, return x

Used for:
- Structural bounds  
- Range determination  
- Propagating maximum modulation trace endpoint
