import InfomaterialManual.DocSetup
import Infomaterial.Relational.Kinetic.BoltzmannClosure
import Infomaterial.Relational.Kinetic.MolecularChaosGluing
import Infomaterial.Relational.Plasma.Quasineutrality
import Infomaterial.Relational.Plasma.DebyeGraphScreening
import Infomaterial.Relational.Plasma.TopologicalWaveSheaf
import Infomaterial.Relational.DenseMatter.EOS
import Infomaterial.Relational.DenseMatter.PastaTopology
import Infomaterial.Relational.Liquid.OrnsteinZernikeClosure
import Infomaterial.Relational.Liquid.DensityFunctionalFlow
import Infomaterial.Relational.Thermo.BoltzmannEntropy
import Infomaterial.Relational.Reaction.FreeEnergyDescent
import Infomaterial.Relational.Reaction.MassActionRate
import Infomaterial.Relational.Reaction.Entropy
import Infomaterial.Relational.Reaction.DetailedBalance
import Infomaterial.Thermodynamics.Temperature
import Infomaterial.Relational.Quantum.MagicSquare
import Infomaterial.Relational.Quantum.LeggettGarg
import Infomaterial.Relational.Quantum.SupportContextuality

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Kinetic
open Infomaterial.Thermodynamics.Temperature
open Infomaterial.Probability.Stochastic

/-!
A second Book IX teaching chapter for physical phase diagnostics beyond the first
cross-domain witness page.
-/

#doc (Manual) "Physical diagnostics" =>

# Physical Phase Diagnostics

The first physical-witness page teaches the common form: an older physical
subject enters Infomaterial only when it witnesses generated relational behavior.
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
* Lean carriers: `Infomaterial.Relational.Kinetic.*`,
  `Infomaterial.Relational.Plasma.*`, `Infomaterial.Relational.DenseMatter.*`,
  `Infomaterial.Relational.Liquid.*`, `Infomaterial.Relational.Thermo.*`,
  `Infomaterial.Relational.Reaction.*`, `Infomaterial.Relational.Quantum.*`;
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
{name Infomaterial.Relational.Kinetic.Collision}`Collision`, and the finite
closure reading is:

{docstring Infomaterial.Relational.Kinetic.collisionRule}

{docstring Infomaterial.Relational.Kinetic.finite_boltzmann_collision_lfp}

The invariant theorem is:

{docstring Infomaterial.Relational.Kinetic.finite_collision_invariants_preserved}

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

{docstring Infomaterial.Relational.Kinetic.Factorizes}

{docstring Infomaterial.Relational.Kinetic.factorizes_imp_decorrelated}

{docstring Infomaterial.Relational.Kinetic.epr_not_factorizes}

Checked:

```lean
example :
    Not (Factorizes eprJoint) :=
  epr_not_factorizes
```

The frontier boundary is clear. The finite obstruction is proved. Propagation of
chaos over a continuum gas is not.

## Plasma Diagnostics

Plasma supplies three different tests: charge-neutral relaxation, screened
potential closure, and topological edge obstruction.

Quasineutrality is the fixed point of screening:

{docstring Infomaterial.Relational.Plasma.quasineutral_iff_screen_fixed}

and screening lowers the imbalance Lyapunov:

{docstring Infomaterial.Relational.Plasma.imbalance_screen_le}

Checked:

```lean
example (c : List Int) :
    Relational.Plasma.imbalance
        (Relational.Plasma.screen c)
      <= Relational.Plasma.imbalance c :=
  Relational.Plasma.imbalance_screen_le c
```

Graph screening is a closure over a finite relay complex. The carrier is
{name Infomaterial.Relational.Plasma.DebyeGraph}`DebyeGraph`, and the key closure
witnesses are:

{docstring Infomaterial.Relational.Plasma.screened_potential_is_lfp}

{docstring Infomaterial.Relational.Plasma.screened_potential_idem}

Topological plasma waves use the curvature regime as the obstruction surface:

{docstring Infomaterial.Relational.Plasma.EdgeObstruction}

{docstring Infomaterial.Relational.Plasma.canonicalEdgeBand_has_obstruction}

{docstring Infomaterial.Relational.Plasma.canonicalEdgeBand_H1_nonzero}

Checked:

```lean
example :
    Relational.Plasma.EdgeObstruction
      Relational.Plasma.canonicalEdgeBand :=
  Relational.Plasma.canonicalEdgeBand_has_obstruction
```

This is enough to say "screening as closure" and "edge mode as curved regime
obstruction." It is not enough to claim the continuum Debye-Huckel Green
function or spectral PDE theory.

## Dense And Liquid Diagnostics

Dense matter enters through finite admissibility and finite topology, not through
many-body nuclear physics.

The sampled equation-of-state carrier is
{name Infomaterial.Relational.DenseMatter.FiniteEOS}`FiniteEOS`. Stability and
causality combine as:

{docstring Infomaterial.Relational.DenseMatter.Admissible}

{docstring Infomaterial.Relational.DenseMatter.stiffEOS_admissible}

{docstring Infomaterial.Relational.DenseMatter.superluminal_not_causal}

Checked:

```lean
example :
    Relational.DenseMatter.Admissible
      Relational.DenseMatter.stiffEOS 1 :=
  Relational.DenseMatter.stiffEOS_admissible
```

Pasta topology is finite excursion-set topology. The cell complex carrier is
{name Infomaterial.Relational.DenseMatter.CellComplex}`CellComplex`; the two
small morphology witnesses are:

{docstring Infomaterial.Relational.DenseMatter.filledTriangle_euler}

{docstring Infomaterial.Relational.DenseMatter.hollowTriangle_euler}

Checked:

```lean
example :
    Relational.DenseMatter.eulerChar
      Relational.DenseMatter.hollowTriangle = 0 :=
  Relational.DenseMatter.hollowTriangle_euler
```

Liquid-state structure appears as closure and Lyapunov descent. Ornstein-Zernike
closure is the least settled total-correlation field:

{docstring Infomaterial.Relational.Liquid.total_dominates_direct}

{docstring Infomaterial.Relational.Liquid.oz_least}

Density-functional descent uses an internal-real free energy:

{docstring Infomaterial.Relational.Liquid.minimizer_is_equilibrium}

{docstring Infomaterial.Relational.Liquid.orbit_Omega_le_init}

Checked:

```lean
example (F : Relational.Liquid.DFTFlow) (s : F.State)
    (h : Relational.Liquid.IsMinimizer F s) :
    Relational.Liquid.IsEquilibrium F s :=
  Relational.Liquid.minimizer_is_equilibrium F s h
```

The frontier is the analytic layer: Fourier transforms, functional derivatives,
continuum densities, and nuclear interactions.

## Reaction And Thermodynamic Diagnostics

Reaction networks already had a Datalog support projection. The diagnostic pages add
what the support projection cannot see: Lyapunov descent, real entropy, rates, and
detailed balance.

Catabolic firing strictly descends a count potential:

{docstring Infomaterial.Relational.Reaction.step_strict_decrease}

{docstring Infomaterial.Relational.Reaction.catabolic_steps_bounded}

Checked:

```lean
example {Species : Type}
    (N : Relational.Reaction.Network Species)
    (hcat : Relational.Reaction.Catabolic N)
    {n : Nat}
    {s s' : Relational.Reaction.State Species}
    (h : Relational.Reaction.ReachIn N n s s') :
    n <= Relational.Reaction.total N.univ s :=
  Relational.Reaction.catabolic_steps_bounded N hcat h
```

Boltzmann entropy is already real-valued inside the dependency-free core:

{docstring Infomaterial.Relational.Thermo.htheorem}

{docstring Infomaterial.Relational.Reaction.entropyH_le_of_relaxes}

Mass action supplies a real-valued field and its fixed-point reading:

{docstring Infomaterial.Relational.Reaction.propensity_nonneg}

{docstring Infomaterial.Relational.Reaction.equilibrium_is_fixed}

Detailed balance is the reversible reaction's zero-flux fixed point:

{docstring Infomaterial.Relational.Reaction.detailedBalance_iff_netFlux_zero}

{docstring Infomaterial.Relational.Reaction.detailedBalance_euler_fixed}

Checked:

```lean
example {Species : Type}
    (R : Relational.Reaction.Reversible Species)
    (univ : List Species)
    (c : Relational.Reaction.Conc Species)
    (h : Relational.Reaction.DetailedBalance R univ c)
    (dt : Real.Internal.RReal) :
    Relational.Reaction.eulerStep
      (Relational.Reaction.pairField R univ) dt c = c :=
  Relational.Reaction.detailedBalance_euler_fixed
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

{docstring Infomaterial.Thermodynamics.Temperature.gaugeTopCreationCount}

{docstring Infomaterial.Thermodynamics.Temperature.gauge_top_creation_quarter}

{docstring Infomaterial.Thermodynamics.Temperature.collision_top_minted}

The zero-creation side recovers the Nat-valued free-energy Lyapunov package:

{docstring Infomaterial.Thermodynamics.Temperature.ZeroCreation}

{docstring Infomaterial.Thermodynamics.Temperature.zero_creation_keeps_free_energy_lyapunov}

and an actual firing gives a positive discharge:

{docstring Infomaterial.Thermodynamics.Temperature.freeEnergyDrop}

{docstring Infomaterial.Thermodynamics.Temperature.freeEnergyDrop_pos_of_fires}

The stochastic carrier is top-flux balance:

{docstring Infomaterial.Thermodynamics.Temperature.TopFlux}

{docstring Infomaterial.Thermodynamics.Temperature.Balanced}

{docstring Infomaterial.Thermodynamics.Temperature.stationary_flux_balanced}

{docstring Infomaterial.Thermodynamics.Temperature.detailed_balance_stationary_flux_balanced}

The production theorem keeps the bridge honest: balanced stochastic flux, a
load-bearing H1 support, and an actual closure firing together produce positive
Landauer cost and positive free-energy discharge.

{docstring Infomaterial.Thermodynamics.Temperature.stationary_transition_produces_landauer_and_discharge}

{docstring Infomaterial.Thermodynamics.Temperature.detailed_balance_transition_produces_landauer_and_discharge}

The lifted carrier packages all witnesses instead of collapsing them to a single
scalar:

{docstring Infomaterial.Thermodynamics.Temperature.LiftedThermoTransition}

{docstring Infomaterial.Thermodynamics.Temperature.LiftedThermoTransition.produces_landauer_and_discharge}

Checked:

```lean
example (a : Charge) :
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

{docstring Infomaterial.Relational.Quantum.magicSquare_strongly_contextual}

Leggett-Garg moves the same obstruction into time:

{docstring Infomaterial.Relational.Quantum.lgPerfect_macrorealism_violated}

and the internal-real quantitative separation is:

{docstring Infomaterial.Relational.Quantum.lg_quantum_value_not_macrorealist}

The support of a probabilistic model welds probability back to the
possibilistic gluing carrier:

{docstring Infomaterial.Relational.Quantum.toSupport}

{docstring Infomaterial.Relational.Quantum.prBoxP_support_strongly_contextual}

Checked:

```lean
example :
    Relational.Quantum.StronglyContextual
      Relational.Quantum.magicSquare :=
  Relational.Quantum.magicSquare_strongly_contextual

example :
    Relational.Quantum.StronglyContextual
      Relational.Quantum.lgPerfect :=
  Relational.Quantum.lgPerfect_macrorealism_violated

example :
    Relational.Quantum.StronglyContextual
      (Relational.Quantum.toSupport
        Relational.Quantum.prBoxP) :=
  Relational.Quantum.prBoxP_support_strongly_contextual
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
