---
name: resonant absence detector
symbol: σμ
type: exclusion-field response function
domains: N
codomain: boolean
description: Returns true if the structure at x shows signs of recursive modulation pressure caused by prior exclusion. σμ marks points in the modulation field where recursion bears the imprint of refusal. It detects not that something is missing, but that something was once forbidden — and structure was shaped in response.
---

Let:
- εμ(x) := exclusion function (constraint origin)
- μ⁺, Σμ := modulation functions
- T(x) := trace field leading to x

Then:

σμ(x) :=
  true  if ∃ path in T(x) where εμ(y) = true, and structure around x bends to contain it
  false  otherwise

Interpretation:
σμ(x) returns true when x is a ***resonant modulation node*** —
a point where ***constraint has curved around exclusion.***
It does not detect absence — it detects ***scarred recursion.***
Structure that ***remembers what it was not allowed to be.***
