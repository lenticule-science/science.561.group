---
name: "Approximate"
identity: approximate
description: "To approximate is to project an unresolved structure to a bounded state whose remainder is tagged unresolved. An approximation is precise exactly when the bound, measure or threshold that stops it is stated."
date-created: 2026-10-15
aliases:
  - "approximation"
  - "approximate-by-bounding"
  - "approximate-by-probability"
  - "approximate-by-structure"
see-also:
  - thin
  - thin-approximate-prototype-simulacra
target: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "emsenn, 2026-10-15: \"i know thin and approximate as precise terms\""
    - "relationality-services-section notes approximate-by-bounding, approximate-by-probability, approximate-by-structure"
---
An **approximation** is a function `a : U → P` from an unresolved modulation structure `U` to a projected state `P`, together with a status in `{resolved, projected-unresolved}`. It returns a resolved node when its stopping condition is met by constraint closure, and otherwise returns a partial structure tagged projected and unresolved. The stopping condition is the approximation's parameter.

## Three named approximations
| Function | Stopping condition | Selection of steps |
|---|---|---|
| `approximate-by-bounding` | the recursion bound of the evaluating agent `Q`; resolved when constraint closure `Ω(x) = x` is reached within it | constraint-limited recursion along a bounded depth pathway |
| `approximate-by-probability` | exclusion constraints on the trace-weighted estimator | candidate paths chosen by estimated recurrence likelihood from the agent's weighted trace `T(Q)` |
| `approximate-by-structure` | the accumulated semantic difference `Δ[s]` between trace steps exceeds an identity-curvature threshold `ℐ_Γ` | structure-aware projection that stops where recursion diverges from identity-preserving paths |

## Precision
A statement that approximates a constraint without naming its bound, measure or threshold is an approximation of undeclared parameter. The remedy is derivation: replace the approximation by the construction it approximates, or declare the parameter.
