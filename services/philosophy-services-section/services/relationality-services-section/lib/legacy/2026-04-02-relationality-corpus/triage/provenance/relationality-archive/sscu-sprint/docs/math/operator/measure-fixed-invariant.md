---
name: measure-fixed-invariant
role: operator
derived_from:
- acts/fixed-measure
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



The **Measure Fixed Invariant** operator collapses a fixed invariant state along
the earned nucleus for the fixed profile.

## Definition
- Input: a [Fixed Invariant State](docs/math/structure/fixed-invariant-state.md).
- Output: a [Fixed Invariant State](docs/math/structure/fixed-invariant-state.md)
  representing the nucleus-equivalence class of the input.
- Behaviour: applies the nucleus induced by
  [`acts/fixed-measure`](docs/math/acts/fixed-measure.md) to restrict the state
  to its fixed-profile measurement.

## Invariants
- Measurement retains only trace-shuffle- and fixed-shape-compatible content.
- Outputs remain in the fixed invariant carrier.

## Proof
By construction from `acts/fixed-measure`, this operator computes the nucleus of
fixed invariant states. It collapses variations that the fixed profile
identifies while keeping results within the same carrier.
