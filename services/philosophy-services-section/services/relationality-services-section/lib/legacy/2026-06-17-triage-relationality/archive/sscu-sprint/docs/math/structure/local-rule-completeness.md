---
title: Local Rule Completeness
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Witness that finite local rules plus an aperiodic germ generate global sections
(recognizable subshifts).

## Definition
- Components: [Tiling Constraint](tiling-constraint.md) and
  [Aperiodic Germ](aperiodic-germ.md) guaranteeing unique extension to a global
  section.
- Statement: any section satisfying the local rules is reconstructible from the
  germ; local rules are complete.

## Invariants
- Completeness: no admissible global section violates a local rule.
- Recognizability: germ determines global configuration uniquely up to
  admissible symmetries.

## Proof
- Uses: [Tiling Constraint](tiling-constraint.md) plus germ extraction/extension
  ([Extract Aperiodic Germ](../operator/extract-aperiodic-germ.md),
  [Aperiodic Extension](../operator/aperiodic-extension.md)) to prove
  recognizability/subshift property.
- Shows that: finite local rules suffice to determine the quasicrystalline
  section.
