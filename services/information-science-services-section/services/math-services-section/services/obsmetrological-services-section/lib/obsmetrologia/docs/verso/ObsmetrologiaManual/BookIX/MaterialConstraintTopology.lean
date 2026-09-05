import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.GlassDynamics.Overlap
import Obsmetrologia.AperiodicOrder.GlassDynamics.Heterogeneity
import Obsmetrologia.AperiodicOrder.GlassDynamics.Basin
import Obsmetrologia.AperiodicOrder.Crystal.Glass
import Obsmetrologia.Calculus.Order.PersistentH0

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.AperiodicOrder.Crystal
open Obsmetrologia.AperiodicOrder.GlassDynamics
open Obsmetrologia.AperiodicOrder.Crystal.Glass
open Obsmetrologia.Calculus.Order
open Obsmetrologia.Thermodynamics.Temperature

private abbrev RatBasinConnectivityTransition {G : Glass}
    (γ : Glass.RatBasinFreeEnergyBridge G) :=
  Glass.RatBasinFreeEnergyBridge.BasinConnectivityTransition γ

private abbrev finiteDiffractionMass :=
  AperiodicOrder.Tiling.finiteDiffractionMass

/-!
A teaching chapter for material constraint and finite topology diagnostics.
-/

#doc (Manual) "Material constraint topology" =>

# Material Constraint Topology

The material pages must not jump from kinetic facilitation to keratin as if
there were no intervening finite material diagnostics. This page teaches the
small carriers that sit between them: configuration overlap, mobility,
metastable basin descent, and persistent degree-zero topology.

The claim-site carried here is:

* claim-site: material constraints as finite configuration, descent, and
  component-persistence diagnostics;
* phase: relational physical material after closure and finite graph carriers
  are lawful;
* generating sites: finite site lists, decidable local state equality,
  facilitation closure, graph transitions, Nat-valued Lyapunov energy, and
  edge-monotone graph filtrations;
* downstream uses: glass diagnostics, keratin lock histories, dense/liquid
  material invariants, frontier medium-range order, and comparison-atlas material
  entries;
* Lean declarations: `Obsmetrologia.AperiodicOrder.GlassDynamics.overlapCount`,
  `Obsmetrologia.AperiodicOrder.GlassDynamics.mobilityCount`,
  `Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph`,
  `Obsmetrologia.AperiodicOrder.Crystal.Glass`,
  `Obsmetrologia.Calculus.Order.GraphFiltration`,
  `Obsmetrologia.Calculus.Order.components_only_merge`;
* Blueprint/proof-tree nodes: `thm:glass-substance-bundle`,
  `thm:glass-beads-between-tiles-and-crystals`,
  `thm:glass-beads-port-law-condensate`,
  `thm:glass-substance-descent-lowers-energy`, and
  `thm:glass-substance-temperature`;
* provenance: glass, replica-overlap, dynamic-heterogeneity, energy-landscape,
  and persistent-H0 notes;
* familiar mathematical comparison: Hamming similarity, replica overlap, mobility
  field, metastable basin graph, Lyapunov descent, and persistent homology;
* reader closure: read every glass or material phrase through the finite carrier
  that makes it lawful;
* frontier status: Parisi order parameters, four-point susceptibility,
  metric alpha complexes, and finite quotient component counts remain missing
  carriers. The finite stationary temperature/Landauer bridge is present through
  `AperiodicOrder.Crystal.Glass` and through the basin-indexed glass thermalization. The
  finite H¹/Landauer basin ledger is present; analytic quotient temperature and
  critical threshold extraction remain frontier.

The governing sentence is:

> A material diagnostic enters only when its finite relational carrier is named.

## Configuration Overlap

A material configuration is a site-indexed local state assignment:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.Configuration}

The finite overlap count is:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.overlapCount}

Self-overlap and symmetry are the settled laws:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.overlapCount_self}

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.overlapCount_symm}

Checked:

```lean
example {Site State : Type} [DecidableEq State]
    (sites : List Site)
    (x : Configuration Site State) :
    overlapCount sites x x = sites.length :=
  overlapCount_self sites x
```

The familiar comparison is replica overlap. The lawful claim is only the finite
count on a listed support.

## Mobility Is The Complementary Diagnostic

Dynamic heterogeneity first appears as local change between configurations:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.changedOn}

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.mobilityCount}

Zero mobility is agreement on the listed support:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.mobility_zero_iff_agree_on_support}

Checked:

```lean
example {Site State : Type} [DecidableEq State]
    (sites : List Site)
    (x : Configuration Site State) :
    mobilityCount sites x x = 0 :=
  mobility_self sites x
```

This is not yet a four-point susceptibility or a stochastic process. It is the
finite mobility carrier that later analytic claims would have to extend.

## Basin Descent Is Lyapunov Order

The basin graph carrier packages metastable states, transitions, and a
Nat-valued energy:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph}

Strict descent is:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph.Descends}

and a descent chain strictly lowers energy:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph.descendChain_energy_lt}

The no-cycle theorem is the finite H-theorem:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph.no_descending_cycle}

Checked:

```lean
example (B : BasinGraph) (a : B.Basin) :
    ¬ B.DescendChain a a :=
  B.no_descending_cycle a
```

The phase law is Lyapunov descent. The material language is an older projection of
that order-theoretic fact.

## Glass Substance

Glass is now bundled as a material substance rather than scattered as separate
receipts. The layers are named directly:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Tiles}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads}

{docstring Obsmetrologia.AperiodicOrder.Crystal.BeadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.BeadAdjacency.tuple_eq}

{docstring Obsmetrologia.AperiodicOrder.Crystal.BeadMaterialRealization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.BeadMaterialRealization.lenticle_eq_overlap}

{docstring Obsmetrologia.AperiodicOrder.Crystal.BeadMaterialRealization.covers_lenticle_pair}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals}

The glass carrier itself is:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass}

The bead layer is proved to sit between tiles and crystals:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beads_between_tiles_and_crystals}

The bead layer also has its own carried structure before crystals read it:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.passCount}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.condensate}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.condensedContacts}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.geometricLenticle}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.geometricLenticle_eq_overlap}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.geometricLenticle_sub_left}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.geometricLenticle_sub_right}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.covers_geometricLenticle_pair}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.threadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.contactAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.cellAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.visibleAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.adjacencyTuple_eq}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.placement_cells_eq_condensed}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.thread_pass_ports_distinct}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.over_occupation_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.mirror_preserves_condensate_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Beads.loadBearing_of_condensed_crosses_threshold}

Crystals retain the bead thread law and bead condensate:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadAdjacency_tuple_eq}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadRealization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadGeometricLenticle}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadGeometricLenticle_eq_overlap}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.covers_beadGeometricLenticle_pair}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadPlacement}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadCondensedContacts}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.beadThreadLegal}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.bead_pass_ports_distinct}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.bead_over_occupation_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.mirror_preserves_beadCondensate_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.bead_loadBearing_of_condensed_crosses_threshold}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Crystals.bead_phase_spine}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.crystal_beadThreadLegal}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.crystal_bead_pass_ports_distinct}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadCondensate_eq_crystal_beadCondensate}

Quasicrystals retain the bead layer while adding finite diffraction mass:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadPassCount}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadCondensate}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadAdjacency_tuple_eq}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadRealization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadGeometricLenticle}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadGeometricLenticle_eq_overlap}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.covers_beadGeometricLenticle_pair}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadPlacement}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadCondensedContacts}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.beadThreadLegal}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.bead_pass_ports_distinct}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.bead_over_occupation_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.mirror_preserves_beadCondensate_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.bead_loadBearing_of_condensed_crosses_threshold}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.finite_diffraction_mass_univ}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.BeadPhaseSpine}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.bead_phase_spine}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Quasicrystals.bead_phase_k4_analytic_spine}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadAdjacency_eq_crystal_beadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadAdjacency_eq_quasicrystal_beadAdjacency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadRealization_eq_crystal_beadRealization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadRealization_eq_quasicrystal_beadRealization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadGeometricLenticle_eq_overlap}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.covers_beadGeometricLenticle_pair}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadPlacement_eq_crystal_beadPlacement}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadPlacement_eq_quasicrystal_beadPlacement}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadCondensedContacts_eq_quasicrystal_beadCondensedContacts}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadCondensate_eq_quasicrystal_beadCondensate}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.quasicrystal_bead_over_occupation_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.quasicrystal_mirror_preserves_beadCondensate_inconsistency}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.beadPlacement_loadBearing_of_condensed_crosses_threshold}

