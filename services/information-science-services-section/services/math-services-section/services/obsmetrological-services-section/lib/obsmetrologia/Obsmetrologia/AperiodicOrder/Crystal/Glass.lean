import Obsmetrologia.AperiodicOrder.GlassDynamics.Overlap
import Obsmetrologia.AperiodicOrder.GlassDynamics.Heterogeneity
import Obsmetrologia.AperiodicOrder.GlassDynamics.Basin
import Obsmetrologia.AperiodicOrder.GlassDynamics.KCM
import Obsmetrologia.AperiodicOrder.Crystal.Quasicrystal
import Obsmetrologia.Calculus.Real.Multiplication
import Obsmetrologia.Calculus.Probability.PoissonSettling
import Obsmetrologia.KineticTheory.Liquid.DensityFunctionalFlow
import Obsmetrologia.Calculus.Order.PersistentH0
import Obsmetrologia.Thermodynamics.Temperature

/-!
# Glass: quasicrystal support plus finite glass diagnostics

`Glass` is the glass phase of substance: quasicrystal support plus finite
glass diagnostics (overlap, dynamic heterogeneity, basin descent,
kinetically constrained activation) and a lifted thermodynamic transition.

The results are projection theorems from that bundle. They do not identify
glass with the analytic Parisi layer; they prove that a glass phase retains
the already-built finite skeleton and the stationary-temperature bridge.

## Main definitions

* `Glass`.
* `Glass.BasinThermalization`, `Glass.RatBasinThermalization`,
  `Glass.BasinFreeEnergyBridge`, `Glass.RatBasinFreeEnergyBridge`.

## Main results

* `Glass.made_from_tiles`, `Glass.beads_between_tiles_and_crystals`,
  `Glass.quasicrystals_made_from_crystals` record that a glass phase is
  still the same tile, projected back down through every rung.
* `Glass.descent_lowers_energy` and `Glass.no_descending_cycle` expose the
  basin-graph Lyapunov law.
* `Glass.self_overlap_left` and `Glass.mobility_self_left` expose the finite
  overlap and dynamic-heterogeneity laws.
* `Glass.temperature_eq_distribution` and
  `Glass.produces_creation_landauer_and_discharge` expose the temperature
  bridge and matter ledger.
* `Glass.BasinThermalization.temperature_eq_distribution` specializes the
  stochastic temperature bridge to the basin landscape itself.
* `Glass.BasinThermalization.ledgerAt_eq_eulerChar` records the basin-indexed
  Landauer ledger.
* `Glass.BasinThermalization.produces_h1_landauer_matter_ledger` records the
  basin-indexed `H¹`/Landauer matter ledger.
* `Glass.BasinThermalization.frozenAt_iff_distribution_le` and
  `Glass.BasinThermalization.hoppingAt_iff_le_distribution` lift the ordered
  stochastic carrier into frozen/hopping threshold predicates.
* `Glass.RatBasinThermalization.threshold_total` specializes the
  frozen/hopping threshold to the rational stochastic carrier.
* `Glass.BasinFreeEnergyBridge.orbit_Omega_le_init` reuses the lower liquid
  DFT free-energy descent over the glass basin landscape.
* `Glass.RatBasinFreeEnergyBridge.produces_glass_rung` combines rational
  temperature thresholding, rational free-energy descent, and the Landauer
  ledger in one basin carrier.

## Tags

glass, tiles, beads, crystals, quasicrystals, temperature, Landauer
-/

namespace Obsmetrologia
namespace AperiodicOrder.Crystal

open Obsmetrologia.Discrete (Graph)
open Obsmetrologia.Probability.Stochastic (StochSemiring MarkovKernel IsStationary)
open Obsmetrologia.Thermodynamics.Temperature
open Obsmetrologia.AperiodicOrder.GlassDynamics

/-- A glass material substance: quasicrystal support plus finite glass
diagnostics and a lifted thermodynamic transition. -/
structure Glass where
  /-- The quasicrystal layer below glass. -/
  quasicrystals : Quasicrystals
  /-- Sites for glass configurations. -/
  Site : Type
  /-- Local states of glass configurations. -/
  State : Type
  /-- Decidable local-state equality, needed for finite overlap and mobility. -/
  stateEq : DecidableEq State
  /-- The finite support on which configurations are compared. -/
  sites : List Site
  /-- The left glass configuration. -/
  left : Configuration Site State
  /-- The right glass configuration. -/
  right : Configuration Site State
  /-- The metastable basin landscape. -/
  basins : BasinGraph
  /-- The starting basin of a witnessed descent. -/
  start : basins.Basin
  /-- The ending basin of a witnessed descent. -/
  stop : basins.Basin
  /-- A strict descent chain through the basin landscape. -/
  descent : basins.DescendChain start stop
  /-- Sites for the kinetically constrained activation carrier. -/
  KcmSite : Type
  /-- Listed sites used by the activation step. -/
  activationSites : List KcmSite
  /-- The facilitation graph. -/
  facilitation : Graph KcmSite
  /-- The seed activation field. -/
  seed : KcmSite → Bool
  /-- State space for the thermodynamic transition. -/
  ThermoState : Type
  /-- Stochastic value semiring for the thermodynamic transition. -/
  thermoValues : StochSemiring
  /-- The lifted transition carrying stationary temperature, Landauer support,
  and hard-flow discharge. -/
  thermal :
    Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition
      ThermoState thermoValues

namespace Glass

/-- The tile layer of a glass substance. -/
def tiles (G : Glass) : Tiles :=
  G.quasicrystals.crystals.beads.tiles

/-- The bead layer of a glass substance. -/
def beads (G : Glass) : Beads :=
  G.quasicrystals.crystals.beads

/-- The crystal layer of a glass substance. -/
def crystals (G : Glass) : Crystals :=
  G.quasicrystals.crystals

/-- The bead condensate reading carried upward by the glass substance. -/
def beadCondensate (G : Glass) : Reading :=
  G.beads.condensate

/-- The bead condensate reading carried upward through the quasicrystal layer. -/
def quasicrystalBeadCondensate (G : Glass) : Reading :=
  G.quasicrystals.beadCondensate

