---
title: Modal Fold
id: modal-fold
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Collapses two modal layers (e.g., □ and ◇) into a mixed operator when admissible.

## Definition
- Inputs: modal operators from [Modal Structure](../structure/modal-structure.md).
- Output: folded modal structure where selected layers are identified.
- Behaviour: define a mixed modality combining necessity/possibility; collapse
  recognitions accordingly.

## Invariants
- Soundness: folding respects modal laws and does not violate earned adjunctions.
- Idempotent: folding twice yields the same structure.

## Proof
- Uses: modal structure to define folding map.
- Produces: folded modal structure.
- Shows that: modal layers can be identified when admissible without breaking
  modal coherence.
