import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Thermodynamics.Temperature

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Thermodynamics.Temperature
open Obsmetrologia.Probability.Stochastic

/-!
A Book IX teaching chapter for informational thermodynamics: Landauer cost,
anti-Landauer retention, balanced stochastic temperature, and lifted
thermodynamic transitions.
-/

#doc (Manual) "Informational thermodynamics" =>

# Informational Thermodynamics

Informational thermodynamics is the physical-phase reading of settled
information flow. It is not introduced as an ambient physics theory. In this
book it becomes lawful only after four carriers are already present:
cohomological obstruction, hard closure discharge, stochastic stationarity, and
load-bearing support.

The claim-site carried here is:

* claim-site: informational thermodynamics as balanced contradiction flux with
  Landauer and anti-Landauer ledgers;
* phase: relational physical phases after closure, cohomology, stochastic
  settling, and persistent support are available;
* generating sites: cover nerves, coordination cohomology, Landauer entropy,
  anti-Landauer entropy, hard free-energy descent, Markov stationarity, detailed
  balance, held-inconsistency creation, and load-bearing aperiodic support;
* downstream uses: reaction thermodynamics, material load-bearing, causal
  shrouds, dense-matter diagnostics, and frontier continuum thermodynamics;
* Lean declarations: `Landauer.landauerBits`, `AntiLandauer.antiLandauerBits`,
  `AntiLandauer.index_balance`, `TopCreationSource`, `freeEnergyDrop`,
  `TopFlux`, `Balanced`, `balancedTemperature`, `stationaryFlux`,
  `detailed_balance_stationary_flux_balanced`, `LandauerSupport`,
  `LiftedThermoTransition`, and
  `LiftedThermoTransition.produces_creation_landauer_and_discharge`;
* Blueprint/proof-tree nodes: this page promotes the current Lean witnesses as
  finite and cohomological thermodynamic carriers; continuum heat baths,
  fluctuation theorems, and smooth nonequilibrium thermodynamics remain
  frontier;
* provenance: Landauer/anti-Landauer cohomology, closure-flow Lyapunov,
  stochastic settling, detailed-balance, and aperiodic load-bearing modules;
* familiar mathematical comparison: Landauer principle, detailed balance,
  stationary temperature, entropy ledger, free-energy discharge, and
  thermodynamic irreversibility;
* reader closure: ask which carrier is being measured before reading a word
  like heat, temperature, entropy, or reversibility;
* frontier status: no continuum bath, measure-theoretic entropy production,
  physical units, or smooth thermodynamic limit is claimed here.

The governing sentence is:

> Informational thermodynamics enters as a ledger on generated carriers, not as
> an imported law of nature.

## Landauer And Anti-Landauer

The irreversible side is the coordination obstruction. A cover nerve with
nonzero cycle rank carries Landauer bits:

{docstring Obsmetrologia.Landauer.landauerBits}

{docstring Obsmetrologia.Landauer.landauer_zero_iff_reversible}

{docstring Obsmetrologia.Landauer.landauer_eq_coordination_cost}

The retained side is anti-Landauer content: the harmonic/global-section count.

{docstring Obsmetrologia.AntiLandauer.antiLandauerBits}

{docstring Obsmetrologia.AntiLandauer.antiLandauer_eq_components}

{docstring Obsmetrologia.AntiLandauer.index_balance}

{docstring Obsmetrologia.AntiLandauer.consensusCharge}

{docstring Obsmetrologia.AntiLandauer.contradictionCharge}

{docstring Obsmetrologia.AntiLandauer.antimatterCharge}

{docstring Obsmetrologia.AntiLandauer.matterCharge}

{docstring Obsmetrologia.AntiLandauer.net_charge_balance}

{docstring Obsmetrologia.AntiLandauer.matter_antimatter_balance}

{docstring Obsmetrologia.AntiLandauer.equal_pair_creation_preserves_net}

{docstring Obsmetrologia.AntiLandauer.fixed_net_cycle_requires_consensus}

{docstring Obsmetrologia.AntiLandauer.PreservesEuler}

{docstring Obsmetrologia.AntiLandauer.preservesEuler_iff_balanced_h0_h1_delta}

{docstring Obsmetrologia.AntiLandauer.ClosureIndexStep}

{docstring Obsmetrologia.AntiLandauer.ClosureIndexStep.preserves_net_charge}

{docstring Obsmetrologia.AntiLandauer.ClosureIndexStep.preserves_matter_antimatter_balance}

Checked:

```lean
example (N : Cohomology.CoverNerve) :
    (AntiLandauer.antiLandauerBits N : Int)
      - (Landauer.landauerBits N : Int)
        = AntiLandauer.eulerChar N :=
  AntiLandauer.index_balance N

example (N N' : Cohomology.CoverNerve) (d : Nat)
    (hnet :
      AntiLandauer.netCharge N'
        = AntiLandauer.netCharge N)
    (hcycle :
      AntiLandauer.contradictionCharge N' =
        AntiLandauer.contradictionCharge N + d) :
    AntiLandauer.consensusCharge N' =
      AntiLandauer.consensusCharge N + d :=
  AntiLandauer.fixed_net_cycle_requires_consensus
    N N' d hnet hcycle

example (N N' : Cohomology.CoverNerve) :
    AntiLandauer.PreservesEuler N N'
      <->
        (AntiLandauer.antiLandauerBits N' : Int)
          - (AntiLandauer.antiLandauerBits N : Int)
            =
        (Landauer.landauerBits N' : Int)
          - (Landauer.landauerBits N : Int) :=
  AntiLandauer.preservesEuler_iff_balanced_h0_h1_delta N N'

example (s : AntiLandauer.ClosureIndexStep) :
    (AntiLandauer.antimatterCharge s.after : Int)
        - (AntiLandauer.matterCharge s.after : Int)
      =
      (AntiLandauer.antimatterCharge s.before : Int)
        - (AntiLandauer.matterCharge s.before : Int) :=
  AntiLandauer.ClosureIndexStep.preserves_matter_antimatter_balance s
```

The reader closure is that Landauer and anti-Landauer are not two metaphors for
entropy. They are the two sides of a finite index ledger: obstruction discarded
by settling and harmonic content retained by settling. The pair-creation law
proved here is an index law, not yet a dynamical temperature theorem: at fixed
net charge, creating contradiction requires matching consensus creation.
The closure-step theorem is also finite and ledger-level: once a step is
projected to a cover-nerve transition that preserves `chi`, the `(H0,H1)`
movement is forced to be balanced. The stronger Noether-current reading still
needs a carrier where the `D4` gauge action acts on those closure-index steps.

## Creation And Discharge

The temperature page separates creation from discharge. Held contradiction can
arrive from a gauge orbit or a causal collision:

{docstring Obsmetrologia.Thermodynamics.Temperature.TopCreationSource}

{docstring Obsmetrologia.Thermodynamics.Temperature.TopCreationSource.count}

{docstring Obsmetrologia.Thermodynamics.Temperature.TopCreationSource.gauge_count_quarter}

{docstring Obsmetrologia.Thermodynamics.Temperature.TopCreationSource.collision_mintsTop}

{docstring Obsmetrologia.Thermodynamics.Temperature.TopCreationSource.count_pos}

Hard closure supplies the discharge scalar:

{docstring Obsmetrologia.Thermodynamics.Temperature.freeEnergyDrop}

{docstring Obsmetrologia.Thermodynamics.Temperature.freeEnergyDrop_pos_of_fires}

{docstring Obsmetrologia.Thermodynamics.Temperature.FreeEnergyFiring}

{docstring Obsmetrologia.Thermodynamics.Temperature.FreeEnergyFiring.discharge_pos}

Checked:

```lean
example (f : FreeEnergyFiring) : 0 < f.discharge :=
  FreeEnergyFiring.discharge_pos f
```

This is the zero-temperature side of the bridge: hard closure descends a
free-energy ledger. The page does not claim a smooth energy functional or a
continuum heat bath.

{docstring Obsmetrologia.Thermodynamics.Temperature.zeroCreation}

{docstring Obsmetrologia.Thermodynamics.Temperature.zeroCreation_zero}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.recovers_nat_lyapunov}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.hard_closure_laws}

{docstring Obsmetrologia.Thermodynamics.Temperature.zero_temperature_recovers_nat_lyapunov}

Checked:

```lean
example (ζ : ZeroTemperatureFlow) :
    (∀ n, Valuation.freeEnergy ζ.closure ζ.seed ζ.cells (n + 1) ≤
        Valuation.freeEnergy ζ.closure ζ.seed ζ.cells n) ∧
      (∀ n φ, φ ∈ ζ.cells →
        Valuation.fenOrbit ζ.closure ζ.seed n φ ≠
          Valuation.fenOrbit ζ.closure ζ.seed (n + 1) φ →
        Valuation.freeEnergy ζ.closure ζ.seed ζ.cells (n + 1) <
          Valuation.freeEnergy ζ.closure ζ.seed ζ.cells n) ∧
      Valuation.freeEnergy ζ.closure ζ.seed ζ.cells 1 = 0 ∧
        ∃ N, Valuation.fenOrbit ζ.closure ζ.seed N =
            Valuation.settleLift ζ.closure ζ.seed ∧
          N ≤ Valuation.freeEnergy ζ.closure ζ.seed ζ.cells 0 + 1 :=
  ζ.recovers_nat_lyapunov
```

## Balanced Stochastic Temperature

Positive temperature is represented only after a stochastic carrier is present.
The carrier records creation and discharge in the same stochastic semiring, and
temperature is the common value under balance.

