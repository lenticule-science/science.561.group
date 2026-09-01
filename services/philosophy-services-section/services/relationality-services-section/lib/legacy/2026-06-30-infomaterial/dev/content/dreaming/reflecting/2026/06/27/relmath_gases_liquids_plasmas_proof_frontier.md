---
title: "RelMath proof frontier map for gases, liquids, and plasmas"
subtitle: "Connections from attached 2026 mathematical matter memos to the current `emsenn/relational-math` Lean territory"
author: "OpenAI"
date: "2026-06-27"
lang: "en-US"
---


## 0. Scope and reading rule

This document maps the attached research directions on **gases**, **liquids**, and **plasmas** into the current `emsenn/relational-math` proof program.
It is not a new physics survey.
The attached memos already provide that survey layer.
This is a **proof-agent routing document**: it says which definitions and theorem-forms from those research areas are already present as RelMath structures, which are close enough to pursue next, and which are not yet visible because the repository lacks the necessary foundations.

The key distinction is:

- **Realized within the territory** means RelMath already has a formal theorem-level structure that matches the source definition or theorem *as a structural projection*.
  It does not mean RelMath has proved the analytic physics theorem itself.
- **On the horizon** means the current RelMath primitives plausibly support a finite, discrete, sheaf-theoretic, order-theoretic, stochastic, or cohomological formalization by a proofing agent.
- **Not yet visible** means the source theorem relies on foundations not yet present in the repository: continuum PDE, smooth manifolds, functional analysis, real-valued entropy integrals, Fourier/Gevrey estimates, Coulomb kernels, differential forms, symplectic geometry, or large-\(N\) limiting probability.

The current repo has a strong rule: only the atomic mark and articulating recursion are free data; every module below them is derived.
In practice this means proof agents should not import public mathematical packages to shortcut definitions.
They should derive the needed skeleton from the existing RelMath spine or add a clearly scoped derived layer.

## 1. Current RelMath territory relevant to matter mathematics

### 1.1 Core spine

The present core spine gives a proof-native language for finite relational matter:

- `Mark`, `Utterance`, `Articulating`: primitive atoms and recursive articulation.
- `ArticulationCell`: a four-cell partition.
- `Predicating`: predication category with objects of the form \(\varphi=(s,p,o)\).
- `Positing`: FOUR/bilattice values, two orders, `Valuation`, and the \(\bot_k\) seed.
- `Settling`: closure \(\Diamond\circ\Box\) to a fixed point; generated order \(\le_k\); joins and meets; Knaster–Tarski least fixed point.
- `Hyperdoctrine` and `Quantifying`: reindexing and quantifier adjoints \(\exists\dashv f^\*\dashv\forall\), Frobenius, Beck–Chevalley, and finite fibration structure.
- `TruthOrder`, `Equality`, `BigradedCohomology`: second order \(\le_t\), truth-order adjoints, classical/paraconsistent equality, bigraded invariants, and internal gauge.
- `Sheaf`, `SettlingCohomologyH1`, `CRDTCohomologicalCALM`: fixed point as sheaf, \(H^1=0\), gluing, merge order-independence, confluence.

This already overlaps strongly with the attached research directions wherever the external mathematics is about **closures, equilibrium, fixed points, restrictions, sheaves, cohomology, phase/regime classification, stationarity, or monotone flows**.

### 1.2 Existing modules that matter most for gases/liquids/plasmas

The following modules are the main anchors for proof-agent work.

#### `Value.SettlingOverValueCategory`

Relevant definitions and theorems:

```lean
structure ValueCategory
structure VClosure (V : ValueCategory)
def VClosure.settle
theorem VClosure.settle_fixed
theorem VClosure.settle_least
theorem VClosure.settle_lfp
def regimeOf
theorem regimeOf_v_independent
theorem four_regime_v_independent
```

Meaning: a closure process can run over any ordered value carrier \(V\), and the strict/Scott/transfinite-bounded/aperiodic regime classification factors through closure-ordinal data rather than the choice of \(V\).
This is the most important bridge to fuzzy probabilities, kinetic values, density values, energy values, stochastic matrices, and field-valued closures.

#### `Closure.ClosureRuleSystem`

Relevant definitions and theorems:

```lean
structure ClosureRule
abbrev RuleSystem := List ClosureRule
def ruleFire
def fire
def Tstep
theorem Tstep_infl
theorem Tstep_mono
def SClosed
theorem rule_respecting
def clS
theorem generated_closure_is_least
theorem least_closed_unique
theorem immediate_consequence_lfp
theorem alwaysRule_lfp
```

Meaning: positive inference/collision/update rules generate an immediate-consequence operator \(T_S\).
Its closure is the least fixed point above a seed, exactly the Datalog / van Emden–Kowalski shape.
This is the natural RelMath substrate for **finite Boltzmann collision rules**, **reaction rules**, **finite relaxation operators**, **screening closures**, and **constraint propagation**.

#### `Closure.ScottContinuousClosure`

Relevant definitions and theorems:

```lean
structure DirectedFamily
theorem DirectedFamily.sup_mem
def ScottContinuous
theorem finite_scott_continuous
theorem scott_continuous_iff_omega_regime
theorem finite_charge_strict
def fire
theorem fire_covers_directed
theorem finite_antecedent_scott_continuous
```

Meaning: finite-antecedent rules are Scott-continuous because they commute with directed joins; non-Scott continuity marks a transition into curved/transfinite/aperiodic behavior.
This is directly relevant to finite-vs-infinite closure phenomena: finite collision rules, finite constraints, finite local interactions, and the boundary where infinitary constraints appear.

#### `Probability.Measure`

Relevant definitions and theorems:

```lean
abbrev Event
structure SampleSpace
def SampleSpace.measure
def SampleSpace.total
theorem measure_empty
theorem measure_univ
theorem measure_union_disjoint
theorem measure_mono
theorem measure_compl
def condMeasure
theorem condMeasure_le
theorem condMeasure_symm
theorem measure_is_valuation
theorem conditioning_is_reindex
theorem conditional_via_fiber_adjoint
```

Meaning: finite probability is already formalized as a valuation.
Conditioning is restriction/reindexing in the hyperdoctrine.
This is a direct substrate for finite statistical mechanics, conditional independence projections, finite Green–Kubo numerators, finite event algebras, and discrete fluctuation statements.

#### `Probability.Stochastic`

Relevant definitions and theorems:

```lean
structure StochSemiring
structure MarkovKernel
def MarkovKernel.sum
def MarkovKernel.matMul
def MarkovKernel.stochClosure
def MarkovKernel.advance
def IsStationary
theorem markov_stationary_is_closure_fixpoint
theorem stationary_matrix_fixpoint
def stochVC
def stochVClosure
theorem uniformWitnessStationary
theorem stochastic_is_value_settling
```

Meaning: Markov stationarity is exactly a stochastic-closure fixed point.
This already realizes the fixed-point skeleton of Markov chains, BGK-like relaxation projections, finite-state Fokker–Planck projections, and stochastic settling.

#### `Probability.PoissonSettling`

Relevant definitions and theorems:

