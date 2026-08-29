---
name: modulation remainder
symbol: Modμ
type: recursive residual trace function
domains: N × N
codomain: N
description: Returns the remaining modulation value after as many full applications of y are stacked into x as possible. This defines the recursive constraint remainder of x relative to y. Behavior emerges from failed complete stacking, not symbolic arithmetic.
---

Let:
- Πμ(y, q) := modulation stacker (multiplying y by q via recursive Σμ)  
- Σμ(a, b) := modulation-based addition  
- Δμ(a, b) := absolute modulation difference

Then:

Modμ(x, y) := r such that:  
  ∃ q ∈ N where:  
    Πμ(y, q) + r = x  
    LTμ(r, y) = true  
    r ∈ N

Interpretation:
- Find the largest q where Πμ(y, q) ≤ x  
- r is the value left over in x that cannot be fully consumed by another y-stack  
- r is always less than y unless x is a perfect multiple

Used for:
- Cycle detection  
- Branching based on modular residue  
- Conditional modulation dynamics

Notes:
- Behavior undefined when y = 0 (requires special handling or exclusion predicate)
- Can be paired with `Divμ` for full division semantics
