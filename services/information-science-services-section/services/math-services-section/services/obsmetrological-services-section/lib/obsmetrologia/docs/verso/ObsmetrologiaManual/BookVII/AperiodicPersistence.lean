import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.Tiling.History
import Obsmetrologia.AperiodicOrder.Tiling.InverseHull
import Obsmetrologia.AperiodicOrder.Tiling.MatterTopology
import Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraphMatter
import Obsmetrologia.AperiodicOrder.Tiling.Percolation
import Obsmetrologia.AperiodicOrder.Tiling.Diffraction
import Obsmetrologia.AperiodicOrder.Tiling.FiniteInfiniteCharger
import Obsmetrologia.AperiodicOrder.Tiling.StepN.FixedPoint
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoDecidableCore
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitutionTower
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoPersistence

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Cohomology
open Obsmetrologia.Discrete
open Obsmetrologia.Probability.Measure
open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.Aperiodic
open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.AperiodicOrder.Tiling.Witness

/-!
A teaching chapter for aperiodic persistence and material witnesses.
-/

#doc (Manual) "Aperiodic persistence" =>

# Aperiodic Persistence

Book VII begins where ordinary closure has stopped being the right comfort.
Strict and Scott regimes stabilize in familiar ways. Aperiodic matter is what
remains when the system must be read through finite stages, substitutions,
inverse hulls, persistent classes, and material networks whose load-bearing
content is topological rather than merely dense.

The claim-site carried here is:

* claim-site: aperiodic and persistent relational matter;
* phase: persistence after non-Scott settling;
* generating sites: direct limits, inverse hulls, classifying cohomology,
  substitution towers, condensate readings, contact-network cycle rank,
  step-depth colimits;
* Lean carriers: `Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam`,
  `Obsmetrologia.AperiodicOrder.Tiling.InverseHull`,
  `Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRao`,
  `Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitution`,
  `Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitutionTower`,
  `Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoPersistence`,
  `Obsmetrologia.AperiodicOrder.Tiling.PortGraph`,
  `Obsmetrologia.AperiodicOrder.Tiling.CondensateMatter`,
  `Obsmetrologia.AperiodicOrder.Tiling.MatterTopology`,
  `Obsmetrologia.AperiodicOrder.Tiling.History`,
  `Obsmetrologia.AperiodicOrder.Tiling.StepN.FixedPoint`;
* familiar comparisons: Anderson-Putnam complexes, tiling hulls, Wang tile
  witnesses, substitution eigenclasses, beadwork port graphs, jamming,
  renormalization fixed points;
* danger: treating a local finite witness as the full aperiodicity theorem, or
  treating density as load-bearing topology.

The governing sentence is:

> Aperiodic matter is finite-stage evidence that survives the passage to the
> hull, the tower, or the colimit.

That survival is the phase. The book must distinguish local witnesses from
persistent witnesses, and persistent witnesses from complete classification.

## Histories Before Quotients

The relational-hyperverse archive had a useful history layer, but its concrete
quotient monoid still depended on an open cancellation argument. The active
library therefore takes only the proved carrier first:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Aperiodic.HistorySystem}

The prefix laws are already proved:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Aperiodic.HistorySystem.empty_le}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Aperiodic.HistorySystem.le_concat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Aperiodic.HistorySystem.concat_left_monotone}

Checked:

```lean
example (T : HistorySystem) (t u : T.carrier) :
    T.le t (T.concat t u) :=
  T.le_concat t u
```

The step-quality facet is the commutation relation:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Aperiodic.CommutationRelation}

The quotient \(M(\Sigma,I)\), its independent-step diamond, and its universal
property stay frontier until the missing cancellation proof exists. This is a
case where the archive is useful but not yet lawful as a proved theorem.

## Direct Limit And Inverse Hull

The Anderson-Putnam side begins with a directed system of finite-stage
cohomologies:

{docstring Obsmetrologia.AperiodicOrder.Tiling.DirectedSystem}

The relation defining the colimit is eventual equality:

