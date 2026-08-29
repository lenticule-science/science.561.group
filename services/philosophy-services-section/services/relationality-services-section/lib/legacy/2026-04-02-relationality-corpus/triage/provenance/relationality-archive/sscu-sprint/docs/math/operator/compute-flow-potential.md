---
name: compute-flow-potential
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



Computes flow potential for recognitions to guide scheduling/optimisation.

## Definition
- Inputs: recognition, flow rules, and [Entropy Functional](../structure/entropy-functional.md).
- Output: [Flow Potential](../structure/flow-potential.md) value.
- Behaviour: estimate entropy production/resistance along likely flow paths;
  assign potential.

## Invariants
- Consistency: higher potentials correspond to higher expected entropy/effort.
- Stability: potential recomputed coherently as flow rules change.

## Proof
- Uses: flow and entropy to estimate potential.
- Produces: potential assignment.
- Shows that: potential is well-defined and useful for planning.
