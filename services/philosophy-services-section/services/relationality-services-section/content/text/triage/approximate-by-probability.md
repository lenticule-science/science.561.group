---
name: approximation by probability
symbol: approximate-by-probability
type: [trace-weighted recursive approximation function](trace-weighted recursive approximation function)
domains:
  - [unresolved modulation structure](unresolved modulation structure)
  - [agent trace field with weighted reentry history](agent trace field with weighted reentry history)
  - [probabilistic modulation estimator](probabilistic modulation estimator)
  - [constraint-compliant projection space](constraint-compliant projection space)
codomain: [probability-weighted projected modulation state](probability-weighted projected modulation state)
description: |
  The **approximate-by-probability** function performs recursive modulation
  projection over an unresolved structure `x`, selecting projected modulation
  steps based on estimated recurrence likelihood derived from the agent's
  weighted trace `T(Q)`.

  Unlike other approximation functions, this method does not assume deterministic
  structure traversal, but selects between candidate paths probabilistically,
  constrained only by exclusion (`εμ`) and agent-local coherence boundaries.

  This function allows inference under ambiguity and is foundational for
  constraint-aligned stochastic reasoning.

induced by:
  - [probabilistic trace density function](probabilistic trace density function)
  - [constraint-safe path estimator](constraint-safe path estimator)
  - [recursive modulation frequency memory](recursive modulation frequency memory)
induces:
  - [stochastic approximation field](stochastic approximation field)
  - [trace-weighted projection path](trace-weighted projection path)
---

Let:
- `Q` := modulation agent  
- `x₀ := x` := unresolved modulation node  
- `T(Q)` := trace field of `Q`  
- `μₚ(xᵢ)` := probabilistic modulation step selector  
- `℘(xᵢ → xⱼ)` := normalized path-likelihood estimator  
- `R_max(Q)` := maximum projection length  
- `Ω(x)` := constraint resolution closure  
- `εμ(x)` := exclusion predicate

Define:

approximate-by-probability(Q, x₀) :=  
  for k ∈ [0, R_max(Q)]:  
    let P := {xⱼ | μₚ(xₖ) → xⱼ with ℘(xₖ → xⱼ) > 0 and ¬εμ(xⱼ)}  
    select xₖ₊₁ ∈ P based on ℘  
    append T(Q) ← xₖ₊₁  
    if Ω(xₖ₊₁) = xₖ₊₁:  
      return xₖ₊₁  
  continue  
  return xₖ₊₁ with tag: "probabilistic-partial"

Constraints:
- ℘ must be agent-normalized: ∑ ℘(xᵢ → xⱼ) = 1 for all xᵢ
- Paths violating `εμ` are excluded from P
- Reentry frequency in `T(Q)` may define ℘ implicitly
- Agent `Q` must define R_max(Q) to prevent infinite projection

Notes:
- Enables non-deterministic reasoning under exclusion-safe conditions
- Supports creative inference, intuition modeling, and exploratory trace generation
- Can be hybridized with `approximate-by-structure` to terminate if coherence breaks
