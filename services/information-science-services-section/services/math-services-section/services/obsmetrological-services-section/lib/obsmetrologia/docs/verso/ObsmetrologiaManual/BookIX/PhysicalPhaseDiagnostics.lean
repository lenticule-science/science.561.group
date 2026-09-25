import ObsmetrologiaManual.DocSetup
import Obsmetrologia.KineticTheory.Gas.BoltzmannClosure
import Obsmetrologia.KineticTheory.Gas.MolecularChaosGluing
import Obsmetrologia.KineticTheory.Plasma.Quasineutrality
import Obsmetrologia.KineticTheory.Plasma.DebyeGraphScreening
import Obsmetrologia.KineticTheory.Plasma.TopologicalWaveSheaf
import Obsmetrologia.DenseMatter.Neutron.EOS
import Obsmetrologia.DenseMatter.Neutron.PastaTopology
import Obsmetrologia.KineticTheory.Liquid.OrnsteinZernikeClosure
import Obsmetrologia.KineticTheory.Liquid.DensityFunctionalFlow
import Obsmetrologia.Thermodynamics.BoltzmannEntropy
import Obsmetrologia.ReactionNetworks.FreeEnergyDescent
import Obsmetrologia.ReactionNetworks.MassActionRate
import Obsmetrologia.ReactionNetworks.Entropy
import Obsmetrologia.ReactionNetworks.DetailedBalance
import Obsmetrologia.Thermodynamics.Temperature
import Obsmetrologia.QuantumContextuality.MagicSquare
import Obsmetrologia.QuantumContextuality.LeggettGarg
import Obsmetrologia.QuantumContextuality.SupportContextuality

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.KineticTheory.Gas
open Obsmetrologia.Thermodynamics.Temperature
open Obsmetrologia.Probability.Stochastic

/-!
A second Book IX teaching chapter for physical phase diagnostics beyond the first
cross-domain witness page.
-/

#doc (Manual) "Physical diagnostics" =>

# Physical Phase Diagnostics

The first physical-witness page teaches the common form: an older physical
subject enters Obsmetrologia only when it witnesses generated relational behavior.
This chapter adds diagnostic depth. It is still not a physics survey. It is a
phase-filed set of tests for whether the generated carriers are doing real work.

The claim-site carried here is:

* claim-site: physical diagnostics as phase-local tests of relational matter;
* phase: relational physical phases after closure, gluing, and persistence are
  lawful;
* generating sites: closure rules, valuation gluing, cohomological obstruction,
  Lyapunov descent, value-settling, internal reals, finite support models;
* downstream uses: kinetic invariants, molecular-chaos obstruction, plasma
  screening, dense-matter admissibility, pasta topology, liquid closure, reaction
  thermodynamics, detailed balance, and stronger contextuality witnesses;
* Lean carriers: `Obsmetrologia.KineticTheory.Gas.*`,
  `Obsmetrologia.KineticTheory.Plasma.*`, `Obsmetrologia.DenseMatter.Neutron.*`,
  `Obsmetrologia.KineticTheory.Liquid.*`, `Obsmetrologia.Thermodynamics.*`,
  `Obsmetrologia.ReactionNetworks.*`, `Obsmetrologia.QuantumContextuality.*`;
* Blueprint/proof-tree nodes: Blueprint has relational-physics contextuality
  coverage; the mark proof-tree remains provenance for the primitive base, not
  evidence for these physical carriers;
* provenance: older gases, liquids, plasmas, dense matter, and quantum notes are
  refit here only when a Lean declaration names the carrier;
* familiar comparison: collision invariants, Debye screening, equations of state,
  Ornstein-Zernike closure, density-functional descent, Boltzmann H-theorem,
  detailed balance, magic-square and Leggett-Garg contextuality;
* reader closure: identify the generated behavior before reading the physical
  name;
* frontier status: continuum PDEs, Hilbert-space operator models, measure
  theory, Fourier analysis, many-body nuclear physics, and full relative
  cohomological contextuality remain frontier unless their carriers are built.

The governing sentence is:

> A physical diagnostic is admitted when it distinguishes a generated phase
> behavior from a familiar resemblance.

## Kinetic Diagnostics