```lean
theorem detailed_balance_implies_stationary
theorem poisson_detailed_balance
def expVal
theorem expVal_add
theorem expVal_smul
theorem expVal_indicator
def ratStoch
def poissonKernel
def poissonPi
theorem poissonKernel_stationary
theorem poissonKernel_settling_fixpoint
```

Meaning: a Poisson-shaped distribution has already been realized as a birth–death settling fixed point, with detailed balance as the proof bridge.
This is the strongest current bridge to kinetic/statistical mechanics.

#### `Flow.FreeEnergyLyapunov`

Relevant definitions and theorems:

```lean
def kHeight
theorem kHeight_mono
theorem kHeight_lt_of_lt
def deficit
theorem deficit_antitone
theorem deficit_strict_of_fires
def freeEnergy
theorem freeEnergy_antitone
theorem freeEnergy_strict_of_fires
theorem kappa_bounded_by_initial_free_energy
def closureAtZeroTemp
theorem closureAtZeroTemp_is_hard
theorem energy_gives_unique_equilibrium
theorem free_energy_is_lyapunov
```

Meaning: the repository already has an H-theorem-like finite Lyapunov theorem.
Free energy decreases along closure flow, strictly decreases at firings, reaches equilibrium, and bounds convergence.
This is the key bridge to the Boltzmann \(H\)-theorem, DFT minimization, BGK relaxation, and entropy-production projections.

#### `Flow.ClosureFlowDynamics`

Relevant definitions and theorems:

```lean
theorem flow_ascends
theorem flow_lands_on_lfp
theorem flow_is_monotone_ascent_to_lfp
def SmoothStep
def FiringStep
theorem smoothStep_iff_fixed
theorem smooth_is_terminal
theorem settled_no_firing
def drive
theorem drive_le_succ
theorem drive_monotone
theorem drive_empty_eq_orbit
theorem closure_flow_is_monotone_dynamical_system
```

Meaning: closure flow is a monotone discrete dynamical system.
Smooth steps are no-ops/fixed-point steps; firing steps are singular times; singular times form an initial segment.
This is relevant to nonequilibrium relaxation, glassy arrest projections, kinetic relaxation, reconnection-like topological events, and irreversible coarse-graining.

#### `Flow.ClosureFlowCurvatureRegime`

Relevant definitions and theorems:

```lean
def IsFlat
def IsCurved
theorem flat_iff_not_curved
theorem vanishes_iff_flat
theorem nonvanishes_iff_curved
def terminatesByOmega
theorem no_curved_omega_terminating
def curvatureRank
theorem rank_zero_iff_flat
theorem rank_none_iff_curved
theorem rank_nonzero_has_nsc_firing
theorem curvature_regime_correspondence
```

Meaning: the four regimes are already interpreted as a curvature classification: \(H^1=0\) iff flat; \(H^1\ne0\) iff curved; non-Scott firings are curvature events.
This is a natural language for **obstructions, defects, reconnection events, glassy frustration, nonlocal closure failures, and topological transitions**.

#### `Cohomology.QuantaleEnrichedSheaf`

Relevant definitions and theorems:

```lean
structure Quantale
def chargeQuantale
structure QCat
structure QFunctor
theorem qcat_is_quantale_category
structure QFuzzyEquiv
def QFuzzyEquiv.compose
theorem QFuzzyEquiv.one_strict
theorem q_fuzzy_equivalence_composes
def laplacian
theorem h0_laplacian_fixed_points
```

Meaning: RelMath already has a quantale-valued categorical skeleton.
Fuzzy equivalences compose by multiplying grades; degree-zero enriched cohomology is identified with Lawvere-Laplacian fixed points.
This is directly relevant to fuzzy kinetic states, graded equivalences, transport networks, topological plasma-wave projections, sheaf-based signal/field consistency, and approximate equivalence of phases.

#### `Cohomology.DFrame`

Relevant definitions and theorems:

```lean
structure Frame
def powersetFrame
structure DFrame
def dframe_of_bitopological
theorem dframe_of_bitopological_relations
def dF
def mSettled
def dframe_valued_sheaf_at
def restrictSub
theorem restrictSub_meet
theorem restrictSub_top
theorem restrictSub_con
theorem dframe_valued_sheaf
```

Meaning: the repo already has the dual algebra of bitopological spaces and a d-frame-valued settling sheaf bundling truth and falsehood/inconsistency sides.
This is relevant to two-sided order, active matter defects, liquid-crystal defect projections, consistency/totality constraints, and topological/frustrated local order.

---

## 2. Realized within the territory

This section lists external mathematical definitions or theorem-forms that already have a RelMath counterpart.
The word “realized” here means **structural proof-native realization**, not full analytic realization.

### 2.1 Equilibrium as fixed point

**Source direction.** The gases memo treats equilibrium as a Maxwellian fixed point of the collision operator \(Q(f,f)=0\), Markov/Fokker–Planck relaxation as convergence to stationary distributions, and hydrodynamic closures as projections onto equilibrium manifolds.
The liquids memo treats equilibrium density fields as minimizers of free energy.
The plasma memo treats stationary kinetic or MHD states as fixed points/equilibria of field-particle or fluid evolution.

**RelMath realization.**

- `VClosure.settle_fixed`: closure settling is a fixed point.
- `VClosure.settle_lfp`: settling is the least fixed point above the seed.
- `ClosureRule.immediate_consequence_lfp`: a rule-generated closure is the least fixed point of \(T_S\).
- `Probability.
  Stochastic.markov_stationary_is_closure_fixpoint`: Markov stationarity is closure fixedness.
- `Probability.
  PoissonSettling.poissonKernel_settling_fixpoint`: a Poisson-shaped birth–death stationary law is a settling fixed point.

**Interpretation.** RelMath already has a general theorem-shape:

\[ \text{equilibrium} = \text{fixed point of a monotone closure/transition operator}. \]

This is a genuine common skeleton behind Boltzmann relaxation, Markov chains, density-functional minimization, and quasineutral/plasma closure.
It is not yet a theorem about Maxwellians, Gibbs measures, or Vlasov equilibria; it is the order-theoretic fixed-point spine those theories can be discretized into.

### 2.2 H-theorem / Lyapunov monotonicity

**Source direction.** The Boltzmann \(H\)-theorem states that \(H[f]=\int f\log f\) decreases under the Boltzmann collision operator.
The gases memo emphasizes entropy production and hypocoercive relaxation.
The liquids memo uses free-energy minimization and Green–Kubo transport.
The plasma memo distinguishes collisionless invariants from collisional entropy production and relaxation.

**RelMath realization.**

- `FreeEnergyLyapunov.deficit`: a finite-support free-energy deficit.
- `deficit_antitone`: the deficit decreases as the valuation ascends in \(\le_k\).
- `deficit_strict_of_fires`: a firing strictly lowers the deficit.
- `freeEnergy_antitone`: weak H-theorem along the orbit.
- `freeEnergy_strict_of_fires`: strict H-theorem at actual state changes.
- `free_energy_is_lyapunov`: bundles monotone decrease, strict firing decrease, equilibrium, and bounded convergence.
- `energy_gives_unique_equilibrium`: vanishing cohomology / flat regimes give constructive unique equilibrium.

**Interpretation.** RelMath has a finite, order-valued H-theorem:

