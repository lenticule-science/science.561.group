---
name: fixed-flow
role: structure
derived_from:
- acts/fix-flow
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing fixed points of the flow modality, earned by the act
`FixFlow`.

## Components

- Carrier `FixFlow` of fixed points.
- Inclusion `ι_flow : FixFlow ↪ Carrier`.
- Stability: `flow ∘ ι_flow = ι_flow`.

## Proof

Sketch: `FixFlow` selects points stabilised by the flow act; show inclusion and
stability using the earned flow modality.
