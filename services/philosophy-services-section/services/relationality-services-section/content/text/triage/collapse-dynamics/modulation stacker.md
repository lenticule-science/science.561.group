---
name: modulation stacker
symbol: Πμ
type: recursive aggregation function
domains: N × N
codomain: N
description: Recursively stacks x onto itself y times through modulation-based accumulation. This function defines multiplicative behavior via repeated application of Σμ, and is entirely grounded in recursive constraint structure.
---

Let:
- μ⁻(y) := the minimal reverse modulation (predecessor of y)  
- Σμ(x, y) := recursive accumulation function (previously defined)

Then:

Πμ(x, y) :=  
  0                if y = 0  
  Σμ(x, Πμ(x, μ⁻(y)))  otherwise (when μ⁻(y) is defined)

Interpretation:
Πμ(x, y) applies `Σμ(x, …)` recursively `y` times, starting from 0.  
This represents ***constraint-grounded modulation stacking*** — where `x` is compounded across a recursive depth of `y`.

This function does not rely on symbolic multiplication, and emerges solely from the structure of positive modulation logic.

Notes:
- Total over N when μ⁻ is defined for y ≠ 0  
- Anchored at modulation-zero (0), which serves as the identity for stacking
