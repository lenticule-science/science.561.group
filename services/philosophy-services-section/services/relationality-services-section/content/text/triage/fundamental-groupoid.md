---
title: Fundamental Groupoid
id: fundamental-groupoid
role: structure
status: plan
derived_from: math/structure/loop-space
proof_refs: []
---



Groupoid-like carrier of contexts/recognitions and homotopy classes of directed
paths between them, earned from the higher-inductive path data supplied by
[LoopHIT](../acts/loop-hit.md).

## Definition
- Objects: contexts/recognitions carved out of
  [Relationlessness](../acts/relationlessness.md) and its first recognitions.
- Morphisms: homotopy classes of [Directed Paths](directed-path.md) between
  objects, with composition from [Path Compose](../operator/path-compose.md)
  when endpoints match.
- Identities: constant paths from [Identify Path](../operator/path-identity.md).
- Associator/unitor: homotopies witnessing associativity/unit laws.

## Invariants
- Composition well-defined on homotopy classes; endpoint matching is required
  and preserved.
- Associativity/unit laws witnessed by earned homotopies from the loop HIT.
- Reversibility: invertible paths exist precisely when directed paths admit
  opposites; otherwise the carrier remains a fundamental category enriched by
  higher cells.
- Coverage compatibility: path composition respects coverings on the
  [Coverage Site](coverage-site.md), ensuring groupoid transport can be glued
  across overlaps.

## Proof
- Derived from: [Loop Space](loop-space.md) giving composition/unit data on
  loops and paths.
- Uses: [Directed Path](directed-path.md), [Path Compose](../operator/path-compose.md),
  [Identify Path](../operator/path-identity.md) to assemble the groupoid data.
- Shows that: directed paths and their homotopies assemble into a fundamental
  groupoid over contexts, giving the base homotopical carrier for path
  composition, transports, and coverings.
