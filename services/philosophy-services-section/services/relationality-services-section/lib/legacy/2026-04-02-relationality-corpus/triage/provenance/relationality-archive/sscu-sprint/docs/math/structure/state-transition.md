---
name: state-transition
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Math-level description of a state update over sections for persistence/consistency.

## Definition
- Components: source [Hypertensor Section](hypertensor-section.md), target section,
  and flow rule from [Flow Context](../operator/flow-context.md) mapping source
  to target.
- Purpose: model snapshots/state updates abstractly.

## Invariants
- Consistency: transition follows admissible flow; preserves sheaf invariants.
- Idempotence for no-op transitions; compositional over sequences.

## Proof
- Uses: flow context to define valid transitions.
- Shows that: state updates can be specified as math carriers for downstream machine snapshots.
