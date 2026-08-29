---
name: terminal stabilization predicate
symbol: tau
type: recursive fixed point predicate
domains: modulation function, constraint difference evaluator
codomain: boolean
description: Evaluates whether a value is a terminal fixed point under a recursive modulation function, without reference to identity or external constants.
---

The **terminal stabilization predicate** (`tau`) evaluates whether a value `x` is a fixed point of a recursive modulation function `f`, and whether the application of `f` induces no further difference.

Let:
- `f(x)` be a recursive modulation function
- `Δ[s](x, y)` be the structural or semantic difference between `x
