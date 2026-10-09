---
title: Fixed Nucleus
id: fixed-nucleus
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/fix-nucleus
description: Structure capturing fixed points of the nucleus modality, earned by the act FixNucleus.
---



Structure capturing fixed points of the nucleus modality, earned by the act
`FixNucleus`.

## Components

- Carrier `FixNucleus` of fixed points.
- Inclusion `ι_nuc : FixNucleus ↪ Carrier`.
- Stability: `nucleus ∘ ι_nuc = ι_nuc`.

## Proof

Sketch: `FixNucleus` selects points stabilised by the nucleus act; show
inclusion and stability using the earned nucleus modality.
