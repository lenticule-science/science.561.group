---
name: fixed-flow-nucleus
role: structure
derived_from:
- acts/fix-flow-nucleus
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---

Structure capturing fixed points of the composite flow–nucleus modality,
earned by the act `FixFlowNucleus`.

## Components

- Carrier `FixFlowNucleus` of points fixed by both flow and nucleus.
- Inclusion `ι_fn : FixFlowNucleus ↪ Carrier`.
- Stability: fixed under both flow and nucleus compositions.

## Proof

Sketch: `FixFlowNucleus` selects points stabilised by the composite modality;
show inclusion and simultaneous stability under both actions.
