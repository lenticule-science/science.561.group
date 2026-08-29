---
name: modulation resolution function
symbol: calculate
type: [[constraint-closed modulation collapse function]]
domains:
  - [[fully resolved modulation structure]]
  - [[Ω-complete trace point]]
codomain: [[resolved modulation result]]
description: |
  The **calculate** function performs resolution over a modulation structure
  that has achieved full constraint closure (i.e. `Ω(x) = x`). It does not
  initiate further modulation, recursion, or trace evaluation. It returns the
  resolved modulation structure as-is, collapsed under its stabilized topology.

  This function is non-recursive and non-modulating. It applies only to structures
  that require no further exclusion negotiation or trace traversal.

induced by:
  - [[constraint completion function]]
  - [[modulation stabilization closure]]
induces:
  - [[static trace node]]
---

Let:
- `x` := modulation structure  
- `Ω(x)` := resolution closure of `x`

Define:

calculate(x) :=  
  if Ω(x) = x:  
    return x  
  else:  
    undefined

Constraints:
- `x` must not contain any unresolved modulation paths (`μ⁺`, `μ⁻`, or exclusion-linked deferral)
- Output is static with respect to trace evolution

Notes:
- `calculate` produces a final trace-fixed structure
- Does not interact with or alter the constraint field