Kinetic theory first tests whether collision rules preserve the quantities they
claim to preserve. The collision carrier is
{name Obsmetrologia.KineticTheory.Gas.Collision}`Collision`, and the finite
closure reading is:

{docstring Obsmetrologia.KineticTheory.Gas.collisionRule}

{docstring Obsmetrologia.KineticTheory.Gas.finite_boltzmann_collision_lfp}

The invariant theorem is:

{docstring Obsmetrologia.KineticTheory.Gas.finite_collision_invariants_preserved}

Checked:

```lean
example {V : Type} {cs : List (Collision V)}
    {w : V -> Int}
    (hcs : forall c, c ∈ cs ->
      Collision.Conserves c w)
    {p q : Population V}
    (h : Evolves cs p q) :
    total w p = total w q :=
  finite_collision_invariants_preserved hcs h
```

The next diagnostic is molecular chaos. It is not a slogan about gases; in this
carrier it is separated gluing of a two-particle joint:

{docstring Obsmetrologia.KineticTheory.Gas.Factorizes}

{docstring Obsmetrologia.KineticTheory.Gas.factorizes_imp_decorrelated}

{docstring Obsmetrologia.KineticTheory.Gas.epr_not_factorizes}

Checked:

```lean
example :
    Not (Factorizes eprJoint) :=
  epr_not_factorizes
```

The frontier boundary is clear. The finite obstruction is proved. Propagation of
chaos over a continuum gas is not.

## Plasma Diagnostics

Plasma supplies three different tests: reading-neutral relaxation, screened
potential closure, and topological edge obstruction.

Quasineutrality is the fixed point of screening:

{docstring Obsmetrologia.KineticTheory.Plasma.quasineutral_iff_screen_fixed}

and screening lowers the imbalance Lyapunov:

{docstring Obsmetrologia.KineticTheory.Plasma.imbalance_screen_le}

Checked:

```lean
example (c : List Int) :
    KineticTheory.Plasma.imbalance
        (KineticTheory.Plasma.screen c)
      <= KineticTheory.Plasma.imbalance c :=
  KineticTheory.Plasma.imbalance_screen_le c
```

Graph screening is a closure over a finite relay complex. The carrier is
{name Obsmetrologia.KineticTheory.Plasma.DebyeGraph}`DebyeGraph`, and the key closure
witnesses are:

{docstring Obsmetrologia.KineticTheory.Plasma.screened_potential_is_lfp}

{docstring Obsmetrologia.KineticTheory.Plasma.screened_potential_idem}

Topological plasma waves use the curvature regime as the obstruction surface:

{docstring Obsmetrologia.KineticTheory.Plasma.EdgeObstruction}

{docstring Obsmetrologia.KineticTheory.Plasma.canonicalEdgeBand_has_obstruction}

{docstring Obsmetrologia.KineticTheory.Plasma.canonicalEdgeBand_H1_nonzero}

Checked:

```lean
example :
    KineticTheory.Plasma.EdgeObstruction
      KineticTheory.Plasma.canonicalEdgeBand :=
  KineticTheory.Plasma.canonicalEdgeBand_has_obstruction
```

This is enough to say "screening as closure" and "edge mode as curved regime
obstruction." It is not enough to claim the continuum Debye-Huckel Green
function or spectral PDE theory.

## Dense And Liquid Diagnostics

Dense matter enters through finite admissibility and finite topology, not through
many-body nuclear physics.

The sampled equation-of-state carrier is
{name Obsmetrologia.DenseMatter.Neutron.FiniteEOS}`FiniteEOS`. Stability and
causality combine as:

{docstring Obsmetrologia.DenseMatter.Neutron.Admissible}

{docstring Obsmetrologia.DenseMatter.Neutron.stiffEOS_admissible}

{docstring Obsmetrologia.DenseMatter.Neutron.superluminal_not_causal}

Checked:

```lean
example :
    DenseMatter.Neutron.Admissible
      DenseMatter.Neutron.stiffEOS 1 :=
  DenseMatter.Neutron.stiffEOS_admissible
```

Pasta topology is finite excursion-set topology. The cell complex carrier is
{name Obsmetrologia.DenseMatter.Neutron.CellComplex}`CellComplex`; the two
small morphology witnesses are:

{docstring Obsmetrologia.DenseMatter.Neutron.filledTriangle_euler}

