import Infomaterial.Dynamics.Flow.FreeEnergyLyapunov
import Infomaterial.Relational.Spacetime.Support.Charged
import Infomaterial.Persistence.Aperiodic.Percolation
import Infomaterial.Cohomology.AntiLandauerEntropy
import Infomaterial.Calculus.Probability.Stochastic
import Infomaterial.Calculus.Probability.PoissonSettling
import Infomaterial.Relational.Reaction.DetailedBalance

/-!
# Temperature as balanced contradiction flux

This module gives the first small bridge between the zero-temperature Lyapunov
flow and stochastic settling. It keeps the construction at the level already
available in the library: contradiction creation is counted by the gauge orbit or
by a charged causal collision, discharge is the one-step drop of the `Nat`
free-energy deficit, and positive temperature is represented as a value in an
abstract stochastic carrier when creation and discharge are balanced.

## Main definitions

* `gaugeTopCreationCount` counts held-`⊤` appearances in the D8 gauge orbit.
* `freeEnergyDrop` is the one-step Lyapunov discharge.
* `TopCreationSource`, `FreeEnergyFiring`, `StationaryTopState`, and
  `LiftedThermoTransition` retain the upstream evidence behind each scalar:
  creation source, hard-flow firing, stochastic state, and load-bearing support.
* `TopFlux`, `Balanced`, and `balancedTemperature` package a stochastic-carrier
  creation/discharge pair and its zero-net-flux balance value.
* `stationaryFlux` reads Markov stationarity as equality between creation and
  discharge at a state.

## Main results

* `zero_creation_keeps_free_energy_lyapunov` recovers the existing hard-closure
  Lyapunov package when the creation rate vanishes.
* `stationary_flux_balanced` turns `IsStationary` into zero net `⊤` flux.
* `detailed_balance_stationary_flux_balanced` specializes the balance to detailed
  balance.
* `stationary_transition_produces_landauer_and_discharge` and
  `detailed_balance_transition_produces_landauer_and_discharge` add the first
  transition-level production statement: load-bearing support and a closure
  firing give positive Landauer cost and positive free-energy discharge while
  the stochastic flux is balanced.
* `landauerLedger_eq_eulerChar` records the conserved Landauer/anti-Landauer
  ledger identity used by contradiction churn.
-/

namespace Infomaterial
namespace Thermodynamics.Temperature

open Probability.Stochastic

/-! ## Creation and discharge -/

/-- The per-gauge-orbit held-`⊤` creation count: the number of inconsistent charges
seen across the D8 orbit of a charge. -/
def gaugeTopCreationCount (a : Charge) : Nat :=
  List.countP (fun c => Charge.isInconsistency c) (List.map (fun g => D4.D8.act g a) D4.D8.all)

/-- The D8 gauge orbit creates held-`⊤` at the quarter-rate already proved by the
percolation front. -/
theorem gauge_top_creation_quarter (a : Charge) :
    gaugeTopCreationCount a * 4 = D4.D8.all.length := by
  unfold gaugeTopCreationCount
  exact Persistence.Aperiodic.condensate_baserate_quarter a

/-- A causal collision of contradictory charges mints held `⊤` at the target event. -/
theorem collision_top_minted {E : Type} (le : E → E → Bool) (a₁ a₂ z : E)
    (h₁ : le a₁ z = true) (h₂ : le a₂ z = true) :
    Relational.Spacetime.Support.Charged.emit2 le a₁ Charge.tTop a₂ Charge.tBot z =
      Charge.kTop :=
  Relational.Spacetime.Support.Charged.collision_conflict le a₁ a₂ z h₁ h₂

/-- A bundled causal-collision witness that keeps the event type and the two
incoming contradictory sources. -/
structure CollisionTopMint where
  /-- The event carrier of the causal collision. -/
  Event : Type
  /-- The finite causal reachability test used by the charged support. -/
  le : Event → Event → Bool
  /-- The positive source. -/
  positive : Event
  /-- The negative source. -/
  negative : Event
  /-- The common target event. -/
  target : Event
  /-- The positive source reaches the target. -/
  positive_reaches : le positive target = true
  /-- The negative source reaches the target. -/
  negative_reaches : le negative target = true

namespace CollisionTopMint

/-- The bundled collision mints held `⊤` at its target. -/
theorem mintsTop (m : CollisionTopMint) :
    Relational.Spacetime.Support.Charged.emit2 m.le m.positive Charge.tTop
        m.negative Charge.tBot m.target = Charge.kTop :=
  collision_top_minted m.le m.positive m.negative m.target
    m.positive_reaches m.negative_reaches

