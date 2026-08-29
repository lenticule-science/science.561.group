---
name: sheaf-morphism
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Morphisms between hypertensor sheaves over the hypertensor site, preserving
restriction/gluing structure.

## Definition
- Components: natural transformation between functors underlying
  [Hypertensor Sheaf](hypertensor-sheaf.md) objects on the
  [Hypertensor Site](hypertensor-site.md).
- Preservation: commutes with restrictions and gluing/locality laws.

## Invariants
- Naturality: squares with restrictions commute.
- Gluing: morphism respects matching/glued sections.
- Exactness: pushforwards/pullbacks preserve finite limits where applicable.

## Proof
- Uses: sheaf structure and restriction algebra to define natural transformations.
- Shows that: morphisms preserve earned sheaf structure on the hypertensor site.