\[ \Phi_{n+1}\le \Phi_n,\qquad \Phi_{n+1}<\Phi_n \text{ at firings},\qquad \Phi=0 \text{ at equilibrium}. \]

This is currently a \(T=0\), Nat-valued, hard-closure version.
It is the correct base for a proofing agent to pursue positive-temperature entropy, real-valued free energy, BGK relaxation, and DFT-like minimization.

### 2.3 Markov stationarity and detailed balance

**Source direction.** Kinetic theory frequently uses Markov semigroups, Fokker–Planck equations, BGK relaxation, and detailed balance.
The Poisson distribution is the stationary law of a birth–death process.
The plasma memo also uses stochastic and collisional reductions where stationary states are fixed points.

**RelMath realization.**

- `StochSemiring`: abstract stochastic value semiring.
- `MarkovKernel`: finite transition kernel.
- `MarkovKernel.advance`: vector-kernel advance.
- `IsStationary`: \(\pi P=\pi\).
- `markov_stationary_is_closure_fixpoint`: stationarity iff fixed point.
- `detailed_balance_implies_stationary`: reversible detailed balance implies stationarity.
- `poisson_detailed_balance`: cleared Nat identity for Poisson weights.
- `poissonKernel_stationary` and `poissonKernel_settling_fixpoint`: concrete rational birth–death example.

**Interpretation.** This is one of the strongest realized bridges.
A proofing agent can now build finite kinetic chains, reversible collision chains, birth–death models, finite-state BGK approximations, or stochastic closures without needing continuum probability.

### 2.4 Probability as valuation and conditioning as reindexing

**Source direction.** Statistical mechanics treats states as probability measures over particle configurations or phase space.
BBGKY hierarchies use marginals.
Kinetic theory uses conditional distributions, correlations, and factorization.
Liquids use Gibbs measures and correlation functions.
Plasmas use empirical phase-space measures and distribution functions.

**RelMath realization.**

- `SampleSpace.measure`: finite counting measure.
- `measure_is_valuation`: probability measure satisfies finite Kolmogorov-like laws as valuation.
- `conditional_via_fiber_adjoint`: conditional measure is restriction to a fiber; Bayes numerator symmetry follows from intersection commutativity.
- `conditioning_is_reindex`: conditioning is hyperdoctrine reindexing.

**Interpretation.** RelMath has the finite event-algebra foundation for probability as valuation.
This is enough to formalize finite molecular-chaos projections, finite Gibbs ensembles, finite scattering observations, and finite conditional independence.
It is not enough yet for continuum measures, \(L^p\) spaces, weak convergence, large deviations, or measure-valued PDE.

### 2.5 Closure rules as Datalog / immediate-consequence operators

**Source direction.** Kinetic equations and closure theories can often be read as local update rules: collision rules, reaction rules, finite antecedent inference, constraint propagation, relaxation-to-equilibrium, or finite-volume flux updates.
The gases memo explicitly frames Boltzmann’s molecular chaos as closure from finite collision structure; the plasma memo emphasizes structure-preserving algorithms and discrete update rules.

**RelMath realization.**

- `ClosureRule`: monotone antecedent plus cell/charge consequent.
- `Tstep`: one immediate-consequence step.
- `Tstep_infl` and `Tstep_mono`: generated update is inflationary and monotone.
- `rule_respecting`: closed states already satisfy all fired consequents.
- `generated_closure_is_least`: generated closure is the least closed valuation.
- `immediate_consequence_lfp`: \(cl^S=lfp(T_S)\).
- `alwaysRule_lfp`: concrete worked proof.

**Interpretation.** This is the proof skeleton for finite collision/reaction/constraint systems.
A discrete Boltzmann proof-agent should start here: encode a finite velocity-cell collision system as a `RuleSystem`, prove conservation invariants and monotone closure properties, then connect to `FreeEnergyLyapunov`.

### 2.6 Scott continuity and finite antecedents

**Source direction.** In kinetic theory, finite collision rules and local interactions are qualitatively different from infinitary constraints.
In gases, finite collision trees generate Boltzmann behavior.
In liquids, local interactions and finite-range constraints can produce short-range order.
In plasmas, finite local closures may fail when global field constraints or quasineutral limits enter.

**RelMath realization.**

- `DirectedFamily`: finite directed subset.
- `DirectedFamily.sup_mem`: finite directed joins are attained.
- `ScottContinuous`: closure commutes with directed joins.
- `finite_scott_continuous`: every charge closure is Scott-continuous over finite carrier.
- `scott_continuous_iff_omega_regime`: Scott-continuity iff \(\kappa\le\omega\) / cohomology vanishes.
- `finite_antecedent_scott_continuous`: finite-antecedent firing commutes with directed joins.

**Interpretation.** This directly realizes the boundary between finite local closure and infinitary/non-Scott behavior.
It is useful for classifying which physical closure systems should remain flat/Scott and which can develop curvature/obstruction.

### 2.7 Flow, singularity, and curvature

**Source direction.** The liquids memo treats fluid flow, vortex topology, turbulence, and singularity/regularity.
The gases memo treats relaxation, shocks, hydrodynamic limits, and entropy production.
The plasma memo treats reconnection, Landau damping, kinetic turbulence, and topological transitions.

**RelMath realization.**

- `ClosureFlowDynamics`: closure orbit as a monotone dynamical system.
- `SmoothStep` and `FiringStep`: smooth/no-op vs singular/firing times.
- `smooth_is_terminal`: once smooth, always smooth; singular times form an initial segment.
- `drive`: increment-driven closure flow \(F_U\).
- `ClosureFlowCurvatureRegime`: flat vs curved regimes.
- `vanishes_iff_flat`: \(H^1=0\) iff flat.
- `nonvanishes_iff_curved`: \(H^1\ne0\) iff curved.
- `curvature_regime_correspondence`: four regimes classify total curvature type.
- `rank_nonzero_has_nsc_firing`: curved side has a concrete non-Scott firing witness.

**Interpretation.** RelMath has a real internal language for singular closure events and obstruction.
It is not Navier–Stokes singularity theory, reconnection mathematics, or shock analysis.
But it can already formalize a **combinatorial curvature theory of irreversible closure events**.

### 2.8 Quantale-enriched sheaves and fuzzy equivalence

**Source direction.** The plasma memo discusses topology, spectral bundles, topological plasma waves, and structure-preserving geometric computation.
The liquids memo discusses topological descriptors, active matter, defects, and local order.
The gases memo discusses kinetic optimal transport and topological descriptors of disordered particle systems.

**RelMath realization.**

- `Quantale`: complete lattice with monoidal multiplication distributing over suprema.
- `chargeQuantale`: concrete FOUR/Charge quantale.
- `QCat`, `QFunctor`: quantale-enriched categories and functors.
- `QFuzzyEquiv`: equivalence graded by \(q\in Q\).
- `q_fuzzy_equivalence_composes`: grades multiply under composition.
- `h0_laplacian_fixed_points`: degree-zero enriched cohomology as Lawvere-Laplacian fixed points.

**Interpretation.** RelMath can already talk about fuzzy equivalences, graded transport, enriched sheaf consistency, and Laplacian fixed points.
This is a strong base for discrete topological plasma-wave projections, finite transport networks, finite structural descriptors, and graded phase equivalence.