end CollisionTopMint

/-- Upstream evidence for held-`⊤` creation: either a D8 gauge orbit or a concrete
causal collision. -/
inductive TopCreationSource where
  /-- Gauge-orbit creation from a charge. -/
  | gauge (a : Charge)
  /-- Causal collision creation from contradictory sources. -/
  | collision (m : CollisionTopMint)

namespace TopCreationSource

/-- The Nat creation count associated to a source. A collision contributes one
target event; a gauge source keeps the full D8 orbit count. -/
def count : TopCreationSource → Nat
  | gauge a => gaugeTopCreationCount a
  | collision _ => 1

/-- Gauge-source counts satisfy the D8 quarter-rate. -/
theorem gauge_count_quarter (a : Charge) :
    count (gauge a) * 4 = D4.D8.all.length :=
  gauge_top_creation_quarter a

/-- Collision-source evidence really mints held `⊤`. -/
theorem collision_mintsTop (m : CollisionTopMint) :
    Relational.Spacetime.Support.Charged.emit2 m.le m.positive Charge.tTop
        m.negative Charge.tBot m.target = Charge.kTop :=
  m.mintsTop

/-- Every retained creation source has positive `Nat` creation count. -/
theorem count_pos (s : TopCreationSource) : 0 < s.count := by
  cases s with
  | gauge a =>
      change 0 < gaugeTopCreationCount a
      unfold gaugeTopCreationCount
      rw [Persistence.Aperiodic.gauge_orbit_equidistributes a]
      omega
  | collision _ =>
      change 0 < (1 : Nat)
      omega

end TopCreationSource

/-- The one-step discharge rate of the hard closure flow: the free-energy drop
between step `n` and step `n + 1`. -/
def freeEnergyDrop (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) (n : Nat) : Nat :=
  Valuation.freeEnergy c seed cells n - Valuation.freeEnergy c seed cells (n + 1)

/-- A Nat-valued creation process vanishes at every step. -/
def ZeroCreation (creation : Nat → Nat) : Prop :=
  ∀ n, creation n = 0

/-- With no `⊤` creation, the flow is the existing zero-temperature Lyapunov descent. -/
theorem zero_creation_keeps_free_energy_lyapunov
    (creation : Nat → Nat) (_h0 : ZeroCreation creation)
    (c : Charge.Closure) (seed : Valuation) (cells : List PredicationCell) :
    (∀ n, Valuation.freeEnergy c seed cells (n + 1) ≤
        Valuation.freeEnergy c seed cells n) ∧
      (∀ n φ, φ ∈ cells →
        Valuation.fenOrbit c seed n φ ≠ Valuation.fenOrbit c seed (n + 1) φ →
        Valuation.freeEnergy c seed cells (n + 1) <
          Valuation.freeEnergy c seed cells n) ∧
      Valuation.freeEnergy c seed cells 1 = 0 ∧
        ∃ N, Valuation.fenOrbit c seed N = Valuation.settleLift c seed ∧
          N ≤ Valuation.freeEnergy c seed cells 0 + 1 := by
  exact Valuation.free_energy_is_lyapunov c seed cells

/-- A firing step has positive free-energy discharge. -/
theorem freeEnergyDrop_pos_of_fires (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) (n : Nat) (φ : PredicationCell)
    (hmem : φ ∈ cells)
    (hfire : Valuation.fenOrbit c seed n φ ≠ Valuation.fenOrbit c seed (n + 1) φ) :
    0 < freeEnergyDrop c seed cells n := by
  have hlt := Valuation.freeEnergy_strict_of_fires c seed cells n φ hmem hfire
  unfold freeEnergyDrop
  omega

/-- A bundled hard-closure firing witness, retaining the closure, seed, support,
time, and fired cell instead of projecting immediately to a scalar discharge. -/
structure FreeEnergyFiring where
  /-- The hard closure being iterated. -/
  closure : Charge.Closure
  /-- The seed valuation. -/
  seed : Valuation
  /-- The finite support used by the free-energy ledger. -/
  cells : List PredicationCell
  /-- The firing time. -/
  time : Nat
  /-- The support cell that fires. -/
  cell : PredicationCell
  /-- The fired cell lies in the support. -/
  cell_mem : cell ∈ cells
  /-- The fired cell changes across the step. -/
  fired : Valuation.fenOrbit closure seed time cell ≠
    Valuation.fenOrbit closure seed (time + 1) cell

