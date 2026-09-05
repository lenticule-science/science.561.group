---

title: Flow–Nucleus Compatibility
tags:
  - flow
  - nucleus
  - geometry
  - residuation
depends-on:
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
form: research
# Theorem (Flow–Nucleus Compatibility)

The base flow and nucleus acts generate the geometry used everywhere else.
This theorem summarises their internal laws: commutation, residuation,
distribution, and transport of fixed points.

## 1. Commutation and residual structure

**Theorem 1 (Flow commutes with the nucleus).**  
[Commute Flow and Nucleus](../../../acts/commute-flow-and-nucleus.md) and its
shuffle specialisation
[Commute Shuffle Flow and Nucleus](../../../acts/commute-shuffle-flow-and-nucleus.md)
state that applying the nucleus before or after flow yields the same stabilised
recognition.  [Flow Index Implication](../../../acts/flow-index-implication.md)
and [Legislate Dynamic Residuation](../../../acts/legislate-dynamic-residuation.md)
record the adjunction between flow and nucleus in the index direction, while
[Residue Dynamically](../../../acts/residue-dynamically.md) packages the law.

*Proof sketch.* The cited acts prove that the flow–nucleus pair is an adjoint
whose unit/counit commute with shuffles and residual maps.  Consequently every
composition of flow and nucleus collapses to a unique stabilised form. ∎

## 2. Distribution laws

**Theorem 2 (Distributive closure).**  
[Absorb Closure](../../../acts/absorb-closure.md),
[Distribute Interior](../../../acts/distribute-interior.md),
[Equalize Nucleus Distribution](../../../acts/equalize-nucleus-distribution.md),
and [Distribute Flow](../../../acts/distribute-flow.md) witness that nuclei and
flows distribute over finite meets/joins and shuffles.

*Proof sketch.* Each act shows how lattice operations commute with the flow or
nucleus given the commutation relations above.  Together they ensure that
closures/interiors derived from the nucleus interact correctly with flow-driven
composition. ∎

## 3. Fixed structures and transport

**Theorem 3 (Fixed flow–nucleus data).**  
[Fix Flow](../../../acts/fix-flow.md),
[Fix Nucleus](../../../acts/fix-nucleus.md), and
[Fix Flow Nucleus](../../../acts/fix-flow-nucleus.md) show that the persistent
iteration of either operator stabilises, and the composite matches the joint
fixed points.  [Transport Flow Fix](../../../acts/transport-flow-fix.md) and
[Transport Nucleus Fix](../../../acts/transport-nucleus-fix.md) then carry
fixed points along admissible morphisms.

*Proof sketch.* Applying `EnsureFixedPoint` to each operator yields the fixed
versions.  Commutation from Theorem 1 ensures these fixed sets coincide when
both flow and nucleus are involved.  The transport acts reuse the residuation to
move fixed points coherently across the geometry. ∎

## 4. Curvature and higher structure

**Theorem 4 (Curvature and higher composites).**  
[Form Geometry](../../../acts/form-geometry.md),
[Flow Composite Profile](../../../acts/flow-composite-profile.md), and
[Geometry Composite Profile](../../../acts/geometry-composite-profile.md) extend
the flow–nucleus pair to composite profiles, while
[Comonad Curvature](../../../acts/comonad-curvature.md) records the obstruction
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