### 2.9 D-frame-valued sheaves

**Source direction.** Liquids and plasmas often need two-sided structure: truth/falsehood, positive/negative evidence, consistency/totality, defect/core, density/void, local order/frustration.
Liquid crystals and active nematics use order-parameter defect topology; plasmas use field-line topology and reconnection obstructions.

**RelMath realization.**

- `Frame`: complete distributive lattice / frame.
- `DFrame`: two frames \(L_+,L_-\) with consistency and totality relations.
- `dframe_of_bitopological`: canonical bitopological d-frame.
- `dframe_valued_sheaf_at`: local d-frame over a clopen support.
- `dframe_valued_sheaf`: presheaf bundling truth and falsehood/inconsistency sides; restriction preserves structure.

**Interpretation.** D-frames provide the right algebraic target for active matter, liquid-crystal defect projections, two-sided plasma constraints, and paraconsistent/frustrated local order.
They should be preferred over one-sided Boolean event algebras whenever the source system has co-witnessed contradiction, defect, or frustration.

---

## 3. On the horizon: proof-agent projects enabled by the current territory

This section lists research definitions/theorems from the attached papers/memos that are not yet implemented, but are close enough to pursue in RelMath now.

## 3.1 Gas mathematics

### 3.1.1 Finite Boltzmann collision system

**Source definition/theorem.** The Boltzmann equation has a collision operator \(Q(f,f)\) built from binary collisions conserving mass, momentum, and energy.
The \(H\)-theorem says entropy decreases.
Lanford-type and Deng–Hani–Ma-type work derives Boltzmann dynamics from hard-sphere collision trees under Boltzmann–Grad scaling.

**RelMath anchor.**

- `ClosureRuleSystem.
  ClosureRule`
- `ClosureRuleSystem.
  Tstep`
- `ClosureRuleSystem.immediate_consequence_lfp`
- `Probability.
  Measure.measure_is_valuation`
- `FreeEnergyLyapunov.free_energy_is_lyapunov`

**Proof-agent target.**

Create:

```lean
RelMath/Relational/Kinetic/DiscreteVelocity.lean
RelMath/Relational/Kinetic/CollisionRule.lean
RelMath/Relational/Kinetic/BoltzmannClosure.lean
RelMath/Relational/Kinetic/HTheoremProjection.lean
```

Definitions:

```lean
structure VelocityCell where
  -- finite velocity alphabet, likely `Fin n`

structure CollisionQuad where
  a b a' b' : VelocityCell
  mass_ok : ...
  momentum_ok : ...
  energy_ok : ...

def collisionRule : CollisionQuad → ClosureRule
def collisionSystem : List CollisionQuad → RuleSystem
def collisionTstep : ...
```

Theorems to pursue:

```lean
theorem collision_Tstep_infl
theorem collision_Tstep_mono
theorem collision_closure_lfp
theorem collision_invariants_preserved
theorem collision_free_energy_nonincreasing
```

**Status.** Horizon.
RelMath has the closure/fixed-point and finite-measure pieces.
It does not yet have the finite velocity/collision algebra.

### 3.1.2 Molecular chaos as vanishing obstruction

**Source definition/theorem.** Molecular chaos says precollisional two-particle marginals factorize asymptotically.
Lanford’s theorem makes this precise for short time; later work extends under regularity assumptions.

**RelMath anchor.**

- `Probability.
  Measure.conditional_via_fiber_adjoint`
- `Cohomology.
  Sheaf`
- `SettlingCohomologyH1`
- `CRDTCohomologicalCALM`
- `CurvatureRegime.vanishes_iff_flat`

**Proof-agent target.**

Define finite marginals as restrictions of a joint valuation along projection maps:

```lean
def marginal₁ : JointValuation → Valuation
def marginal₂ : JointValuation → Valuation
def tensorProductProjection : Valuation → Valuation → JointValuation
def MolecularChaosProjection (J : JointValuation) : Prop :=
  J = tensorProductProjection (marginal₁ J) (marginal₂ J)
```

Theorems:

```lean
theorem molecular_chaos_is_separated_gluing
theorem flat_regime_preserves_chaos_projection
theorem H1_obstructs_molecular_chaos
```

**Status.** Horizon.
A proof-agent can make a finite sheaf/valuation version now.
The real propagation-of-chaos theorem is not visible.

### 3.1.3 BGK relaxation as closure to local Maxwellian projection

**Source definition/theorem.** BGK replaces \(Q(f,f)\) by \((M[f]-f)/\tau\), relaxing toward the Maxwellian with the same conserved moments.

**RelMath anchor.**

- `VClosure`
- `Stochastic.
  MarkovKernel`
- `FreeEnergyLyapunov`
- `ClosureRuleSystem`

**Proof-agent target.**

Define a finite “moment class” and an abstract projection to an equilibrium representative:

```lean
structure MomentClass
def sameMoments : State → State → Prop
def MaxwellianProjection : State → State
```

Theorems:

```lean
theorem maxwellian_projection_fixed
theorem bgk_closure_lfp
theorem bgk_free_energy_decreases
theorem bgk_preserves_moment_class
```

**Status.** Horizon.
This would be a symbolic finite BGK theorem, not a theorem about Gaussian Maxwellians over \(\mathbb R^d\).

### 3.1.4 Fluctuations and large deviations: finite projection

**Source definition/theorem.** Bodineau–Gallagher–Saint-Raymond–Simonella derive fluctuating Boltzmann equations and large deviations around hard-sphere dynamics.

**RelMath anchor.**

- `Probability.
  Measure`
- `Probability.
  PoissonSettling.expVal`
- `Probability.
  PoissonSettling.poissonKernel_settling_fixpoint`
- `Stochastic.
  MarkovKernel`

**Proof-agent target.**

Create finite empirical-count objects:

```lean
def empiricalCount : SampleSpace Ω → Event Ω → Nat
def fluctuation : empiricalCount - expectedCount
```

Theorems:

```lean
theorem expVal_indicator_measure
theorem centered_fluctuation_sum_zero_projection
theorem poisson_counting_stationary_projection
```

**Status.** Horizon for finite counting projections.
True Gaussian fluctuations and large deviations need real analysis/probability.

## 3.2 Liquid mathematics

### 3.2.1 Pair correlation and Ornstein–Zernike closure

**Source definition/theorem.** Liquid-state theory centers on \(g(r)\), \(h(r)=g(r)-1\), structure factor \(S(k)=1+\rho \hat h(k)\), and the Ornstein–Zernike equation

\[ h = c + \rho\, c*h. \]

**RelMath anchor.**

- `Probability.
  Measure`
- `ClosureRuleSystem.immediate_consequence_lfp`
- `QuantaleEnrichedSheaf.h0_laplacian_fixed_points`
- `Value.
  SettlingOverValueCategory`
- `Cohomology.
  DFrame`

**Proof-agent target.**

Create a finite pair-correlation graph:

```lean
structure DistanceBin
structure PairCorrelation where
  g : DistanceBin → Value
def totalCorrelation : PairCorrelation → ...
def directCorrelation : ...
def OZStep (rho : Value) : CorrelationState → CorrelationState
```

