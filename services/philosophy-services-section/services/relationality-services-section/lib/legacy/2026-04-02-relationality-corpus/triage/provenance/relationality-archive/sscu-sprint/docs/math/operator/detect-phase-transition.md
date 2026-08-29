---
name: detect-phase-transition
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



Detects critical points where recognition families change topology/structure
under parameterised flow.

## Definition
- Inputs: parameterised recognitions/flows.
- Output: [Relational Phase Transition](../structure/relational-phase-transition.md)
  witnesses at critical parameters.
- Behaviour: monitor invariants across parameters; flag abrupt changes.

## Invariants
- Soundness: marks only genuine critical changes.
- Stability: phases away from critical points remain consistent.

## Proof
- Uses: flow/invariant analysis across parameter space.
- Produces: phase transition markers.
- Shows that: critical phenomena are detectable in the relational setting.
