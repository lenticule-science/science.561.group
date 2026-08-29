---
title: Temporal Commutator
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Witnesses noncommutation of two time evolutions (e.g., flow with different
contexts).

## Definition
- Components: pair of flows/evolutions applied in different orders around a
  [Time Slice](time-slice.md); recognition of their commutator.
- Interpretation: difference between `flow_A ∘ flow_B` and `flow_B ∘ flow_A`.

## Invariants
- Zero commutator when flows commute; nonzero indicates temporal asymmetry.
- Stability: commutator recognitions preserved under nucleus.

## Proof
- Uses: [Flow Context](../operator/flow-context.md) compositions and time slice
  reference.
- Shows that: temporal ordering effects can be captured as recognitions.
