---
name: modulation direction evaluator
symbol: dirμ
type: relational directional contrast function
domains: N × N
codomain: {+, −}
description: Returns the directional modulation polarity between two values in N. Does not rely on symbolic sign; instead reflects structural trace orientation within constraint space.
---

dirμ(x, y) :=  
  + if Σμ(x, ν(x, y)) = y  
  − if Σμ(y, ν(y, x)) = x