{docstring Obsmetrologia.AperiodicOrder.Tiling.DirectedSystem.Eventually}

and the colimit itself is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.DirectedSystem.Colimit}

The concrete constant model is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.apSystem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.apSystem_stage_independent}

The geometric side is the inverse system:

{docstring Obsmetrologia.InverseSystem}

with threads as coherent finite-stage readings:

{docstring Obsmetrologia.InverseSystem.Thread}

and hull as the inverse limit:

{docstring Obsmetrologia.InverseSystem.Hull}

The hull is separated by its stages:

{docstring Obsmetrologia.InverseSystem.hull_separated_by_stages}

and paired to the cohomological classifying invariant by the seam:

{docstring Obsmetrologia.AperiodicOrder.Tiling.seamMap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.hull_pairs_clinv}

Checked:

```lean
example (m n : Nat) (x : H1Class) :
    DirectedSystem.Colimit.mk apSystem ⟨m, x⟩
      = DirectedSystem.Colimit.mk apSystem ⟨n, x⟩ :=
  apSystem_stage_independent m n x

example :
    seamMap (constThread aperiodicWitness.clInv)
      = aperiodicWitness.clInv :=
  seamMap_constThread aperiodicWitness.clInv

example :
    ∃ t : apHullSystem.Thread,
      seamMap t = aperiodicWitness.clInv
        ∧ seamMap t ≠ H1Class.zero :=
  hull_pairs_clinv
```

The phase lesson is that the direct limit and inverse hull are not competing
stories. The colimit identifies finite representatives that eventually agree.
The hull separates points by all finite-stage projections. Cohomology and hull
are two surfaces of one persistent object.

## The Finite/Transfinite Charger

The aperiodic corpus uses two bridges across the finite/transfinite boundary.
One bridge is observational: a finite-state cover presents an infinite system.
The other bridge is constructive: a directed colimit builds the transfinite
carrier from compatible stages.

The charger names the square:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.Cell}

The two axes are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.arrowDual}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.finitenessDual}

and the square is another face of the existing Klein-four carrier:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.toK4}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.ofK4_toK4}

Checked:

```lean
example (c : Charger.Cell) :
    Charger.ofK4 (Charger.toK4 c) = c :=
  Charger.ofK4_toK4 c

example (g : Positing.Gauge.K4) :
    Charger.toK4 (Charger.ofK4 g) = g :=
  Charger.toK4_ofK4 g

example (c : Charger.Cell) :
    Charger.arrowDual (Charger.finitenessDual c)
      = Charger.finitenessDual (Charger.arrowDual c) :=
  Charger.axes_commute c
```

The algebra/coalgebra axis should not be confused with the older reading
Klein-four operations. `OrderSwapDuality` already proves an involutive
order-swap:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.orderSwapDuality_witnesses_arrow_reversal_shape}

That is a witness for the shape of arrow reversal, while the charger itself is
the product of the algebra/coalgebra axis with the finite/transfinite axis.

The two off-diagonal cells are the useful bridges:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.bridge_cells}

The sofic bridge lands in finite coalgebra:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.fib_deep_sofic_lands_finite_coalgebra}

and the colimit bridge lands in transfinite algebra:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Charger.colimit_cocone_lands_transfinite_algebra}

Checked:

```lean
example (w : List Bool) (hw : Path goldenStep w) :
    Charger.soficCell decoStep forgetDecoration
        (substitute fibSub w) (fib_deep_sofic w hw)
      = Charger.finiteCoalgebra :=
  Charger.fib_deep_sofic_lands_finite_coalgebra w hw

example (S : DirectedSystem) :
    Charger.colimitCell S = Charger.transfiniteAlgebra :=
  Charger.colimit_lands_transfinite_algebra S
```

This is the routing use of the charger. The diagonal contrast
finite-algebra/transfinite-coalgebra is easy to say, but it does not explain how
work moves. The off-diagonal bridges do: use a finite coalgebra when an infinite
system is tractable by observation through a finite cover; use a transfinite
algebra when compatible finite stages must be assembled into a colimit.

## Finite Cohomology Witnesses