Theorems:

```lean
theorem OZStep_mono
theorem ornstein_zernike_lfp
theorem structure_factor_is_incidence_transform_projection
theorem h0_laplacian_fixed_points_for_pair_closure
```

**Status.** Horizon.
A finite, graph-valued OZ closure is in reach.
Fourier analysis and continuum convolution are not yet visible.

### 3.2.2 Classical density functional theory as fixed-point/free-energy minimization

**Source definition/theorem.** Classical DFT minimizes

\[ \Omega[\rho]=F[\rho]+\int (V_{\mathrm{ext}}-\mu)\rho \]

over density fields.
Dynamic DFT is a gradient-flow-like evolution of density under a free-energy functional.

**RelMath anchor.**

- `Value.
  Optimization` is imported in the current spine.
- `Value.
  SettlingOverValueCategory`
- `FreeEnergyLyapunov.free_energy_is_lyapunov`
- `Probability.
  Measure.measure_is_valuation`

**Proof-agent target.**

Create finite density fields:

```lean
structure FiniteDensityField (Cell : Type) where
  rho : Cell → InternalReals.Rat
```

Define finite external potential and free-energy projection:

```lean
def freeEnergyRat : FiniteDensityField Cell → InternalReals.Rat
def densityClosure : ...
```

Theorems:

```lean
theorem minimizer_is_fixed_point
theorem fixed_point_is_settled_density
theorem DFT_zero_temperature_projection
theorem DDFT_flow_free_energy_decreases
```

**Status.** Horizon.
The `Nat` Lyapunov theorem and rational field make a finite DFT projection plausible.
Real variational calculus is not yet visible.

### 3.2.3 Green–Kubo transport coefficients: finite expectation projection

**Source definition/theorem.** Diffusion and viscosity can be expressed as time-correlation integrals, for example

\[ D=\frac1d\int_0^\infty \langle v(0)\cdot v(t)\rangle\,dt. \]

**RelMath anchor.**

- `Probability.
  PoissonSettling.expVal`
- `Probability.
  Measure.measure_is_valuation`
- `Stochastic.
  MarkovKernel`
- `ClosureFlowDynamics.drive`

**Proof-agent target.**

Define finite-time correlation sums:

```lean
def timeCorrelation (K : MarkovKernel S V) (obs₁ obs₂ : S → Nat) (n : Nat) : Nat
def greenKuboPartialSum : Nat → Nat
```

Theorems:

```lean
theorem expVal_correlation_additive
theorem stationary_correlation_time_shift
theorem partial_sum_mono_for_nonnegative_observables
```

**Status.** Horizon for finite partial sums.
Infinite integrals, decay of correlations, and finiteness/positivity of transport coefficients are not visible.

### 3.2.4 Liquid-crystal / active-matter defect projections

**Source definition/theorem.** Nematic liquid crystals use an order-parameter manifold such as \(\mathbb{RP}^2\), with defects classified by topology.
Active nematics add active stress and defect dynamics.

**RelMath anchor.**

- `DFrame.dframe_valued_sheaf`
- `BigradedCohomology`
- `KleinFourGauge`
- `CurvatureRegime.curvature_regime_correspondence`
- `QuantaleEnrichedSheaf.
  QFuzzyEquiv`

**Proof-agent target.**

Define defect charts as local d-frame sections:

```lean
structure DefectChart where
  localOrder : PredicationCell → Charge
  con_tot : ...
def defectObstruction : ...
```

Theorems:

```lean
theorem defect_is_H1_obstruction_projection
theorem active_defect_firing_is_curvature_event
theorem dframe_restriction_preserves_defect_consistency
```

**Status.** Horizon.
RelMath can formalize a sheaf/d-frame obstruction projection now.
Homotopy groups of \(\mathbb{RP}^2\), Q-tensors, and PDE dynamics are not visible.

### 3.2.5 Glass and structural disorder

**Source definition/theorem.** Glass theory studies metastability, dynamic heterogeneity, caging, slow relaxation, and sometimes TDA descriptors of local structure.

**RelMath anchor.**

- `ClosureFlowDynamics.
  SmoothStep` / `FiringStep`
- `CurvatureRegime.
  IsCurved`
- `Aperiodic.
  Classification`
- `Aperiodic.
  StepN.*`
- `QuantaleEnrichedSheaf.
  QFuzzyEquiv`
- `DFrame`

**Proof-agent target.**

Define glassy arrest as delayed or obstructed settling:

```lean
def ArrestedOnSupport (cells : List PredicationCell) (n : Nat) : Prop := ...
def DynamicHeterogeneityProjection : ...
```

Theorems:

```lean
theorem H1_nonzero_obstructs_confluence_projection
theorem nonScott_firing_gives_heterogeneity_projection
theorem fuzzy_equivalence_of_local_structures_composes
```

**Status.** Horizon for finite/combinatorial glassiness.
True glass transition theory, metastable Gibbs states, relaxation-time divergence, and mode-coupling PDEs are not visible.

## 3.3 Plasma mathematics

### 3.3.1 Quasineutrality as closure constraint

**Source definition/theorem.** Plasma models often impose quasineutrality

\[ \sum_s q_s n_s \approx 0, \]

or take a singular Debye-length limit enforcing charge neutrality.

**RelMath anchor.**

- `ValueCategory`
- `InternalReals.
  Rat` via `PoissonSettling.ratStoch`
- `ClosureRuleSystem`
- `FreeEnergyLyapunov.energy_gives_unique_equilibrium`
- `Cohomology.
  Sheaf`

**Proof-agent target.**

Create:

```lean
structure Species where
  charge : InternalReals.Rat

structure PlasmaCellState where
  density : Species → InternalReals.Rat

def netCharge : PlasmaCellState → InternalReals.Rat
def quasineutralRule : ClosureRule
def quasineutralClosure : ...
```

Theorems:

```lean
theorem quasineutral_closure_lfp
theorem quasineutral_fixed_point_zero_net_charge_projection
theorem quasineutral_free_energy_decreases
theorem H1_zero_quasineutral_gluing_projection
```

**Status.** Horizon.
The finite closure version is close.
The Vlasov–Poisson quasineutral limit and Penrose stability are not visible.

### 3.3.2 Debye screening as graph/Lawvere closure

**Source definition/theorem.** Debye screening suppresses electric potential over length \(\lambda_D\); linearized Debye–Hückel potential decays like \(e^{-r/\lambda_D}/r\).

**RelMath anchor.**

- `QuantaleEnrichedSheaf.laplacian`
- `h0_laplacian_fixed_points`
- `ValueCategory`
- `GraphColoring` / `PortGraph` / `Aperiodic` graph modules in the import spine
- `Real.
  InternalReals` and `Real.
  Logarithm` are present in the import spine, but not yet known to support exponentials.

**Proof-agent target.**

Define a finite graph of cells with a monotone attenuation kernel:

```lean
def screeningKernel : Cell → Cell → InternalReals.Rat
def screenedPotentialStep : Potential → Potential
```

Theorems:

```lean
theorem screening_step_mono
theorem screening_laplacian_fixed_points
theorem screened_potential_is_lfp_projection
```

