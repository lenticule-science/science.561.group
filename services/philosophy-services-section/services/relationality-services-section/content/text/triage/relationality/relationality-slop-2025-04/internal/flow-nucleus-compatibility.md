---
title: Flow–Nucleus compatibility
aliases:
  - Flow–Nucleus compatibility
  - flow–nucleus compatibility
date-created: "2026-03-04T00:00:00"
keywords:
  - flow
  - nucleus
  - geometry
  - residuation
depends_on:
  - commute-flow-and-nucleus
  - commute-shuffle-flow-and-nucleus
  - flow-index-implication
  - legislate-dynamic-residuation
  - residue-dynamically
  - absorb-closure
  - distribute-interior
  - equalize-nucleus-distribution
  - distribute-flow
  - fix-flow
  - fix-nucleus
  - fix-flow-nucleus
  - transport-flow-fix
  - transport-nucleus-fix
  - form-geometry
  - flow-composite-profile
  - geometry-composite-profile
  - comonad-curvature
---

# Theorem (Flow–Nucleus Compatibility)

The base flow and nucleus acts generate the geometry used everywhere else.
This theorem summarises their internal laws: commutation, residuation,
distribution, and transport of fixed points.

## 1. Commutation and residual structure

**Theorem 1 (Flow commutes with the nucleus).**
[Commute Flow and Nucleus](404.md) and its
shuffle specialisation
[Commute Shuffle Flow and Nucleus](404.md)
state that applying the nucleus before or after flow yields the same stabilised
recognition.  [Flow Index Implication](404.md)
and [Legislate Dynamic Residuation](404.md)
record the adjunction between flow and nucleus in the index direction, while
[Residue Dynamically](404.md) packages the law.

*Proof sketch.* The cited acts prove that the flow–nucleus pair is an adjoint
whose unit/counit commute with shuffles and residual maps.  Consequently every
composition of flow and nucleus collapses to a unique stabilised form. ∎

## 2. Distribution laws

**Theorem 2 (Distributive closure).**
[Absorb Closure](404.md),
[Distribute Interior](404.md),
[Equalize Nucleus Distribution](404.md),
and [Distribute Flow](404.md) witness that nuclei and
flows distribute over finite meets/joins and shuffles.

*Proof sketch.* Each act shows how lattice operations commute with the flow or
nucleus given the commutation relations above.  Together they ensure that
closures/interiors derived from the nucleus interact correctly with flow-driven
composition. ∎

## 3. Fixed structures and transport

**Theorem 3 (Fixed flow–nucleus data).**
[Fix Flow](404.md),
[Fix Nucleus](404.md), and
[Fix Flow Nucleus](404.md) show that the persistent
iteration of either operator stabilises, and the composite matches the joint
fixed points.  [Transport Flow Fix](404.md) and
[Transport Nucleus Fix](404.md) then carry
fixed points along admissible morphisms.

*Proof sketch.* Applying `EnsureFixedPoint` to each operator yields the fixed
versions.  Commutation from Theorem 1 ensures these fixed sets coincide when
both flow and nucleus are involved.  The transport acts reuse the residuation to
move fixed points coherently across the geometry. ∎

## 4. Curvature and higher structure

**Theorem 4 (Curvature and higher composites).**
[Form Geometry](404.md),
[Flow Composite Profile](404.md), and
[Geometry Composite Profile](404.md) extend
the flow–nucleus pair to composite profiles, while
[Comonad Curvature](404.md) records the obstruction
to strict idempotence.  These rely entirely on the compatibility laws above.

*Proof sketch.* Once flow and nucleus commute and distribute, they generate a
comonad/monad pair whose curvature is measured by `ComonadCurvature`.  The
composite-profile acts show that this structure lifts to towered profiles
without introducing additional axioms. ∎

## Summary

| Property | Witnessing acts |
| -------- | ---------------- |
| Commutation / residuation | `CommuteFlowAndNucleus`, `CommuteShuffleFlowAndNucleus`, `FlowIndexImplication`, `LegislateDynamicResiduation`, `ResidueDynamically` |
| Distribution laws | `AbsorbClosure`, `DistributeInterior`, `EqualizeNucleusDistribution`, `DistributeFlow` |
| Fixed points & transport | `FixFlow`, `FixNucleus`, `FixFlowNucleus`, `TransportFlowFix`, `TransportNucleusFix` |
| Higher geometry | `FormGeometry`, `FlowCompositeProfile`, `GeometryCompositeProfile`, `ComonadCurvature` |

These witnesses establish the backbone of the relational geometry used in every
other theorem.
