---
name: approximation by bounding
symbol: approximate-by-bounding
type: "[constraint-limited recursive approximation function](constraint-limited recursive approximation function)"
domains:
  - "[unresolved modulation structure](unresolved modulation structure)"
  - "[bounded recursion profile](bounded recursion profile)"
  - "[agent-local trace field](agent-local trace field)"
  - "[constraint exclusion surface](constraint exclusion surface)"
codomain: "[bounded modulation projection state](bounded modulation projection state)"
description: |
  The **approximate-by-bounding** function projects modulation resolution
  along a constrained depth pathway, limited by the recursion bounds defined
  by the evaluating agent `Q`.

  It attempts to reach constraint closure (`Ω(x) = x`) within a recursion 
  limit. If successful, it returns a resolved modulation node. Otherwise, it 
  returns a partial structure tagged as projected and unresolved.

induced by:
  - "[bounded modulation traversal function](bounded modulation traversal function)"
  - "[exclusion-aware recursion limiter](exclusion-aware recursion limiter)"
induces:
  - "[approximate resolution state](approximate resolution state)"
  - "[modulation horizon tag](modulation horizon tag)"
title: approximation by bounding
---

Let:
- `Q` := agent with modulation trace `T(Q)`
- `x` := unresolved modulation node
- `R_bound(Q)` := maximum recursion depth for Q
- `μₚ` := projective modulation step function

Define:

approximate-by-bounding(Q, x) :=  
  let x₀ := x  
  for k ∈ [0, R_bound(Q)]:  
    xₖ₊₁ := μₚ(xₖ)  
    append T(Q) ← xₖ₊₁  
    if Ω(xₖ₊₁) = xₖ₊₁:  
      return xₖ₊₁  
  return xₖ₊₁ with tag: "bounded-partial"

Constraints:
- ε-guarded exclusion points terminate traversal
- Re-entry into prior trace nodes must be explicitly permitted
- Function does not guarantee path uniqueness or completeness

Notes:
- `approximate-by-bounding` supports recursion-safe reasoning under modulation depth constraints
- May be composed with `evaluate` or `approximate-by-structure` for hybrid behavior
