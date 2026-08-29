import Infomaterial.Relational.Material.Constraint.Overlap
import Infomaterial.Relational.Material.Constraint.Heterogeneity
import Infomaterial.Relational.Material.Constraint.Basin
import Infomaterial.Relational.Material.Constraint.KCM
import Infomaterial.Persistence.Aperiodic.FiniteLocalRule
import Infomaterial.Persistence.Aperiodic.PortGraph
import Infomaterial.Persistence.Aperiodic.Diffraction
import Infomaterial.Calculus.Real.Multiplication
import Infomaterial.Relational.Liquid.DensityFunctionalFlow
import Infomaterial.Thermodynamics.Temperature

/-!
# Glass as a bundled material substance

This module packages the finite glass machinery as one material bundle. The
chain is explicit: `Tiles` carry finite local rules, `Beads` add the lenticular
ported thread walk, `Crystals` add a finite ordered occupation pattern,
`Quasicrystals` add a finite diffraction event over that pattern, and
`Substance` adds the glass diagnostics: overlap, dynamic heterogeneity, basin
descent, kinetically constrained activation, and the temperature/Landauer bridge.

The results are projection theorems from that bundle. They do not identify glass
with the analytic Parisi layer; they prove that a glass substance retains the
already-built finite skeleton and the stationary-temperature bridge.

## Main definitions

* `Tiles`, `Beads`, `Crystals`, `Quasicrystals`, `Substance`.
* `Substance.BasinThermalization`, `Substance.BasinFreeEnergyBridge`.

## Main results

* `Substance.beads_between_tiles_and_crystals` records the inserted bead layer.
* `Substance.descent_lowers_energy` and `Substance.no_descending_cycle` expose
  the basin-graph Lyapunov law.
* `Substance.self_overlap_left` and `Substance.mobility_self_left` expose the
  finite overlap and dynamic-heterogeneity laws.
* `Substance.temperature_eq_distribution` and
  `Substance.produces_creation_landauer_and_discharge` expose the temperature
  bridge and matter ledger.
* `Substance.BasinThermalization.temperature_eq_distribution` specializes the
  stochastic temperature bridge to the basin landscape itself.
* `Substance.BasinThermalization.ledgerAt_eq_eulerChar` records the
  basin-indexed Landauer ledger.
* `Substance.BasinThermalization.frozenAt_iff_distribution_le` and
  `Substance.BasinThermalization.hoppingAt_iff_le_distribution` lift the
  ordered stochastic carrier into frozen/hopping threshold predicates.
* `BasinGraph.rationalEnergy_le_of_descendChain` lifts Nat-valued basin descent
  into the internal rational order.
* `Substance.BasinFreeEnergyBridge.orbit_Omega_le_init` reuses the lower liquid
  DFT free-energy descent over the glass basin landscape.

## Tags

glass, tiles, beads, crystals, quasicrystals, temperature, Landauer
-/

namespace Infomaterial
namespace Relational.Material.Glass

open Infomaterial.Discrete (Graph)
open Infomaterial.Probability.Stochastic (StochSemiring MarkovKernel IsStationary)
open Infomaterial.Thermodynamics.Temperature

namespace BasinGraph

/-- The rational free-energy lift of the Nat-valued basin energy. -/
def rationalEnergy (B : BasinGraph) (b : B.Basin) : Real.Internal.Rat :=
  Real.Internal.Rat.ofNat (B.energy b)

/-- Nat-valued basin descent also lowers the internal rational free energy. -/
theorem rationalEnergy_le_of_descendChain (B : BasinGraph) {a b : B.Basin}
    (h : B.DescendChain a b) :
    B.rationalEnergy b ≤ B.rationalEnergy a :=
  Real.Internal.Rat.ofNat_le_ofNat (Nat.le_of_lt (B.descendChain_energy_lt h))

end BasinGraph

/-- `Tiles` are the finite-local-rule face: a local transition graph together
with one admissible word of that graph. -/
structure Tiles where
  /-- The local alphabet or tile carrier. -/
  Carrier : Type
  /-- The finite local compatibility rule. -/
  localRule : Graph Carrier
  /-- A listed local pattern. -/
  word : List Carrier
  /-- The listed pattern obeys the finite local rule. -/
  admissible : Persistence.Aperiodic.Path localRule word

/-- `Beads` insert the lenticular ported-thread layer between tiles and
crystals. -/
structure Beads where
  /-- The tile layer carried by the beadwork. -/
  tiles : Tiles
  /-- The rigid lenticule carrier. -/
  Lenticule : Type
  /-- The routed thread walk through lenticules. -/
  thread : Persistence.Aperiodic.Thread Lenticule
  /-- Every thread pass is legal for the lenticular hole rule. -/
  threadLegal : Persistence.Aperiodic.ThreadLegal thread

