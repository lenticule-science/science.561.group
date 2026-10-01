import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Horizon

open Verso.Genre Manual InlineLean

namespace Obsmetrologia

open CausalSets.Causal.Order
open CausalSets.Causal.Cone
open CausalSets.BlackHoles
open CausalSets.BlackHoles.Horizon

private abbrev FiniteHoleRegion := CausalSets.BlackHoles.Region

/-!
A teaching chapter for kinematic points, kinematic regions, and kinematic
patches as earned finite causal-diamond carriers.
-/

#doc (Manual) "Kinematic points, regions, and patches" =>

# Kinematic Points, Regions, And Patches

This page is the compact bridge between causal-set settling and the later
hole, shroud, patch, and bead-thread pages. Its claim-site is:

* claim-site: finite causal-diamond kinematics;
* phase: relational spacetime;
* generating sites: settled causal order, strict reachability, causal diamonds,
  endpoint sequencing, readout regions, no-readout regions, and hole-region
  patches;
* Lean carriers: `DiamondPoint`, `HoleDiamondKinematicSpace`,
  `sequencingHoleRegion`, `sequencingReadoutExterior`, `sequencingShroud`,
  and `kinematicHoleRegionPatch`;
* Blueprint nodes: `thm:hole-diamond-kinematic-space`,
  `thm:finite-readout-patch-censorship-consolidation`, and
  `thm:diamond-lift-closure-conjecture`;
* familiar comparison: the kinematic space of causal diamonds;
* danger: reading a kinematic point as an ambient spacetime point rather than
  as a strict causal interval generated inside a finite causal set.

The governing sentence is:

> A kinematic point is a proved causal diamond, and a kinematic region is a
> readout or no-readout predicate on the sequencing causal set of such diamonds.

## Causal Ground

The ground object is still the finite causal set:

{docstring Obsmetrologia.CausalSets.Causal.Order.CausalSet}

A causal set supplies events and a settled reachability relation. This page does
not add a background space. It asks what can be built once a causal set already
has listed events and strict reachability.

## Kinematic Points

A kinematic point is a causal diamond point:

{docstring Obsmetrologia.CausalSets.BlackHoles.DiamondPoint}

It is not a bare pair. Its lower and upper endpoints are listed events of the
same causal set, and the lower endpoint strictly reaches the upper endpoint.
The formula is:

```text
  p = (a,b),
  \qquad
  a,b \in C.events,
  \qquad
  C.reaches(a,b).
```

Checked over the canonical four-event diamond:

```lean
example :
    DiamondPoint actualObsmetrologiaDiamondCausalSet :=
  actualObsmetrologiaDiamondPoint01
```

The word "point" is therefore earned by interval data. It is not imported from
a continuum and then used to explain causal order.

## Sequencing, Not Nesting

The first tempting relation on diamond points is nesting:

{docstring Obsmetrologia.CausalSets.BlackHoles.nestingPrec0}

Nesting is not the kinematic causal order, because every diamond nests in
itself:

{docstring Obsmetrologia.CausalSets.BlackHoles.nesting_self_edge}

and that self-edge prevents the strict-order closure required by a causal set:

{docstring Obsmetrologia.CausalSets.BlackHoles.nesting_no_strictOrderClosure_of_point}

The causal relation on diamond points is sequencing:

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencingPrec0}

Formula:

```text
  (a,b) \prec_K (c,d)
    \quad\Longleftrightarrow\quad
  b \leq_C c.
```

Lean records the exact iff:

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_prec0_eq_true_iff}

Sequencing is transitive in the Boolean edge presentation:

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_prec0_trans_bool}

## Kinematic Space

The sequencing relation closes to the finite causal set of diamond points:

{docstring Obsmetrologia.CausalSets.BlackHoles.HoleDiamondKinematicSpace}

Checked:

```lean
example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableRel C.reaches] :
    CausalSet (DiamondPoint C) :=
  HoleDiamondKinematicSpace C
```