{docstring Obsmetrologia.DenseMatter.Neutron.hollowTriangle_euler}

Checked:

```lean
example :
    DenseMatter.Neutron.eulerChar
      DenseMatter.Neutron.hollowTriangle = 0 :=
  DenseMatter.Neutron.hollowTriangle_euler
```

Liquid-state structure appears as closure and Lyapunov descent. Ornstein-Zernike
closure is the least settled total-correlation field:

{docstring Obsmetrologia.KineticTheory.Liquid.total_dominates_direct}

{docstring Obsmetrologia.KineticTheory.Liquid.oz_least}

Density-functional descent uses an internal-real free energy:

{docstring Obsmetrologia.KineticTheory.Liquid.minimizer_is_equilibrium}

{docstring Obsmetrologia.KineticTheory.Liquid.orbit_Omega_le_init}

Checked:

```lean
example (F : KineticTheory.Liquid.DFTFlow) (s : F.State)
    (h : KineticTheory.Liquid.IsMinimizer F s) :
    KineticTheory.Liquid.IsEquilibrium F s :=
  KineticTheory.Liquid.minimizer_is_equilibrium F s h
```

The frontier is the analytic layer: Fourier transforms, functional derivatives,
continuum densities, and nuclear interactions.

## Reaction And Thermodynamic Diagnostics

Reaction networks already had a Datalog support projection. The diagnostic pages add
what the support projection cannot see: Lyapunov descent, real entropy, rates, and
detailed balance.

Catabolic firing strictly descends a count potential:

{docstring Obsmetrologia.ReactionNetworks.step_strict_decrease}

{docstring Obsmetrologia.ReactionNetworks.catabolic_steps_bounded}

Checked:

```lean
example {Species : Type}
    (N : ReactionNetworks.Network Species)
    (hcat : ReactionNetworks.Catabolic N)
    {n : Nat}
    {s s' : ReactionNetworks.State Species}
    (h : ReactionNetworks.ReachIn N n s s') :
    n <= ReactionNetworks.total N.univ s :=
  ReactionNetworks.catabolic_steps_bounded N hcat h
```

Boltzmann entropy is already real-valued inside the dependency-free core:

{docstring Obsmetrologia.Thermodynamics.htheorem}

{docstring Obsmetrologia.ReactionNetworks.entropyH_le_of_relaxes}

Mass action supplies a real-valued field and its fixed-point reading:

{docstring Obsmetrologia.ReactionNetworks.propensity_nonneg}

{docstring Obsmetrologia.ReactionNetworks.equilibrium_is_fixed}

Detailed balance is the reversible reaction's zero-flux fixed point:

{docstring Obsmetrologia.ReactionNetworks.detailedBalance_iff_netFlux_zero}

{docstring Obsmetrologia.ReactionNetworks.detailedBalance_euler_fixed}

Checked:

```lean
example {Species : Type}
    (R : ReactionNetworks.Reversible Species)
    (univ : List Species)
    (c : ReactionNetworks.Conc Species)
    (h : ReactionNetworks.DetailedBalance R univ c)
    (dt : Real.Internal.RReal) :
    ReactionNetworks.eulerStep
      (ReactionNetworks.pairField R univ) dt c = c :=
  ReactionNetworks.detailedBalance_euler_fixed
    R univ c h dt
```

The frontier boundary is not "reactions are settled." The settled part is the
finite, count, support, and internal-real skeleton. Measure-theoretic stochastic
chemistry and continuum thermodynamic limits remain outside this carrier.

## Balanced Temperature And Production

The thermodynamic bridge is now narrower and stronger than a metaphor about
energy. It does not prove a universal positive-temperature matter dynamics. It
does introduce a finite balance carrier for held-top creation, stochastic
stationarity, Landauer support, and hard closure firing.

The gauge and collision sources for held-top creation are:

{docstring Obsmetrologia.Thermodynamics.Temperature.gaugeTopCreationCount}

{docstring Obsmetrologia.Thermodynamics.Temperature.gauge_top_creation_quarter}

{docstring Obsmetrologia.Thermodynamics.Temperature.collision_top_minted}