**Status.** Horizon for graph attenuation and Laplacian fixed points.
True exponential Debye asymptotics and Poisson PDE are not visible.

### 3.3.3 Vlasov / Liouville flow as phase-space valuation flow

**Source definition/theorem.** Vlasov equations transport distribution functions on phase space under self-consistent fields:

\[ \partial_t f + v\cdot\nabla_x f + F[f]\cdot\nabla_v f=0. \]

**RelMath anchor.**

- `ClosureFlowDynamics.drive`
- `Probability.
  Measure`
- `Probability.
  Stochastic.
  MarkovKernel`
- `Lorentzian.
  CausalLiouville` is imported in the spine.
- `ValueCategory`

**Proof-agent target.**

Define finite phase-space cells:

```lean
structure PhaseCell where
  x : PositionCell
  v : VelocityCell

def transportKernel : MarkovKernel PhaseCell V
def liouvilleStep : PhaseValuation → PhaseValuation
```

Theorems:

```lean
theorem liouville_stationary_is_settling_fixed
theorem transport_preserves_counting_mass
theorem phase_flow_is_monotone_or_measure_preserving_projection
```

**Status.** Horizon for finite Markov/closure projections.
Actual Liouville transport, Hamiltonian symplectic flow, and Vlasov PDE are not visible.

### 3.3.4 Magnetic reconnection as non-Scott curvature event

**Source definition/theorem.** Reconnection changes magnetic field-line topology when ideal frozen-in constraints break.
In plasma theory, this is a singular topological transition.

**RelMath anchor.**

- `ClosureFlowDynamics.
  FiringStep`
- `CurvatureRegime.
  IsCurved`
- `rank_nonzero_has_nsc_firing`
- `curvature_regime_correspondence`
- `DFrame.dframe_valued_sheaf`
- `BigradedCohomology`

**Proof-agent target.**

Define field-line connectivity as a local section / sheaf gluing condition:

```lean
structure FieldLineConnectivity
def ReconnectionProjection : FlowStep → Prop := ...
```

Theorems:

```lean
theorem reconnection_projection_implies_firing
theorem reconnection_projection_implies_H1_nonzero
theorem flat_regime_forbids_reconnection_projection
```

**Status.** Horizon as a sheaf/curvature/topology projection.
Magnetic helicity, \(E_\parallel\), actual field-line topology, and MHD/PIC reconnection rates are not visible.

### 3.3.5 Topological plasma waves as spectral/Laplacian sheaf projections

**Source definition/theorem.** Topological plasma-wave work uses spectral bundles, edge modes, Berry curvature, Chern numbers, and bulk-edge correspondence in cold or magnetized plasma models.

**RelMath anchor.**

- `QuantaleEnrichedSheaf.
  QCat`
- `QFuzzyEquiv`
- `q_fuzzy_equivalence_composes`
- `QuantaleEnrichedSheaf.h0_laplacian_fixed_points`
- `Flow.
  LawvereLaplacianSpectralGap` is imported in the spine.

**Proof-agent target.**

Define finite band/sheaf spectra as Laplacian fixed-point classes:

```lean
structure SpectralPatch
structure BandSheaf
def edgeModeProjection : ...
```

Theorems:

```lean
theorem laplacian_H0_modes_are_global_sections
theorem fuzzy_band_equivalence_composes
theorem edge_obstruction_implies_H1_nonzero_projection
```

**Status.** Horizon for sheaf/Laplacian projections.
Berry curvature, Chern classes, non-Hermitian spectral theory, and PDE wave dispersion are not visible.

### 3.3.6 Structure-preserving PIC / finite exterior calculus projections

**Source definition/theorem.** Geometric PIC and GEMPIC preserve charge, gauge constraints, Gauss law, and \(\nabla\cdot B=0\) through compatible discrete complexes.

**RelMath anchor.**

- `Cohomology.
  Sheaf`
- `QuantaleEnrichedSheaf`
- `DFrame`
- `ClosureRuleSystem`
- `Probability.
  Stochastic`
- `Lorentzian.
  CausalCohomology*` modules are imported in the spine.

**Proof-agent target.**

Define a finite cochain complex of cells, particles as sections, and constraints as closure rules:

```lean
structure DiscreteComplex
def d0 : C0 → C1
def d1 : C1 → C2
theorem d_comp_d_zero_projection
def gaussConstraintClosure : ...
```

Theorems:

```lean
theorem constraint_closure_preserves_divergence_free_projection
theorem gauge_equivalent_sections_have_same_H0
theorem charge_conservation_as_BeckChevalley_projection
```

**Status.** Horizon for a finite cohomological skeleton.
Actual finite-element exterior calculus and Maxwell equations are not visible.

---

## 4. Not yet visible from the program

This section is important because it keeps proof-agent work honest.
These directions are not merely “hard”; they require foundations not currently present, or only barely present, in the repository.

## 4.1 Full Boltzmann–Grad / Lanford / Deng–Hani–Ma derivations

RelMath can model closure rules, finite collision systems, finite measures, and finite H-theorem projections.
It cannot yet formalize:

- \(N\)-particle hard-sphere phase spaces with excluded diagonals.
- Collision trees and recollision estimates.
- Boltzmann–Grad scaling \(N\varepsilon^{d-1}\to\lambda^{-1}\).
- Weak convergence of marginals.
- Long-time regularity assumptions on continuum Boltzmann solutions.

**Reason not visible.** Missing geometry, analysis, measure-valued convergence, limiting probability, and hard-sphere mechanics.

## 4.2 DiPerna–Lions renormalized Boltzmann solutions

RelMath does not yet have:

- \(L^1\), \(L\log L\), entropy inequalities over measurable spaces.
- Weak compactness.
- Renormalized solution definitions.
- Distributional PDE syntax.

**Reason not visible.** Missing functional analysis and continuum measure theory.

## 4.3 Non-cutoff Boltzmann and Landau-Coulomb regularity

RelMath does not yet have:

- Fractional diffusion operators.
- Integro-differential kernels.
- Velocity-weighted Sobolev/Hölder spaces.
- Fisher information over continuum distributions.
- Degenerate parabolic PDE regularity.

**Reason not visible.** Missing real analysis, PDE, and functional inequalities.

## 4.4 Navier–Stokes / Euler / Arnold–Ebin–Marsden hydrodynamic geometry

RelMath has closure flow as a discrete dynamical system, but it does not yet have:

- Smooth manifolds.
- Diffeomorphism groups.
- Vector fields and differential forms on manifolds.
- Sobolev manifolds.
- Navier–Stokes weak/strong solution theory.
- Euler geodesic equation on \(\mathrm{Diff}_{\mathrm{vol}}\).

**Reason not visible.** Missing smooth geometry and PDE foundations.

## 4.5 Green–Kubo transport coefficients

RelMath can define finite expectations and finite-time sums.
It cannot yet prove:

- Existence of infinite-time correlation integrals.
- Positivity/finiteness of viscosity, conductivity, or diffusion.
- Decay of correlations.
- Fluctuation-dissipation theorems over continuous state spaces.

**Reason not visible.** Missing real-valued integration, limits, ergodic/mixing theory.

## 4.6 Vlasov–Maxwell, Vlasov–Poisson, and Landau damping