The Jeandel-Rao carrier is deliberately finite. It does not claim the whole
aperiodicity theorem. It provides local cohomological witnesses extracted from
finite one-vertex Anderson-Putnam complexes.

The complex carrier is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.OneVertexComplex}

The closedness and nonzero predicates are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.OneVertexComplex.IsCocycle}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.OneVertexComplex.NonzeroH1Class}

The decorated witness and marker-ring core are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jrComplex}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.phi}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.markerRingComplex}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.b3}

The finite witness theorems are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRaoMarker01_nonzero_h1_class}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.markerRing_b3_nonzero_h1_class}

Checked:

```lean
example :
    jrComplex.NonzeroH1Class phi :=
  jeandelRaoMarker01_nonzero_h1_class

example :
    markerRingComplex.NonzeroH1Class b3 :=
  markerRing_b3_nonzero_h1_class
```

This is a place where the book must be stricter than ordinary exposition. A
finite nonzero cocycle is a real theorem. It is not yet full Jeandel-Rao
aperiodicity, not yet complete MLD classification, and not yet a direct-limit
class. Calling it more than that would be drift.

## Substitution Makes The Witness Persistent

The next rung is the marker-domino substitution. A finite witness becomes
persistent only when the system explains how it survives the tower.

The substitution edge map and pullback are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.subEdge}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.subPull}

The pullback sends the marker-ring core to the decorated witness:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.subPull_b3}

and preserves cocycles:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.subPull_cocycle}

The bundled one-rung theorem is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jr_substitution_pullback}

The recognizability return closes the rung into an endomorphism:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.recPull}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigma}

The core class is fixed by the substitution:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigma_b3}

and every iterate fixes it:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaIter_b3}

The nonzero direct-limit statement is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.NonzeroInDirectLimit}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.b3_nonzero_in_direct_limit}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jr_substitution_tower}

Checked:

```lean
example :
    subPull b3 = phi :=
  subPull_b3

example :
    sigma b3 = b3 :=
  sigma_b3

example :
    NonzeroInDirectLimit b3 :=
  b3_nonzero_in_direct_limit

example :
    (∀ ψ : QEdge -> Int,
      markerRingComplex.IsCocycle (sigma ψ))
      ∧ sigma b3 = b3
      ∧ (∀ n : Nat, sigmaIter n b3 = b3)
      ∧ NonzeroInDirectLimit b3 :=
  jr_substitution_tower
```

The phase lesson is the difference between a witness and persistence. The local
cochain `b3` matters because substitution does not erase it. The tower turns
finite-stage evidence into a direct-limit survivor.

## Persistence Discharged: An Unconditional Instance

`jr_substitution_tower` persists the class `b3` on the `markerRing` complex.
The frontier this book actually names, `thm:jeandel-rao-persistence`, is a
different complex: it asks whether the decorated witness `φ` on `jrComplex`
survives its own substitution tower. Naming that gap honestly costs one
frontier hypothesis, not a `sorry`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.iterate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandel_rao_persistence}

An unconditional statement over an *arbitrary* cocycle-preserving self-map
would be false — a map collapsing `[φ]` is a counterexample — and one over an
arbitrary class-preserving map would be trivial, witnessed by `id`. The
hypothesis `hpreserve` earns its keep only when something concrete discharges
it. Composing the pieces already proved above does exactly that: the
marker-domino pullback `subPull`, the marker-ring substitution `sigma`, and
the recognizability return `recPull` compose to a self-map of `jrComplex`
cochains.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge}

This composite lands in cocycles unconditionally, for every input, not only
for cocycles — it factors through `subPull`, and `sigma` always produces a
cocycle — and it fixes `φ` on the nose by chasing the three already-proved
identities `recPull φ = b3`, `sigma b3 = b3`, `subPull b3 = φ`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_cocycle}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_phi}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_iter_phi}

So `φ`'s class survives the entire `sigmaEdge` tower with no hypothesis left
open — `hpreserve` discharged along `φ`'s own orbit, giving a genuinely
unconditional persistence theorem for this concrete witness:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandel_rao_persistence_instance}