{docstring Obsmetrologia.Thermodynamics.Temperature.TopFlux}

{docstring Obsmetrologia.Thermodynamics.Temperature.Balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.balancedTemperature}

{docstring Obsmetrologia.Thermodynamics.Temperature.balancedTemperature_unique}

{docstring Obsmetrologia.Thermodynamics.Temperature.rational_temperature_unique}

{docstring Obsmetrologia.Thermodynamics.Temperature.stationaryFlux}

{docstring Obsmetrologia.Thermodynamics.Temperature.stationary_flux_balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.stationary_temperature_eq_distribution}

{docstring Obsmetrologia.Thermodynamics.Temperature.stationary_temperature_unique}

Detailed balance is the reversible path into the same stationary flux claim:

{docstring Obsmetrologia.Thermodynamics.Temperature.detailed_balance_stationary_flux_balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.detailed_balance_temperature_eq_distribution}

{docstring Obsmetrologia.Thermodynamics.Temperature.detailed_balance_temperature_unique}

Checked:

```lean
example {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V)
    (π : S -> V.carrier) (s : S)
    (h : IsStationary K π) :
    Balanced (stationaryFlux K π s) :=
  stationary_flux_balanced K π s h

example {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V)
    (π : S -> V.carrier) (s : S)
    (h : IsStationary K π) :
    ∃ T : V.carrier,
      (T = K.advance π s /\ T = π s) /\
        ∀ U : V.carrier, U = K.advance π s /\ U = π s -> U = T :=
  stationary_temperature_unique K π s h

example (mint discharge : Real.Internal.Rat)
    (hdischarge : discharge ≠ 0) :
    ∃ T : Real.Internal.Rat,
      discharge * T = mint /\
        ∀ U : Real.Internal.Rat, discharge * U = mint -> U = T :=
  rational_temperature_unique mint discharge hdischarge
```

Temperature is therefore not a primitive scalar. It is a named reading of
balanced stochastic flux. Over the internal rational carrier, nonzero discharge
also supports a quotient characterization: the temperature is the unique value
whose discharge multiple recovers the mint rate. A full real-valued quotient of
independent analytic rates remains a stronger frontier claim.

## Load-Bearing Support

Landauer cost becomes physical in this finite carrier when it is attached to
load-bearing support.

{docstring Obsmetrologia.Thermodynamics.Temperature.loadBearing_iff_positive_landauer}

{docstring Obsmetrologia.Thermodynamics.Temperature.landauerLedger}

{docstring Obsmetrologia.Thermodynamics.Temperature.landauerLedger_eq_eulerChar}

{docstring Obsmetrologia.Thermodynamics.Temperature.LandauerSupport}

{docstring Obsmetrologia.Thermodynamics.Temperature.LandauerSupport.cost_pos}

{docstring Obsmetrologia.Thermodynamics.Temperature.LandauerSupport.ledger_eq_eulerChar}

Checked:

```lean
example (L : LandauerSupport) :
    0 < L.cost :=
  LandauerSupport.cost_pos L

example (L : LandauerSupport) :
    L.ledger = AntiLandauer.eulerChar L.nerve :=
  LandauerSupport.ledger_eq_eulerChar L
```

The physical reading is narrow and useful: load-bearing support holds positive
Landauer cost. The index ledger still remembers the anti-Landauer side.

## Lifted Thermodynamic Transitions

The lifted transition is the first bundled informational-thermodynamic object in
the current library. It retains all four witnesses instead of projecting them
away: creation source, stationary stochastic state, Landauer support, and hard
closure firing.

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.creationCount}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.creationCount_pos}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.flux_balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.temperature_eq_distribution}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.temperature_unique}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.produces_landauer_and_discharge}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.produces_creation_landauer_and_discharge}

Checked:

```lean
example {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) :
    0 < τ.creationCount
      /\ Balanced τ.flux
      /\ 0 < τ.landauerCost
      /\ 0 < τ.discharge :=
  τ.produces_creation_landauer_and_discharge
```

This is the current teachable closure for informational thermodynamics. A
transition carries positive held-top creation, balanced stochastic flux,
positive Landauer cost, and positive hard-flow discharge when the corresponding
witnesses are supplied.

## Reader Closure

When later pages say informational thermodynamics, perform this closure:

* Landauer means cohomological obstruction counted in bits;
* anti-Landauer means harmonic/global-section content retained by settling;
* temperature means balanced stochastic creation/discharge flux;
* discharge means one-step hard-closure free-energy drop;
* support means a load-bearing cover nerve with positive Landauer cost;
* transition means the bundled witness retaining all of the above.

Any stronger claim needs a new carrier. In particular, continuum heat flow,
physical units, fluctuation relations, and smooth nonequilibrium entropy
production are not consequences of this page.
