import InfomaterialManual.DocSetup
import Infomaterial.Relational.Spacetime.Dimension.Fingerprint
import Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness
import Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung
import Infomaterial.Relational.Spacetime.Continuum.Sprinkling
import Infomaterial.Relational.Spacetime.Continuum.ChuActionColimit

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Spacetime.Continuum.ChuActionColimit
open Infomaterial.Relational.Spacetime.Continuum.Colimit
open Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung
open Infomaterial.Relational.Spacetime.Continuum.Sprinkling
open Infomaterial.Relational.Spacetime.Dimension.Fingerprint
open Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness
open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction
open Infomaterial.Relational.Spacetime.Operator.BenincasaDowker

/-!
A teaching chapter for dimension readings and continuum reconstruction frontiers.
-/

#doc (Manual) "Dimension and continuum frontier" =>

# Dimension And Continuum Frontier

The previous chapters built finite causal spacetime from settled order, intervals,
incidence, operators, action, and curvature. This chapter explains what can be
read from that finite data toward dimension and continuum reconstruction.

The claim-site carried here is:

* claim-site: dimension and continuum reconstruction from causal invariants;
* phase: relational spacetime;
* generating sites: apex count, ordering fraction, Gauss-Bonnet count, internal
  real interpretation, order-complex cohomology, spacetime fingerprint, sprinkling
  average, refinement colimit;
* Lean carriers: `Infomaterial.Relational.Spacetime.Dimension.OrderingFraction`,
  `Infomaterial.Relational.Spacetime.Dimension.Fingerprint`,
  `Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness`,
  `Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung`,
  `Infomaterial.Relational.Spacetime.Continuum.Sprinkling`,
  `Infomaterial.Relational.Spacetime.Continuum.Colimit`,
  `Infomaterial.Relational.Spacetime.Continuum.ChuActionColimit`;
* familiar comparisons: Myrheim-Meyer dimension, Euler characteristic,
  manifoldlikeness, Hauptvermutung, sprinkling averages, continuum limit;
* danger: treating finite estimators as already being a continuum theorem.

The governing sentence is:

> Continuum geometry is not assumed; the finite causal order emits invariants
> that any continuum reconstruction must respect.

## Ordering Fraction

The apex count is the ordered-pair count read from the settled causal order:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.apexCount}

The ordering fraction is the rational Myrheim-Meyer input:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.orderingFraction}

The diamond has five apex pairs:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.diamond_apex_count}

and ordering fraction five-sixths:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.diamond_ordering_fraction}

Checked:

```lean
example :
    apexCount fourEvents diamondPrec = 5 :=
  diamond_apex_count

example :
    orderingFraction fourEvents diamondPrec = fiveSixths :=
  diamond_ordering_fraction

def diamondFraction :=
  orderingFraction fourEvents diamondPrec

example :
    diamondFraction.num = 5
      /\ diamondFraction.den = 6 :=
  diamond_ordering_fraction_val
```

This is not yet the real-valued Myrheim-Meyer dimension. It is the exact finite
rational input to that estimator.

## Gauss-Bonnet And Independence

The settling Euler characteristic is:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.eulerChar}

The stated Gauss-Bonnet identity is:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.gauss_bonnet}

On the diamond:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.gauss_bonnet_diamond}

The independence statement separates geometry from classifying/topological data:

{docstring Infomaterial.Relational.Spacetime.Dimension.OrderingFraction.geometry_independent_of_topology}

Checked:

```lean
example :
    eulerChar fourEvents diamondPrec = 5 :=
  gauss_bonnet_diamond.1

example :
    orderingFraction fourEvents chainPrec = 1 :=
  chain_ordering_fraction

example :
    orderingFraction fourEvents antichainPrec = 0 :=
  antichain_ordering_fraction
```

The repair lesson is important: classifying data and geometric ordering fraction
are not the same invariant. A book that collapses them will mis-teach spacetime.

## Internal-Real Interpretation

The rational-to-real part of the dimension story is now present internally:

{docstring Infomaterial.Relational.Spacetime.Dimension.Fingerprint.diamondOrderingFractionReal}

The diamond's internal rational fraction is:

{docstring Infomaterial.Relational.Spacetime.Dimension.Fingerprint.diamond_orderingFractionIRat_eq}

and its internal-real embedding is:

{docstring Infomaterial.Relational.Spacetime.Dimension.Fingerprint.diamond_orderingFractionReal_eq}

The bundled statement is:

{docstring Infomaterial.Relational.Spacetime.Dimension.Fingerprint.diamond_myrheim_meyer_real_bridge}