/-- The four bead adjacency graphs carried upward through the material spine. -/
def beadAdjacency (G : Glass) : BeadAdjacency G.beads.Lenticule :=
  G.beads.adjacency

/-- The bead material realization carried upward through the material spine. -/
def beadRealization (G : Glass) : BeadMaterialRealization :=
  G.beads.realization

/-- The site-level bead lenticle carried upward through the material spine. -/
def beadGeometricLenticle (G : Glass) : Site.Clopen :=
  G.beads.geometricLenticle

/-- The bead placement carried upward through the crystal and quasicrystal
layers. -/
def beadPlacement (G : Glass) : AperiodicOrder.Tiling.PlacementGraph :=
  G.beads.placement

/-- The condensed bead-contact count carried upward through the material spine. -/
def beadCondensedContacts (G : Glass) : Nat :=
  G.beads.condensedContacts

/-- The finite overlap count retained by a glass substance. -/
def overlap (G : Glass) : Nat :=
  letI := G.stateEq
  overlapCount G.sites G.left G.right

/-- The finite mobility count retained by a glass substance. -/
def mobility (G : Glass) : Nat :=
  letI := G.stateEq
  mobilityCount G.sites G.left G.right

/-- A glass substance reaches its tile layer through its beads. -/
theorem made_from_tiles (G : Glass) : G.beads.tiles = G.tiles :=
  rfl

/-- Beads are the intermediate layer between tiles and crystals. -/
theorem beads_between_tiles_and_crystals (G : Glass) : G.crystals.beads = G.beads :=
  rfl

/-- The quasicrystal layer is made from the crystal layer. -/
theorem quasicrystals_made_from_crystals (G : Glass) :
    G.quasicrystals.crystals = G.crystals :=
  rfl

/-- A glass substance retains the legal bead thread under its crystal layer. -/
theorem crystal_beadThreadLegal (G : Glass) :
    AperiodicOrder.Tiling.ThreadLegal G.crystals.beads.thread :=
  G.crystals.beadThreadLegal

/-- Every bead-thread pass retained by the glass crystal routes through
distinct ports. -/
theorem crystal_bead_pass_ports_distinct (G : Glass)
    {p : AperiodicOrder.Tiling.ThreadPass G.crystals.beads.Lenticule}
    (hp : p ∈ G.crystals.beads.thread) : p.2.1 ≠ p.2.2 :=
  G.crystals.bead_pass_ports_distinct hp

/-- The glass-level bead condensate is the crystal's carried bead condensate. -/
theorem beadCondensate_eq_crystal_beadCondensate (G : Glass) :
    G.beadCondensate = G.crystals.beadCondensate :=
  rfl

/-- The glass-level bead condensate is the quasicrystal's carried bead
condensate. -/
theorem beadCondensate_eq_quasicrystal_beadCondensate (G : Glass) :
    G.beadCondensate = G.quasicrystalBeadCondensate :=
  rfl

/-- The glass-level bead adjacency bundle is the crystal's carried bead
adjacency bundle. -/
theorem beadAdjacency_eq_crystal_beadAdjacency (G : Glass) :
    G.beadAdjacency = G.crystals.beadAdjacency :=
  rfl

/-- The glass-level bead adjacency bundle is the quasicrystal's carried bead
adjacency bundle. -/
theorem beadAdjacency_eq_quasicrystal_beadAdjacency (G : Glass) :
    G.beadAdjacency = G.quasicrystals.beadAdjacency :=
  rfl

/-- The glass-level bead material realization is the crystal's carried
realization. -/
theorem beadRealization_eq_crystal_beadRealization (G : Glass) :
    G.beadRealization = G.crystals.beadRealization :=
  rfl

/-- The glass-level bead material realization is the quasicrystal's carried
realization. -/
theorem beadRealization_eq_quasicrystal_beadRealization (G : Glass) :
    G.beadRealization = G.quasicrystals.beadRealization :=
  rfl

/-- The glass-level site lenticle is the overlap of its two material patches. -/
theorem beadGeometricLenticle_eq_overlap (G : Glass) :
    G.beadGeometricLenticle =
      Site.meet G.beadRealization.leftPatch G.beadRealization.rightPatch :=
  G.beads.geometricLenticle_eq_overlap

/-- Pulling the glass-level bead cover back to its site-level lenticle gives the
duplicated overlap cover. -/
theorem covers_beadGeometricLenticle_pair (G : Glass) :
    Site.Covers G.beadGeometricLenticle
      [G.beadGeometricLenticle, G.beadGeometricLenticle] :=
  G.beads.covers_geometricLenticle_pair

/-- The glass-level bead placement is the crystal's carried bead placement. -/
theorem beadPlacement_eq_crystal_beadPlacement (G : Glass) :
    G.beadPlacement = G.crystals.beadPlacement :=
  rfl

/-- The glass-level bead placement is the quasicrystal's carried bead placement. -/
theorem beadPlacement_eq_quasicrystal_beadPlacement (G : Glass) :
    G.beadPlacement = G.quasicrystals.beadPlacement :=
  rfl

/-- The glass-level condensed contact count is the quasicrystal's carried bead
contact count. -/
theorem beadCondensedContacts_eq_quasicrystal_beadCondensedContacts (G : Glass) :
    G.beadCondensedContacts = G.quasicrystals.beadCondensedContacts :=
  rfl

/-- A glass substance whose bead support is occupied at least twice carries the
held contradiction pole through its quasicrystal layer. -/
theorem quasicrystal_bead_over_occupation_inconsistency (G : Glass) (n : Nat)
    (h : G.quasicrystals.beadPassCount.count = n + 2) :
    G.quasicrystalBeadCondensate.isInconsistency = true :=
  G.quasicrystals.bead_over_occupation_inconsistency n h

/-- Mirroring the bead condensate carried by the quasicrystal layer preserves
contradiction content. -/
theorem quasicrystal_mirror_preserves_beadCondensate_inconsistency (G : Glass) :
    (Reading.negate G.quasicrystalBeadCondensate).isInconsistency =
      G.quasicrystalBeadCondensate.isInconsistency :=
  G.quasicrystals.mirror_preserves_beadCondensate_inconsistency