Checked:

```lean
example : sigmaEdge phi = phi :=
  sigmaEdge_phi

example : ∀ n : Nat, jrComplex.NonzeroH1Class (iterate sigmaEdge n phi) :=
  jeandel_rao_persistence_instance
```

`jeandel_rao_persistence` itself is kept unweakened as the strictly more
general statement over an arbitrary class-preserving self-map;
`jeandel_rao_persistence_instance` is the case `χ = φ`, not a replacement for
it. Identifying `sigmaEdge` with the literal Labbé recognizable substitution
matrix stays outside this instance's scope.

The orbit of `φ` is not the edge of what `sigmaEdge` reaches, only the edge of
what had been checked. Chasing the same three pieces through their case
splits shows `sigmaEdge` reads out just two coordinates of its argument,
unconditionally, for every cochain:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_eq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_zero_iff}

Consequently a second application of `sigmaEdge` only re-reads coordinates the
first application already fixed, so the map is idempotent and its tower
stabilizes after one step:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_idem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.iterate_sigmaEdge_succ}

That two-coordinate structure widens `hpreserve` from the single point `φ` to
a whole characterized subfamily: every `jrComplex` cocycle with either
read-out coordinate nonzero survives the entire tower, `φ` among them since
`φ e2 = 1 ≠ 0`.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.sigmaEdge_persistence_subfamily}

Checked:

```lean
example (χ : jrComplex.Edge → Int) (hc : jrComplex.IsCocycle χ)
    (h : χ Edge.e0 ≠ 0 ∨ χ Edge.e2 ≠ 0) :
    ∀ n : Nat, jrComplex.NonzeroH1Class (iterate sigmaEdge n χ) :=
  sigmaEdge_persistence_subfamily χ hc h
```

This does not close `thm:jeandel-rao-persistence` at the fully general
nonzero-class level. A cocycle with both read-out coordinates zero but
nonzero elsewhere — supported only on `e1`, forced `e1 = e3` by the
`f0`-boundary and free otherwise — is a nonzero class `sigmaEdge` annihilates,
consistent with the module's own note that the fully unconditional statement
would be false. The phase lesson repeats one register lower than the tower
itself: persistence proved for one witness orbit is not persistence proved for
the class of all witnesses, and widening the proved subfamily is real
progress precisely because it says exactly where the widening stops.

## Decidable Core Of An Undecidable Question

The domino problem comparison has to be read with the same discipline. The
library does not prove the external computability theorem here. What it does
prove is the constructive core that an undecidable existence question can only
ask for: an object, a certificate, and a decision for that certificate.

The generic carriers are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.ExistenceQuestion}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore.ofCertificate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore.assertion}

The Jeandel-Rao object records exactly the finite data used by the proved
witness:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoAperiodicObject}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRao11Object}

Its certificate is the eleven-tile count together with the already green
decorated class, marker core, and substitution tower:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRaoConstructiveQuestion}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRao11_certificate}

The certificate is decidable because it is inhabited by the witness:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRao11_certificate_decidable}

The bundled core and existence bridge are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRaoConstructiveCore}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRao_constructive_existence}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.jeandelRao_witness_is_decidable_core}

Checked:

```lean
example :
    jeandelRaoConstructiveQuestion.Assertion :=
  jeandelRao_constructive_existence

example :
    ∃ core : DecidableCore jeandelRaoConstructiveQuestion,
      core.object.tileCount = 11 :=
  jeandelRao_witness_is_decidable_core
```

This is what the library proves. The undecidable domino problem asks an
existence question over arbitrary finite tile sets. The Jeandel-Rao construction
does not decide that global question; it gives a concrete object in the target
class and a finite certificate that the library can check. The witness is
therefore the decidable core of the undecidable question, not a decision
procedure for the question.

## Condensates And Material Topology

Aperiodic matter is not only tiling cohomology. The same phase also carries
material witnesses: port graphs, condensate readings, and load-bearing networks.

