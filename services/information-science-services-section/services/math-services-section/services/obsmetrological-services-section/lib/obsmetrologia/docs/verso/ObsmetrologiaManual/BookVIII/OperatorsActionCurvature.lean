import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.CausalSets.Causal.Diamond
import ObsmetrologiaPhysicalScience.CausalSets.Incidence.MobiusAction
import ObsmetrologiaPhysicalScience.CausalSets.Curvature.ActionWiring

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Real.Internal
open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction
open Obsmetrologia.CausalSets.Curvature.ActionWiring
open Obsmetrologia.CausalSets.Curvature.Lambek
open Obsmetrologia.CausalSets.Curvature.Ricci
open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.CausalSets.Incidence.MobiusAction
open Obsmetrologia.CausalSets.Operator.BenincasaDowker
open Obsmetrologia.CausalSets.Operator.Coefficients
open Obsmetrologia.CausalSets.Operator.DAlembertian

/-!
A teaching chapter for the operator/action/curvature projection of causal incidence.
-/

#doc (Manual) "Operators, action, and curvature" =>

# Operators, Action, And Curvature

The previous chapter ended with Mobius incidence. This chapter explains what that
incidence does.

The claim-site carried here is:

* claim-site: causal d'Alembertian, Benincasa-Dowker action, and curvature;
* phase: relational spacetime;
* generating sites: settled causal order, interval abundance, Mobius inverse,
  layer constancy, column and row incidence sums;
* Lean carriers: `Obsmetrologia.CausalSets.Operator.DAlembertian`,
  `Obsmetrologia.CausalSets.Operator.BenincasaDowker`,
  `Obsmetrologia.CausalSets.Operator.Coefficients`,
  `Obsmetrologia.CausalSets.Incidence.MobiusAction`,
  `Obsmetrologia.CausalSets.Action.EinsteinHilbertAction`,
  `Obsmetrologia.CausalSets.Curvature.Lambek`,
  `Obsmetrologia.CausalSets.Curvature.Ricci`,
  `Obsmetrologia.CausalSets.Curvature.ActionWiring`;
* familiar comparisons: retarded wave operator, Benincasa-Dowker stencil,
  Einstein-Hilbert action, Bianchi identity, Ricci trace;
* danger: reading continuum geometry as already proved when the Lean theorems
  prove exact finite-poset incidence identities.

The governing sentence is:

> The operator is the Mobius inverse acting on fields; curvature is what its
> column and row traces expose.

## The Incidence Operator

The causal d'Alembertian is:

{docstring Obsmetrologia.CausalSets.Operator.DAlembertian.dalembertian}

It annihilates the zero field:

{docstring Obsmetrologia.CausalSets.Operator.DAlembertian.dalembertian_zero}

and it is additive:

{docstring Obsmetrologia.CausalSets.Operator.DAlembertian.dalembertian_add}

The point is not that Obsmetrologia has borrowed a differential operator. The finite
operator is the causal order's Mobius inverse convolved over the past cone. The
word "d'Alembertian" is legitimate only because the incidence operator has the
right retarded, linear behavior.

Checked:

```lean
example :
    dalembertian fourEvents diamondPrec
        (fun _ => RReal.zero) 3
      = RReal.zero :=
  dalembertian_zero fourEvents diamondPrec 3
```

## Layer Constancy And Benincasa-Dowker

The layer-grouped Benincasa-Dowker operator is:

{docstring Obsmetrologia.CausalSets.Operator.BenincasaDowker.dalembertianBD}

The exact incidence operator agrees with it under layer constancy:

{docstring Obsmetrologia.CausalSets.Operator.BenincasaDowker.dalembertianStrict_eq_BD}

The diamond carries that law:

{docstring Obsmetrologia.CausalSets.Operator.BenincasaDowker.diamond_layer_constant}

and therefore the two operator readings agree at the diamond apex:

{docstring Obsmetrologia.CausalSets.Operator.BenincasaDowker.diamond_strict_eq_BD}

This is the important restraint. The book must not say "the coefficients are
Mobius" as an unconditional slogan. The theorem says the strict incidence
operator is the layer-grouped operator when Mobius weights are constant on
interval-abundance layers. The diamond is a carrier of that law.

Checked:

```lean
def bdDiamond :=
  dalembertianBD fourEvents diamondPrec cDiamond

example (phi : Fin 4 -> RReal) :
    dalembertianStrict fourEvents diamondPrec phi 3
      = bdDiamond phi 3 :=
  diamond_strict_eq_BD phi
```

## Endogenous Coefficients

The strict-past action is:

{docstring Obsmetrologia.CausalSets.Operator.Coefficients.strictAction}

The endogenous coefficient groups Mobius weights by interval abundance:

{docstring Obsmetrologia.CausalSets.Operator.Coefficients.endoCoeff}

The general reconstruction theorem is:

{docstring Obsmetrologia.CausalSets.Operator.Coefficients.endo_reconstructs_action}

The diamond computes the coefficients:

{docstring Obsmetrologia.CausalSets.Operator.Coefficients.diamond_endoCoeff}

and shows the action is their layer sum:

{docstring Obsmetrologia.CausalSets.Operator.Coefficients.diamond_action_is_layer_sum}

Checked:

```lean
example :
    endoCoeff fourEvents diamondPrec 3 0 = -2 :=
  diamond_endoCoeff.1

example :
    endoCoeff fourEvents diamondPrec 3 2 = 1 :=
  diamond_endoCoeff.2.2

example :
    strictAction fourEvents diamondPrec 3
      = rangeSumZ (endoCoeff fourEvents diamondPrec 3) 3 :=
  diamond_action_is_layer_sum
```

The coefficient sequence is now no longer an external parameter. It has an
internal reading: group the incidence inverse by the abundance layers already
read from the settled order.

## Action Wiring

The layer action is:

{docstring Obsmetrologia.CausalSets.Incidence.MobiusAction.bdLayerAction}

Layer constancy factors the endogenous coefficient:

{docstring Obsmetrologia.CausalSets.Incidence.MobiusAction.endoCoeff_layerConstant}

and identifies the Mobius action with the layer-grouped
Benincasa-Dowker action:

{docstring Obsmetrologia.CausalSets.Incidence.MobiusAction.strictAction_eq_bdLayerAction}

The diamond carrier is:

{docstring Obsmetrologia.CausalSets.Incidence.MobiusAction.diamond_strictAction_eq_bd}

Checked:

```lean
example :
    strictAction fourEvents diamondPrec 3
      = bdLayerAction fourEvents diamondPrec cDiamond 3 :=
  diamond_strictAction_eq_bd
```

This is where the operator becomes an action statement. The page should be read
as a transport: causal order generates intervals; intervals generate layers;
Mobius incidence generates coefficients; coefficients reconstruct strict
action; layer constancy identifies that strict action with the public
Benincasa-Dowker layer action.

## Local Curvature And Action

The local curvature is the column Mobius sum:

{docstring Obsmetrologia.CausalSets.Action.EinsteinHilbertAction.localCurvature}

The discrete action is its total:

{docstring Obsmetrologia.CausalSets.Action.EinsteinHilbertAction.bdAction}

On the diamond, curvature is boundary-local:

{docstring Obsmetrologia.CausalSets.Action.EinsteinHilbertAction.diamond_localCurvature}

and the action is one:

{docstring Obsmetrologia.CausalSets.Action.EinsteinHilbertAction.diamond_bdAction}

Checked:

```lean
example :
    localCurvature fourEvents diamondPrec 0 = 1 :=
  diamond_localCurvature.1

example :
    bdAction fourEvents diamondPrec = 1 :=
  diamond_bdAction
```