/-- A glass substance's bead placement bears load once its condensed contacts
cross the finite percolation threshold. -/
theorem beadPlacement_loadBearing_of_condensed_crosses_threshold (G : Glass)
    (h : AperiodicOrder.Tiling.percolationThreshold G.beadPlacement.nerve + 1 ≤
      G.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing G.beadPlacement.nerve :=
  G.beads.loadBearing_of_condensed_crosses_threshold h

/-- The witnessed basin descent strictly lowers energy. -/
theorem descent_lowers_energy (G : Glass) :
    G.basins.energy G.stop < G.basins.energy G.start :=
  G.basins.descendChain_energy_lt G.descent

/-- The witnessed basin descent also lowers the internal rational free-energy
lift of the basin landscape. -/
theorem descent_lowers_rationalEnergy (G : Glass) :
    G.basins.rationalEnergy G.stop ≤ G.basins.rationalEnergy G.start :=
  G.basins.rationalEnergy_le_of_descendChain G.descent

/-- No basin in the retained landscape descends back to itself. -/
theorem no_descending_cycle (G : Glass) (b : G.basins.Basin) :
    ¬ G.basins.DescendChain b b :=
  G.basins.no_descending_cycle b

/-- The left configuration overlaps itself on every retained site. -/
theorem self_overlap_left (G : Glass) :
    (letI := G.stateEq; overlapCount G.sites G.left G.left) = G.sites.length := by
  letI := G.stateEq
  exact overlapCount_self G.sites G.left

/-- The left configuration has zero mobility against itself. -/
theorem mobility_self_left (G : Glass) :
    (letI := G.stateEq; mobilityCount G.sites G.left G.left) = 0 := by
  letI := G.stateEq
  exact mobility_self G.sites G.left

/-- The retained KCM activation step is exactly facilitation closure. -/
theorem activation_closure (G : Glass) :
    (∀ x, G.seed x = true → ActiveClosure G.activationSites G.facilitation G.seed x) ∧
      (∀ y x, ActiveClosure G.activationSites G.facilitation G.seed y →
        G.facilitation y x = true →
        ActiveClosure G.activationSites G.facilitation G.seed x) ∧
      (∀ (r : G.KcmSite → Bool),
        (∀ y x, y ∈ G.activationSites → r y = true →
          G.facilitation y x = true → r x = true) →
        activateStep G.activationSites G.facilitation r = r) :=
  activation_is_facilitation_closure G.activationSites G.facilitation G.seed

/-- The crystal occupation pattern has full finite diffraction mass on the
universal intensity event. -/
theorem finite_diffraction_mass_univ (G : Glass) :
    AperiodicOrder.Tiling.finiteDiffractionMass G.crystals.period G.crystals.occupation
      Obsmetrologia.Discrete.Set.univ = G.crystals.period + 1 :=
  G.quasicrystals.finite_diffraction_mass_univ

/-- The retained temperature value is the stationary distribution at the
distinguished state. -/
theorem temperature_eq_distribution (G : Glass) :
    G.thermal.temperature =
      G.thermal.stochastic.distribution G.thermal.stochastic.state :=
  Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.temperature_eq_distribution
    G.thermal

/-- The retained thermodynamic transition carries positive creation, balanced
flux, positive Landauer cost, and positive hard-flow discharge. -/
theorem produces_creation_landauer_and_discharge (G : Glass) :
    0 < G.thermal.creationCount ∧
      Obsmetrologia.Thermodynamics.Temperature.Balanced G.thermal.flux ∧
        0 < G.thermal.landauerCost ∧ 0 < G.thermal.discharge :=
  Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.produces_creation_landauer_and_discharge
    G.thermal

/-! ## Basin-indexed temperature bridge -/

/-- A basin-indexed thermalization of a glass substance. Its Markov kernel moves
between the retained metastable basins, its stationary distribution gives the
temperature at a distinguished basin, and each basin carries a Landauer support
whose ledger records the local matter cost. -/
structure BasinThermalization (G : Glass) where
  /-- The stochastic value semiring. -/
  values : StochSemiring
  /-- The stochastic kernel whose state space is the basin landscape. -/
  kernel : MarkovKernel G.basins.Basin values
  /-- The stationary distribution over basins. -/
  distribution : G.basins.Basin → values.carrier
  /-- The basin at which the temperature value is read. -/
  basin : G.basins.Basin
  /-- The distribution is stationary for the basin kernel. -/
  stationary : IsStationary kernel distribution
  /-- The Landauer support carried by each basin. -/
  support : G.basins.Basin → LandauerSupport
  /-- The hard-flow firing that supplies positive discharge. -/
  firing : FreeEnergyFiring

namespace BasinThermalization

/-- The transition weight for a move between two basins. -/
def transitionWeight {G : Glass} (β : BasinThermalization G)
    (source target : G.basins.Basin) : β.values.carrier :=
  β.kernel.P source target

/-- The stationary flux read at the distinguished basin. -/
def flux {G : Glass} (β : BasinThermalization G) : TopFlux β.values :=
  stationaryFlux β.kernel β.distribution β.basin

/-- The basin temperature value: the balanced stationary flux at the
distinguished basin. -/
def temperature {G : Glass} (β : BasinThermalization G) : β.values.carrier :=
  balancedTemperature β.flux
    (stationary_flux_balanced β.kernel β.distribution β.basin β.stationary)

/-- The Landauer cost attached to a basin. -/
def landauerCostAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  (β.support b).cost

/-- The signed Landauer ledger attached to a basin. -/
def ledgerAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Int :=
  (β.support b).ledger

/-- The cover nerve attached to a basin support. -/
def nerveAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Obsmetrologia.Cohomology.CoverNerve :=
  (β.support b).nerve

/-- The `H⁰` rank attached to a basin support. -/
def h0At {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  (β.nerveAt b).H0rank

/-- The `H¹` rank attached to a basin support. -/
def h1At {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  (β.nerveAt b).H1rank

/-- The Landauer bits attached to a basin support. -/
def landauerBitsAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  Obsmetrologia.Landauer.landauerBits (β.nerveAt b)

/-- The anti-Landauer bits attached to a basin support. -/
def antiLandauerBitsAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  Obsmetrologia.AntiLandauer.antiLandauerBits (β.nerveAt b)

/-- The load-bearing matter predicate attached to a basin support. -/
def loadBearingAt {G : Glass} (β : BasinThermalization G)
    (b : G.basins.Basin) : Prop :=
  AperiodicOrder.Tiling.loadBearing (β.nerveAt b)

/-- A basin is frozen at threshold `θ` when its basin temperature is below that
threshold in the stochastic value order. -/
def frozenAt {G : Glass} (β : BasinThermalization G)
    (θ : β.values.carrier) : Prop :=
  β.values.le β.temperature θ

/-- A basin is hopping at threshold `θ` when the threshold is below its basin
temperature in the stochastic value order. -/
def hoppingAt {G : Glass} (β : BasinThermalization G)
    (θ : β.values.carrier) : Prop :=
  β.values.le θ β.temperature

/-- Stationarity balances the flux at the distinguished basin. -/
theorem flux_balanced {G : Glass} (β : BasinThermalization G) :
    Balanced β.flux :=
  stationary_flux_balanced β.kernel β.distribution β.basin β.stationary

/-- Basin temperature is the stationary distribution value at the distinguished
basin. -/
theorem temperature_eq_distribution {G : Glass}
    (β : BasinThermalization G) :
    β.temperature = β.distribution β.basin :=
  stationary_temperature_eq_distribution
    β.kernel β.distribution β.basin β.stationary

/-- A basin thermalization has a unique balanced temperature at its
distinguished basin. -/
theorem temperature_unique {G : Glass}
    (β : BasinThermalization G) :
    ∃ T : β.values.carrier,
      (T = β.kernel.advance β.distribution β.basin ∧
        T = β.distribution β.basin) ∧
        ∀ U : β.values.carrier,
          U = β.kernel.advance β.distribution β.basin ∧
            U = β.distribution β.basin → U = T :=
  Obsmetrologia.Thermodynamics.Temperature.stationary_temperature_unique
    β.kernel β.distribution β.basin β.stationary

/-- Every retained basin support has positive Landauer cost. -/
theorem landauerCostAt_pos {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    0 < β.landauerCostAt b :=
  (β.support b).cost_pos

/-- The basin ledger is the Euler characteristic of its retained support. -/
theorem ledgerAt_eq_eulerChar {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.ledgerAt b = Obsmetrologia.AntiLandauer.eulerChar (β.support b).nerve :=
  (β.support b).ledger_eq_eulerChar

/-- Basin `H¹` is exactly the basin Landauer bit count. -/
theorem h1At_eq_landauerBitsAt {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.h1At b = β.landauerBitsAt b :=
  rfl

/-- Basin `H⁰` is exactly the basin anti-Landauer bit count. -/
theorem antiLandauerBitsAt_eq_h0At {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.antiLandauerBitsAt b = β.h0At b :=
  rfl

/-- The signed basin ledger is `H⁰ - H¹`. -/
theorem h0_minus_h1_eq_ledgerAt {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    (β.antiLandauerBitsAt b : Int) -
        (β.landauerBitsAt b : Int) = β.ledgerAt b := by
  exact (Obsmetrologia.AntiLandauer.index_balance (β.nerveAt b)).trans
    (β.ledgerAt_eq_eulerChar b).symm

/-- A basin support conducts/bears load exactly when its `H¹` matter reading is
positive. This is the material-state conductor reading inherited from the same `H¹`/Landauer
proofs as `MatterTopology`, not the StepN metalization recurrence. -/
theorem loadBearingAt_iff_positive_h1At {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.loadBearingAt b ↔ 0 < β.h1At b := by
  unfold loadBearingAt h1At nerveAt
  simpa [Obsmetrologia.Landauer.landauerBits] using
    Obsmetrologia.Thermodynamics.Temperature.loadBearing_iff_positive_landauer
      (β.support b).nerve

/-- A basin-indexed thermalization carries the `H¹`/Landauer matter ledger:
`H¹` is Landauer cost in bits, `H⁰` is anti-Landauer content, the signed
ledger is `H⁰ - H¹`, and load-bearing is positive `H¹`. -/
theorem produces_h1_landauer_matter_ledger {G : Glass}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.h1At b = β.landauerBitsAt b ∧
      β.antiLandauerBitsAt b = β.h0At b ∧
        (β.antiLandauerBitsAt b : Int) -
            (β.landauerBitsAt b : Int) = β.ledgerAt b ∧
          (β.loadBearingAt b ↔ 0 < β.h1At b) :=
  ⟨β.h1At_eq_landauerBitsAt b,
    β.antiLandauerBitsAt_eq_h0At b,
    β.h0_minus_h1_eq_ledgerAt b,
    β.loadBearingAt_iff_positive_h1At b⟩

/-- The frozen predicate is the basin distribution value compared with the
chosen threshold. -/
theorem frozenAt_iff_distribution_le {G : Glass}
    (β : BasinThermalization G) (θ : β.values.carrier) :
    β.frozenAt θ ↔ β.values.le (β.distribution β.basin) θ := by
  unfold frozenAt
  rw [β.temperature_eq_distribution]

/-- The hopping predicate is the chosen threshold compared with the basin
distribution value. -/
theorem hoppingAt_iff_le_distribution {G : Glass}
    (β : BasinThermalization G) (θ : β.values.carrier) :
    β.hoppingAt θ ↔ β.values.le θ (β.distribution β.basin) := by
  unfold hoppingAt
  rw [β.temperature_eq_distribution]

/-- Any total stochastic value order classifies the distinguished basin as
frozen or hopping relative to a threshold. -/
theorem threshold_total {G : Glass}
    (β : BasinThermalization G) (θ : β.values.carrier)
    (htotal : ∀ a b : β.values.carrier, β.values.le a b ∨ β.values.le b a) :
    β.frozenAt θ ∨ β.hoppingAt θ := by
  unfold frozenAt hoppingAt
  exact htotal β.temperature θ

/-- If a threshold is both above and below the basin temperature, antisymmetry
of the stochastic value order identifies it with that temperature. -/
theorem frozen_and_hopping_eq_temperature {G : Glass}
    (β : BasinThermalization G) (θ : β.values.carrier)
    (hf : β.frozenAt θ) (hh : β.hoppingAt θ) :
    β.temperature = θ :=
  β.values.le_antisymm hf hh

/-- A basin-indexed thermalization carries balanced flux, positive Landauer
cost at the distinguished basin, and positive hard-flow discharge. -/
theorem produces_landauer_and_discharge {G : Glass}
    (β : BasinThermalization G) :
    Balanced β.flux ∧ 0 < β.landauerCostAt β.basin ∧ 0 < β.firing.discharge :=
  ⟨β.flux_balanced, β.landauerCostAt_pos β.basin, β.firing.discharge_pos⟩

end BasinThermalization

/-! ## Rational basin temperature -/

/-- A basin-indexed thermalization over the corpus rational stochastic carrier.
Unlike the generic carrier, this one has a total value order, so the
frozen/hopping threshold dichotomy needs no extra hypothesis. -/
structure RatBasinThermalization (G : Glass) where
  /-- The rational stochastic kernel whose state space is the basin landscape. -/
  kernel :
    MarkovKernel G.basins.Basin Obsmetrologia.Probability.PoissonSettling.ratStoch
  /-- The stationary rational distribution over basins. -/
  distribution : G.basins.Basin → Real.Internal.Rat
  /-- The basin at which the temperature value is read. -/
  basin : G.basins.Basin
  /-- The distribution is stationary for the basin kernel. -/
  stationary : IsStationary kernel distribution
  /-- The Landauer support carried by each basin. -/
  support : G.basins.Basin → LandauerSupport
  /-- The hard-flow firing that supplies positive discharge. -/
  firing : FreeEnergyFiring

namespace RatBasinThermalization

/-- Forget the rational specialization to the generic basin thermalization. -/
def toBasinThermalization {G : Glass}
    (ρ : RatBasinThermalization G) : BasinThermalization G where
  values := Obsmetrologia.Probability.PoissonSettling.ratStoch
  kernel := ρ.kernel
  distribution := ρ.distribution
  basin := ρ.basin
  stationary := ρ.stationary
  support := ρ.support
  firing := ρ.firing

/-- The rational basin temperature value. -/
def temperature {G : Glass} (ρ : RatBasinThermalization G) :
    Real.Internal.Rat :=
  ρ.toBasinThermalization.temperature

/-- A rational basin is frozen at threshold `θ` when its basin temperature is
below that threshold. -/
def frozenAt {G : Glass} (ρ : RatBasinThermalization G)
    (θ : Real.Internal.Rat) : Prop :=
  ρ.temperature ≤ θ

/-- A rational basin is hopping at threshold `θ` when the threshold is below its
basin temperature. -/
def hoppingAt {G : Glass} (ρ : RatBasinThermalization G)
    (θ : Real.Internal.Rat) : Prop :=
  θ ≤ ρ.temperature

/-- Rational basin temperature is the stationary distribution value at the
distinguished basin. -/
theorem temperature_eq_distribution {G : Glass}
    (ρ : RatBasinThermalization G) :
    ρ.temperature = ρ.distribution ρ.basin :=
  ρ.toBasinThermalization.temperature_eq_distribution

/-- The rational frozen predicate is the basin distribution value compared with
the chosen threshold. -/
theorem frozenAt_iff_distribution_le {G : Glass}
    (ρ : RatBasinThermalization G) (θ : Real.Internal.Rat) :
    ρ.frozenAt θ ↔ ρ.distribution ρ.basin ≤ θ := by
  unfold frozenAt
  rw [ρ.temperature_eq_distribution]

/-- The rational hopping predicate is the chosen threshold compared with the
basin distribution value. -/
theorem hoppingAt_iff_le_distribution {G : Glass}
    (ρ : RatBasinThermalization G) (θ : Real.Internal.Rat) :
    ρ.hoppingAt θ ↔ θ ≤ ρ.distribution ρ.basin := by
  unfold hoppingAt
  rw [ρ.temperature_eq_distribution]

/-- The rational stochastic carrier gives an unconditional frozen-or-hopping
threshold dichotomy. -/
theorem threshold_total {G : Glass}
    (ρ : RatBasinThermalization G) (θ : Real.Internal.Rat) :
    ρ.frozenAt θ ∨ ρ.hoppingAt θ := by
  unfold frozenAt hoppingAt
  exact Real.Internal.Rat.le_total ρ.temperature θ

/-- If a rational threshold is both above and below the basin temperature,
antisymmetry identifies it with that temperature. -/
theorem frozen_and_hopping_eq_temperature {G : Glass}
    (ρ : RatBasinThermalization G) (θ : Real.Internal.Rat)
    (hf : ρ.frozenAt θ) (hh : ρ.hoppingAt θ) :
    ρ.temperature = θ :=
  Real.Internal.Rat.le_antisymm hf hh

/-- The rational basin ledger is the Euler characteristic of its retained
support. -/
theorem ledgerAt_eq_eulerChar {G : Glass}
    (ρ : RatBasinThermalization G) (b : G.basins.Basin) :
    ρ.toBasinThermalization.ledgerAt b =
      Obsmetrologia.AntiLandauer.eulerChar (ρ.support b).nerve :=
  ρ.toBasinThermalization.ledgerAt_eq_eulerChar b

/-- The rational basin `H¹` rank attached to a basin support. -/
def h1At {G : Glass} (ρ : RatBasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  ρ.toBasinThermalization.h1At b

/-- The rational basin Landauer bit count attached to a basin support. -/
def landauerBitsAt {G : Glass} (ρ : RatBasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  ρ.toBasinThermalization.landauerBitsAt b

/-- The rational basin load-bearing predicate attached to a basin support. -/
def loadBearingAt {G : Glass} (ρ : RatBasinThermalization G)
    (b : G.basins.Basin) : Prop :=
  ρ.toBasinThermalization.loadBearingAt b

/-- Rational basin `H¹` is exactly the basin Landauer bit count. -/
theorem h1At_eq_landauerBitsAt {G : Glass}
    (ρ : RatBasinThermalization G) (b : G.basins.Basin) :
    ρ.h1At b = ρ.landauerBitsAt b :=
  ρ.toBasinThermalization.h1At_eq_landauerBitsAt b

/-- A rational basin support is load-bearing exactly when its `H¹` matter
reading is positive. -/
theorem loadBearingAt_iff_positive_h1At {G : Glass}
    (ρ : RatBasinThermalization G) (b : G.basins.Basin) :
    ρ.loadBearingAt b ↔ 0 < ρ.h1At b :=
  ρ.toBasinThermalization.loadBearingAt_iff_positive_h1At b

/-- Rational basin thermalization carries the same `H¹`/Landauer matter
ledger as the generic basin thermalization. -/
theorem produces_h1_landauer_matter_ledger {G : Glass}
    (ρ : RatBasinThermalization G) (b : G.basins.Basin) :
    ρ.toBasinThermalization.h1At b =
        ρ.toBasinThermalization.landauerBitsAt b ∧
      ρ.toBasinThermalization.antiLandauerBitsAt b =
        ρ.toBasinThermalization.h0At b ∧
        (ρ.toBasinThermalization.antiLandauerBitsAt b : Int) -
            (ρ.toBasinThermalization.landauerBitsAt b : Int) =
          ρ.toBasinThermalization.ledgerAt b ∧
          (ρ.toBasinThermalization.loadBearingAt b ↔
            0 < ρ.toBasinThermalization.h1At b) :=
  ρ.toBasinThermalization.produces_h1_landauer_matter_ledger b

/-- Rational basin thermalization carries balanced flux, positive Landauer cost,
and positive hard-flow discharge. -/
theorem produces_landauer_and_discharge {G : Glass}
    (ρ : RatBasinThermalization G) :
    Balanced ρ.toBasinThermalization.flux ∧
      0 < ρ.toBasinThermalization.landauerCostAt ρ.basin ∧
        0 < ρ.firing.discharge :=
  ρ.toBasinThermalization.produces_landauer_and_discharge

end RatBasinThermalization

/-! ## Basin free-energy bridge -/

/-- A basin-indexed free-energy bridge for a glass substance. It keeps the
stochastic temperature/Landauer basin thermalization and adds a rational
free-energy descent flow whose states are the same metastable basins. -/
structure BasinFreeEnergyBridge (G : Glass) where
  /-- The basin-indexed stochastic temperature and Landauer ledger. -/
  thermalization : BasinThermalization G
  /-- The rational basin free energy. -/
  Omega : G.basins.Basin → Real.Internal.Rat
  /-- One relaxation step between basins. -/
  step : G.basins.Basin → G.basins.Basin
  /-- The relaxation step never raises rational free energy. -/
  step_le : ∀ b, Omega (step b) ≤ Omega b
  /-- A basin with unchanged free energy is already settled by the step. -/
  step_settles : ∀ b, Omega (step b) = Omega b → step b = b

namespace BasinFreeEnergyBridge

/-- The lower liquid `DFTFlow` obtained by reading the bridge over basins. -/
def flow {G : Glass} (γ : BasinFreeEnergyBridge G) :
    Obsmetrologia.KineticTheory.Liquid.DFTFlow where
  State := G.basins.Basin
  Omega := γ.Omega
  step := γ.step
  step_le := γ.step_le
  step_settles := γ.step_settles

/-- The basin relaxation orbit. -/
def orbit {G : Glass} (γ : BasinFreeEnergyBridge G)
    (b : G.basins.Basin) : Nat → G.basins.Basin :=
  Obsmetrologia.KineticTheory.Liquid.orbit γ.flow b

/-- Basin free energy decreases at every bridge step. -/
theorem orbit_Omega_antitone {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b (n + 1)) ≤ γ.Omega (γ.orbit b n) :=
  Obsmetrologia.KineticTheory.Liquid.orbit_Omega_antitone γ.flow b n

/-- Along the basin relaxation orbit, free energy remains below its initial
value. -/
theorem orbit_Omega_le_init {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  Obsmetrologia.KineticTheory.Liquid.orbit_Omega_le_init γ.flow b n

/-- A basin minimizing the bridge free energy is fixed by the relaxation step. -/
theorem minimizer_is_equilibrium {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin)
    (h : Obsmetrologia.KineticTheory.Liquid.IsMinimizer γ.flow b) :
    Obsmetrologia.KineticTheory.Liquid.IsEquilibrium γ.flow b :=
  Obsmetrologia.KineticTheory.Liquid.minimizer_is_equilibrium γ.flow b h

/-- The bridge temperature is the basin thermalization temperature. -/
def temperature {G : Glass} (γ : BasinFreeEnergyBridge G) :
    γ.thermalization.values.carrier :=
  γ.thermalization.temperature

/-- Bridge temperature is the stationary distribution value at the distinguished
basin. -/
theorem temperature_eq_distribution {G : Glass}
    (γ : BasinFreeEnergyBridge G) :
    γ.temperature =
      γ.thermalization.distribution γ.thermalization.basin :=
  γ.thermalization.temperature_eq_distribution

/-- The bridge ledger at a basin is its Euler characteristic. -/
theorem ledgerAt_eq_eulerChar {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) :
    γ.thermalization.ledgerAt b =
      Obsmetrologia.AntiLandauer.eulerChar (γ.thermalization.support b).nerve :=
  γ.thermalization.ledgerAt_eq_eulerChar b

/-- The bridge simultaneously carries rational free-energy descent, balanced
basin temperature, positive Landauer cost, and positive hard-flow discharge. -/
theorem produces_temperature_landauer_and_descent {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) :
    γ.Omega (γ.step b) ≤ γ.Omega b ∧
      Balanced γ.thermalization.flux ∧
        0 < γ.thermalization.landauerCostAt γ.thermalization.basin ∧
          0 < γ.thermalization.firing.discharge :=
  ⟨γ.step_le b, γ.thermalization.flux_balanced,
    γ.thermalization.landauerCostAt_pos γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos⟩

/-- The temperature bridge and glass rung are one finite theorem: the basin
bridge has a unique stationary temperature, non-increasing basin free energy,
balanced flux, positive Landauer/discharge evidence, and the frozen predicate
is exactly the below-threshold comparison with the basin distribution value. -/
theorem temperature_bridge_and_glass_rung {G : Glass}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin)
    (θ : γ.thermalization.values.carrier) :
    (∃ T : γ.thermalization.values.carrier,
      (T = γ.thermalization.kernel.advance γ.thermalization.distribution
            γ.thermalization.basin ∧
        T = γ.thermalization.distribution γ.thermalization.basin) ∧
        ∀ U : γ.thermalization.values.carrier,
          U = γ.thermalization.kernel.advance γ.thermalization.distribution
              γ.thermalization.basin ∧
            U = γ.thermalization.distribution γ.thermalization.basin → U = T) ∧
      γ.Omega (γ.step b) ≤ γ.Omega b ∧
        Balanced γ.thermalization.flux ∧
          0 < γ.thermalization.landauerCostAt γ.thermalization.basin ∧
            0 < γ.thermalization.firing.discharge ∧
              (γ.thermalization.frozenAt θ ↔
                γ.thermalization.values.le
                  (γ.thermalization.distribution γ.thermalization.basin) θ) :=
  ⟨γ.thermalization.temperature_unique, γ.step_le b,
    γ.thermalization.flux_balanced,
    γ.thermalization.landauerCostAt_pos γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos,
    γ.thermalization.frozenAt_iff_distribution_le θ⟩

end BasinFreeEnergyBridge

/-! ## Rational basin free-energy bridge -/

/-- A rational basin free-energy bridge for a glass substance. This is the
specialized glass rung whose stochastic temperature lives in the corpus rational
carrier and whose free energy is a rational DFT-style descent over the same
basin state space. -/
structure RatBasinFreeEnergyBridge (G : Glass) where
  /-- The rational basin-indexed stochastic temperature and Landauer ledger. -/
  thermalization : RatBasinThermalization G
  /-- The rational basin free energy. -/
  Omega : G.basins.Basin → Real.Internal.Rat
  /-- One relaxation step between basins. -/
  step : G.basins.Basin → G.basins.Basin
  /-- The relaxation step never raises rational free energy. -/
  step_le : ∀ b, Omega (step b) ≤ Omega b
  /-- A basin with unchanged free energy is already settled by the step. -/
  step_settles : ∀ b, Omega (step b) = Omega b → step b = b

namespace RatBasinFreeEnergyBridge

/-- Forget the rational specialization to the generic basin free-energy bridge. -/
def toBasinFreeEnergyBridge {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) : BasinFreeEnergyBridge G where
  thermalization := γ.thermalization.toBasinThermalization
  Omega := γ.Omega
  step := γ.step
  step_le := γ.step_le
  step_settles := γ.step_settles

/-- The lower liquid `DFTFlow` obtained by reading the rational bridge over
basins. -/
def flow {G : Glass} (γ : RatBasinFreeEnergyBridge G) :
    Obsmetrologia.KineticTheory.Liquid.DFTFlow :=
  γ.toBasinFreeEnergyBridge.flow

/-- The rational basin relaxation orbit. -/
def orbit {G : Glass} (γ : RatBasinFreeEnergyBridge G)
    (b : G.basins.Basin) : Nat → G.basins.Basin :=
  Obsmetrologia.KineticTheory.Liquid.orbit γ.flow b

/-- Along the rational basin relaxation orbit, free energy remains below its
initial value. -/
theorem orbit_Omega_le_init {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  Obsmetrologia.KineticTheory.Liquid.orbit_Omega_le_init γ.flow b n

/-- The rational bridge temperature is the rational basin thermalization
temperature. -/
def temperature {G : Glass} (γ : RatBasinFreeEnergyBridge G) :
    Real.Internal.Rat :=
  γ.thermalization.temperature

/-- Rational bridge temperature is the stationary distribution value at the
distinguished basin. -/
theorem temperature_eq_distribution {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) :
    γ.temperature =
      γ.thermalization.distribution γ.thermalization.basin :=
  γ.thermalization.temperature_eq_distribution

/-- The rational bridge classifies every rational threshold as frozen or
hopping. -/
theorem threshold_total {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (θ : Real.Internal.Rat) :
    γ.thermalization.frozenAt θ ∨ γ.thermalization.hoppingAt θ :=
  γ.thermalization.threshold_total θ

/-- The rational bridge ledger at a basin is its Euler characteristic. -/
theorem ledgerAt_eq_eulerChar {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (b : G.basins.Basin) :
    γ.thermalization.toBasinThermalization.ledgerAt b =
      Obsmetrologia.AntiLandauer.eulerChar
        (γ.thermalization.support b).nerve :=
  γ.thermalization.ledgerAt_eq_eulerChar b

/-- The rational glass rung combines the three live spines: rational
free-energy descent over basins, rational frozen/hopping threshold selection,
and the basin Landauer ledger with positive discharge evidence. -/
theorem produces_glass_rung {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (b : G.basins.Basin)
    (θ : Real.Internal.Rat) :
    γ.Omega (γ.step b) ≤ γ.Omega b ∧
      γ.temperature =
        γ.thermalization.distribution γ.thermalization.basin ∧
        (γ.thermalization.frozenAt θ ∨ γ.thermalization.hoppingAt θ) ∧
          γ.thermalization.toBasinThermalization.ledgerAt b =
            Obsmetrologia.AntiLandauer.eulerChar
              (γ.thermalization.support b).nerve ∧
            Balanced γ.thermalization.toBasinThermalization.flux ∧
              0 <
                γ.thermalization.toBasinThermalization.landauerCostAt
                  γ.thermalization.basin ∧
                0 < γ.thermalization.firing.discharge :=
  ⟨γ.step_le b, γ.temperature_eq_distribution,
    γ.threshold_total θ, γ.ledgerAt_eq_eulerChar b,
    γ.thermalization.toBasinThermalization.flux_balanced,
    γ.thermalization.toBasinThermalization.landauerCostAt_pos
      γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos⟩

/-- The rational glass rung with the basin-indexed `H¹` matter ledger exposed:
rational temperature thresholding, rational free-energy descent, balanced flux,
positive discharge, and the load-bearing iff positive-`H¹` law all live on the
same basin carrier. -/
theorem produces_h1_glass_rung {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (b : G.basins.Basin)
    (θ : Real.Internal.Rat) :
    γ.Omega (γ.step b) ≤ γ.Omega b ∧
      γ.temperature =
        γ.thermalization.distribution γ.thermalization.basin ∧
        (γ.thermalization.frozenAt θ ∨ γ.thermalization.hoppingAt θ) ∧
          γ.thermalization.h1At b =
            γ.thermalization.landauerBitsAt b ∧
            (γ.thermalization.loadBearingAt b ↔
              0 < γ.thermalization.h1At b) ∧
              Balanced γ.thermalization.toBasinThermalization.flux ∧
                0 <
                  γ.thermalization.toBasinThermalization.landauerCostAt
                    γ.thermalization.basin ∧
                  0 < γ.thermalization.firing.discharge :=
  ⟨γ.step_le b, γ.temperature_eq_distribution,
    γ.threshold_total θ, γ.thermalization.h1At_eq_landauerBitsAt b,
    γ.thermalization.loadBearingAt_iff_positive_h1At b,
    γ.thermalization.toBasinThermalization.flux_balanced,
    γ.thermalization.toBasinThermalization.landauerCostAt_pos
      γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos⟩

/-! ## Basin connectivity transition -/

/-- A finite basin-connectivity transition for a rational glass bridge. It
retains the basin graph filtration where connectivity appears and the rational
temperature threshold used to read the distinguished basin as glassy. -/
structure BasinConnectivityTransition {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) where
  /-- The persistent-H0 filtration on the basin graph. -/
  filtration : Obsmetrologia.Calculus.Order.GraphFiltration G.basins.Basin
  /-- The stage where the retained basin connection is first read. -/
  transitionStage : Nat
  /-- A later stage used for the component-persistence witness. -/
  laterStage : Nat
  /-- The transition stage precedes the later stage. -/
  stage_le : transitionStage ≤ laterStage
  /-- The source basin of the retained connectivity witness. -/
  source : G.basins.Basin
  /-- The target basin of the retained connectivity witness. -/
  target : G.basins.Basin
  /-- The retained basins are connected at the transition stage. -/
  connected_at_transition :
    Obsmetrologia.Calculus.Order.PathConn
      (filtration.graphAt transitionStage) source target
  /-- The rational temperature threshold attached to this connectivity
  transition. -/
  threshold : Real.Internal.Rat

namespace BasinConnectivityTransition

/-- The retained connectivity persists to the later filtration stage. -/
theorem connected_later {G : Glass} {γ : RatBasinFreeEnergyBridge G}
    (C : BasinConnectivityTransition γ) :
    Obsmetrologia.Calculus.Order.PathConn
      (C.filtration.graphAt C.laterStage) C.source C.target :=
  Obsmetrologia.Calculus.Order.components_only_merge
    C.filtration C.stage_le C.connected_at_transition

/-- The finite glassy predicate: the rational basin is frozen at the retained
connectivity threshold. -/
def glassy {G : Glass} {γ : RatBasinFreeEnergyBridge G}
    (C : BasinConnectivityTransition γ) : Prop :=
  γ.thermalization.frozenAt C.threshold

/-- Being below the connectivity transition means the rational bridge
temperature is below the retained threshold. -/
def belowConnectivityTransition {G : Glass}
    {γ : RatBasinFreeEnergyBridge G}
    (C : BasinConnectivityTransition γ) : Prop :=
  γ.temperature ≤ C.threshold

/-- The finite glass-rung iff: a rational basin bridge is glassy at a retained
connectivity transition exactly when its temperature is below that transition
threshold. -/
theorem glassy_iff_temperature_below_connectivity_transition
    {G : Glass} {γ : RatBasinFreeEnergyBridge G}
    (C : BasinConnectivityTransition γ) :
    C.glassy ↔ C.belowConnectivityTransition := by
  rfl

/-- Stationarity rewrites the finite glass-rung iff as a comparison with the
stationary basin distribution. -/
theorem glassy_iff_distribution_below_connectivity_transition
    {G : Glass} {γ : RatBasinFreeEnergyBridge G}
    (C : BasinConnectivityTransition γ) :
    C.glassy ↔
      γ.thermalization.distribution γ.thermalization.basin ≤ C.threshold :=
  γ.thermalization.frozenAt_iff_distribution_le C.threshold

end BasinConnectivityTransition

/-- The rational bridge plus a basin-connectivity transition gives the finite
glass rung: connectivity persists, basin free energy descends, temperature is
stationary, and glassiness is exactly temperature below the retained
connectivity threshold. -/
theorem produces_connectivity_glass_rung {G : Glass}
    (γ : RatBasinFreeEnergyBridge G) (b : G.basins.Basin)
    (C : BasinConnectivityTransition γ) :
    Obsmetrologia.Calculus.Order.PathConn
      (C.filtration.graphAt C.laterStage) C.source C.target ∧
      γ.Omega (γ.step b) ≤ γ.Omega b ∧
        γ.temperature =
          γ.thermalization.distribution γ.thermalization.basin ∧
          (C.glassy ↔ C.belowConnectivityTransition) ∧
            (C.glassy ↔
              γ.thermalization.distribution γ.thermalization.basin ≤
                C.threshold) ∧
            Balanced γ.thermalization.toBasinThermalization.flux ∧
              0 <
                γ.thermalization.toBasinThermalization.landauerCostAt
                  γ.thermalization.basin ∧
                0 < γ.thermalization.firing.discharge :=
  ⟨C.connected_later, γ.step_le b, γ.temperature_eq_distribution,
    C.glassy_iff_temperature_below_connectivity_transition,
    C.glassy_iff_distribution_below_connectivity_transition,
    γ.thermalization.toBasinThermalization.flux_balanced,
    γ.thermalization.toBasinThermalization.landauerCostAt_pos
      γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos⟩

end RatBasinFreeEnergyBridge

end Glass
end AperiodicOrder.Crystal
end Obsmetrologia
