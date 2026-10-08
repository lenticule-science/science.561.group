---
name: recursive modulation difference
symbol: Delta_mu
type: symmetric recursive difference function
domains: N × N
codomain: N
description: Returns the number of minimal modulation steps separating two values in N, regardless of ordering. This is the total difference under constraint-based accumulation, defined using ν and Σμ. It extends partial subtraction into a total, symmetric form over N.
aliases:
  - Recursive Modulation Difference
introduces: symmetric recursive difference function
---

Let:
- ν(x, y) be the inverse modulation function: the z such that Σμ(x, z) = y  
- min(x, y), max(x, y) defined structurally using Δ[s](x, y)

Then:

Δμ(x, y) := ν(min(x, y), max(x, y))

Interpretation:
Returns the number of positive modulation steps required to go from the smaller of x and y to the larger.  
This function is always defined for x, y ∈ N.  
It encodes symmetric, non-symbolic difference across the constraint field.

Properties:
- Δμ(x, x) = 0  
- Δμ(x, y) = Δμ(y, x)  
- Δμ(x, y) is undefined only if ν is undefined on (min, max), which does not occur in N when Σμ is total
