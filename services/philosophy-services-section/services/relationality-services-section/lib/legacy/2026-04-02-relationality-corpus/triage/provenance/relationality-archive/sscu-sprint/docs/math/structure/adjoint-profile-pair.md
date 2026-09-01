---
name: adjoint-profile-pair
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Two profiles whose recognitions stand in an adjunction via flow/nucleus.

## Definition
- Components: a pair of [Interprofile Functors](interprofile-functor.md) `L ⊣ R`
  with unit/counit compatible with [Flow–Nucleus Adjunction](flow-nucleus-adjunction.md).
- Behaviour: transport recognitions between profiles with adjoint structure.

## Invariants
- Triangle identities for the adjunction.
- Preservation of flow/nucleus when moving along `L`/`R`.
- Logical/classifier coherence between the profiles.

## Proof
- Uses: interprofile functor data and flow/nucleus adjunction.
- Shows that: profile pairs can be related via adjoint functors in the
  relational setting.