Checked:

```lean
example :
    diamondOrderingFractionIRat = iFiveSixths :=
  diamond_orderingFractionIRat_eq

example :
    diamondOrderingFractionReal = rFiveSixths :=
  diamond_orderingFractionReal_eq
```

The real interpretation is not the full dimension theorem. The Gamma function and
inverse estimator remain outside this settled carrier.

## Manifoldlikeness

The cochain pullback is:

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.pullback}

It commutes with the coboundary:

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.pullback_delta}

and carries cocycles and coboundaries along:

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.pullback_cocycle}

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.pullback_coboundary}

The diamond interval has the two-dimensional Euler signature:

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.diamond_interval_euler}

The bundled statement is:

{docstring Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness.causal_manifoldlikeness}

Checked:

```lean
example :
    Infomaterial.Relational.Spacetime.Incidence.Mobius.hallSum
        fourEvents diamondPrec 0 3 = 1 :=
  diamond_interval_euler.1

example :
    Infomaterial.Relational.Spacetime.Incidence.Mobius.mobius
        fourEvents diamondPrec 0 3 = 1 :=
  diamond_interval_euler.2.1
```

This is a topology instrument, not the full Hauptvermutung. The finite order
complex is computable; convergence of the whole Betti profile to a Lorentzian
manifold remains frontier.

## Fingerprint

The testable Hauptvermutung content is packaged as a fingerprint:

{docstring Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung.SpacetimeFingerprint}

The fingerprint is read from a causal order:

{docstring Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung.fingerprint}

The diamond's fingerprint is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Hauptvermutung.diamond_fingerprint}

Checked:

```lean
example :
    fingerprint fourEvents diamondPrec
      = { relations := 5, action := 1 } :=
  diamond_fingerprint
```

The fingerprint is not a continuum embedding. It is the finite invariant profile
any faithful embedding would have to preserve.

## Sprinkling Averages

The integer sprinkling expectation is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.expValZ}

The layer-grouped value is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.bdLayerSum}

Expectation commutes with the layer sum:

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.bdLayerSum_expectation}

The moment response of the two-dimensional coefficients is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.bdLayerSum_moment_response}

The diamond occupation profile and layer sums are:

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.diamond_occProfile}

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.diamond_bd2_layerSum}

{docstring Infomaterial.Relational.Spacetime.Continuum.Sprinkling.diamond_cDiamond_layerSum}

Checked:

```lean
example :
    occProfile fourEvents diamondPrec 3 0 = 2 :=
  diamond_occProfile.1

example :
    bdLayerSum bdCoeff2
        (occProfile fourEvents diamondPrec 3) 3 = 3 :=
  diamond_bd2_layerSum

example :
    bdLayerSum cDiamond
        (occProfile fourEvents diamondPrec 3) 3 = -1 :=
  diamond_cDiamond_layerSum
```

This is the discrete model of a Poisson sprinkling story. The average and moment
conditions are green. The analytic scaling to a continuum density is not.

## Colimit Mechanisms

The refinement tower is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Colimit.RefinementTower}

The abstract attained-colimit lemma is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Colimit.tower_continuum_attained}

The finite-value Benincasa-Dowker construction is:

{docstring Infomaterial.Relational.Spacetime.Continuum.Colimit.bd_construction_two}

The Chu information-action construction is:

{docstring Infomaterial.Relational.Spacetime.Continuum.ChuActionColimit.chu_action_colimit}

Checked:

```lean
example (N : Nat) :
    bdF ((bdTower.upto N).sup) = bdF (bdStage N) :=
  (bd_construction_two N).2.1
```

Here the manual has to be precise. The finite colimit mechanism is real, and the
Chu information action is an attained colimit. The unbounded gravitational
Benincasa-Dowker continuum density and metric Ricci magnitude are not established
by these lemmas.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `apexCount` and `orderingFraction` as finite rational data.
2. Read `diamond_myrheim_meyer_real_bridge` only as the rational-to-real bridge.
3. Read `pullback_delta` before saying "topology is invariant."
4. Read `fingerprint` as testable data, not as a continuum embedding.
5. Read `bdLayerSum_expectation` as finite expectation linearity.
6. Read `bd_construction_two` and `chu_action_colimit` as finite colimit
   mechanisms with explicit scope limits.
7. Keep the Gamma inversion, continuum density, metric Ricci normalization, and
   full Hauptvermutung in the frontier.

The next spacetime work should either deepen the continuum frontier or move to
the physical phase domains that use these finite spacetime invariants.
