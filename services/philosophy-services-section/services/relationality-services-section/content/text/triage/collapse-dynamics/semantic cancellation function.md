---
name: semantic cancellation function
symbol: χ[s]
type: [[contrast elimination predicate]]
domains:
  - [[completed constraint function]]
  - [[semantic differentiation function]]
codomain: boolean
induced by:
  - [[semantic differentiation function]]
  - [[constraint completion function]]
induces:
  - [[constraint collapse trigger]]
---

The ***semantic cancellation function*** (`χ[s]`) evaluates whether semantic differentiation between two stabilized points has disappeared under recursive closure.

Let:
- `Ωₜ` be a sequence of constraint completions  
- `Δₜ[s](x, x′)` return whether contrast persists at time `t`

Then define:
> χ[s](x, x′) := ∃ t₀: ∀ t > t₀, Δₜ[s](x, x′) = false

That is, `χ[s]` returns true if semantic difference was fully eliminated after a point in the system’s history.

Used to:
- Flag completed convergence  
- Trigger symbolic unification  
- Collapse contrast tension loops