/-- `Crystals` are bead-supported finite occupation patterns. -/
structure Crystals where
  /-- The bead layer below the crystal pattern. -/
  beads : Beads
  /-- The finite cyclic size parameter. -/
  period : Nat
  /-- The finite occupation pattern on `period + 1` sites. -/
  occupation : Fin (period + 1) → Bool

/-- `Quasicrystals` add the finite diffraction-event layer over a crystal
pattern. -/
structure Quasicrystals where
  /-- The crystal pattern below the quasicrystal diagnostic. -/
  crystals : Crystals
  /-- The intensity event read by finite diffraction mass. -/
  intensity : Infomaterial.Probability.Measure.Event Nat

/-- A glass material substance: quasicrystal support plus finite glass
diagnostics and a lifted thermodynamic transition. -/
structure Substance where
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
    Infomaterial.Thermodynamics.Temperature.LiftedThermoTransition
      ThermoState thermoValues

namespace Substance

/-- The tile layer of a glass substance. -/
def tiles (G : Substance) : Tiles :=
  G.quasicrystals.crystals.beads.tiles

/-- The bead layer of a glass substance. -/
def beads (G : Substance) : Beads :=
  G.quasicrystals.crystals.beads

/-- The crystal layer of a glass substance. -/
def crystals (G : Substance) : Crystals :=
  G.quasicrystals.crystals

/-- The finite overlap count retained by a glass substance. -/
def overlap (G : Substance) : Nat :=
  letI := G.stateEq
  overlapCount G.sites G.left G.right

/-- The finite mobility count retained by a glass substance. -/
def mobility (G : Substance) : Nat :=
  letI := G.stateEq
  mobilityCount G.sites G.left G.right

/-- A glass substance reaches its tile layer through its beads. -/
theorem made_from_tiles (G : Substance) : G.beads.tiles = G.tiles :=
  rfl

/-- Beads are the intermediate layer between tiles and crystals. -/
theorem beads_between_tiles_and_crystals (G : Substance) : G.crystals.beads = G.beads :=
  rfl

/-- The quasicrystal layer is made from the crystal layer. -/
theorem quasicrystals_made_from_crystals (G : Substance) :
    G.quasicrystals.crystals = G.crystals :=
  rfl

/-- The witnessed basin descent strictly lowers energy. -/
theorem descent_lowers_energy (G : Substance) :
    G.basins.energy G.stop < G.basins.energy G.start :=
  G.basins.descendChain_energy_lt G.descent

/-- The witnessed basin descent also lowers the internal rational free-energy
lift of the basin landscape. -/
theorem descent_lowers_rationalEnergy (G : Substance) :
    G.basins.rationalEnergy G.stop ≤ G.basins.rationalEnergy G.start :=
  G.basins.rationalEnergy_le_of_descendChain G.descent

/-- No basin in the retained landscape descends back to itself. -/
theorem no_descending_cycle (G : Substance) (b : G.basins.Basin) :
    ¬ G.basins.DescendChain b b :=
  G.basins.no_descending_cycle b

/-- The left configuration overlaps itself on every retained site. -/
theorem self_overlap_left (G : Substance) :
    (letI := G.stateEq; overlapCount G.sites G.left G.left) = G.sites.length := by
  letI := G.stateEq
  exact overlapCount_self G.sites G.left

/-- The left configuration has zero mobility against itself. -/
theorem mobility_self_left (G : Substance) :
    (letI := G.stateEq; mobilityCount G.sites G.left G.left) = 0 := by
  letI := G.stateEq
  exact mobility_self G.sites G.left

/-- The retained KCM activation step is exactly facilitation closure. -/
theorem activation_closure (G : Substance) :
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
theorem finite_diffraction_mass_univ (G : Substance) :
    Persistence.Aperiodic.finiteDiffractionMass G.crystals.period G.crystals.occupation
      Infomaterial.Discrete.Set.univ = G.crystals.period + 1 :=
  Persistence.Aperiodic.finiteDiffractionMass_univ
    G.crystals.period G.crystals.occupation

/-- The retained temperature value is the stationary distribution at the
distinguished state. -/
theorem temperature_eq_distribution (G : Substance) :
    G.thermal.temperature =
      G.thermal.stochastic.distribution G.thermal.stochastic.state :=
  Infomaterial.Thermodynamics.Temperature.LiftedThermoTransition.temperature_eq_distribution
    G.thermal

