---
name: bounded divergence predicate  
symbol: 𝔽  
type: [recursive non-convergence predicate](recursive non-convergence predicate)  
domains:  
  - [constraint evolution function](constraint evolution function)  
codomain: boolean  
induced by:  
  - [trace depth limit](trace depth limit)  
induces:  
  - [divergence horizon mapping](divergence horizon mapping)  
---

The ***bounded divergence predicate*** (`𝔽`) asserts that a constraint field fails to stabilize within a bounded recursion depth `h`.

Let:
> 𝔽(x, h) := ∀ i ≤ h, f⁽ⁱ⁾(x) ≠ ω

Where `ω` is the field's stabilization target (e.g. a fixpoint).

This is a **local non-convergence detector**.
