import InfomaterialManual.DocSetup
import Infomaterial.Relational.Material.Constraint.Overlap
import Infomaterial.Relational.Material.Constraint.Heterogeneity
import Infomaterial.Relational.Material.Constraint.Basin
import Infomaterial.Relational.Material.Glass
import Infomaterial.Relational.Material.Topology.PersistentH0

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Material.Glass
open Infomaterial.Relational.Material.Topology

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
* Lean declarations: `Infomaterial.Relational.Material.Glass.overlapCount`,
  `Infomaterial.Relational.Material.Glass.mobilityCount`,
  `Infomaterial.Relational.Material.Glass.BasinGraph`,
  `Infomaterial.Relational.Material.Glass.Substance`,
  `Infomaterial.Relational.Material.Topology.GraphFiltration`,
  `Infomaterial.Relational.Material.Topology.components_only_merge`;
* Blueprint/proof-tree nodes: `thm:glass-substance-bundle`,
  `thm:glass-beads-between-tiles-and-crystals`,
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
  `Glass.Substance` and through the basin-indexed glass thermalization.

The governing sentence is:

> A material diagnostic enters only when its finite relational carrier is named.

## Configuration Overlap

A material configuration is a site-indexed local state assignment:

{docstring Infomaterial.Relational.Material.Glass.Configuration}

The finite overlap count is:

{docstring Infomaterial.Relational.Material.Glass.overlapCount}

Self-overlap and symmetry are the settled laws:

{docstring Infomaterial.Relational.Material.Glass.overlapCount_self}

{docstring Infomaterial.Relational.Material.Glass.overlapCount_symm}

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

{docstring Infomaterial.Relational.Material.Glass.changedOn}

{docstring Infomaterial.Relational.Material.Glass.mobilityCount}

Zero mobility is agreement on the listed support:

{docstring Infomaterial.Relational.Material.Glass.mobility_zero_iff_agree_on_support}

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

{docstring Infomaterial.Relational.Material.Glass.BasinGraph}

Strict descent is:

{docstring Infomaterial.Relational.Material.Glass.BasinGraph.Descends}

and a descent chain strictly lowers energy:

{docstring Infomaterial.Relational.Material.Glass.BasinGraph.descendChain_energy_lt}

The no-cycle theorem is the finite H-theorem:

{docstring Infomaterial.Relational.Material.Glass.BasinGraph.no_descending_cycle}

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

{docstring Infomaterial.Relational.Material.Glass.Tiles}

{docstring Infomaterial.Relational.Material.Glass.Beads}

{docstring Infomaterial.Relational.Material.Glass.Crystals}

{docstring Infomaterial.Relational.Material.Glass.Quasicrystals}

The glass carrier itself is:

{docstring Infomaterial.Relational.Material.Glass.Substance}

The bead layer is proved to sit between tiles and crystals:

{docstring Infomaterial.Relational.Material.Glass.Substance.beads_between_tiles_and_crystals}

Checked:

```lean
example (G : Substance) :
    G.crystals.beads = G.beads :=
  G.beads_between_tiles_and_crystals
```

The retained basin witness lowers energy:

{docstring Infomaterial.Relational.Material.Glass.Substance.descent_lowers_energy}

The Nat-valued basin energy also has an internal rational lift:

{docstring Infomaterial.Relational.Material.Glass.BasinGraph.rationalEnergy}

{docstring Infomaterial.Relational.Material.Glass.BasinGraph.rationalEnergy_le_of_descendChain}

{docstring Infomaterial.Relational.Material.Glass.Substance.descent_lowers_rationalEnergy}

and the retained thermodynamic transition identifies temperature with the
stationary distribution while carrying positive Landauer/discharge evidence:

{docstring Infomaterial.Relational.Material.Glass.Substance.temperature_eq_distribution}

{docstring Infomaterial.Relational.Material.Glass.Substance.produces_creation_landauer_and_discharge}

Checked:

```lean
example (G : Substance) :
    G.basins.energy G.stop < G.basins.energy G.start :=
  G.descent_lowers_energy

example (G : Substance) :
    G.basins.rationalEnergy G.stop ≤
      G.basins.rationalEnergy G.start :=
  G.descent_lowers_rationalEnergy

example (G : Substance) :
    G.thermal.temperature =
      G.thermal.stochastic.distribution
        G.thermal.stochastic.state :=
  G.temperature_eq_distribution
```

The basin-indexed bridge puts the stochastic kernel directly on the metastable
basin landscape:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization}

Its temperature and Landauer ledger are projections from that basin carrier:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.temperature_eq_distribution}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.ledgerAt_eq_eulerChar}

The frozen and hopping predicates are threshold comparisons in the ordered
stochastic carrier:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.frozenAt}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.hoppingAt}

Stationarity rewrites those predicates as comparisons with the basin
distribution value:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.frozenAt_iff_distribution_le}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.hoppingAt_iff_le_distribution}

and a total ordered carrier gives the relative frozen-or-hopping dichotomy:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.threshold_total}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinThermalization.frozen_and_hopping_eq_temperature}

Checked:

```lean
example {G : Substance}
    (β : Substance.BasinThermalization G)
    (θ : β.values.carrier) :
    β.frozenAt θ ↔
      β.values.le (β.distribution β.basin) θ :=
  β.frozenAt_iff_distribution_le θ

example {G : Substance}
    (β : Substance.BasinThermalization G)
    (θ : β.values.carrier)
    (htotal :
      ∀ a b : β.values.carrier,
        β.values.le a b ∨ β.values.le b a) :
    β.frozenAt θ ∨ β.hoppingAt θ :=
  β.threshold_total θ htotal
```

This proves the finite glass substance carrier and the ordered basin threshold
bridge. It does not turn the Parisi order-parameter layer or analytic
relaxation theory green.

The local free-energy bridge reuses the lower liquid DFT carrier on this same
basin state space:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.flow}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.orbit_Omega_le_init}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.minimizer_is_equilibrium}

The bridge still projects back to temperature and matter ledger:

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.temperature_eq_distribution}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.ledgerAt_eq_eulerChar}

{docstring Infomaterial.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.produces_temperature_landauer_and_descent}

Checked:

```lean
example {G : Substance}
    (γ : Substance.BasinFreeEnergyBridge G)
    (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  γ.orbit_Omega_le_init b n

example {G : Substance}
    (γ : Substance.BasinFreeEnergyBridge G) :
    γ.temperature =
      γ.thermalization.distribution
        γ.thermalization.basin :=
  γ.temperature_eq_distribution
```

This is the glass-local marriage of basin settling, rational free energy,
stochastic temperature, and Landauer support. The analytic continuum DFT layer
and Parisi order-parameter layer remain frontier.

## Persistent H0 Is Component Coarsening

Persistent topology enters only as finite graph connectivity
{name Infomaterial.Relational.Material.Topology.PathConn}`PathConn` over a
growing filtration:

{docstring Infomaterial.Relational.Material.Topology.GraphFiltration}

Edge growth lifts to connectivity growth:

{docstring Infomaterial.Relational.Material.Topology.PathConn.mono}

and components only merge:

{docstring Infomaterial.Relational.Material.Topology.components_only_merge}

Checked:

```lean
example {V : Type}
    (F : GraphFiltration V) {m n : Nat}
    (hmn : m <= n) {u v : V}
    (h : PathConn (F.graphAt m) u v) :
    PathConn (F.graphAt n) u v :=
  components_only_merge F hmn h
```

The manual may therefore say "persistent H0" only in this relation-coarsening
sense. Counting components, metric filtrations, alpha complexes, and persistent
barcodes are frontier until their carriers are added.

## Reader Closure

This page is upstream of keratin. Keratin adds irreversible contact locking.
The present page supplies the finite diagnostics that make material comparison,
heterogeneity, descent, and component persistence lawful before the lock-history
carrier appears.