The proof boundary is finite.  The green bead phase proves the intermediate
carrier, port legality, condensate contradiction, mirror-stable contradiction
content, the four-adjacency carrier, clopen lenticle overlap, deterministic
placement threshold, the crystal bead spine, and the quasicrystal finite
diffraction readout.  The quasicrystal bead phase also carries the K4/FOUR
analytic spine over its finite occupation pattern.  It does not yet prove
pairwise separation of the four adjacency graphs, a visible-surface sofic factor
of the thread walk, graph-threading as a settling closed walk, probabilistic
critical fraction extraction, chromatic obstruction as an irremovable structural
defect, analytic diffraction, a full spectral theorem, or continuum embedding.

Checked:

```lean
example (G : Glass) :
    G.crystals.beads = G.beads :=
  G.beads_between_tiles_and_crystals

example (B : Beads) :
    B.adjacencyTuple =
      (B.threadAdjacency, B.contactAdjacency,
        B.cellAdjacency, B.visibleAdjacency) :=
  B.adjacencyTuple_eq

example (B : Beads)
    {p :
      Obsmetrologia.AperiodicOrder.Tiling.ThreadPass
        B.Lenticule}
    (hp : p ∈ B.thread) :
    p.2.1 ≠ p.2.2 :=
  B.thread_pass_ports_distinct hp

example (B : Beads) (n : Nat)
    (h : B.passCount.count = n + 2) :
    B.condensate.isInconsistency = true :=
  B.over_occupation_inconsistency n h

example (B : Beads) :
    B.geometricLenticle =
      Site.meet B.realization.leftPatch
        B.realization.rightPatch :=
  B.geometricLenticle_eq_overlap

example (B : Beads) :
    Site.Covers B.geometricLenticle
      [B.geometricLenticle, B.geometricLenticle] :=
  B.covers_geometricLenticle_pair

example (X : Crystals) :
    X.beadAdjacency.tuple =
      X.beads.adjacencyTuple :=
  X.beadAdjacency_tuple_eq

example (X : Crystals) :
    X.beadGeometricLenticle =
      Site.meet X.beadRealization.leftPatch
        X.beadRealization.rightPatch :=
  X.beadGeometricLenticle_eq_overlap

example (B : Beads) :
    B.placement.nerve.cells = B.condensedContacts :=
  B.placement_cells_eq_condensed

example (B : Beads)
    (h :
      AperiodicOrder.Tiling.percolationThreshold
          B.placement.nerve + 1 ≤
        B.condensedContacts) :
    AperiodicOrder.Tiling.loadBearing
      B.placement.nerve :=
  B.loadBearing_of_condensed_crosses_threshold h

example (X : Crystals) (n : Nat)
    (h : X.beadPassCount.count = n + 2) :
    X.beadCondensate.isInconsistency = true :=
  X.bead_over_occupation_inconsistency n h

example (X : Crystals)
    (h :
      AperiodicOrder.Tiling.percolationThreshold
          X.beadPlacement.nerve + 1 ≤
        X.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing
      X.beadPlacement.nerve :=
  X.bead_loadBearing_of_condensed_crosses_threshold h

example (X : Crystals) (n : Nat)
    (hocc : X.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold
          X.beadPlacement.nerve + 1 ≤
        X.beadCondensedContacts) :
    AperiodicOrder.Tiling.ThreadLegal
        X.beads.thread ∧
      X.beadCondensate.isInconsistency = true ∧
        (Charge.negate X.beadCondensate).isInconsistency =
          X.beadCondensate.isInconsistency ∧
          X.beadAdjacency.tuple =
            X.beads.adjacencyTuple ∧
            X.beadGeometricLenticle =
              Site.meet X.beadRealization.leftPatch
                X.beadRealization.rightPatch ∧
              Site.Covers X.beadGeometricLenticle
                [X.beadGeometricLenticle,
                  X.beadGeometricLenticle] ∧
                AperiodicOrder.Tiling.loadBearing
                  X.beadPlacement.nerve :=
  X.bead_phase_spine n hocc hload

example (G : Glass) :
    G.beadCondensate = G.crystals.beadCondensate :=
  G.beadCondensate_eq_crystal_beadCondensate

example (Q : Quasicrystals) (n : Nat)
    (h : Q.beadPassCount.count = n + 2) :
    Q.beadCondensate.isInconsistency = true :=
  Q.bead_over_occupation_inconsistency n h

example (Q : Quasicrystals) :
    Q.beadAdjacency.tuple =
      Q.crystals.beads.adjacencyTuple :=
  Q.beadAdjacency_tuple_eq

example (Q : Quasicrystals) :
    Site.Covers Q.beadGeometricLenticle
      [Q.beadGeometricLenticle, Q.beadGeometricLenticle] :=
  Q.covers_beadGeometricLenticle_pair

example (Q : Quasicrystals)
    (h :
      AperiodicOrder.Tiling.percolationThreshold
          Q.beadPlacement.nerve + 1 ≤
        Q.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing
      Q.beadPlacement.nerve :=
  Q.bead_loadBearing_of_condensed_crosses_threshold h

example (Q : Quasicrystals) :
    Obsmetrologia.AperiodicOrder.Tiling.finiteDiffractionMass
        Q.crystals.period Q.crystals.occupation
        Obsmetrologia.Discrete.Set.univ =
      Q.crystals.period + 1 :=
  Q.finite_diffraction_mass_univ

example (Q : Quasicrystals) (n : Nat)
    (hocc : Q.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold
          Q.beadPlacement.nerve + 1 ≤
        Q.beadCondensedContacts) :
    Quasicrystals.BeadPhaseSpine Q :=
  Q.bead_phase_spine n hocc hload

example (Q : Quasicrystals) (n : Nat)
    (v : List Obsmetrologia.Flow.ChromaticRat) (side : Bool)
    (hocc : Q.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold
          Q.beadPlacement.nerve + 1 ≤
        Q.beadCondensedContacts) :
    Quasicrystals.BeadPhaseSpine Q ∧
      Obsmetrologia.Flow.K4FourAnalyticSpine
        v Q.crystals.period Q.crystals.occupation side :=
  Q.bead_phase_k4_analytic_spine n v side hocc hload

example (G : Glass) :
    G.beadCondensate = G.quasicrystalBeadCondensate :=
  G.beadCondensate_eq_quasicrystal_beadCondensate

example (G : Glass) :
    G.beadPlacement = G.quasicrystals.beadPlacement :=
  G.beadPlacement_eq_quasicrystal_beadPlacement

example (G : Glass) :
    G.beadAdjacency = G.quasicrystals.beadAdjacency :=
  G.beadAdjacency_eq_quasicrystal_beadAdjacency

example (G : Glass) :
    G.beadRealization =
      G.quasicrystals.beadRealization :=
  G.beadRealization_eq_quasicrystal_beadRealization

example (G : Glass) :
    G.beadGeometricLenticle =
      Site.meet G.beadRealization.leftPatch
        G.beadRealization.rightPatch :=
  G.beadGeometricLenticle_eq_overlap

example (G : Glass)
    (h :
      AperiodicOrder.Tiling.percolationThreshold
          G.beadPlacement.nerve + 1 ≤
        G.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing
      G.beadPlacement.nerve :=
  G.beadPlacement_loadBearing_of_condensed_crosses_threshold
    h
```

