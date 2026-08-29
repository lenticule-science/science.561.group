---
name: section-internal-hom
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Internal hom/exponential on hypertensor sections.

## Definition
- Carrier: for sections `A,B` in [Hypertensor Section](hypertensor-section.md),
  the internal hom `B^A` of morphisms respecting sheaf structure and coverage.
- Evaluation/coevaluation maps satisfying exponential adjunction.

## Invariants
- Exponential adjunction: `Hom(C×A,B) ≅ Hom(C,B^A)`.
- Compatibility: internal hom respects restriction/gluing of the sheaf.

## Proof
- Uses: sheaf cartesian closed structure on sections to define exponentials.
- Shows that: section category admits internal homs for higher-order operations.