/-- The retained thermodynamic transition carries positive creation, balanced
flux, positive Landauer cost, and positive hard-flow discharge. -/
theorem produces_creation_landauer_and_discharge (G : Substance) :
    0 < G.thermal.creationCount ∧
      Infomaterial.Thermodynamics.Temperature.Balanced G.thermal.flux ∧
        0 < G.thermal.landauerCost ∧ 0 < G.thermal.discharge :=
  Infomaterial.Thermodynamics.Temperature.LiftedThermoTransition.produces_creation_landauer_and_discharge
    G.thermal

/-! ## Basin-indexed temperature bridge -/

/-- A basin-indexed thermalization of a glass substance. Its Markov kernel moves
between the retained metastable basins, its stationary distribution gives the
temperature at a distinguished basin, and each basin carries a Landauer support
whose ledger records the local matter cost. -/
structure BasinThermalization (G : Substance) where
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
def transitionWeight {G : Substance} (β : BasinThermalization G)
    (source target : G.basins.Basin) : β.values.carrier :=
  β.kernel.P source target

/-- The stationary flux read at the distinguished basin. -/
def flux {G : Substance} (β : BasinThermalization G) : TopFlux β.values :=
  stationaryFlux β.kernel β.distribution β.basin

/-- The basin temperature value: the balanced stationary flux at the
distinguished basin. -/
def temperature {G : Substance} (β : BasinThermalization G) : β.values.carrier :=
  balancedTemperature β.flux
    (stationary_flux_balanced β.kernel β.distribution β.basin β.stationary)

/-- The Landauer cost attached to a basin. -/
def landauerCostAt {G : Substance} (β : BasinThermalization G)
    (b : G.basins.Basin) : Nat :=
  (β.support b).cost

/-- The signed Landauer ledger attached to a basin. -/
def ledgerAt {G : Substance} (β : BasinThermalization G)
    (b : G.basins.Basin) : Int :=
  (β.support b).ledger

/-- A basin is frozen at threshold `θ` when its basin temperature is below that
threshold in the stochastic value order. -/
def frozenAt {G : Substance} (β : BasinThermalization G)
    (θ : β.values.carrier) : Prop :=
  β.values.le β.temperature θ

/-- A basin is hopping at threshold `θ` when the threshold is below its basin
temperature in the stochastic value order. -/
def hoppingAt {G : Substance} (β : BasinThermalization G)
    (θ : β.values.carrier) : Prop :=
  β.values.le θ β.temperature

/-- Stationarity balances the flux at the distinguished basin. -/
theorem flux_balanced {G : Substance} (β : BasinThermalization G) :
    Balanced β.flux :=
  stationary_flux_balanced β.kernel β.distribution β.basin β.stationary

/-- Basin temperature is the stationary distribution value at the distinguished
basin. -/
theorem temperature_eq_distribution {G : Substance}
    (β : BasinThermalization G) :
    β.temperature = β.distribution β.basin :=
  stationary_temperature_eq_distribution
    β.kernel β.distribution β.basin β.stationary

/-- Every retained basin support has positive Landauer cost. -/
theorem landauerCostAt_pos {G : Substance}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    0 < β.landauerCostAt b :=
  (β.support b).cost_pos

/-- The basin ledger is the Euler characteristic of its retained support. -/
theorem ledgerAt_eq_eulerChar {G : Substance}
    (β : BasinThermalization G) (b : G.basins.Basin) :
    β.ledgerAt b = Infomaterial.AntiLandauer.eulerChar (β.support b).nerve :=
  (β.support b).ledger_eq_eulerChar

/-- The frozen predicate is the basin distribution value compared with the
chosen threshold. -/
theorem frozenAt_iff_distribution_le {G : Substance}
    (β : BasinThermalization G) (θ : β.values.carrier) :
    β.frozenAt θ ↔ β.values.le (β.distribution β.basin) θ := by
  unfold frozenAt
  rw [β.temperature_eq_distribution]

/-- The hopping predicate is the chosen threshold compared with the basin
distribution value. -/
theorem hoppingAt_iff_le_distribution {G : Substance}
    (β : BasinThermalization G) (θ : β.values.carrier) :
    β.hoppingAt θ ↔ β.values.le θ (β.distribution β.basin) := by
  unfold hoppingAt
  rw [β.temperature_eq_distribution]

/-- Any total stochastic value order classifies the distinguished basin as
frozen or hopping relative to a threshold. -/
theorem threshold_total {G : Substance}
    (β : BasinThermalization G) (θ : β.values.carrier)
    (htotal : ∀ a b : β.values.carrier, β.values.le a b ∨ β.values.le b a) :
    β.frozenAt θ ∨ β.hoppingAt θ := by
  unfold frozenAt hoppingAt
  exact htotal β.temperature θ