A port graph begins with thread passes through lenticules:

{docstring Obsmetrologia.AperiodicOrder.Tiling.ThreadPass}

and the hole transition is a weave crossing:

{docstring Obsmetrologia.AperiodicOrder.Tiling.holeTransition}

{docstring Obsmetrologia.AperiodicOrder.Tiling.holeTransition_eq_warpAlt}

Legality is threading through:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Legal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.legal_iff_distinct}

The condensate reading reads occupation count as relational value:

{docstring Obsmetrologia.AperiodicOrder.Tiling.condensate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.over_occupation_inconsistency}

The material-level density carrier is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Material}

{docstring Obsmetrologia.AperiodicOrder.Tiling.rigidity}

{docstring Obsmetrologia.AperiodicOrder.Tiling.rigid_iff_overoccupied}

{docstring Obsmetrologia.AperiodicOrder.Tiling.floppy_of_all_le_one}

But load-bearing structure is topological:

{docstring Obsmetrologia.AperiodicOrder.Tiling.loadBearing}

{docstring Obsmetrologia.AperiodicOrder.Tiling.loadBearing_iff_not_forest}

{docstring Obsmetrologia.AperiodicOrder.Tiling.jamming_click}

The percolation layer sharpens the old density story. The threshold is not
defined by the number of condensed sites alone, but by excess contact over the
spanning-forest boundary:

{docstring Obsmetrologia.AperiodicOrder.Tiling.percolationThreshold}

{docstring Obsmetrologia.AperiodicOrder.Tiling.h1rank_eq_excess}

{docstring Obsmetrologia.AperiodicOrder.Tiling.loadBearing_iff_critical}

The density warning is a theorem rather than a slogan:

{docstring Obsmetrologia.AperiodicOrder.Tiling.density_necessary}

{docstring Obsmetrologia.AperiodicOrder.Tiling.density_not_sufficient}

and the first FOUR-placement carrier records the missing topology explicitly:

{docstring Obsmetrologia.AperiodicOrder.Tiling.PlacementGraph}

{docstring Obsmetrologia.AperiodicOrder.Tiling.PlacementGraph.condensedContacts}

{docstring Obsmetrologia.AperiodicOrder.Tiling.PlacementGraph.loadBearing_of_condensed_crosses_threshold}

The minimal gauge-orbit witness is correspondingly finite. A D8 orbit supplies
the condensed contacts needed for the two-contact cyclic nerve:

{docstring Obsmetrologia.AperiodicOrder.Tiling.gauge_orbit_equidistributes}

{docstring Obsmetrologia.AperiodicOrder.Tiling.condensate_baserate_quarter}

{docstring Obsmetrologia.AperiodicOrder.Tiling.PlacementGraph.gaugeOrbitCyclic_loadBearing}

At the smallest local cycle, the same carrier ties load-bearing to one Landauer
bit:

{docstring Obsmetrologia.AperiodicOrder.Tiling.fundamental_cycle_is_local_h1}

{docstring Obsmetrologia.AperiodicOrder.Tiling.fundamental_cycle_one_bit}

Checked:

```lean
example :
    holeTransition = warpAlt :=
  holeTransition_eq_warpAlt

example (n : Nat) :
    (condensate (n + 2)).isInconsistency = true :=
  over_occupation_inconsistency n

example (m : Material) :
    0 < rigidity m ↔ ∃ k ∈ m, 2 ≤ k :=
  rigid_iff_overoccupied m

example (N : CoverNerve) :
    loadBearing N ↔ N.entities ≠ N.cells + N.components :=
  loadBearing_iff_not_forest N

example (N : CoverNerve) :
    loadBearing N ↔ percolationThreshold N + 1 <= N.cells :=
  loadBearing_iff_critical N

example (a : Reading) :
    loadBearing (PlacementGraph.gaugeOrbitCyclic a).nerve :=
  PlacementGraph.gaugeOrbitCyclic_loadBearing a

example :
    Landauer.landauerBits fundamentalNerve = 1
      ∧ (forall a : Reading,
        (fundamentalCycle a).countP
          (fun c => c.isInconsistency) = 1) :=
  fundamental_cycle_one_bit
```

