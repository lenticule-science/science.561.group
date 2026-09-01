---
name: modal-drift
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Gradual shift of a recognition’s modal status under long-term flow.

## Definition
- Components: track changes in modal layer membership over flow iterations.
- Context: based on [Modal Structure](modal-structure.md) and [Flow Context](../operator/flow-context.md).

## Invariants
- Drift rate: measurable change per flow step.
- Stabilisation: drift may converge to a modal fixed point.

## Proof
- Uses: modal operators and flow dynamics.
- Shows that: modal status can drift and be quantified.
