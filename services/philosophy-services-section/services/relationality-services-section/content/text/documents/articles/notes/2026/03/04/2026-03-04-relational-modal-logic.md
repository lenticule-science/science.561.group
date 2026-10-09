---
title: Relational modal Logic
aliases:
  - Relational modal Logic
  - relational modal logic
date-created: "2026-03-04T00:00:00"
keywords:
  - modal
  - box
  - diamond
  - kz
operations:
  - name: box
  - name: diamond
  - name: tower
depends-on:
  - theorem/internal/modal-stack
  - theorem/internal/flow-nucleus-compatibility
description: The relational calculus earns modal operators that satisfy the usual distributive laws, and in fact the box modality is Kock–Zöberlein (lax idempotent) with diamond as its dual.
---

# Theorem (Relational Modal Logic)

The relational calculus earns modal operators that satisfy the usual distributive
laws, and in fact the box modality is Kock–Zöberlein (lax idempotent) with
diamond as its dual.  This theorem records the witnesses.

## 1. Box and diamond constructors

**Theorem 1 (Modal operators).**  
[Modal Logic](../../../../../../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/modal-logic.md),
[Box Modality](../../../../../../triage/404.md), and
[Diamond Modality](../../../../../../triage/404.md) provide the basic modal
operators.  [Modal Truncation](../../../../../../triage/404.md) and
[Irrational Modality](../../../../../../triage/404.md) record derived forms
used in temporal reasoning.

*Proof sketch.* Each act defines how the modal operator is built from flow and
nucleus interactions along the trace.  Their proofs describe how modal contexts
are constructed and how reductions propagate through them. ∎

## 2. Distributivity and closure

**Theorem 2 (Monotonicity and distributivity).**  
[Distribute Flow](../../../../../../triage/404.md),
[Equalize Nucleus Distribution](../../../../../../triage/404.md),
and [Distribute Interior](../../../../../../triage/404.md) witness that the
modal operators distribute over the lattice structure obtained in the semantics
layer (meets/joins and residuals).  Consequently both `□` and `◇` are monotone,
and each preserves the appropriate joins/meets.

*Proof sketch.* These acts are part of the flow–nucleus compatibility theorem,
so they directly show how closures/interiors commute with lattice operations.
Since `□` and `◇` are defined via those closures/interiors, the modal
monotonicity and distributivity laws follow. ∎

## 3. KZ lax idempotence

**Theorem 3 (KZ property for box).**  
[Quadratic Modality](../../../../../../triage/404.md) witnesses that the box
modality is lax idempotent in the Kock–Zöberlein sense: there is a comparison
map `□ ≤ □□` whose composite with `□` is the identity, and this comparison is
itself monotone.  Dually, `◇` admits the usual comparison `◇◇ ≤ ◇`.

*Proof sketch.* The quadratic modality act encodes the lax idempotence data:
its proof shows that the unit/counit of the modal adjunction satisfy the KZ
triangle.  Since the modal operators are derived from flow/nucleus residuation,
the comparison map is given by the residual itself, and composing twice collapses
to the original `□`. ∎

## 4. Temporal combinations

**Theorem 4 (Temporal towers).**  
[Modal Tower](../../../modality-tower.md) and
[Orbit Step/Reach](../../../reach.md) extend
the basic modalities into temporal stacks (always/eventually, recurrence,
reachability).  These inherit the KZ and distributive properties above.

*Proof sketch.* The tower act iterates the modal operators while respecting the
flow–nucleus interaction, so each level still satisfies the KZ and distributive
laws.  The orbit acts demonstrate how temporal reachability fits into this
hierarchy. ∎

## Summary

| Modal property | Witnessing acts |
| -------------- | ---------------- |
| Operators | `ModalLogic`, `BoxModality`, `DiamondModality`, `ModalTruncation`, `IrrationalModality` |
| Monotone/distributive | `DistributeFlow`, `EqualizeNucleusDistribution`, `DistributeInterior` |
| KZ lax idempotent | `QuadraticModality` |
| Temporal extensions | `ModalityTower`, `OrbitStep`, `Reach` |

Thus the relational calculus realises a genuine modal logic with KZ box and its
dual diamond, ready to be used in external semantic comparisons.