namespace FreeEnergyFiring

/-- The discharge attached to a bundled firing. -/
def discharge (f : FreeEnergyFiring) : Nat :=
  freeEnergyDrop f.closure f.seed f.cells f.time

/-- Bundled firing witnesses have positive discharge. -/
theorem discharge_pos (f : FreeEnergyFiring) : 0 < f.discharge :=
  freeEnergyDrop_pos_of_fires f.closure f.seed f.cells f.time f.cell
    f.cell_mem f.fired

end FreeEnergyFiring

/-! ## Stochastic balance -/

/-- A creation/discharge pair valued in a stochastic semiring. -/
structure TopFlux (V : StochSemiring) where
  /-- The per-step `⊤` creation value. -/
  creation : V.carrier
  /-- The per-step `⊤` discharge value. -/
  discharge : V.carrier

/-- Zero net `⊤` flux: creation and discharge agree in the carrier. -/
def Balanced {V : StochSemiring} (F : TopFlux V) : Prop :=
  F.creation = F.discharge

/-- The balanced temperature value, taken as the common discharge value of a
zero-net-flux pair. -/
def balancedTemperature {V : StochSemiring} (F : TopFlux V) (_h : Balanced F) :
    V.carrier :=
  F.discharge

/-- The flux attached to a Markov state: stochastic advance is creation and the
stationary distribution value is discharge. -/
def stationaryFlux {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) (s : S) : TopFlux V where
  creation := K.advance π s
  discharge := π s

/-- Markov stationarity is zero net `⊤` flux at each state. -/
theorem stationary_flux_balanced {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) (s : S)
    (h : IsStationary K π) : Balanced (stationaryFlux K π s) := by
  unfold Balanced stationaryFlux
  exact congrFun ((markov_stationary_is_closure_fixpoint K π).1 h) s

/-- The stationary balance temperature at a state is the stationary distribution
value at that state. -/
theorem stationary_temperature_eq_distribution {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) (s : S)
    (h : IsStationary K π) :
    balancedTemperature (stationaryFlux K π s) (stationary_flux_balanced K π s h) =
      π s := rfl

/-- A stationary stochastic state with the kernel, distribution, state, and
stationarity proof retained. -/
structure StationaryTopState (S : Type) (V : StochSemiring) where
  /-- The stochastic transition kernel. -/
  kernel : MarkovKernel S V
  /-- The stationary distribution. -/
  distribution : S → V.carrier
  /-- The state at which the flux is read. -/
  state : S
  /-- The stationary fixed-point proof. -/
  stationary : IsStationary kernel distribution

namespace StationaryTopState

/-- The `TopFlux` read from a bundled stationary state. -/
def flux {S : Type} {V : StochSemiring} (σ : StationaryTopState S V) : TopFlux V :=
  stationaryFlux σ.kernel σ.distribution σ.state

/-- Bundled stationary states have balanced flux. -/
theorem flux_balanced {S : Type} {V : StochSemiring} (σ : StationaryTopState S V) :
    Balanced σ.flux :=
  stationary_flux_balanced σ.kernel σ.distribution σ.state σ.stationary

/-- The balanced temperature value read from a bundled stationary state. -/
def temperature {S : Type} {V : StochSemiring} (σ : StationaryTopState S V) :
    V.carrier :=
  balancedTemperature σ.flux σ.flux_balanced

/-- The stationary temperature is the retained stationary distribution value. -/
theorem temperature_eq_distribution {S : Type} {V : StochSemiring}
    (σ : StationaryTopState S V) :
    σ.temperature = σ.distribution σ.state := rfl

end StationaryTopState

/-- Detailed balance gives a stationary zero-net-flux temperature at each state. -/
theorem detailed_balance_stationary_flux_balanced {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier)
    (hrev : ∀ z o, V.mul (π z) (K.P z o) = V.mul (π o) (K.P o z))
    (hrow : ∀ o, K.sum (fun z => K.P o z) = V.one) (s : S) :
    Balanced (stationaryFlux K π s) :=
  stationary_flux_balanced K π s
    (Probability.PoissonSettling.detailed_balance_implies_stationary K π hrev hrow)

/-- Under detailed balance, the distinguished temperature value is the stationary
distribution value at the state. -/
theorem detailed_balance_temperature_eq_distribution {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier)
    (hrev : ∀ z o, V.mul (π z) (K.P z o) = V.mul (π o) (K.P o z))
    (hrow : ∀ o, K.sum (fun z => K.P o z) = V.one) (s : S) :
    balancedTemperature (stationaryFlux K π s)
        (detailed_balance_stationary_flux_balanced K π hrev hrow s) =
      π s := rfl

