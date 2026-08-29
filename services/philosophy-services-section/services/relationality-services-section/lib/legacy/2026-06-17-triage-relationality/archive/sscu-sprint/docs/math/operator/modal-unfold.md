---
title: Modal Unfold
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



Expands a recognition into its pre-modal decomposition across layers.

## Definition
- Inputs: a modal structure with folded/combined modalities.
- Output: modal structure with separated layers showing pre-modal components.
- Behaviour: decompose mixed modality into base necessity/possibility (or other)
  layers; redistribute recognitions accordingly.

## Invariants
- Soundness: unfolding preserves semantics; only exposes structure.
- Reversibility: folding then unfolding recovers the original (up to equivalence).

## Proof
- Uses: modal structure to split combined modalities.
- Produces: unfolded modal structure.
- Shows that: modal layers can be separated for analysis while maintaining
  earned modal laws.