RelMath can encode finite phase-space transition systems and fixed-point closures, but it lacks:

- Distribution functions \(f(t,x,v)\) over \(\mathbb R^d\times\mathbb R^d\).
- Poisson and Maxwell PDE.
- Electromagnetic fields \(E,B\), gauge potentials, and differential constraints.
- Fourier/Laplace analysis.
- Analytic/Gevrey norms and phase-mixing estimates.
- Penrose stability.

**Reason not visible.** Missing continuum kinetic PDE and harmonic analysis.

## 4.7 Hamiltonian plasma geometry and Casimirs

RelMath has category, hyperdoctrine, gauge-like K4 actions, cohomology, and causal/Lorentzian modules.
It does not yet have:

- Symplectic manifolds.
- Noncanonical Poisson brackets.
- Infinite-dimensional Hamiltonian systems.
- Casimir functionals.
- Marsden–Weinstein/Morrison Vlasov–Maxwell bracket.

**Reason not visible.** Missing symplectic/Poisson geometry and functional calculus.

## 4.8 Magnetic helicity and MHD reconnection in the physical sense

RelMath can build a sheaf/cohomology curvature projection of reconnection-like events.
It cannot yet build:

\[ H_m=\int A\cdot B\,dV \]

or prove helicity conservation/dissipation theorems, because it lacks:

- Vector calculus over 3-manifolds.
- Differential forms and integration.
- Magnetic vector potentials.
- MHD PDE and weak solutions.
- Knot/link invariants of field lines.

**Reason not visible.** Missing differential topology, integration, and PDE.

## 4.9 Gyrokinetics, quasisymmetry, and stellarator optimization

RelMath has quotient/fibration/closure/regime machinery and an optimization-as-fixed-point projection.
It lacks:

- Guiding-center coordinates.
- Lie-transform asymptotics.
- Toroidal geometry.
- KAM/near-integrability.
- Magnetic field-line Hamiltonian systems.
- Real-valued objective optimization.

**Reason not visible.** Missing smooth geometry, perturbation theory, and real optimization.

## 4.10 Topological plasma-wave invariants in the actual sense

RelMath has Q-categories, fuzzy equivalence, cohomology, and Laplacian fixed points.
It lacks:

- Hilbert spaces / spectral theory.
- Vector bundles over momentum space.
- Berry connection/curvature.
- Chern classes.
- Non-Hermitian spectra and branch cuts.
- Bulk-edge correspondence theorems.

**Reason not visible.** Missing spectral geometry and topology of vector bundles.

---

## 5. Cross-regime map: definitions and theorem-forms

The table below gives a compact source-to-RelMath map.

| Source area | Source definition/theorem | RelMath object | Status | Proof-agent note |
|---|---|---:|---:|---|
| Gas | Boltzmann collision operator \(Q\) | `ClosureRuleSystem.Tstep` | Horizon | Build finite collision quads and collision closure. |
| Gas | \(H\)-theorem | `FreeEnergyLyapunov.free_energy_is_lyapunov` | Realized projection | Extend from Nat \(T=0\) to rational/real entropy. |
| Gas | Molecular chaos | `conditional_via_fiber_adjoint`, \(H^1=0\) | Horizon | Define finite joint/marginal factorization. |
| Gas | Lanford / long-time derivation | none | Not visible | Needs hard-sphere geometry and convergence. |
| Gas | Markov/Fokker–Planck stationarity | `markov_stationary_is_closure_fixpoint` | Realized finite | Build finite-state Fokker–Planck projections. |
| Gas | Poisson birth–death stationary law | `poissonKernel_settling_fixpoint` | Realized finite | Generalize beyond 2-state witness. |
| Gas | Hypocoercivity | `LawvereLaplacian`, `CurvatureRegime` | Horizon | Need commutator/bracket-generating projection. |
| Liquid | Pair correlation \(g(r)\), \(S(k)\) | finite event/correlation valuation | Horizon | Build finite distance-bin pair-correlation module. |
| Liquid | Ornstein–Zernike \(h=c+\rho c*h\) | lfp of correlation closure | Horizon | Define convolution as finite graph incidence. |
| Liquid | DFT minimization | `FreeEnergyLyapunov`, `Optimization` | Horizon | Build rational density-field closure. |
| Liquid | Navier–Stokes regularity | none | Not visible | Needs PDE. |
| Liquid | Arnold fluid geometry | none | Not visible | Needs manifolds/diffeomorphism groups. |
| Liquid | Vorticity/helicity | \(H^1\), curvature modules | Horizon projection | Need actual vector calculus for physical helicity. |
| Liquid | Liquid-crystal defects | `DFrame`, `BigradedCohomology` | Horizon projection | Build finite order-parameter sheaf. |
| Liquid | Glass dynamic arrest | `ClosureFlowDynamics`, `CurvatureRegime` | Horizon projection | Formalize arrested support / non-Scott heterogeneity. |
| Plasma | Vlasov flow | `drive`, `MarkovKernel` finite phase-space | Horizon | Build finite phase-cell transport. |
| Plasma | Quasineutrality | rule closure / lfp | Horizon | Define species charge and zero-net-charge closure. |
| Plasma | Debye shielding | Lawvere Laplacian fixed points | Horizon projection | Need graph attenuation kernel. |
| Plasma | Landau damping | none | Not visible | Needs Fourier/Gevrey/phase mixing. |
| Plasma | Hamiltonian Vlasov–Maxwell | none | Not visible | Needs Poisson/symplectic/infinite-dimensional geometry. |
| Plasma | Magnetic reconnection | `FiringStep`, `IsCurved`, \(H^1\ne0\) | Horizon projection | Formalize field-line connectivity sheaf. |
| Plasma | MHD helicity | cohomology/gauge projection | Horizon/not visible | Actual helicity integral not available. |
| Plasma | Topological plasma waves | `QCat`, `QFuzzyEquiv`, `h0_laplacian_fixed_points` | Horizon projection | Actual Chern/band topology not available. |
| Plasma | Structure-preserving PIC | sheaf/cochain projections | Horizon | Build finite complex and constraint closures. |

---

## 6. Recommended proof-agent queue

This is an ordered queue of proof-agent tasks that are likely to produce real new RelMath modules while staying inside current foundations.

### Batch A — finite kinetic closure

**Goal.** Create a finite discrete-velocity collision theory as a direct child of `ClosureRuleSystem`.

Modules:

```text
RelMath/Relational/Kinetic/DiscreteVelocity.lean
RelMath/Relational/Kinetic/CollisionInvariant.lean
RelMath/Relational/Kinetic/BoltzmannClosure.lean
RelMath/Relational/Kinetic/BGKProjection.lean
RelMath/Relational/Kinetic/HTheoremProjection.lean
```

Core theorem bundle:

```lean
theorem finite_boltzmann_collision_lfp
theorem finite_collision_invariants_preserved
theorem finite_collision_free_energy_nonincreasing
theorem bgk_projection_is_closure_fixed_point
```

Why first: this connects the gases memo to existing closure, probability, stochastic, and H-theorem modules with minimal new foundations.

### Batch B — molecular chaos and BBGKY finite projection

