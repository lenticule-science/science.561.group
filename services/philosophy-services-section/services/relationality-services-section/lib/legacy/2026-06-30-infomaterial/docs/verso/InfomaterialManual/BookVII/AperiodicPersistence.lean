import InfomaterialManual.DocSetup
import Infomaterial.Persistence.Aperiodic.InverseHull
import Infomaterial.Persistence.Aperiodic.MatterTopology
import Infomaterial.Persistence.Aperiodic.Percolation
import Infomaterial.Persistence.Aperiodic.Diffraction
import Infomaterial.Persistence.Aperiodic.StepN.FixedPoint
import Infomaterial.Persistence.Aperiodic.Witness.JeandelRaoSubstitutionTower

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Cohomology
open Infomaterial.Discrete
open Infomaterial.Persistence.Aperiodic
open Infomaterial.Persistence.Aperiodic.StepN
open Infomaterial.Persistence.Aperiodic.Witness

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
  substitution towers, condensate charges, contact-network cycle rank,
  step-depth colimits;
* Lean carriers: `Infomaterial.Persistence.Aperiodic.AndersonPutnam`,
  `Infomaterial.Persistence.Aperiodic.InverseHull`,
  `Infomaterial.Persistence.Aperiodic.Witness.JeandelRao`,
  `Infomaterial.Persistence.Aperiodic.Witness.JeandelRaoSubstitution`,
  `Infomaterial.Persistence.Aperiodic.Witness.JeandelRaoSubstitutionTower`,
  `Infomaterial.Persistence.Aperiodic.PortGraph`,
  `Infomaterial.Persistence.Aperiodic.CondensateMatter`,
  `Infomaterial.Persistence.Aperiodic.MatterTopology`,
  `Infomaterial.Persistence.Aperiodic.StepN.FixedPoint`;
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

## Direct Limit And Inverse Hull

The Anderson-Putnam side begins with a directed system of finite-stage
cohomologies:

{docstring Infomaterial.Persistence.Aperiodic.DirectedSystem}

The relation defining the colimit is eventual equality:

{docstring Infomaterial.Persistence.Aperiodic.DirectedSystem.Eventually}

and the colimit itself is:

{docstring Infomaterial.Persistence.Aperiodic.DirectedSystem.Colimit}

The concrete constant model is:

{docstring Infomaterial.Persistence.Aperiodic.apSystem}

{docstring Infomaterial.Persistence.Aperiodic.apSystem_stage_independent}

The geometric side is the inverse system:

{docstring Infomaterial.Persistence.Aperiodic.InverseSystem}

with threads as coherent finite-stage readings:

{docstring Infomaterial.Persistence.Aperiodic.InverseSystem.Thread}

and hull as the inverse limit:

{docstring Infomaterial.Persistence.Aperiodic.InverseSystem.Hull}

The hull is separated by its stages:

{docstring Infomaterial.Persistence.Aperiodic.InverseSystem.hull_separated_by_stages}

and paired to the cohomological classifying invariant by the seam:

{docstring Infomaterial.Persistence.Aperiodic.seamMap}

{docstring Infomaterial.Persistence.Aperiodic.hull_pairs_clinv}

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

## Finite Cohomology Witnesses

The Jeandel-Rao carrier is deliberately finite. It does not claim the whole
aperiodicity theorem. It provides local cohomological witnesses extracted from
finite one-vertex Anderson-Putnam complexes.

The complex carrier is:

{docstring Infomaterial.Persistence.Aperiodic.Witness.OneVertexComplex}

The closedness and nonzero predicates are:

{docstring Infomaterial.Persistence.Aperiodic.Witness.OneVertexComplex.IsCocycle}

{docstring Infomaterial.Persistence.Aperiodic.Witness.OneVertexComplex.NonzeroH1Class}

The decorated witness and marker-ring core are:

{docstring Infomaterial.Persistence.Aperiodic.Witness.jrComplex}

{docstring Infomaterial.Persistence.Aperiodic.Witness.phi}