/-- A detailed-balanced stochastic state, retaining the reversibility and row
normalization witnesses rather than projecting directly to stationarity. -/
structure DetailedBalancedTopState (S : Type) (V : StochSemiring) where
  /-- The stochastic transition kernel. -/
  kernel : MarkovKernel S V
  /-- The distribution. -/
  distribution : S → V.carrier
  /-- The state at which the flux is read. -/
  state : S
  /-- Microscopic reversibility. -/
  reversible :
    ∀ z o, V.mul (distribution z) (kernel.P z o) =
      V.mul (distribution o) (kernel.P o z)
  /-- Row normalization. -/
  row_sum : ∀ o, kernel.sum (fun z => kernel.P o z) = V.one

namespace DetailedBalancedTopState

/-- Detailed balance gives the retained stationary state. -/
def toStationaryTopState {S : Type} {V : StochSemiring}
    (δ : DetailedBalancedTopState S V) : StationaryTopState S V where
  kernel := δ.kernel
  distribution := δ.distribution
  state := δ.state
  stationary :=
    Probability.PoissonSettling.detailed_balance_implies_stationary
      δ.kernel δ.distribution δ.reversible δ.row_sum

/-- The `TopFlux` read from a bundled detailed-balanced state. -/
def flux {S : Type} {V : StochSemiring} (δ : DetailedBalancedTopState S V) :
    TopFlux V :=
  δ.toStationaryTopState.flux

/-- Bundled detailed-balanced states have balanced flux. -/
theorem flux_balanced {S : Type} {V : StochSemiring}
    (δ : DetailedBalancedTopState S V) : Balanced δ.flux :=
  δ.toStationaryTopState.flux_balanced

end DetailedBalancedTopState

/-! ## Transition production -/

/-- At a stationary state, a load-bearing support and a firing step give balanced
stochastic flux together with positive Landauer cost and positive hard-flow
discharge. -/
theorem stationary_transition_produces_landauer_and_discharge
    {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) (s : S)
    (hstat : IsStationary K π) (N : Cohomology.CoverNerve)
    (hload : Persistence.Aperiodic.loadBearing N)
    (c : Charge.Closure) (seed : Valuation) (cells : List PredicationCell)
    (n : Nat) (φ : PredicationCell) (hmem : φ ∈ cells)
    (hfire : Valuation.fenOrbit c seed n φ ≠ Valuation.fenOrbit c seed (n + 1) φ) :
    Balanced (stationaryFlux K π s) ∧
      0 < Landauer.landauerBits N ∧
        0 < freeEnergyDrop c seed cells n := by
  exact ⟨stationary_flux_balanced K π s hstat,
    (Persistence.Aperiodic.loadBearing_iff_landauer N).1 hload,
    freeEnergyDrop_pos_of_fires c seed cells n φ hmem hfire⟩

/-- Under detailed balance, a load-bearing support and a firing step give balanced
stochastic flux together with positive Landauer cost and positive hard-flow
discharge. -/
theorem detailed_balance_transition_produces_landauer_and_discharge
    {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier)
    (hrev : ∀ z o, V.mul (π z) (K.P z o) = V.mul (π o) (K.P o z))
    (hrow : ∀ o, K.sum (fun z => K.P o z) = V.one) (s : S)
    (N : Cohomology.CoverNerve) (hload : Persistence.Aperiodic.loadBearing N)
    (c : Charge.Closure) (seed : Valuation) (cells : List PredicationCell)
    (n : Nat) (φ : PredicationCell) (hmem : φ ∈ cells)
    (hfire : Valuation.fenOrbit c seed n φ ≠ Valuation.fenOrbit c seed (n + 1) φ) :
    Balanced (stationaryFlux K π s) ∧
      0 < Landauer.landauerBits N ∧
        0 < freeEnergyDrop c seed cells n := by
  exact ⟨detailed_balance_stationary_flux_balanced K π hrev hrow s,
    (Persistence.Aperiodic.loadBearing_iff_landauer N).1 hload,
    freeEnergyDrop_pos_of_fires c seed cells n φ hmem hfire⟩

/-! ## Landauer ledger -/

/-- The Landauer ledger whose invariant is the Euler characteristic. -/
def landauerLedger (N : Cohomology.CoverNerve) : Int :=
  (AntiLandauer.antiLandauerBits N : Int) - (Landauer.landauerBits N : Int)

