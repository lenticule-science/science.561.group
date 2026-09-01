---
name: detect-flow-attractor
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Detects flow attractors by analysing basins of attraction.

## Definition
- Inputs: flow rules and candidate recognitions/basins.
- Output: [Flow Attractor](../structure/flow-attractor.md) witness if convergence holds.
- Behaviour: compute attracting basin via [Compute Attracting Basin](compute-attracting-basin.md); verify stability of candidate; mark as attractor.

## Invariants
- Soundness: only true attractors are marked.
- Stability: attractor classification persists under small flow perturbations.

## Proof
- Uses: basin computation and fixed-point checks.
- Produces: attractor witness.
- Shows that: convergence targets can be identified via basin analysis.