**Goal.** Define finite marginals, joint valuations, and factorization as a sheaf/separation condition.

Modules:

```text
RelMath/Relational/Kinetic/Marginal.lean
RelMath/Relational/Kinetic/MolecularChaosProjection.lean
RelMath/Relational/Kinetic/BBGKYProjection.lean
```

Core theorem bundle:

```lean
theorem marginal_is_reindex
theorem factorization_is_gluing_projection
theorem H1_zero_implies_no_factorization_obstruction
```

Why second: it uses existing hyperdoctrine reindexing and \(H^1=0\) confluence.

### Batch C — finite liquid-state correlations

**Goal.** Formalize finite pair-correlation closure and an Ornstein–Zernike-style lfp.

Modules:

```text
RelMath/Relational/Liquid/PairCorrelation.lean
RelMath/Relational/Liquid/StructureFactorProjection.lean
RelMath/Relational/Liquid/OrnsteinZernikeClosure.lean
RelMath/Relational/Liquid/DensityFunctionalProjection.lean
```

Core theorem bundle:

```lean
theorem pair_correlation_measure_is_valuation
theorem oz_operator_monotone
theorem ornstein_zernike_lfp
theorem density_functional_minimizer_is_fixed_point
```

Why third: it turns liquid short-range order into RelMath closure/cohomology language.

### Batch D — plasma constraint closures

**Goal.** Formalize quasineutrality, screening, and finite phase-space transport as closure/fixed-point systems.

Modules:

```text
RelMath/Relational/Plasma/SpeciesCharge.lean
RelMath/Relational/Plasma/QuasineutralClosure.lean
RelMath/Relational/Plasma/PhaseSpaceTransport.lean
RelMath/Relational/Plasma/DebyeGraphScreening.lean
```

Core theorem bundle:

```lean
theorem quasineutral_closure_lfp
theorem quasineutral_fixed_point_zero_net_charge
theorem phase_transport_stationary_is_settling_fixed
theorem screening_laplacian_fixed_points
```

Why fourth: it gives plasma mathematics a finite RelMath foothold without pretending to prove Vlasov–Poisson.

### Batch E — topological fluids/plasmas

**Goal.** Use `DFrame`, `QEnriched`, and curvature-regime results to formalize defect/reconnection/topological-event projections.

Modules:

```text
RelMath/Topology/DefectSheafProjection.lean
RelMath/Relational/Fluid/VortexCohomologyProjection.lean
RelMath/Relational/Plasma/ReconnectionCurvatureProjection.lean
RelMath/Relational/Plasma/TopologicalWaveSheafProjection.lean
```

Core theorem bundle:

```lean
theorem defect_obstruction_implies_H1_nonzero
theorem flat_regime_forbids_reconnection_projection
theorem q_fuzzy_phase_equivalence_composes
theorem laplacian_H0_modes_are_fixed_points
```

Why fifth: it connects the most novel RelMath cohomology/curvature machinery to frontier topological matter without needing immediate continuum PDE.

### Batch F — positive-temperature and real-valued entropy

**Goal.** Move the \(T=0\) Nat-valued H-theorem toward rational/real finite entropy.

Modules:

```text
RelMath/Relational/Thermo/RationalEntropyProjection.lean
RelMath/Relational/Thermo/PositiveTemperatureClosure.lean
RelMath/Relational/Kinetic/DetailedBalanceEntropy.lean
```

Core theorem bundle:

```lean
theorem detailed_balance_entropy_nonincreasing_projection
theorem positive_temperature_closure_lfp
theorem rational_free_energy_decreases_under_reversible_kernel
```

Why sixth: this is important but depends on how far `InternalReals` and real-order infrastructure can currently go.

---

## 7. Red-node candidates

These are concise “red nodes” a proofing agent could add.

### Red node 1: `FiniteCollisionQuad`

> Define a finite collision quadruple \((v,w)\to(v',w')\) with abstract conserved labels `mass`, `momentum`, and `energy`.
> Prove that the induced `ClosureRule` update preserves the sums of those labels over a finite support.

### Red node 2: `BoltzmannHProjection`

> Use `FreeEnergyLyapunov` to prove that any finite collision closure generated by monotone collision rules has a nonincreasing finite free-energy deficit and strictly decreases at firings.

### Red node 3: `MolecularChaosAsGluing`

> Define a finite two-particle joint valuation, its two one-particle marginals, and a tensor/factorized projection.
> Prove that factorization is a separated-gluing condition and that nonzero \(H^1\) is an obstruction.

### Red node 4: `OrnsteinZernikeLFP`

> On a finite distance-bin graph, define `h`, `c`, and a finite incidence convolution.
> Prove the OZ step is monotone and its closure is the least fixed point satisfying the finite OZ equation.

### Red node 5: `QuasineutralClosure`

> Define species with rational charge and finite cell densities.
> Define a closure rule that raises a cell to a quasineutral settled state when net charge vanishes or is forced.
> Prove the resulting closure has a least fixed point and unique equilibrium in flat regimes.

### Red node 6: `ReconnectionCurvatureProjection`

> Define a finite field-line connectivity sheaf.
> A reconnection is a step that changes connectivity.
> Prove that a reconnection step is a firing step and, in the non-Scott case, yields nonvanishing \(H^1\).

### Red node 7: `TopologicalWaveQSheaf`

> Model a finite spectral band cover as a `QCat`/Q-enriched sheaf.
> Prove that `q`-fuzzy equivalence of local band data composes and that degree-zero modes are Lawvere-Laplacian fixed points.

### Red node 8: `GreenKuboFiniteSum`

> Define finite-time correlation functions for a stationary Markov kernel and prove additivity, homogeneity, and stationarity time-shift identities for partial sums.

### Red node 9: `DensityFunctionalProjection`

> Define finite rational density fields and a rational free-energy functional.
> Prove that closure-minimizers are fixed points and that \(T=0\) recovers the existing hard closure.

### Red node 10: `DefectDFrame`

> Define local order defects using the d-frame-valued sheaf.
> Prove restriction preserves consistency and that defect obstruction is detected by the falsehood/inconsistency side.

---

## 8. Bottom line

The strongest immediate insight is that the attached matter directions all contain a shared theorem-form:

\[ \textbf{local update / transport / collision / constraint} \quad\leadsto\quad \textbf{closure operator} \quad\leadsto\quad \textbf{fixed point / equilibrium} \quad\leadsto\quad \textbf{cohomological obstruction or vanishing} \quad\leadsto\quad \textbf{regime classification}. \]

RelMath already has this form in a proof-native way.
The most productive next work is not to jump directly to Navier–Stokes, Vlasov–Maxwell, or Landau damping.
Those are not yet visible.
The productive path is to build **finite kinetic/liquid/plasma projections**:

1. finite Boltzmann collision closure;
2. finite molecular-chaos/gluing obstruction;
3. finite Ornstein–Zernike closure;
4. finite quasineutral plasma closure;
5. finite reconnection/defect \(H^1\) obstruction;
6. finite topological-wave Q-sheaf modes;
7. rational/positive-temperature entropy extension.

That route keeps the no-free-data discipline while making contact with the mathematical frontiers of gases, liquids, and plasmas in a way a proofing agent can actually pursue.
