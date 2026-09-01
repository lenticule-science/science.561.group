---
name: fixed-nucleus
role: structure
derived_from:
- acts/fix-nucleus
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
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
