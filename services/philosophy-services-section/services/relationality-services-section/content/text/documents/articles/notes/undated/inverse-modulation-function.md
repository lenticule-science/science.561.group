---
name: inverse modulation function
symbol: nu
type: inverse recursive modulation resolver
domains: N × N
codomain: N
description: Computes the modulation delta z such that Σμ(x, z) = y. Required to exist under constraint overlap pressure (phi_rev), this function recursively determines the difference between two values under positive recursive accumulation.
title: inverse modulation function
aliases:
  - Inverse Modulation Function
introduces: inverse recursive modulation resolver
---

Let:
- Σμ(x, z) be defined: recursive accumulation of μ⁺ over x, z times  
- Δ[s](a, b) be structural contrast (used for equality check)  

Then:

ν(x, y) :=  
  0           if Δ[s](x, y) = 0  
  μ⁺(ν(x, y′))    otherwise, where y′ := μ⁻(y) and Σμ(x, ν(x, y′)) = y′

Or, non-recursively (search form):

ν(x, y) :=  
  the minimal z ∈ N such that Σμ(x, z) = y  
  (undefined if no such z exists)

Interpretation:
ν returns the number of modulation steps needed to reach y from x.  
This function resolves difference without subtracting — it accumulates forward from x until the target is met, if possible.