{docstring Infomaterial.Persistence.Aperiodic.Witness.markerRingComplex}

{docstring Infomaterial.Persistence.Aperiodic.Witness.b3}

The finite witness theorems are:

{docstring Infomaterial.Persistence.Aperiodic.Witness.jeandelRaoMarker01_nonzero_h1_class}

{docstring Infomaterial.Persistence.Aperiodic.Witness.markerRing_b3_nonzero_h1_class}

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

{docstring Infomaterial.Persistence.Aperiodic.Witness.subEdge}

{docstring Infomaterial.Persistence.Aperiodic.Witness.subPull}

The pullback sends the marker-ring core to the decorated witness:

{docstring Infomaterial.Persistence.Aperiodic.Witness.subPull_b3}

and preserves cocycles:

{docstring Infomaterial.Persistence.Aperiodic.Witness.subPull_cocycle}

The bundled one-rung theorem is:

{docstring Infomaterial.Persistence.Aperiodic.Witness.jr_substitution_pullback}

The recognizability return closes the rung into an endomorphism:

{docstring Infomaterial.Persistence.Aperiodic.Witness.recPull}

{docstring Infomaterial.Persistence.Aperiodic.Witness.sigma}

The core class is fixed by the substitution:

{docstring Infomaterial.Persistence.Aperiodic.Witness.sigma_b3}

and every iterate fixes it:

{docstring Infomaterial.Persistence.Aperiodic.Witness.sigmaIter_b3}

The nonzero direct-limit statement is:

{docstring Infomaterial.Persistence.Aperiodic.Witness.NonzeroInDirectLimit}

{docstring Infomaterial.Persistence.Aperiodic.Witness.b3_nonzero_in_direct_limit}

{docstring Infomaterial.Persistence.Aperiodic.Witness.jr_substitution_tower}

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

## Condensates And Material Topology

Aperiodic matter is not only tiling cohomology. The same phase also carries
material witnesses: port graphs, condensate charges, and load-bearing networks.

A port graph begins with thread passes through lenticules:

{docstring Infomaterial.Persistence.Aperiodic.ThreadPass}

and the hole transition is a weave crossing:

{docstring Infomaterial.Persistence.Aperiodic.holeTransition}

{docstring Infomaterial.Persistence.Aperiodic.holeTransition_eq_warpAlt}

Legality is threading through:

{docstring Infomaterial.Persistence.Aperiodic.Legal}

{docstring Infomaterial.Persistence.Aperiodic.legal_iff_distinct}

The condensate charge reads occupation count as relational value:

{docstring Infomaterial.Persistence.Aperiodic.condensate}

{docstring Infomaterial.Persistence.Aperiodic.over_occupation_inconsistency}

The material-level density carrier is:

{docstring Infomaterial.Persistence.Aperiodic.Material}

{docstring Infomaterial.Persistence.Aperiodic.rigidity}

{docstring Infomaterial.Persistence.Aperiodic.rigid_iff_overoccupied}

{docstring Infomaterial.Persistence.Aperiodic.floppy_of_all_le_one}

But load-bearing structure is topological:

{docstring Infomaterial.Persistence.Aperiodic.loadBearing}

{docstring Infomaterial.Persistence.Aperiodic.loadBearing_iff_not_forest}

{docstring Infomaterial.Persistence.Aperiodic.jamming_click}

The percolation layer sharpens the old density story. The threshold is not
defined by the number of condensed sites alone, but by excess contact over the
spanning-forest boundary:

{docstring Infomaterial.Persistence.Aperiodic.percolationThreshold}

{docstring Infomaterial.Persistence.Aperiodic.h1rank_eq_excess}

{docstring Infomaterial.Persistence.Aperiodic.loadBearing_iff_critical}

The density warning is a theorem rather than a slogan:

{docstring Infomaterial.Persistence.Aperiodic.density_necessary}

{docstring Infomaterial.Persistence.Aperiodic.density_not_sufficient}

and the first FOUR-placement carrier records the missing topology explicitly:

{docstring Infomaterial.Persistence.Aperiodic.PlacementGraph}

{docstring Infomaterial.Persistence.Aperiodic.PlacementGraph.condensedContacts}

{docstring Infomaterial.Persistence.Aperiodic.PlacementGraph.loadBearing_of_condensed_crosses_threshold}

The minimal gauge-orbit witness is correspondingly finite. A D8 orbit supplies
the condensed contacts needed for the two-contact cyclic nerve:

{docstring Infomaterial.Persistence.Aperiodic.gauge_orbit_equidistributes}

{docstring Infomaterial.Persistence.Aperiodic.condensate_baserate_quarter}

{docstring Infomaterial.Persistence.Aperiodic.PlacementGraph.gaugeOrbitCyclic_loadBearing}

At the smallest local cycle, the same carrier ties load-bearing to one Landauer
bit:

{docstring Infomaterial.Persistence.Aperiodic.fundamental_cycle_is_local_h1}

{docstring Infomaterial.Persistence.Aperiodic.fundamental_cycle_one_bit}

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

example (a : Charge) :
    loadBearing (PlacementGraph.gaugeOrbitCyclic a).nerve :=
  PlacementGraph.gaugeOrbitCyclic_loadBearing a

example :
    Landauer.landauerBits fundamentalNerve = 1
      ∧ (forall a : Charge,
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

## Finite Boundary Residue

The autocorrelation page now has a measured finite projection. The displacement
carrier is a finite sample space:

{docstring Infomaterial.Persistence.Aperiodic.displacementSpace}

and the finite diffraction mass is the pushforward of counting measure along the
finite autocorrelation function:

{docstring Infomaterial.Persistence.Aperiodic.finiteDiffractionMass}

It inherits the finite measure laws:

{docstring Infomaterial.Persistence.Aperiodic.finiteDiffractionMass_empty}

{docstring Infomaterial.Persistence.Aperiodic.finiteDiffractionMass_univ}

{docstring Infomaterial.Persistence.Aperiodic.finiteDiffractionMass_mono}

The homometry theorem gives the boundary-observational direction that is
available in the finite core:

{docstring Infomaterial.Persistence.Aperiodic.homometric_finiteDiffractionMass_eq}

Checked:

```lean
example (n : Nat) (w : Fin (n + 1) -> Bool) :
    finiteDiffractionMass n w Set.univ = n + 1 :=
  finiteDiffractionMass_univ n w

example {n : Nat} {w w' : Fin (n + 1) -> Bool}
    (h : Homometric n w w') (A : Set Nat) :
    finiteDiffractionMass n w A =
      finiteDiffractionMass n w' A :=
  homometric_finiteDiffractionMass_eq h A
```

This earns a finite measured residue, not the analytic diffraction spectrum.
The missing layer is still Fourier transformation and spectral type
classification.

## Step-Depth Colimit

The step-n machinery packages another persistence shape: the colimit of the
ascending chain of step-depth moduli. At infinite step depth, the shift becomes
invisible.

The finite-step inclusion facts are:

{docstring Infomaterial.Persistence.Aperiodic.StepN.chain_preserves_point}

{docstring Infomaterial.Persistence.Aperiodic.StepN.chain_inclusion}

The colimit object is:

{docstring Infomaterial.Persistence.Aperiodic.StepN.Minfinity}

with finite-stage embeddings:

{docstring Infomaterial.Persistence.Aperiodic.StepN.embed}

{docstring Infomaterial.Persistence.Aperiodic.StepN.embed_depth_independent}

The infinite shift flow is:

{docstring Infomaterial.Persistence.Aperiodic.StepN.sigmaInfinity}

and it is the identity:

{docstring Infomaterial.Persistence.Aperiodic.StepN.sigmaInfinity_id}

The bundled fixed-point statements are:

{docstring Infomaterial.Persistence.Aperiodic.StepN.step_n_colimit_rg_fixed_point}

{docstring Infomaterial.Persistence.Aperiodic.StepN.step_shift_chain_colimit}

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