The retained basin witness lowers energy:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.descent_lowers_energy}

The Nat-valued basin energy also has an internal rational lift:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph.rationalEnergy}

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.BasinGraph.rationalEnergy_le_of_descendChain}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.descent_lowers_rationalEnergy}

and the retained thermodynamic transition identifies temperature with the
stationary distribution while carrying positive Landauer/discharge evidence:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.temperature_eq_distribution}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.produces_creation_landauer_and_discharge}

Checked:

```lean
example (G : Glass) :
    G.basins.energy G.stop < G.basins.energy G.start :=
  G.descent_lowers_energy

example (G : Glass) :
    G.basins.rationalEnergy G.stop ≤
      G.basins.rationalEnergy G.start :=
  G.descent_lowers_rationalEnergy

example (G : Glass) :
    G.thermal.temperature =
      G.thermal.stochastic.distribution
        G.thermal.stochastic.state :=
  G.temperature_eq_distribution
```

The basin-indexed bridge puts the stochastic kernel directly on the metastable
basin landscape:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization}

Its temperature and Landauer ledger are projections from that basin carrier:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.temperature_eq_distribution}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.temperature_unique}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.ledgerAt_eq_eulerChar}

The basin support also exposes the H¹/Landauer matter ledger directly:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.h1At}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.landauerBitsAt}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.h1At_eq_landauerBitsAt}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.h0_minus_h1_eq_ledgerAt}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.loadBearingAt_iff_positive_h1At}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.produces_h1_landauer_matter_ledger}

The frozen and hopping predicates are threshold comparisons in the ordered
stochastic carrier:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.frozenAt}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.hoppingAt}

Stationarity rewrites those predicates as comparisons with the basin
distribution value:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.frozenAt_iff_distribution_le}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.hoppingAt_iff_le_distribution}

