---
name: modulation inverse necessity function
symbol: chi_nu
type: conditional function construction predicate
domains: constraint field predicate
codomain: functional existence declaration
description: Asserts that if the constraint field exhibits overlapping forward modulation paths (phi_rev = true), then the inverse modulation function nu(x, y) must be constructible. Encodes the formal dependency between structural ambiguity and the necessity of subtraction.
---

Let:
- phi_rev := ∃ x, y₁, y₂ such that y₁ ≠ y₂ and Σμ(x, y₁) = Σμ(x, y₂)  
- ν(x, y) := inverse modulation function, where Σμ(x, ν(x, y)) = y

Then:

χ_ν :=  
  phi_rev ⇒ (ν(x, y) is constructible)

Interpretation:
If the system exhibits modulation overlap at any point,  
then it must admit a function ν(x, y) that resolves modulation reversibility.

That is, the structure cannot not support subtraction once ambiguity arises.  
Inverse modulation is a required structural response.