The bundled theorem is the compact proof carrier for this page:

{docstring Obsmetrologia.CausalSets.BlackHoles.holeDiamond_kinematic_space}

It says three things at once:

* nesting is excluded as the kinematic causal order;
* sequencing gives the causal set of diamond points;
* every readout on that diamond space inherits the ordinary finite
  no-readout/exterior separation laws.

## Kinematic Regions

Once `K(C) = HoleDiamondKinematicSpace C` exists, a kinematic region is just a
region over its diamond points:

```text
  R : DiamondPoint(C) -> Bool.
```

The readout-generated side of that region is not new machinery. It is the
ordinary finite hole construction applied to `K(C)`:

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencingHoleRegion}

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencingReadoutExterior}

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencingShroud}

Checked:

```lean
example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    (readout : FiniteHoleRegion (DiamondPoint C)) :
    FiniteHoleRegion (DiamondPoint C) :=
  sequencingHoleRegion C readout

example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    (readout : FiniteHoleRegion (DiamondPoint C)) :
    FiniteHoleRegion (DiamondPoint C) :=
  sequencingReadoutExterior C readout
```

The inherited laws are:

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_hole_future_closed}

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_readoutExterior_past_closed}

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_hole_exterior_disjoint}

{docstring Obsmetrologia.CausalSets.BlackHoles.sequencing_hole_no_future_to_exterior}

So "kinematic region" means a readout-side or no-readout-side predicate on
diamond points, with the same closure and separation laws as a finite causal
readout cut.

## Kinematic Patches

A patch is a subregion of the no-readout side:

{docstring Obsmetrologia.CausalSets.BlackHoles.Horizon.HoleRegionPatch}

The kinematic specialization is now named directly:

{docstring Obsmetrologia.CausalSets.BlackHoles.Horizon.kinematicHoleRegionPatch}

Its predicate is exactly the no-readout predicate on the sequencing
causal-diamond space:

{docstring Obsmetrologia.CausalSets.BlackHoles.Horizon.kinematicHoleRegionPatch_patch_eq_holeRegion}

A kinematic patch point is not exterior:

{docstring Obsmetrologia.CausalSets.BlackHoles.Horizon.kinematicHoleRegionPatch_not_exterior}

and it cannot causally precede a readout-exterior diamond point:

{docstring Obsmetrologia.CausalSets.BlackHoles.Horizon.kinematicHoleRegionPatch_no_future_to_exterior}

Checked:

```lean
example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    (readout : FiniteHoleRegion (DiamondPoint C)) :
    HoleRegionPatch (HoleDiamondKinematicSpace C) readout :=
  kinematicHoleRegionPatch C readout

example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    {readout : FiniteHoleRegion (DiamondPoint C)}
    {x y : DiamondPoint C}
    (hx :
      (kinematicHoleRegionPatch C readout).patch x =
        true)
    (hy :
      ReadoutExterior (HoleDiamondKinematicSpace C)
        readout y = true) :
    Not (CausalLe (HoleDiamondKinematicSpace C) x y) :=
  kinematicHoleRegionPatch_no_future_to_exterior C hx hy
```

This is the precise relation among the terms:

```text
  causal set C
    -> DiamondPoint(C)
    -> K(C) = HoleDiamondKinematicSpace(C)
    -> readout R : DiamondPoint(C) -> Bool
    -> HoleRegion(K(C), R)
    -> kinematicHoleRegionPatch(C, R).
```

## Downstream Uses

The hole/shroud page uses this carrier to discuss deshrouding, post-hole tiles,
diamond lifts, and kugelblitz formation. The curriculum page uses it to show why
space arrives only after marks have generated articulation chains and causal
diamonds. The Blueprint uses it as the green node behind the diamond-lift and
Husainov-frontier nodes.

The open frontier is not whether kinematic points and regions exist. Lean has
already built them. The open frontier is which additional closure, lift,
continuum, or comparison laws hold over this finite kinematic substrate.

end Obsmetrologia