/-- Load-bearing support is exactly positive Landauer cost. -/
theorem loadBearing_iff_positive_landauer (N : Cohomology.CoverNerve) :
    Persistence.Aperiodic.loadBearing N ↔ 0 < Landauer.landauerBits N :=
  Persistence.Aperiodic.loadBearing_iff_landauer N

/-- The Landauer/anti-Landauer ledger is the Euler characteristic. -/
theorem landauerLedger_eq_eulerChar (N : Cohomology.CoverNerve) :
    landauerLedger N = AntiLandauer.eulerChar N := by
  unfold landauerLedger
  exact AntiLandauer.index_balance N

/-- A load-bearing support with its nerve retained. -/
structure LandauerSupport where
  /-- The support nerve. -/
  nerve : Cohomology.CoverNerve
  /-- The support bears load, hence has positive Landauer cost. -/
  loadBearing : Persistence.Aperiodic.loadBearing nerve

namespace LandauerSupport

/-- The Landauer cost of a bundled load-bearing support. -/
def cost (L : LandauerSupport) : Nat :=
  Landauer.landauerBits L.nerve

/-- Bundled load-bearing supports have positive Landauer cost. -/
theorem cost_pos (L : LandauerSupport) : 0 < L.cost :=
  (loadBearing_iff_positive_landauer L.nerve).1 L.loadBearing

/-- The Landauer ledger of a bundled support. -/
def ledger (L : LandauerSupport) : Int :=
  landauerLedger L.nerve

/-- The bundled support ledger is its Euler characteristic. -/
theorem ledger_eq_eulerChar (L : LandauerSupport) :
    L.ledger = AntiLandauer.eulerChar L.nerve :=
  landauerLedger_eq_eulerChar L.nerve

end LandauerSupport

/-! ## Lifted transitions -/

/-- A thermodynamic transition that retains every upstream witness: creation
source, stationary stochastic state, load-bearing support, and hard-flow firing. -/
structure LiftedThermoTransition (S : Type) (V : StochSemiring) where
  /-- Upstream held-`⊤` creation evidence. -/
  creation : TopCreationSource
  /-- The balanced stochastic state. -/
  stochastic : StationaryTopState S V
  /-- The support carrying Landauer cost. -/
  support : LandauerSupport
  /-- The hard-flow firing that discharges free energy. -/
  firing : FreeEnergyFiring

namespace LiftedThermoTransition

/-- The retained creation count of a lifted transition. -/
def creationCount {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : Nat :=
  τ.creation.count

/-- Lifted transitions retain a positive held-`⊤` creation count. -/
theorem creationCount_pos {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : 0 < τ.creationCount :=
  τ.creation.count_pos

/-- The retained stochastic flux of a lifted transition. -/
def flux {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : TopFlux V :=
  τ.stochastic.flux

/-- The retained balanced temperature value of a lifted transition. -/
def temperature {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : V.carrier :=
  τ.stochastic.temperature

/-- The retained Landauer cost of a lifted transition. -/
def landauerCost {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : Nat :=
  τ.support.cost

/-- The retained hard-flow discharge of a lifted transition. -/
def discharge {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : Nat :=
  τ.firing.discharge

/-- Lifted transitions have balanced stochastic flux. -/
theorem flux_balanced {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) : Balanced τ.flux :=
  τ.stochastic.flux_balanced

/-- Lifted transitions retain the stationary distribution as their temperature
value. -/
theorem temperature_eq_distribution {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) :
    τ.temperature = τ.stochastic.distribution τ.stochastic.state :=
  τ.stochastic.temperature_eq_distribution

/-- Lifted transitions carry positive Landauer cost and positive hard-flow
discharge. -/
theorem produces_landauer_and_discharge {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) :
    Balanced τ.flux ∧ 0 < τ.landauerCost ∧ 0 < τ.discharge :=
  ⟨τ.flux_balanced, τ.support.cost_pos, τ.firing.discharge_pos⟩

/-- Lifted transitions carry the full finite churn package: positive creation,
balanced stochastic flux, positive Landauer cost, and positive hard-flow
discharge. -/
theorem produces_creation_landauer_and_discharge {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) :
    0 < τ.creationCount ∧ Balanced τ.flux ∧
      0 < τ.landauerCost ∧ 0 < τ.discharge :=
  ⟨τ.creationCount_pos, τ.flux_balanced, τ.support.cost_pos,
    τ.firing.discharge_pos⟩

end LiftedThermoTransition

end Thermodynamics.Temperature
end Infomaterial