and a total ordered carrier gives the relative frozen-or-hopping dichotomy:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.threshold_total}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinThermalization.frozen_and_hopping_eq_temperature}

Checked:

```lean
example {G : Glass}
    (β : Glass.BasinThermalization G)
    (θ : β.values.carrier) :
    β.frozenAt θ ↔
      β.values.le (β.distribution β.basin) θ :=
  β.frozenAt_iff_distribution_le θ

example {G : Glass}
    (β : Glass.BasinThermalization G)
    (θ : β.values.carrier)
    (htotal :
      ∀ a b : β.values.carrier,
        β.values.le a b ∨ β.values.le b a) :
    β.frozenAt θ ∨ β.hoppingAt θ :=
  β.threshold_total θ htotal

example {G : Glass}
    (β : Glass.BasinThermalization G)
    (b : G.basins.Basin) :
    β.h1At b = β.landauerBitsAt b :=
  β.h1At_eq_landauerBitsAt b

example {G : Glass}
    (β : Glass.BasinThermalization G)
    (b : G.basins.Basin) :
    β.loadBearingAt b ↔ 0 < β.h1At b :=
  β.loadBearingAt_iff_positive_h1At b
```

This proves the finite glass substance carrier and the ordered basin threshold
bridge. It does not turn the Parisi order-parameter layer or analytic
relaxation theory green.

The rational stochastic carrier removes the extra totality hypothesis:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.temperature_eq_distribution}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.frozenAt_iff_distribution_le}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.hoppingAt_iff_le_distribution}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.threshold_total}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.ledgerAt_eq_eulerChar}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.h1At_eq_landauerBitsAt}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.loadBearingAt_iff_positive_h1At}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinThermalization.produces_h1_landauer_matter_ledger}

Checked:

```lean
example {G : Glass}
    (ρ : Glass.RatBasinThermalization G)
    (θ : Real.Internal.Rat) :
    ρ.frozenAt θ ∨ ρ.hoppingAt θ :=
  ρ.threshold_total θ

example {G : Glass}
    (ρ : Glass.RatBasinThermalization G)
    (θ : Real.Internal.Rat) :
    ρ.frozenAt θ ↔
      ρ.distribution ρ.basin ≤ θ :=
  ρ.frozenAt_iff_distribution_le θ

example {G : Glass}
    (ρ : Glass.RatBasinThermalization G)
    (b : G.basins.Basin) :
    ρ.loadBearingAt b ↔ 0 < ρ.h1At b :=
  ρ.loadBearingAt_iff_positive_h1At b
```

The local free-energy bridge reuses the lower liquid DFT carrier on this same
basin state space:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.flow}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.orbit_Omega_le_init}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.minimizer_is_equilibrium}

The bridge still projects back to temperature and matter ledger:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.temperature_eq_distribution}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.ledgerAt_eq_eulerChar}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.produces_temperature_landauer_and_descent}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.BasinFreeEnergyBridge.temperature_bridge_and_glass_rung}

Checked:

```lean
example {G : Glass}
    (γ : Glass.BasinFreeEnergyBridge G)
    (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  γ.orbit_Omega_le_init b n

example {G : Glass}
    (γ : Glass.BasinFreeEnergyBridge G) :
    γ.temperature =
      γ.thermalization.distribution
        γ.thermalization.basin :=
  γ.temperature_eq_distribution

example {G : Glass}
    (γ : Glass.BasinFreeEnergyBridge G)
    (b : G.basins.Basin)
    (θ : γ.thermalization.values.carrier) :
    (∃ T : γ.thermalization.values.carrier,
      (T = γ.thermalization.kernel.advance
              γ.thermalization.distribution
              γ.thermalization.basin /\
        T = γ.thermalization.distribution
              γ.thermalization.basin) /\
        ∀ U : γ.thermalization.values.carrier,
          U = γ.thermalization.kernel.advance
                γ.thermalization.distribution
                γ.thermalization.basin /\
            U = γ.thermalization.distribution
                γ.thermalization.basin -> U = T) /\
      γ.Omega (γ.step b) ≤ γ.Omega b /\
        Balanced γ.thermalization.flux /\
          0 < γ.thermalization.landauerCostAt
            γ.thermalization.basin /\
            0 < γ.thermalization.firing.discharge /\
              (γ.thermalization.frozenAt θ ↔
                γ.thermalization.values.le
                  (γ.thermalization.distribution
                    γ.thermalization.basin) θ) :=
  γ.temperature_bridge_and_glass_rung b θ
```

