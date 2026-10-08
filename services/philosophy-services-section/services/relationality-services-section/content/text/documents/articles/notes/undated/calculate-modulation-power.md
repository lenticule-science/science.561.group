---
name: modulation power
symbol: Ξμ
type: recursive exponentiation function
domains: N × N
codomain: N
description: Returns x raised to the y-th modulation power by recursively stacking x onto itself y times using Πμ. This defines exponentiation structurally, via recursive accumulation of recursive stackings.
title: modulation power
aliases:
  - Calculate Modulation Power
introduces: recursive exponentiation function
---

Let:
- Πμ(a, b) := modulation stacker (multiplication via Σμ)
- μ⁻(y) := minimal reverse modulation
- Base: Ξμ(x, 0) := μ⁰ := 1 (assumed multiplicative identity)

Then:

Ξμ(x, y) :=  
  1                if y = 0  
  Πμ(x, Ξμ(x, μ⁻(y)))  otherwise

Interpretation:
- Raise `x` to the `y`th power by recursively multiplying `x` by the result of `x^(y−1)`
- Purely recursive — no shortcuts or symbolic algebra
- The exponent is ***how many times*** to stack ***modulation stackings of `x`***

Notes:
- Total over N when μ⁻ is defined and base cases are handled  
- 1 is assumed as a base identity, though you may optionally define `μ⁰` formally
