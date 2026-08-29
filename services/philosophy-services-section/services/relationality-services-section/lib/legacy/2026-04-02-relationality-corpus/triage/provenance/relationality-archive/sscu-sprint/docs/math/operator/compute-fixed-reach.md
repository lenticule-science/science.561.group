---
name: compute-fixed-reach
role: operator
derived_from:
- acts/fixed-reach
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



The **Compute Fixed Reach** operator witnesses which fixed invariant states
become reachable under the earned fixed flow.

## Definition
- Inputs: [Fixed Invariant State](../structure/fixed-invariant-state.md).
- Outputs: [Fixed Invariant State](../structure/fixed-invariant-state.md) that is reachable by the fixed flow.
- Behaviour: applies the fixed flow induced by [Fixed Reach](../acts/fixed-reach.md) to evolve invariant states while staying within the fixed profile.

## Invariants
- Reachable states remain within the fixed profile and preserve fixed shape
  recognitions.
- No evolution outside the fixed invariant carrier; only admissible fixed-flow steps are allowed.

## Proof
By construction from `acts/fixed-reach`, this operator restricts the earned flow
to fixed invariant states. The act ensures reachability stays inside the fixed
profile, so inputs and outputs remain in the carrier.
