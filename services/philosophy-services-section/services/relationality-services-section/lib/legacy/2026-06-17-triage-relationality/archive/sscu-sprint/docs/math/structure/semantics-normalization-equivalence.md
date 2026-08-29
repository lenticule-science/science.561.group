---
title: Semantics as Normalization Equivalence
role: structure
derived_from:
- math/operator/strong-normalization
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Semantic equivalence on recognitions: two recognitions are semantically equal
when all admissible derivations lead them to the same nucleus.

## Definition
- Admissible derivations fixed by the syntax layer.
- Equivalence: `x ≡ y` iff every admissible derivation from `x` and `y` converges
  (strongly normalises) to nuclei that are equal via flow–nucleus compatibility.

## Invariants
- An equivalence relation on recognitions covered by normalization/confluence.
- Changing syntax (admissible derivations) changes the induced semantics; the
  nuclei geometry remains earned.

## Proof
Derived from strong normalization, confluence, and flow–nucleus compatibility
acts: together they ensure unique normal forms (up to nuclei) for admissible
derivations, yielding the semantic equivalence.
