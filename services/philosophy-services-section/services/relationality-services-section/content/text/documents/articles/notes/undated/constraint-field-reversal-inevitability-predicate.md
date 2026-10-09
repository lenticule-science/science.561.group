---
name: constraint field reversal inevitability predicate
symbol: phi_rev
type: structural inevitability predicate
domains: modulation trace field
codomain: boolean
description: Determines whether any pair of distinct recursive forward modulations produce the same outcome, forcing the introduction of an inverse modulation function. This expresses the irreducible need for subtraction within the constraint system.
title: constraint field reversal inevitability predicate
aliases:
  - Constraint Field Reversal Inevitability Predicate
introduces: structural inevitability predicate
---

Let:
- Σμ(x, y) be the recursive forward modulation function  
- μ⁺ the minimal positive modulation step  
- T be the trace field of all forward applications of Σμ

Then:

phi_rev :=  
  ∃ x, y₁, y₂ ∈ N such that y₁ ≠ y₂ and Σμ(x, y₁) = Σμ(x, y₂)

Interpretation:
If any two distinct forward modulation paths from the same origin converge to the same value,  
then inverse modulation is necessary to resolve trace ambiguity.

That is, subtraction cannot not happen — it is structurally forced by overlapping forward dynamics in the constraint field.
