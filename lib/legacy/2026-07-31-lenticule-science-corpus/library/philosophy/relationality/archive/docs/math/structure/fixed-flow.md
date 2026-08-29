---
title: Fixed Flow
id: fixed-flow
role: structure
status: plan
derived_from:
- acts/fix-flow
proof_refs: []
---


# Fixed Flow

Structure capturing fixed points of the flow modality, earned by the act
`FixFlow`.

## Components

- Carrier `FixFlow` of fixed points.
- Inclusion `ι_flow : FixFlow ↪ Carrier`.
- Stability: `flow ∘ ι_flow = ι_flow`.

## Proof

Sketch: `FixFlow` selects points stabilised by the flow act; show inclusion and
stability using the earned flow modality.
