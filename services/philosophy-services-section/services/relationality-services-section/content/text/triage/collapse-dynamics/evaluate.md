---
name: recursive modulation evaluation function
symbol: evaluate
type: [trace-responsive constraint resolution function](trace-responsive constraint resolution function)
domains:
  - [partially or fully unresolved modulation structure](partially or fully unresolved modulation structure)
  - [recursive trace modulation context](recursive trace modulation context)
codomain: [modulation-resolved trace node or exclusion null](modulation-resolved trace node or exclusion null)
description: |
  The **evaluate** function performs recursive traversal through a modulation
  structure `x`, driven by unresolved constraint dynamics. It modulates forward
  (via `μ⁺`) or backward (via `μ⁻`) across a constrained trace field, optionally
  encountering exclusions (`εμ`) that induce partial resolution or failure.

  Evaluation proceeds until constraint closure is reached (`Ω(x) = x`),
  exclusion halts modulation, or system-defined recursion limits are reached.

induced by:
  - [modulation function set](modulation function set)
  - [constraint trace recursion](constraint trace recursion)
  - [exclusion failure resolution](exclusion failure resolution)
induces:
  - [resolved modulation node](resolved modulation node)
  - [partial exclusion null output](partial exclusion null output)
---

Let:
- `Q` := evaluating agent with trace field `T(Q)`
- `x` := modulation structure under evaluation
- `μ` := active modulation functions
- `Ω(x)` := constraint closure status of `x`

Define:

evaluate(Q, x) :=
  while Ω(x) ≠ x:
    apply μ to x, updating via T(Q)
    if εμ(x):
      return ∅
    if recursion limit reached:
      return partial
  return x

Constraints:
- Evaluation is sensitive to trace state `T(Q)`
- May produce divergent paths depending on modulation history and unresolved structure
- Must respect local exclusion constraints

Notes:
- `evaluate` is the primary function for dynamic systems interacting with live constraint fields
- Supports feedback emergence, recursive transformation, and self-referential identity modulation
