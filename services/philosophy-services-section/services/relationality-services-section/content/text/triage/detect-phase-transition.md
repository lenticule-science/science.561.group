---
title: Detect Phase Transition
id: detect-phase-transition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
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