The zero-temperature side recovers the Nat-valued free-energy Lyapunov package.
That package is the `T → 0` hard-closure statement and is unconditional — it
does not and cannot depend on any stochastic creation/temperature term.
`ZeroCreation` and `ZeroTemperatureFlow` retain the no-creation evidence as
provenance for what "zero temperature" packages, not as a hypothesis the
Lyapunov conclusion needs:

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroCreation}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.recovers_nat_lyapunov}

{docstring Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.hard_closure_laws}

{docstring Obsmetrologia.Thermodynamics.Temperature.zero_temperature_recovers_nat_lyapunov}

and an actual firing gives a positive discharge:

{docstring Obsmetrologia.Thermodynamics.Temperature.freeEnergyDrop}

{docstring Obsmetrologia.Thermodynamics.Temperature.freeEnergyDrop_pos_of_fires}

The stochastic carrier is top-flux balance:

{docstring Obsmetrologia.Thermodynamics.Temperature.TopFlux}

{docstring Obsmetrologia.Thermodynamics.Temperature.Balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.stationary_flux_balanced}

{docstring Obsmetrologia.Thermodynamics.Temperature.detailed_balance_stationary_flux_balanced}

The production theorem keeps the bridge honest: balanced stochastic flux, a
load-bearing H1 support, and an actual closure firing together produce positive
Landauer cost and positive free-energy discharge.

{docstring Obsmetrologia.Thermodynamics.Temperature.stationary_transition_produces_landauer_and_discharge}

{docstring Obsmetrologia.Thermodynamics.Temperature.detailed_balance_transition_produces_landauer_and_discharge}

The lifted carrier packages all witnesses instead of collapsing them to a single
scalar:

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition}

{docstring Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.produces_landauer_and_discharge}

Checked:

```lean
example (a : Reading) :
    gaugeTopCreationCount a * 4 = D4.D8.all.length :=
  gauge_top_creation_quarter a

example {S : Type} {V : StochSemiring}
    (τ : LiftedThermoTransition S V) :
    Balanced τ.flux
      ∧ 0 < τ.landauerCost
      ∧ 0 < τ.discharge :=
  LiftedThermoTransition.produces_landauer_and_discharge τ
```

The phase boundary is decisive. The manual may now say that the corpus has a
balanced-temperature bridge for stationary top-flux and transition production.
It must not say that the stochastic dynamics derives the firing law, that
positive-temperature closure has been constructed, or that a universal matter
action has been proved.

## Quantum Diagnostics

The first physical-witness page already teaches PR and Hardy as local-to-global
support failures. The diagnostics here show the ladder is not exhausted.

The magic square is state-independent strong contextuality:

{docstring Obsmetrologia.QuantumContextuality.magicSquare_strongly_contextual}

Leggett-Garg moves the same obstruction into time:

{docstring Obsmetrologia.QuantumContextuality.lgPerfect_macrorealism_violated}

and the internal-real quantitative separation is:

{docstring Obsmetrologia.QuantumContextuality.lg_quantum_value_not_macrorealist}

The support of a probabilistic model welds probability back to the
possibilistic gluing carrier:

{docstring Obsmetrologia.QuantumContextuality.toSupport}

{docstring Obsmetrologia.QuantumContextuality.prBoxP_support_strongly_contextual}

Checked:

```lean
example :
    QuantumContextuality.StronglyContextual
      QuantumContextuality.magicSquare :=
  QuantumContextuality.magicSquare_strongly_contextual

example :
    QuantumContextuality.StronglyContextual
      QuantumContextuality.lgPerfect :=
  QuantumContextuality.lgPerfect_macrorealism_violated

example :
    QuantumContextuality.StronglyContextual
      (QuantumContextuality.toSupport
        QuantumContextuality.prBoxP) :=
  QuantumContextuality.prBoxP_support_strongly_contextual
```

The missing carrier is explicit: Hilbert-space operator realization, temporal
correlation operators, and relative cohomological contextuality are not proved by
these support-level theorems.

## Repair Path

When a future physical page feels too much like an application note, repair it
by asking:

1. Is the carrier closure, gluing, obstruction, Lyapunov descent, value-settling,
   or support contextuality?
2. Which earlier phase generated that carrier?
3. Which Lean theorem is the diagnostic?
4. Which physical name is only the familiar comparison?
5. Which stronger physical theorem lacks a carrier and must remain frontier?

Only after those answers are visible does the page belong in Book IX.