The rational bridge puts the rational threshold and rational free-energy flow
on the same carrier:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.orbit_Omega_le_init}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.threshold_total}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.produces_glass_rung}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.produces_h1_glass_rung}

Checked:

```lean
example {G : Glass}
    (γ : Glass.RatBasinFreeEnergyBridge G)
    (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  γ.orbit_Omega_le_init b n

example {G : Glass}
    (γ : Glass.RatBasinFreeEnergyBridge G)
    (θ : Real.Internal.Rat) :
    γ.thermalization.frozenAt θ ∨
      γ.thermalization.hoppingAt θ :=
  γ.threshold_total θ

example {G : Glass}
    (γ : Glass.RatBasinFreeEnergyBridge G)
    (b : G.basins.Basin)
    (θ : Real.Internal.Rat) :
    let β := γ.thermalization.toBasinThermalization
    γ.Omega (γ.step b) ≤ γ.Omega b /\
      γ.temperature =
        γ.thermalization.distribution
          γ.thermalization.basin /\
        (γ.thermalization.frozenAt θ ∨
          γ.thermalization.hoppingAt θ) /\
          γ.thermalization.h1At b =
            γ.thermalization.landauerBitsAt b /\
            (γ.thermalization.loadBearingAt b ↔
              0 < γ.thermalization.h1At b) /\
              Balanced β.flux /\
                0 <
                  β.landauerCostAt
                    γ.thermalization.basin /\
                  0 < γ.thermalization.firing.discharge :=
  γ.produces_h1_glass_rung b θ
```

This is the glass-local marriage of basin settling, rational free energy,
stochastic temperature, and the H¹/Landauer support ledger. The analytic
continuum DFT layer, real quotient temperature, critical basin-connectivity
extraction, and Parisi order-parameter layer remain frontier.

## Persistent H0 Is Component Coarsening

Persistent topology enters only as finite graph connectivity
{name Obsmetrologia.Calculus.Order.PathConn}`PathConn` over a
growing filtration:

{docstring Obsmetrologia.Calculus.Order.GraphFiltration}

Edge growth lifts to connectivity growth:

{docstring Obsmetrologia.Calculus.Order.PathConn.mono}

and components only merge:

{docstring Obsmetrologia.Calculus.Order.components_only_merge}

The rational glass bridge can retain a finite connectivity threshold on the
basin filtration:

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.BasinConnectivityTransition}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.BasinConnectivityTransition.connected_later}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.BasinConnectivityTransition.glassy_iff_temperature_below_connectivity_transition}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.BasinConnectivityTransition.glassy_iff_distribution_below_connectivity_transition}

{docstring Obsmetrologia.AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge.produces_connectivity_glass_rung}

Checked:

```lean
example {V : Type}
    (F : GraphFiltration V) {m n : Nat}
    (hmn : m <= n) {u v : V}
    (h : PathConn (F.graphAt m) u v) :
    PathConn (F.graphAt n) u v :=
  components_only_merge F hmn h

example {G : Glass}
    (γ : Glass.RatBasinFreeEnergyBridge G)
    (b : G.basins.Basin)
    (C : RatBasinConnectivityTransition γ) :
    let β := γ.thermalization.toBasinThermalization
    PathConn
      (C.filtration.graphAt C.laterStage)
      C.source C.target /\
      γ.Omega (γ.step b) ≤ γ.Omega b /\
        γ.temperature =
          γ.thermalization.distribution
            γ.thermalization.basin /\
          (C.glassy ↔ C.belowConnectivityTransition) /\
            (C.glassy ↔
              γ.thermalization.distribution
                  γ.thermalization.basin ≤
                C.threshold) /\
            Balanced β.flux /\
              0 <
                β.landauerCostAt
                  γ.thermalization.basin /\
                0 < γ.thermalization.firing.discharge :=
  γ.produces_connectivity_glass_rung b C
```

The manual may therefore say "persistent H0" only in this relation-coarsening
sense, and may say "glassy below a basin-connectivity threshold" only for this
retained finite threshold carrier. Counting components, metric filtrations,
alpha complexes, critical threshold extraction, and persistent barcodes are
frontier until their carriers are added.

## Reader Closure

This page is upstream of keratin. Keratin adds irreversible contact locking.
The present page supplies the finite diagnostics that make material comparison,
heterogeneity, descent, and component persistence lawful before the lock-history
carrier appears.
