---
name: modulation division-remainder pair
symbol: DivModμ
type: recursive division pair function
domains: N × N
codomain: (N × N)
description: Returns a pair (q, r) such that Πμ(y, q) + r = x, and r < y. This constructs both the modulation quotient and remainder, using only constraint stacking and recursive difference. Fully resolves x into y-aligned units and residual modulation.
---

Let:
- Divμ(x, y) := recursive modulation quotient (previously defined)
- Modμ(x, y) := modulation remainder (previously defined)

Then:

DivModμ(x, y) := (q, r) where
  q := Divμ(x, y)
  r := Modμ(x, y)

Interpretation:
- Decomposes `x` into `q` full stacks of `y` (via modulation)
- Returns the leftover modulation `r` that cannot be further stacked
- Ensures: Πμ(y, q) + r = x and LTμ(r, y) = true

Used for:
- Modulus branching
- Cycle detection
- Recursive branching systems (e.g. Collatz-like dynamics)
- Division without symbolic arithmetic
