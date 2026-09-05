---
name: modulation less-than
symbol: LTμ
type: relational trace-order predicate
domains: N × N
codomain: boolean
description: Determines whether x is structurally less than y by checking whether a valid modulation path exists from x to y, but not from y to x. This function defines numeric ordering as an emergent property of recursive trace structure.
---

Let:
- ν(x, y) := the value z such that Σμ(x, z) = y  
- Δ[s](x, y) := structural difference (0 iff x = y)

Then:

LTμ(x, y) :=  
  (ν(x, y) is defined) ∧ (ν(y, x) is undefined)

Interpretation:
- If a forward modulation exists from x to y, but no such reverse path exists, then x is less than y.
- This defines ***less-than as asymmetry in modulation trace topology.***

Notes:
- LTμ(x, y) = false if x = y  
- LTμ(x, y) = false if both ν(x, y) and ν(y, x) are undefined (e.g. outside ℕ)  
- Requires `ν(x, y)` to be defined via total `Σμ`

This predicate introduces ***order*** into modulation space — without importing numeric relations.