This is an exact finite statement. Its continuum name is useful, but the proof
does not need a manifold, metric, volume form, or limit.

## Curvature As Left/Right Defect

The row curvature is the advanced companion:

{docstring Obsmetrologia.CausalSets.Curvature.Lambek.rowCurvature}

The curvature defect is the left/right gap:

{docstring Obsmetrologia.CausalSets.Curvature.Lambek.curvatureDefect}

The total defect vanishes:

{docstring Obsmetrologia.CausalSets.Curvature.Lambek.total_defect_eq_zero}

and the diamond exposes the boundary defect profile:

{docstring Obsmetrologia.CausalSets.Curvature.Lambek.diamond_curvatureDefect}

Checked:

```lean
example :
    curvatureDefect fourEvents diamondPrec 0 = 1 :=
  diamond_curvatureDefect.1

example :
    curvatureDefect fourEvents diamondPrec 3 = -1 :=
  diamond_curvatureDefect.2.2.2

example :
    curvatureDefect fourEvents diamondPrec 0
      + curvatureDefect fourEvents diamondPrec 1
      + curvatureDefect fourEvents diamondPrec 2
      + curvatureDefect fourEvents diamondPrec 3 = 0 :=
  diamond_total_defect_zero
```

The Lambek word is not ornamental. Curvature appears as a residual asymmetry:
column/retarded and row/advanced Mobius sums do not agree pointwise, even though
their total defect vanishes.

## Ricci-Type Trace

The direction-resolved tensor is:

{docstring Obsmetrologia.CausalSets.Curvature.Ricci.curvatureTensor}

It is antisymmetric:

{docstring Obsmetrologia.CausalSets.Curvature.Ricci.curvatureTensor_antisymm}

and its trace recovers the scalar defect:

{docstring Obsmetrologia.CausalSets.Curvature.Ricci.tensor_row_trace}

The symmetric companion is:

{docstring Obsmetrologia.CausalSets.Curvature.Ricci.symCurvature}

and the total symmetric trace is twice the action:

{docstring Obsmetrologia.CausalSets.Curvature.Ricci.total_ricciScalar_eq_two_bdAction}

The action-wiring module packages this as:

{docstring Obsmetrologia.CausalSets.Curvature.ActionWiring.curvature_action_wiring}

Checked:

```lean
example :
    curvatureTensor fourEvents diamondPrec 0 3 = -1 :=
  diamond_curvatureTensor_boundary.1

example :
    totalSymRicci fourEvents diamondPrec
      = 2 * bdAction fourEvents diamondPrec :=
  totalSymRicci_eq_two_bdAction fourEvents diamondPrec

example :
    totalSymRicci fourEvents diamondPrec = 2
      /\ bdAction fourEvents diamondPrec = 1 :=
  diamond_action_is_half_sym
```

This is the edge where a careless manual would lie. The exact theorem is an
incidence identity on a finite poset. The Ricci and Einstein-Hilbert names are
projections: internally justified as Mobius trace identities, externally frontier
until a continuum reconstruction theorem supplies the missing analytic bridge.

## Repair Path

If this chapter fails for a reader, use this route:

1. Return to `Intervals, Cones, And Incidence` and reread Mobius weights.
2. Read `dalembertian` as Mobius convolution, not as imported calculus.
3. Read `dalembertianStrict_eq_BD` with the layer-constancy hypothesis visible.
4. Read `endoCoeff` and `endo_reconstructs_action` before reading action.
5. Read `localCurvature` and `rowCurvature` as column and row Mobius sums.
6. Read `curvatureTensor`, `symCurvature`, and `totalSymRicci` as exact finite
   incidence identities.
7. Treat continuum Einstein-Hilbert/Ricci geometry as a frontier recovery, not
   as a premise of the chapter.

The next spacetime chapter should teach dimension, curvature, and continuum
reconstruction as estimators and limit frontiers over these finite identities.