The repair path is explicit: do not confuse mass, rigidity, placement, and
topology. A condensed lenticule is a held inconsistency. A material with some
over-occupied lenticule has positive condensate density. A load-bearing contact
network has cycle rank. Density is necessary, but the topology and placement of
condensed contacts decide whether the material bears load. The current finite
order parameter is therefore held-top density crossed with placement and H1, not
held-top density by itself.

## The Fundamental Cycle, Read On The Regimes

`spin` and `Closure.Regime`'s `regimeCornerBij` were built independently, in
unrelated modules, for unrelated reasons -- one for percolation's load-bearing
cycle, the other for the closure-ordinal regime's conflation with the recurring
FOUR. Composed, they say something neither says alone.

{docstring Obsmetrologia.AperiodicOrder.Tiling.regimeSpin}

The transported cycle is not the naive $\kappa$-height chain:

{docstring Obsmetrologia.AperiodicOrder.Tiling.regimeSpin_cycle}

It closes after four turns, inherited directly from `spin_four` through the
bijection:

{docstring Obsmetrologia.AperiodicOrder.Tiling.regimeSpin_four}

and squaring it gives a clean involution -- the bilattice's two extremes paired
with each other, the two genuinely-infinite non-extremal regimes paired with
each other -- generated by the same order-exchanging symmetry that produces the
fundamental cycle in the first place, not chosen after the fact to fit:

{docstring Obsmetrologia.AperiodicOrder.Tiling.regimeSpin_regimeSpin}

Checked:

```lean
example :
    regimeSpin ClosureRegime.strict =
        ClosureRegime.scott ∧
      regimeSpin ClosureRegime.scott =
        ClosureRegime.aperiodic ∧
      regimeSpin ClosureRegime.aperiodic =
        ClosureRegime.transfiniteBounded ∧
      regimeSpin ClosureRegime.transfiniteBounded =
        ClosureRegime.strict :=
  regimeSpin_cycle

example (r : ClosureRegime) :
    regimeSpin (regimeSpin (regimeSpin (regimeSpin r))) =
      r :=
  regimeSpin_four r
```

This is one generator of the Klein-four/D8 gauge, carried onto the regime side
and shown to act non-trivially. It is not yet the full gauge action, and it
does not by itself fold the regime into the master four-corner conflation --
both remain the open residue recorded in the blueprint. What it does establish
is that the regime quartet is not merely *analogous* to a four-corner cell
waiting for a bijection; it already has at least one of the cell's own
symmetries acting on it, inherited rather than imposed.

## Boundary Link Graphs

Taxonomy incidence and JSON-LD entity graphs reach the same matter ledger only
after they have emitted the cover-nerve counts. The Lean carrier deliberately
does not parse either surface. It records the honest uniformity point: once the
emitter supplies entities, links, components, and the component invariant, the
same `CoverNerve` theorem reads the graph.

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkSurface}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.coverNerve}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.firstBetti}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.crossReferenceCycle}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.h1Rank_coverNerve_eq_firstBetti}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.loadBearing_coverNerve_iff_crossReferenceCycle}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.taxonomyIncidenceGraphMatter}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.entityGraphMatter}

{docstring Obsmetrologia.AperiodicOrder.Tiling.MatterLedger}

{docstring Obsmetrologia.AperiodicOrder.Tiling.matterTopology.receipt}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.mass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.mass_factors_through_coverNerve}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.mass_cycleRank_eq_firstBetti}

{docstring Obsmetrologia.AperiodicOrder.Tiling.BoundaryLinkGraph.mass_bearsLoad_iff_crossReferenceCycle}

Checked:

```lean
example (G : BoundaryLinkGraph) :
    G.coverNerve.H1rank = G.firstBetti :=
  BoundaryLinkGraph.h1Rank_coverNerve_eq_firstBetti G

example (G : BoundaryLinkGraph) :
    loadBearing G.coverNerve ↔ G.crossReferenceCycle :=
  BoundaryLinkGraph.loadBearing_iff_crossReferenceCycle G

example (G : BoundaryLinkGraph) :
    G.mass = matterTopology.receipt G.coverNerve :=
  BoundaryLinkGraph.mass_factors_through_coverNerve G

example (G : BoundaryLinkGraph) :
    G.mass.cycleRank = G.firstBetti :=
  BoundaryLinkGraph.mass_cycleRank_eq_firstBetti G

example (G : BoundaryLinkGraph) :
    G.mass.bearsLoad ↔ G.crossReferenceCycle :=
  BoundaryLinkGraph.mass_bearsLoad_iff_crossReferenceCycle G
```

## Finite Boundary Residue

The autocorrelation page now has a measured finite projection. The displacement
carrier is a finite sample space:

{docstring Obsmetrologia.AperiodicOrder.Tiling.displacementSpace}

The same displacement carrier now has a finite Delone support predicate:

{docstring Obsmetrologia.AperiodicOrder.Tiling.FiniteDisplacementDelone}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDisplacementDelone_of_full}

and the finite diffraction mass is the pushforward of counting measure along the
finite autocorrelation function:

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionMass}

It inherits the finite measure laws:

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionMass_empty}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionMass_univ}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionMass_mono}

The homometry theorem gives the boundary-observational direction that is
available in the finite core:

{docstring Obsmetrologia.AperiodicOrder.Tiling.homometric_finiteDiffractionMass_eq}

The same finite carrier now has a component classifier. It cuts a listed sample
space into three disjoint event faces and then reads the existing reading,
closure-regime, StepN, and H1 witnesses through those finite labels:

{docstring Obsmetrologia.AperiodicOrder.Tiling.FiniteDiffractionKind}

{docstring Obsmetrologia.AperiodicOrder.Tiling.FiniteDiffractionDecomposition}

{docstring Obsmetrologia.AperiodicOrder.Tiling.decompositionOfClassifier}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionDecomposition_mass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.readingDiffractionKind}

{docstring Obsmetrologia.AperiodicOrder.Tiling.closureDiffractionKind}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finite_diffraction_classifier_agreement}

The predictor-level phase carrier then tightens that agreement into one map.
Here `false` is the contracting/Pisot side and `true` is the neutral/Salem side;
the theorem is deliberately finite and predictor-level. It does not construct
the Fourier-side spectrum of an arbitrary primitive substitution.

{docstring Obsmetrologia.AperiodicOrder.Tiling.PhaseSubstitution}

{docstring Obsmetrologia.AperiodicOrder.Tiling.phaseType}

{docstring Obsmetrologia.AperiodicOrder.Tiling.lebesgueType}

{docstring Obsmetrologia.AperiodicOrder.Tiling.pisotSalemClass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.closureRegime}

{docstring Obsmetrologia.AperiodicOrder.Tiling.phaseType_readings_agree}

{docstring Obsmetrologia.AperiodicOrder.Tiling.phaseType_evidence}

The finite carrier also has a pure-point quasicrystal surrogate. This remains
finite: Delone support is read on `displacementSpace`, and pure-point is the
finite Fourier-side component label.

{docstring Obsmetrologia.AperiodicOrder.Tiling.FinitePurePointQuasicrystal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finitePurePointQuasicrystal_of_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finitePurePointQuasicrystal_of_full_pisot}

Checked:

```lean
example (n : Nat) (w : Fin (n + 1) -> Bool) :
    finiteDiffractionMass n w Set.univ = n + 1 :=
  finiteDiffractionMass_univ n w

example {n : Nat} {w : Fin (n + 1) -> Bool}
    (h : forall d, w d = true) :
    FiniteDisplacementDelone n w :=
  finiteDisplacementDelone_of_full h

example {n : Nat} {w w' : Fin (n + 1) -> Bool}
    (h : Homometric n w w') (A : Set Nat) :
    finiteDiffractionMass n w A =
      finiteDiffractionMass n w' A :=
  homometric_finiteDiffractionMass_eq h A

example {Omega : Type} (S : SampleSpace Omega)
    (c : Omega -> FiniteDiffractionKind) :
    S.measure Set.univ =
      S.measure (decompositionOfClassifier c).pp
        + S.measure (decompositionOfClassifier c).sc
        + S.measure (decompositionOfClassifier c).ac := by
  let D := decompositionOfClassifier c
  change S.measure Set.univ =
    S.measure D.pp + S.measure D.sc + S.measure D.ac
  exact finiteDiffractionDecomposition_mass S D

example :
    closureDiffractionKind (StepN.inflationRegime false)
      = FiniteDiffractionKind.purePoint :=
  pisot_diffractionKind

example :
    closureDiffractionKind (StepN.inflationRegime true)
      = FiniteDiffractionKind.singularContinuous :=
  salem_diffractionKind

example :
    readingDiffractionKind (regimeOf true false)
      = FiniteDiffractionKind.purePoint
      ∧ closureDiffractionKind (StepN.inflationRegime true)
        = FiniteDiffractionKind.singularContinuous :=
  ⟨finite_diffraction_classifier_agreement.1,
    finite_diffraction_classifier_agreement.2.2.2.2.1⟩

example (s : PhaseSubstitution) :
    (lebesgueType (phaseDiffractionComponent s)
      = phaseType s)
      ∧ (regimeOf (phaseTruthContent s)
        (phaseInconsistencyContent s) = phaseType s)
      ∧ (pisotSalemClass (phaseScaling s) = phaseType s)
      ∧ (closureRegime s = phaseType s) :=
  phaseType_readings_agree s

example {n : Nat} {w : Fin (n + 1) -> Bool}
    (h : forall d, w d = true) :
    FinitePurePointQuasicrystal n w false :=
  finitePurePointQuasicrystal_of_full_pisot h rfl
```

This proves a finite measured residue and a finite component classifier. The
component words are justified here only as event labels in the finite counting
measure. The new phase map proves exactly the current finite/predictor interface:
diffraction component, bigraded reading, Pisot/Salem scaling, and closure regime
share one value on that carrier. The missing layer is still a general primitive
substitution object, Fourier transformation, spectral atoms, and the analytic
readout theorem.

## Step-Depth Colimit

The step-n machinery packages another persistence shape: the colimit of the
ascending chain of step-depth moduli. At infinite step depth, the shift becomes
invisible.

The finite-step inclusion facts are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.chain_preserves_point}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.chain_inclusion}

The colimit object is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.Minfinity}

with finite-stage embeddings:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.embed}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.embed_depth_independent}

The infinite shift flow is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.sigmaInfinity}

and it is the identity:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.sigmaInfinity_id}

The bundled fixed-point statements are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.step_n_colimit_rg_fixed_point}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.step_shift_chain_colimit}

Checked:

```lean
example :
    (∀ x : Minfinity, sigmaInfinity x = x) :=
  step_n_colimit_rg_fixed_point.1

example (n : Nat) (p : Moduli.ModuliPoint) :
    sigmaInfinity (embed n p) = embed n p :=
  sigmaInfinity_embed_fixed n p
```

The phase lesson is that a fixed point here is not a magical endpoint. It is a
colimit phenomenon: advancing the step depth is identified with staying at the
same persistent moduli point.

## The Common Form

The aperiodic-persistence chapter has one common form:

* the direct limit glues finite-stage representatives by eventual agreement;
* the inverse hull separates threads by finite-stage projections;
* the finite Jeandel-Rao classes provide local nonzero cohomology witnesses;
* the substitution tower proves that the core class survives as a direct-limit
  class;
* condensate matter turns over-occupation into held inconsistency;
* contact topology turns surplus contacts into load-bearing cycle rank;
* the step-depth colimit turns shift into fixed-point behavior.

This is why Book VII is a phase volume. Tiling theory, beadwork, material
science, cohomology, and renormalization appear here as derived comparisons. The object that
organizes them is persistence of relational matter through staged generation.
