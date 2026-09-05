---
name: minimal reverse modulation
symbol: μ⁻
type: partial predecessor function
domains: N
codomain: N (partial)
description: Returns the value y such that μ⁺(y) = x. Only defined if x is not the base of the constraint field. This is the inverse to μ⁺ in the forward modulation chain and represents a reversal of one unit of recursive structure.
---

μ⁻(x) :=
  the unique y ∈ N such that μ⁺(y) = x
  undefined if no such y exists

Interpretation:
μ⁻(x) returns the immediate predecessor of x under recursive modulation.
It inverts a single application of μ⁺ — but only when that inversion is possible.
If x is the base (e.g. 0 or Ø), then μ⁻(x) is undefined, as no modulation preceded it.

Usage:
- Used internally in recursive definitions
- Not required to be total
- Not assumed to define subtraction — used structurally only