/-- If a threshold is both above and below the basin temperature, antisymmetry
of the stochastic value order identifies it with that temperature. -/
theorem frozen_and_hopping_eq_temperature {G : Substance}
    (β : BasinThermalization G) (θ : β.values.carrier)
    (hf : β.frozenAt θ) (hh : β.hoppingAt θ) :
    β.temperature = θ :=
  β.values.le_antisymm hf hh

/-- A basin-indexed thermalization carries balanced flux, positive Landauer
cost at the distinguished basin, and positive hard-flow discharge. -/
theorem produces_landauer_and_discharge {G : Substance}
    (β : BasinThermalization G) :
    Balanced β.flux ∧ 0 < β.landauerCostAt β.basin ∧ 0 < β.firing.discharge :=
  ⟨β.flux_balanced, β.landauerCostAt_pos β.basin, β.firing.discharge_pos⟩

end BasinThermalization

/-! ## Basin free-energy bridge -/

/-- A basin-indexed free-energy bridge for a glass substance. It keeps the
stochastic temperature/Landauer basin thermalization and adds a rational
free-energy descent flow whose states are the same metastable basins. -/
structure BasinFreeEnergyBridge (G : Substance) where
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
def flow {G : Substance} (γ : BasinFreeEnergyBridge G) :
    Infomaterial.Relational.Liquid.DFTFlow where
  State := G.basins.Basin
  Omega := γ.Omega
  step := γ.step
  step_le := γ.step_le
  step_settles := γ.step_settles

/-- The basin relaxation orbit. -/
def orbit {G : Substance} (γ : BasinFreeEnergyBridge G)
    (b : G.basins.Basin) : Nat → G.basins.Basin :=
  Infomaterial.Relational.Liquid.orbit γ.flow b

/-- Basin free energy decreases at every bridge step. -/
theorem orbit_Omega_antitone {G : Substance}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b (n + 1)) ≤ γ.Omega (γ.orbit b n) :=
  Infomaterial.Relational.Liquid.orbit_Omega_antitone γ.flow b n

/-- Along the basin relaxation orbit, free energy remains below its initial
value. -/
theorem orbit_Omega_le_init {G : Substance}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) (n : Nat) :
    γ.Omega (γ.orbit b n) ≤ γ.Omega b :=
  Infomaterial.Relational.Liquid.orbit_Omega_le_init γ.flow b n

/-- A basin minimizing the bridge free energy is fixed by the relaxation step. -/
theorem minimizer_is_equilibrium {G : Substance}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin)
    (h : Infomaterial.Relational.Liquid.IsMinimizer γ.flow b) :
    Infomaterial.Relational.Liquid.IsEquilibrium γ.flow b :=
  Infomaterial.Relational.Liquid.minimizer_is_equilibrium γ.flow b h

/-- The bridge temperature is the basin thermalization temperature. -/
def temperature {G : Substance} (γ : BasinFreeEnergyBridge G) :
    γ.thermalization.values.carrier :=
  γ.thermalization.temperature

/-- Bridge temperature is the stationary distribution value at the distinguished
basin. -/
theorem temperature_eq_distribution {G : Substance}
    (γ : BasinFreeEnergyBridge G) :
    γ.temperature =
      γ.thermalization.distribution γ.thermalization.basin :=
  γ.thermalization.temperature_eq_distribution

/-- The bridge ledger at a basin is its Euler characteristic. -/
theorem ledgerAt_eq_eulerChar {G : Substance}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) :
    γ.thermalization.ledgerAt b =
      Infomaterial.AntiLandauer.eulerChar (γ.thermalization.support b).nerve :=
  γ.thermalization.ledgerAt_eq_eulerChar b

/-- The bridge simultaneously carries rational free-energy descent, balanced
basin temperature, positive Landauer cost, and positive hard-flow discharge. -/
theorem produces_temperature_landauer_and_descent {G : Substance}
    (γ : BasinFreeEnergyBridge G) (b : G.basins.Basin) :
    γ.Omega (γ.step b) ≤ γ.Omega b ∧
      Balanced γ.thermalization.flux ∧
        0 < γ.thermalization.landauerCostAt γ.thermalization.basin ∧
          0 < γ.thermalization.firing.discharge :=
  ⟨γ.step_le b, γ.thermalization.flux_balanced,
    γ.thermalization.landauerCostAt_pos γ.thermalization.basin,
    γ.thermalization.firing.discharge_pos⟩

end BasinFreeEnergyBridge

end Substance
end Relational.Material.Glass
end Infomaterial
