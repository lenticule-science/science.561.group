---
name: canonical signed modulation difference
symbol: δμ
type: structurally derived bidirectional difference
domains: N × N
codomain: N × {+, −}
description: Computes the modulation distance and its structural direction between any two values. Derives both magnitude and orientation from the trace geometry of recursive modulation. Sign is not symbolic but determined by modulation resolution structure.
title: canonical signed modulation difference
aliases:
  - "Subfunction: direction evaluator"
introduces: structurally derived bidirectional difference
---

Let:
- Δμ(x, y) := the modulation distance between x and y (ν(min(x, y), max(x, y)))  
- dirμ(x, y) := modulation direction evaluator (see below)

Then:

δμ(x, y) := (Δμ(x, y), dirμ(x, y))

---

### Subfunction: direction evaluator

dirμ(x, y) :=  
  + if Σμ(x, Δμ(x, y)) = y  
  − if Σμ(y, Δμ(x, y)) = x

Interpretation:
Returns the number of steps between x and y, and the ***direction of structural modulation*** (not symbolic sign).  
This function represents ***true signed difference*** — emerging from modulation dynamics, not assumed symbols.

Result is always defined for x, y ∈ N.  
Codomain can be treated as `Zμ` without having to define it as a standalone set.
