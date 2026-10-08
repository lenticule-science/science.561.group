---
name: inverse modulation inevitability predicate
symbol: phi_inv
type: structural resolution predicate
domains: modulation trace field
codomain: boolean
description: Determines whether the presence of overlapping results from distinct forward modulation paths requires the introduction of an inverse modulation function. This formalizes the structural inevitability of subtraction.
title: inverse modulation inevitability predicate
aliases:
  - Inverse Modulation Inevitability Predicate
introduces: structural resolution predicate
---

Let:
- Σμ(x, y) be recursive modulation accumulation  
- ν(x, y) be the hypothetical inverse: "what z satisfies Σμ(x, z) = y?"  
- T be the modulation trace field  

Then:

phi_inv(x, y) :=  
  ∃ z₁ ≠ z₂ such that Σμ(x, z₁) = y and Σμ(x, z₂) = y

Interpretation:
If two distinct forward modulations from the same origin reach the same point, then the system requires an inverse function ν to distinguish and resolve structure.

That is, the existence of ambiguous accumulation paths implies the necessity of inverse modulation. Subtraction (or reversal) cannot not happen.
