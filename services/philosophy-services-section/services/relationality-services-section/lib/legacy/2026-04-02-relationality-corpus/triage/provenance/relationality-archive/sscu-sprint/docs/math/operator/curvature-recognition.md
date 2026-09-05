---
name: curvature-recognition
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



Detects nontrivial holonomy as relational curvature.

## Definition
- Inputs: holonomy data from [Holonomy Operator](holonomy-operator.md).
- Output: recognition indicating presence/absence/degree of curvature.
- Behaviour: interpret nontrivial holonomy as curvature witness in the
  recognition lattice.

## Invariants
- Flatness: zero holonomy yields neutral/flat recognition.
- Monotonicity: greater holonomy yields stronger curvature recognition.

## Proof
- Uses: [Holonomy Operator](holonomy-operator.md).
- Produces: [Recognition Carrier](../structure/recognition.md) element
  indicating curvature.
- Shows that: curvature can be recognised via accumulated holonomy in the
  relational sheaf setting.
