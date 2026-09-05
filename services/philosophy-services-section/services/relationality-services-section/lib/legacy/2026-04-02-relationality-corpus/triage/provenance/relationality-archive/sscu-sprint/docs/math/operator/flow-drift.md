---
name: flow-drift
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



Detects gradual change under flow, measured as nucleus-stable shift per step.

## Definition
- Inputs: recognition and [Flow Context](flow-context.md); metric via
  [Relational Metric](../structure/relational-metric.md).
- Output: recognition of drift magnitude/direction (e.g., per-step displacement).
- Behaviour: measure displacement after flow step(s), collapse via nucleus,
  express as recognition.

## Invariants
- Monotone with accumulated steps.
- Zero drift for fixed points; bounded for active flows.

## Proof
- Uses: flow and metric to quantify drift.
- Produces: drift recognition.
- Shows that: slow changes under flow are measurable and recognisable.
