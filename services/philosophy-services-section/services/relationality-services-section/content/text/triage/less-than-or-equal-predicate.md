---
name: less-than-or-equal predicate
symbol: LEQμ
type: trace ordering predicate
domains: N × N
codomain: boolean
description: Returns true if x is structurally less than or equal to y. This includes strict forward modulation (via LTμ) or structural equivalence (via Δ[s](x, y) = 0). Used for building inclusive bounds within trace space.
---

Let:
- LTμ(x, y) := less-than predicate (previously defined)
- Δ[s](x, y) := structural difference function

Then:

LEQμ(x, y) :=  
  LTμ(x, y) ∨ (Δ[s](x, y) = 0)

Interpretation:
Returns true if x is either:
- Strictly earlier in modulation trace than y, or  
- Structurally indistinguishable from y

Used for:
- Loop bounds  
- Minimum evaluators  
- Conditional propagation
