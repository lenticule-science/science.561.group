---
name: scale-embedding
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Morphisms between scale windows indicating how fine windows embed into coarser
ones (and vice versa when reversible).

## Definition
- Data: inclusion/rescaling maps between [Scale Windows](scale-window.md) that
  respect coverage and hypertensor structure.
- Properties: embeddings preserve admissible sections/restrictions and align
  overlaps across scales.

## Invariants
- Compatibility: embeddings commute with window coverage/refinement.
- Stability: composing embeddings yields another embedding.

## Proof
- Uses: [Scale Window](scale-window.md) hierarchy to define admissible
  embeddings.
- Shows that: scale transitions can be treated as morphisms for coarse-graining
  and RG steps.
