---
title: Entropy Lens
id: entropy-lens
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Entropy Lens

Transforms a recognition by weighting it through entropy—an entropy-filter map.

## Definition
- Inputs: recognition and [Entropy Functional](./entropy-functional.md).
- Output: entropy-weighted recognition (e.g., emphasising low/high entropy
  components).
- Behaviour: apply entropy-derived weights/modifiers to the recognition’s
  components.

## Invariants
- Normalisation: transformed recognition remains in carrier.
- Monotone: entropy weighting respects ordering if defined.

## Proof
- Uses: entropy functional to guide transformation.
- Produces: filtered recognition.
- Shows that: entropy can filter/modulate recognitions.
