---
title: RelMath vs empirical quantum/causal reality
date-created: 2026-06-28
description: "Source note: I treated the uploaded prompt as the scope and style contract for this memo."
---
# RelMath vs empirical quantum/causal reality

_Source note: I treated the uploaded prompt as the scope and style contract for this memo. fileciteturn0file0_

## 1. Executive answer

**Strongest comparison:** RelMath is genuinely close to **finite causal-set mathematics**.
The repo has finite events, DAG-like causal seeds, transitive closure, strict causal order, causal intervals, past layers, Myrheim–Meyer-style ordering fractions, incidence Möbius inversion, Philip Hall chain sums, causal d’Alembertian projections, Benincasa–Dowker layer coefficients, and endogenous layer/action reconstruction.
This is not merely causal vocabulary; it reproduces a recognizable finite combinatorial fragment of causal set theory.
Causal-set theory itself models spacetime as a locally finite partial order, where order carries causal structure and local finiteness carries discreteness.
([arxiv.org](https://arxiv.org/abs/1903.11544?utm_source=chatgpt.com)) RelMath formalizes that finite order spine in `RelMath/Lorentzian/Causal.lean`, `CausalInterval.lean`, `MyrheimMeyer.lean`, `CausalMobius.lean`, `CausalDAlembertian.lean`, `BenincasaDowker.lean`, and `EndogenousCoefficients.lean`. fileciteturn13file0L35-L48 fileciteturn50file0L8-L18 fileciteturn49file0L8-L16

**Weakest comparison:** RelMath is not yet close to quantum mechanics as experimentally practiced.
It does not yet have Hilbert spaces, complex amplitudes, density matrices, self-adjoint observables, Born probabilities, unitary evolution, completely positive trace-preserving quantum channels, tensor products, stabilizer groups, or quantum error-correcting codes.
Contemporary quantum experiments such as loophole-free Bell tests constrain probability tables produced by real measurement devices; the 2015 Delft, Vienna, and NIST/Boulder experiments closed major locality/detection-style loopholes using spacelike-separated settings and high-efficiency detection.
([arxiv.org](https://arxiv.org/abs/1508.05949?utm_source=chatgpt.com)) RelMath currently has finite probability and Markov kernels, but not quantum probability over noncommuting observables.

**Strangest comparison:** RelMath has an unusually promising **sheaf/contextuality projection**.
Abramsky–Brandenburger contextuality treats nonlocality/contextuality as obstruction to a global section over a measurement cover; local compatibility does not guarantee global realizability.
([arxiv.org](https://arxiv.org/abs/1102.0264?utm_source=chatgpt.com)) RelMath already has covers, sheaf gluing, Čech-like `H¹`, classifying invariants, FOUR/paraconsistent valuations, and internal gauge-like symmetries.
But the current RelMath sheaf layer mostly proves vanishing/gluing in strict regimes, not Bell/Kochen–Specker contextuality.
The right statement is: **RelMath has the architectural socket for contextuality, not contextuality itself.** fileciteturn35file0L39-L57 fileciteturn36file0L4-L12

Bottom line: RelMath is currently closest to **causal-set physics** in formal content, secondarily close to **Abramsky–Brandenburger-style contextuality sheaves** in shape, only weakly close to **operational probabilistic theories**, and not yet close to **categorical quantum mechanics** except at the level of “process/composition” aspiration.

---

## 2. Repository map

### Strong / already in territory

`RelMath/Lorentzian/Causal.lean` formalizes finite causal settling: a causal seed, reachability, transitive closure, and a theorem that the settled relation is transitive and irreflexive.
The key names are `CausalSet`, `link`, `reaches`, `causalStep`, `causalStep_fixed`, `reaches_is_transitively_closed`, and `causal_settling_is_transitive_closure`.
This strongly resembles finite causal-set kinematics. fileciteturn13file0L71-L94 fileciteturn13file0L104-L136 fileciteturn14file0L3-L47

`RelMath/Lorentzian/CausalInterval.lean` defines `between`, `intervalCard`, `pastLayer`, and `layerCount`, then proves a diamond layer profile and partition.
This is a strong finite analogue of Alexandrov intervals, causal diamonds, and layer-count observables used in causal-set d’Alembertians. fileciteturn16file0L49-L86 fileciteturn16file0L103-L119

`RelMath/Lorentzian/MyrheimMeyer.lean` computes the rational ordering-fraction input to a Myrheim–Meyer dimension estimator, while explicitly scoping out the real-valued inversion `d_MM = f⁻¹(r)`.
This is strong as a finite estimator input, weak as an actual empirical dimension estimator. fileciteturn11file0L11-L17 fileciteturn12file0L119-L156

`RelMath/Lorentzian/CausalMobius.lean` builds the incidence-algebra Möbius function, causal coefficients, orthogonality, and Philip Hall chain sums.
This is strong finite incidence algebra.
It becomes physically meaningful only when connected to causal-set d’Alembertian/action calibration. fileciteturn5file0L6-L13 fileciteturn7file0L74-L113

`RelMath/Lorentzian/CausalDAlembertian.lean`, `BenincasaDowker.lean`, and `EndogenousCoefficients.lean` are especially important: RelMath defines a retarded Möbius-convolution causal d’Alembertian, proves additivity and expectation commutation, relates incidence and Benincasa–Dowker layer operators under a layer-constancy law, and reconstructs strict-past action from endogenous Möbius layer coefficients.
Benincasa and Dowker’s original operator approximates the continuum scalar d’Alembertian and curvature expression in manifoldlike causal sets, so this is a real finite projection of known causal-set physics.
([arxiv.org](https://arxiv.org/abs/1001.2725?utm_source=chatgpt.com)) fileciteturn50file0L99-L154 fileciteturn49file0L63-L99 fileciteturn51file0L147-L174

### Medium / structurally close

`RelMath/Calculus/Probability/Measure.lean`, `Stochastic.lean`, `PoissonSettling.lean`, and `RealStochasticInterval.lean` formalize finite sample spaces, counting measures, conditional restriction, Markov kernels, stationary distributions, detailed-balance projections, Poisson-style stationary kernels, and a `[0,1]` real unit interval value category.
This is close to classical empirical distributions and finite stochastic processes, but not yet to statistical inference, measure theory, or quantum channels. fileciteturn29file0L21-L47 fileciteturn28file0L9-L28 fileciteturn31file0L70-L96 fileciteturn32file0L7-L15

`RelMath/Cohomology/SettlingCohomologyH1.lean`, `CoordinationCohomology.lean`, and `LawvereHarmonicCohomology.lean` formalize global sections, gluing, `H¹`-as-obstruction language, graph nerve `H¹` rank as coordination cost, and harmonic/cohomological compatibility.
This is structurally close to sheaf obstruction methods, including contextuality, but does not yet define measurement covers or empirical models. fileciteturn35file0L8-L21 fileciteturn33file0L7-L20 fileciteturn34file0L21-L31

`RelMath/Dynamics/Flow/LawvereLaplacianSpectralGap.lean`, `Laplacianizability.lean`, and `FreeEnergyLyapunov.lean` give an order-valued Laplacian, harmonic fixed points, sheafhood preservation, Tarski ascent, finite spectral-gap-style bounds, and a count-valued free-energy Lyapunov theorem.
This resembles diffusion, Hodge theory, and thermodynamic descent, but it is not analytic spectral theory or physical entropy. fileciteturn44file0L112-L147 fileciteturn45file0L27-L51 fileciteturn46file0L12-L25 fileciteturn26file0L43-L72

### Speculative but interesting

`RelMath/Language/Positing/Four.lean`, `BigradedCohomology.lean`, and `KleinFourGauge.lean` give a four-valued bilattice object, truth/knowledge axes, bigraded truth/inconsistency content, and an internal `ℤ/2`/Klein-four gauge action.
This resembles gauge symmetry only abstractly: it has group action and invariant/moved sectors, but it is not a physical gauge field, not a principal bundle, and not Wilson-loop/lattice-gauge theory. fileciteturn41file0L8-L23 fileciteturn38file0L69-L128 fileciteturn40file0L60-L116

`RelMath/Aperiodic/AndersonPutnam.lean` and `InverseHull.lean` give a directed-system/colimit and inverse-limit hull projection for aperiodic cohomology, with `hull_pairs_clinv` witnessing a nonzero classifying invariant.
This is mathematically rich, but its physics comparison is indirect: it currently resembles aperiodic/tiling cohomology more than empirical quantum or spacetime measurement. fileciteturn52file0L11-L15 fileciteturn53file0L19-L39 fileciteturn48file0L144-L150

---

## 3. Realized within RelMath territory

**Finite causal sets.** Realized.
`CausalSet`, `reaches`, and `causal_settling_is_transitive_closure` reproduce the finite causal-order core: seed relation, transitive reachability, no closed timelike loops by rank, and settled strict order.
This matches causal-set kinematics at the finite poset level. fileciteturn13file0L71-L82 fileciteturn14file0L3-L47

**Causal diamonds / Alexandrov intervals.** Realized as finite order intervals and layer counts.
`between`, `intervalCard`, `pastLayer`, `layerCount`, `diamond_layer_profile`, and `diamond_layers_partition_past` are the right finite shape.
What is missing is embedding into a Lorentzian manifold and empirical sampling by Poisson sprinkling. fileciteturn16file0L49-L86 fileciteturn16file0L103-L119

**Myrheim–Meyer estimator input.** Realized as rational ordering fraction.
`orderingFraction`, `diamond_ordering_fraction`, and `geometry_independent_of_topology` are meaningful finite observables, but the real inversion to a dimension estimate is explicitly not yet formalized. fileciteturn11file0L11-L17 fileciteturn12file0L49-L59

**Causal Möbius / Philip Hall.** Realized.
`mobius`, `chainCount`, `hallSum`, `diamond_philip_hall`, and `mobius_orthogonality_causal` give real incidence-algebra structure.
This is one of the strongest mathematical bridges to causal-set d’Alembertian work. fileciteturn5file0L71-L94 fileciteturn7file0L94-L113

**Causal d’Alembertian projections.** Realized as finite retarded Möbius convolution.
`dalembertian`, `dalembertian_zero`, `dalembertian_add`, and `dalembertian_expectation` provide a discrete operator over internal reals.
The `BenincasaDowker` module then proves exact coincidence with layer-grouped BD operators under layer constancy and includes 2D/4D coefficient projections. fileciteturn50file0L99-L154 fileciteturn49file0L101-L160

**Endogenous causal action coefficients.** Realized.
`endoCoeff`, `strictAction`, `endo_reconstructs_action`, `diamond_endoCoeff`, and `diamond_endoCoeff_factors` are genuinely interesting: the repo groups Möbius inverse weights by abundance layers instead of simply positing dimension-calibrated BD coefficients.
This is a strong internal “playable” causal-set object, but it still needs continuum calibration before becoming physics. fileciteturn51file0L8-L19 fileciteturn51file0L182-L206

**Finite probability / Markov kernels.** Realized.
`SampleSpace`, `measure`, `measure_is_valuation`, `MarkovKernel`, `IsStationary`, `markov_stationary_is_closure_fixpoint`, and `stationary_matrix_fixpoint` are valid finite probability/Markov shapes.
They compare well to empirical distributions and finite stochastic systems, weakly to quantum channels. fileciteturn29file0L66-L84 fileciteturn30file0L25-L56 fileciteturn27file0L147-L181 fileciteturn28file0L9-L28

**Detailed balance / Poisson settling.** Realized as finite/rational toy theory.
`detailed_balance_implies_stationary`, `poisson_detailed_balance`, and `poissonKernel_stationary` are legitimate stochastic-process shapes.
They are not yet stochastic thermodynamics with path measures and entropy production. fileciteturn31file0L70-L96 fileciteturn31file0L191-L203

**Sheaf gluing and obstruction socket.** Partially realized.
`Cech1`, `Cocycle`, `Coboundary`, `glue_coboundary`, `glue_unique`, `h1_vanishes`, and `classifying_invariant_zero_strict` build a gluing/cohomology story.
But in the strict/Scott regime the story is deliberately unobstructed: agreeing families glue uniquely.
Contextuality requires compatible local data with no global section, so that theorem is more a baseline than a contextuality result. fileciteturn35file0L122-L143 fileciteturn36file0L8-L12 fileciteturn36file0L126-L140

**Harmonic/fixed global sections.** Realized.
`lawvereLaplacian`, `IsHarmonic`, `laplacian_is_closure`, `diffusion_converges_to_harmonic`, and `harmonic_kernel_is_fixed_quiescent` create a fixed-point/Hodge-projection layer.
This is useful for information-flow and settling dynamics, but it is order-theoretic rather than Hilbert-spectral. fileciteturn44file0L112-L147 fileciteturn45file0L104-L125 fileciteturn45file0L136-L162

**Gauge-like internal symmetry.** Realized as finite bilattice symmetry.
`K4`, `act`, `mul`, `act_mul`, `isGroup`, `inGauge`, `gaugeAct`, `gauge_fixes_inconsistency`, `gauge_flips_truth`, `paraconsistent_gauge_stable`, and `classical_gauge_moves` give a genuine finite group action.
This is gauge-like, but not yet gauge theory. fileciteturn39file0L64-L95 fileciteturn39file0L147-L195 fileciteturn40file0L68-L116

---

## 4. On the horizon

### Quantum/contextuality horizon

Add `RelMath/Relational/Quantum/MeasurementScenario.lean`.

Definitions: `Measurement`, `Outcome`, `Context`, `MeasurementCover`, `EventSheaf`, `LocalSection`, `CompatibleFamily`, `GlobalSection`.

Theorems: `global_section_restricts_compatible`, `compatible_family_of_global_section`, `no_global_section_is_contextual`.

`notready` is acceptable for nontrivial contextual examples.
The first milestone should be a purely finite presheaf of outcome assignments.
This would put RelMath directly in the neighborhood of Abramsky–Brandenburger contextuality, where contextuality is precisely failure of compatible local data to extend to a global section.
([arxiv.org](https://arxiv.org/abs/1102.0264?utm_source=chatgpt.com))

Add `RelMath/Relational/Quantum/EmpiricalModel.lean`.

Definitions: `Distribution R α`, `EmpiricalModel`, `NoSignaling`, `NoncontextualModel`, `SupportGlobalSection`.

Theorems: `global_distribution_implies_noSignaling`, `support_global_section_implies_noncontextual`, `strong_contextuality_of_no_support_global_section`.

This requires finite probability distributions over local sections.
It can initially use the existing `Probability.
Measure` and `RealStochasticInterval` layer.
`sorry` is acceptable for Bell/CHSH numerical inequalities.

### Causal horizon / black-hole image horizon

Add `RelMath/Lorentzian/Horizon.lean`.

Definitions: `futureOf`, `pastOf`, `futureClosed`, `NoEscapeRegion`, `Exterior`, `HorizonBoundary`, `causalBoundary`.

Theorems: `noEscape_futureClosed`, `horizon_is_boundary_of_noEscape`, `future_closed_complement_past_stable`.

This would compare to black-hole horizons only as finite causal boundaries.
It would not be a smooth event horizon, because an event horizon in GR depends on global spacetime causal structure and null infinity.
RelMath can model finite no-escape regions before it models continuum black-hole geometry.
EHT black-hole image measurements constrain emission-ring and photon-ring geometry near horizons in full GRMHD and VLBI data, which is far beyond the current repo.
([arxiv.org](https://arxiv.org/abs/1906.11238?utm_source=chatgpt.com))

### Empirical causal estimators

Add `RelMath/Lorentzian/EmpiricalEstimators.lean`.

Definitions: `intervalAbundanceHistogram`, `orderingFractionEstimator`, `layerProfile`, `mmDimensionProxy`, `sprinklingSample`.

Theorems: `diamond_orderingFractionEstimator_eq`, `histogram_refines_layerCount`, `sprinkling_expectation_commutes_dalembertian`.

This should connect existing `MyrheimMeyer`, `CausalInterval`, and `CausalDAlembertian`.
Real-valued inversion and statistical confidence intervals can stay `notready`.

### Gauge/Wilson-loop projection

Add `RelMath/Dynamics/Gauge/WilsonLoopProjection.lean`.

Definitions: `FiniteGaugeGroup`, `EdgeLabeling`, `Path`, `pathHolonomy`, `Loop`, `vertexGaugeAct`, `ClassFunction`, `WilsonLoopProjection`.

Theorems: `pathHolonomy_gauge_conjugates`, `wilsonLoop_classFunction_invariant`, `plaquetteWilson_invariant`.

This would be the correct bridge from the current `KleinFourGauge` to lattice gauge theory.
In lattice gauge theory, link variables and Wilson loops are central gauge-invariant observables; the Wilson action is built from plaquettes.
([en.wikipedia.org](https://en.wikipedia.org/wiki/Wilson_action?utm_source=chatgpt.com))

### Entropy / information proxy

Add `RelMath/Information/EntropyProxy.lean`.

Definitions: `supportSize`, `countEntropy`, `valuationSupport`, `relativeSupport`, `mutualSupport`.

Theorems: `support_entropy_mono_under_refinement`, `countEntropy_zero_iff_singleton`, `freeEnergy_bounds_supportEntropy`.

This should explicitly say “proxy.” Shannon entropy is a real-valued logarithmic functional, while von Neumann entropy is `-tr(ρ log ρ)` for density matrices.
([en.wikipedia.org](https://en.wikipedia.org/wiki/A_Mathematical_Theory_of_Communication?utm_source=chatgpt.com)) RelMath currently has count/order-valued descent, not analytic entropy.

### Stochastic thermodynamics projection

Add `RelMath/Calculus/Probability/StochasticThermodynamics.lean`.

Definitions: `Trajectory`, `PathProb`, `ReversePath`, `EntropyProductionProxy`, `DetailedBalance`.

Theorems: `detailed_balance_entropyProduction_zero`, `stationary_distribution_fixed_point`, `freeEnergy_descends_along_markov_closure`.

Stochastic thermodynamics assigns entropy production to fluctuating trajectories and uses exact fluctuation relations for small nonequilibrium systems.
([en.wikipedia.org](https://en.wikipedia.org/wiki/Stochastic_thermodynamics?utm_source=chatgpt.com)) RelMath has detailed balance and Lyapunov descent projections, not trajectory-level thermodynamics yet.

---

## 5. Not yet visible

RelMath is not yet in the territory of **Hilbert-space quantum mechanics**.
It lacks complex Hilbert spaces, linear operators, adjoints, spectra, tensor products, projective/POVM measurement, the Born rule, unitary dynamics, density matrices, von Neumann entropy, and completely positive trace-preserving maps.
Quantum channels are normally represented as linear CPTP maps on density matrices, and quantum process tomography assumes such a quantum-operation formalism.
([en.wikipedia.org](https://en.wikipedia.org/wiki/Quantum_process?utm_source=chatgpt.com))

RelMath is not yet in **categorical quantum mechanics** in the technical sense.
CQM is built around dagger symmetric monoidal / dagger compact categories, where sequential and parallel composition of processes, adjoints, compact closure, and diagrammatic reasoning model quantum protocols.
([en.wikipedia.org](https://en.wikipedia.org/wiki/Categorical_quantum_mechanics?utm_source=chatgpt.com)) RelMath has categorical instincts and adjunction/closure structures, but not dagger compact process categories.

RelMath is not yet in **QFT or path-integral physics**.
It has finite causal actions and incidence operators, but not fields as operator-valued distributions, path integrals, renormalization, gauge-fixed functional integrals, scattering amplitudes, or continuum limit proofs.

RelMath is not yet in **smooth Lorentzian geometry**.
It has finite causal order, not differentiable manifolds, tangent bundles, Lorentzian metrics, null cones, curvature tensors, geodesic equations, Einstein equations as PDE, or global hyperbolicity theorems.

RelMath is not yet in **real empirical spacetime inference**.
GPS timing needs relativistic clock corrections; gravitational waves constrain propagation and strong-field dynamics; EHT black-hole images constrain emission-ring geometry through VLBI and GRMHD model fitting; Lorentz-invariance tests aggregate laboratory, astrophysical, photon, neutrino, and gravitational-wave observations.
([en.wikipedia.org](https://en.wikipedia.org/wiki/Global_Positioning_System?utm_source=chatgpt.com)) RelMath has no data pipeline for these.

RelMath is not yet in **nonabelian gauge theory**.
The internal `K4`/`ℤ/2` action is a real finite group action, but physical gauge theory needs gauge groups such as `U(1)`, `SU(2)`, `SU(3)`, connections, curvature, holonomy, Wilson loops, constraint surfaces, Gauss law, and gauge-invariant observables.

RelMath is not yet in **quantum error correction**.
Current surface-code experiments suppress logical errors by increasing code distance and running syndrome extraction/decoding; Google’s 2024/2025 below-threshold surface-code work is about physical qubits, logical qubits, decoder latency, and logical error rates.
([arxiv.org](https://arxiv.org/abs/2408.13687?utm_source=chatgpt.com)) RelMath has no Pauli group, stabilizer code, syndrome, decoder, logical operator, or threshold theorem layer.

---

## 6. Quantum comparison

RelMath’s best quantum comparison is **not** superposition, amplitudes, or Hilbert-space dynamics.
Its best comparison is **contextual obstruction**.

Abramsky–Brandenburger contextuality uses a measurement cover, local outcome sections, empirical probability models, compatibility/no-signaling, and the question of whether compatible local data extends to a global section.
Contextuality and nonlocality correspond to obstruction to global sections.
([arxiv.org](https://arxiv.org/abs/1102.0264?utm_source=chatgpt.com)) RelMath already has covers, local sections, global sections, gluing, `H¹` language, and nonclassical truth/inconsistency values.
That is the right shape.

But RelMath does **not** yet have the actual quantum empirical ingredients: finite measurement scenarios, outcome presheaves, empirical distributions on each context, no-signaling equations, Bell inequalities, CHSH values, Kochen–Specker configurations, or support-level contextuality.
Its `h1_vanishes` theorem proves that every agreeing family glues in the current strict sheaf setup; that is the opposite of a contextuality witness. fileciteturn36file0L8-L12

RelMath is closer to **Abramsky–Brandenburger contextuality sheaves** than to categorical quantum mechanics, because it already speaks in covers, local/global sections, and cohomological obstruction.
It is somewhat close to **operational probabilistic theories** because it has finite probability and Markov kernels, but it lacks convex state spaces, effects, transformations, and operational composition.
It is not yet close to **categorical quantum mechanics**, because it lacks dagger compact monoidal structure, tensor/process calculus, adjoints as daggers, and Hilbert semantics.

The paraconsistent FOUR layer should not be read as quantum superposition.
FOUR gives truth/knowledge/inconsistency statuses and finite bilattice symmetries; quantum superposition is a vector-amplitude phenomenon with interference and Born probabilities.
The safe comparison is: FOUR may help mark incompatible or overdetermined local evidence in a contextual cover; it does not itself provide quantum amplitudes.

---

## 7. Causal comparison

RelMath’s causal layer does more than imitate causal language.
It reproduces real finite causal-set mathematics at the order-theoretic level.

A causal set is a locally finite ordered structure intended to replace continuum spacetime with discrete events and causal precedence.
([arxiv.org](https://arxiv.org/abs/1903.11544?utm_source=chatgpt.com)) RelMath’s `CausalSet` stores finite events, a seed relation, and acyclicity/rank data; `reaches` gives transitive closure; `causal_settling_is_transitive_closure` packages settled transitivity and strictness. fileciteturn13file0L71-L82 fileciteturn14file0L3-L47

The causal interval layer is also real: `between`, `intervalCard`, `pastLayer`, and `layerCount` match the finite combinatorics of Alexandrov intervals and layer counts.
These are exactly the sort of finite observables that enter causal-set dimension estimators and d’Alembertian layer sums. fileciteturn16file0L49-L86

The strongest causal result is the d’Alembertian/action spine.
Benincasa–Dowker operators approximate continuum wave/curvature operators in suitable manifoldlike causal sets.
([arxiv.org](https://arxiv.org/abs/1001.2725?utm_source=chatgpt.com)) RelMath formalizes a Möbius-convolution d’Alembertian and proves linearity/expectation commutation.
It then relates incidence weights to BD layer coefficients under layer constancy, and reconstructs layer action endogenously from Möbius weights. fileciteturn50file0L123-L154 fileciteturn49file0L63-L99 fileciteturn51file0L159-L174

What is missing is also clear: no faithful embedding into Lorentzian manifolds, no Poisson sprinkling theorem, no continuum approximation proof, no estimator calibration, no Hauptvermutung proof, no Einstein equation, no realistic gravitational-wave/light-cone data interface.
So the judgment is:

**RelMath has genuine finite causal-set mathematics.
It does not yet have empirical spacetime physics.**

---

## 8. Information comparison

RelMath currently has **count-valued**, **order-valued**, and **obstruction-valued** information.

Count-valued information appears in finite measures, `H0` counts, support/cardinality ranks, free-energy deficits, and layer counts.
Order-valued information appears in knowledge-order closure, harmonic fixed points, monotone diffusion, and settling.
Obstruction-valued information appears in `H¹`, classifying invariants, aperiodic colimits, and hull seams.

That is structurally close to information theory only in a coarse sense.
Shannon entropy is a real-valued logarithmic functional introduced in information theory; von Neumann entropy is `-tr(ρ log ρ)` for density matrices; quantum relative entropy compares density matrices by trace/log expressions.
([en.wikipedia.org](https://en.wikipedia.org/wiki/A_Mathematical_Theory_of_Communication?utm_source=chatgpt.com)) RelMath’s `freeEnergy : Valuation → Nat` is explicitly a finite Lyapunov quantity, not thermodynamic entropy.
Its module also says the theory is `T=0` hard closure with no real entropy or temperature. fileciteturn24file0L57-L70

The good comparison is to **Lyapunov descent** and **fixed-point information loss/survival**: RelMath can ask which local information survives closure, which defects vanish, which global sections remain, and which obstruction classes persist.
The bad comparison would be to claim it already has entropy, mutual information, entanglement entropy, or generalized black-hole entropy.

---

## 9. Proposed proof-agent program

| Task | Proposed file | Definitions | Theorems | Dependencies | Success criterion |
|---|---|---|---|---|---|
| Finite measurement scenarios | `RelMath/Relational/Quantum/MeasurementScenario.lean` | `Measurement`, `Outcome`, `Context`, `MeasurementCover`, `EventSheaf` | `global_section_restricts_compatible` | `Cohomology.Sheaf`, `Probability.Measure` | Can state AB-style local/global section problem. |
| Empirical/no-signaling model | `RelMath/Relational/Quantum/EmpiricalModel.lean` | `EmpiricalModel`, `NoSignaling`, `Marginal`, `CompatibleDistributions` | `global_distribution_implies_noSignaling` | `RealStochasticInterval`, `Measure` | No-signaling becomes a theorem over finite covers. |
| Toy contextual obstruction | `RelMath/Relational/Quantum/ContextualObstruction.lean` | `SupportModel`, `NoGlobalSection`, `ContextualObstruction` | `no_global_section_implies_contextual`; `contextual_obstruction_nonzero` as `notready` | previous two | A Bell/KS toy can be represented, even if proof has `sorry`. |
| Causal no-escape region | `RelMath/Lorentzian/Horizon.lean` | `futureOf`, `futureClosed`, `NoEscapeRegion`, `HorizonBoundary` | `noEscape_futureClosed` | `Causal`, `CausalInterval` | A finite horizon boundary is definable without GR overclaim. |
| Alexandrov boundary | `RelMath/Lorentzian/AlexandrovBoundary.lean` | `AlexandrovInterval`, `BoundaryPoint`, `InteriorPoint` | `diamond_boundary_profile` | `CausalInterval`, `MyrheimMeyer` | Diamond boundary/interior split computed. |
| Empirical causal estimators | `RelMath/Lorentzian/EmpiricalEstimators.lean` | `orderingFractionEstimator`, `layerHistogram`, `mmDimensionProxy` | `diamond_estimator_eq_fiveSixths` | `MyrheimMeyer` | Existing estimator inputs packaged for comparison. |
| BD action extension | `RelMath/Lorentzian/BenincasaDowkerAction.lean` | `BDAction`, `LayerAction`, `CurvatureProxy` | `action_reconstructs_from_endoCoeff` | `BenincasaDowker`, `EndogenousCoefficients` | Existing coefficient work becomes an action-level API. |
| Wilson-loop projection | `RelMath/Dynamics/Gauge/WilsonLoopProjection.lean` | `FiniteGaugeGroup`, `EdgeLabeling`, `pathHolonomy`, `WilsonLoopProjection` | `wilson_loop_gauge_invariant` | `KleinFourGauge` initially; later finite groups | First genuine bridge from internal gauge to lattice gauge theory. |
| Entropy proxy | `RelMath/Information/EntropyProxy.lean` | `supportSize`, `countEntropy`, `relativeSupport` | `countEntropy_mono`, `freeEnergy_bounds_countEntropy` | `FreeEnergyLyapunov`, `Measure` | Honest proxy layer, no fake Shannon entropy. |
| Stochastic thermodynamics projection | `RelMath/Calculus/Probability/StochasticThermodynamics.lean` | `Trajectory`, `PathProb`, `ReversePath`, `EntropyProductionProxy` | `detailed_balance_entropyProduction_zero` | `Stochastic`, `PoissonSettling` | Detailed balance becomes finite thermodynamic projection. |
| Markov blanket / causal discovery | `RelMath/Calculus/Probability/CausalDiscovery.lean` | `FiniteVariable`, `DAG`, `ConditionalIndependence`, `MarkovBlanket` | `blanket_separates_node`; `d_separation_sound` as `notready` | `Probability.Measure`, `Lorentzian.Causal` | Separates causal inference DAGs from Lorentzian causal order. |
| Aperiodic contextual hull | `RelMath/Relational/Quantum/AperiodicContextualHull.lean` | `ContextHull`, `StageProjection`, `PersistentObstruction` | `persistent_obstruction_has_no_global_section` as `notready` | `Aperiodic.InverseHull`, contextual modules | Tests whether aperiodic `cl-inv` can become contextual obstruction. |

The highest-value first move is **not** Hilbert space.
It is the finite contextuality layer: measurement covers, local sections, empirical distributions, no-signaling compatibility, and global-section obstruction.
That would connect RelMath’s sheaf/cohomology machinery to quantum empirical structure without pretending to be quantum mechanics.
