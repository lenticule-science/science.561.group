---
name: inverse subtraction
symbol: Subμ⁽ν⁾
type: partial inverse modulation subtraction
domains: N × N
codomain: N (partial)
---


Let:
- Σμ(a, b) be recursive forward accumulation
- ν(y, x) be the inverse modulation function

Then:

Subμ⁽ν⁾(x, y) := ν(y, x)  
  defined iff x ≥ y

Interpretation:
Returns the modulation required to reach x from y.  
Fails when x < y, unless the system is extended to support negative modulation.
