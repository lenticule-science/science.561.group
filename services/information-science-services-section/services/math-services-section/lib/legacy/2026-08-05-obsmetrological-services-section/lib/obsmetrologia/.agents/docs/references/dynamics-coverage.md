---
title: Dynamics Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Dynamics.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - dynamics
---
# Dynamics Coverage Reference

Flow, gauge, spectral, curvature, Lyapunov, and firing dynamics generated from closure and cohomology.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/dynamics-path.md` |
| Guide | `guides/dynamics-maintenance.md` |
| Explanation | `explanations/dynamics.md` |
| Reference | `references/dynamics-coverage.md` |
| Concept atlas | `references/dynamics-concept-atlas.md` |
| Term ledger | `references/dynamics-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Dynamics` | `Obsmetrologia/Dynamics.lean` |
| `Obsmetrologia.Dynamics.Flow` | `Obsmetrologia/Dynamics/Flow.lean` |
| `Obsmetrologia.Dynamics.Flow.BlowupClassification` | `Obsmetrologia/Dynamics/Flow/BlowupClassification.lean` |
| `Obsmetrologia.Dynamics.Flow.ChromaticTileCubicGap` | `Obsmetrologia/Dynamics/Flow/ChromaticTileCubicGap.lean` |
| `Obsmetrologia.Dynamics.Flow.ChromaticTileGap` | `Obsmetrologia/Dynamics/Flow/ChromaticTileGap.lean` |
| `Obsmetrologia.Dynamics.Flow.ChromaticTileRayleigh` | `Obsmetrologia/Dynamics/Flow/ChromaticTileRayleigh.lean` |
| `Obsmetrologia.Dynamics.Flow.ClosureFlowDynamics` | `Obsmetrologia/Dynamics/Flow/ClosureFlowDynamics.lean` |
| `Obsmetrologia.Dynamics.Flow.CurvatureRegime` | `Obsmetrologia/Dynamics/Flow/CurvatureRegime.lean` |
| `Obsmetrologia.Dynamics.Flow.FiringBlowup` | `Obsmetrologia/Dynamics/Flow/FiringBlowup.lean` |
| `Obsmetrologia.Dynamics.Flow.FreeEnergyLyapunov` | `Obsmetrologia/Dynamics/Flow/FreeEnergyLyapunov.lean` |
| `Obsmetrologia.Dynamics.Flow.Laplacianizability` | `Obsmetrologia/Dynamics/Flow/Laplacianizability.lean` |
| `Obsmetrologia.Dynamics.Flow.LawvereKernelH0` | `Obsmetrologia/Dynamics/Flow/LawvereKernelH0.lean` |
| `Obsmetrologia.Dynamics.Flow.LawvereLaplacianSpectralGap` | `Obsmetrologia/Dynamics/Flow/LawvereLaplacianSpectralGap.lean` |
| `Obsmetrologia.Dynamics.Flow.NSCFiring` | `Obsmetrologia/Dynamics/Flow/NSCFiring.lean` |
| `Obsmetrologia.Dynamics.Flow.TransfiniteClosureFlow` | `Obsmetrologia/Dynamics/Flow/TransfiniteClosureFlow.lean` |
| `Obsmetrologia.Dynamics.Gauge` | `Obsmetrologia/Dynamics/Gauge.lean` |
| `Obsmetrologia.Dynamics.Gauge.Finite` | `Obsmetrologia/Dynamics/Gauge/Finite.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| frontier | theorem | `thm:brightwell-gregory-continuum` | Brightwell--Gregory: proper time converges to geodesic distance |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/05-proper-time.tex` |
| frontier | theorem | `thm:causal-set-hauptvermutung` | Causal-set Hauptvermutung --- the continuum-limit Betti match |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/cohomology-mld/cochain-complex/04-manifoldlikeness.tex` |
| frontier | theorem | `thm:myrheim-meyer-dimension` | Myrheim--Meyer dimension |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/01-dimension-estimators.tex` |
| leanok | proposition | `thm:nsc-firing-carrier` | A non-Scott firing is failure to commute with a directed join | `Obsmetrologia.Flow.NSCFiring.IsNSC` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| leanok | theorem | `thm:scott-continuous-iff-no-nsc-firing` | Scott-continuity is absence of NSC firing | `Obsmetrologia.Flow.NSCFiring.scott_continuous_iff_no_nsc_firing` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| leanok | theorem | `thm:nsc-firing-source-of-aperiodic` | NSC firings source the non-Scott regimes | `Obsmetrologia.Flow.NSCFiring.nsc_firing_source_of_aperiodic` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| frontier | theorem | `thm:raw-all-limit-regularity-frontier` | Raw all-limit regularity is a frontier obligation |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| leanok | theorem | `thm:curvature-regime-correspondence` | Curvature is the non-Scott regime projection | `Obsmetrologia.Flow.CurvatureRegime.curvature_regime_correspondence` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| leanok | theorem | `thm:curvature-rank-has-nsc-firing` | Positive curvature rank has an NSC firing witness | `Obsmetrologia.Flow.CurvatureRegime.rank_nonzero_has_nsc_firing` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| frontier | theorem | `thm:sym-trace-is-ricci-scalar` | The symmetric M\"obius trace is the continuum Ricci scalar |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-residual-curvature.tex` |
| frontier | theorem | `thm:bd-action-continuum-colimit` | The Benincasa--Dowker action's continuum limit is a colimit |  | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/03-continuum-colimits.tex` |
| leanok | theorem | `thm:bigraded-two-row` | Bigraded two-row mapping cone (cochain level) | `Obsmetrologia.Bigraded.bigraded_two_row_mapping_cone` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/01-bigraded-and-local-constancy.tex` |
| leanok | theorem | `thm:bigraded-truth-knowledge-les` | Truth--knowledge long exact sequence | `Obsmetrologia.Bigraded.truth_knowledge_graded_decomposition` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/01-bigraded-and-local-constancy.tex` |
| leanok | theorem | `thm:bigraded-truth-knowledge-decomposition` | Truth--knowledge decomposition (degree 0) | `Obsmetrologia.Bigraded.truth_knowledge_section_decomposition` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/01-bigraded-and-local-constancy.tex` |
| leanok | theorem | `thm:local-constancy-model` | Local-constancy vanishing model (strict/Scott) | `Obsmetrologia.LocalConstancy.vanishing_regime_local_constancy_model` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/01-bigraded-and-local-constancy.tex` |
| frontier | theorem | `thm:aperiodic-local-constancy-failure` | Aperiodic failure of local constancy |  | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/01-bigraded-and-local-constancy.tex` |
| leanok | theorem | `thm:lawvere-kernel-h0-iso` | Lawvere harmonic kernel equals $H^0$ | `Obsmetrologia.LawvereLaplacian.harmonic_kernel_h0_iso` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/02-hodge-and-harmonic-sections.tex` |
| leanok | theorem | `thm:settling-hodge-iso` | Settling Hodge isomorphism | `Obsmetrologia.Laplacianizers.settling_hodge_isomorphism` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/02-hodge-and-harmonic-sections.tex` |
| leanok | proposition | `thm:anti-landauer-bits` | Anti-Landauer entropy | `Obsmetrologia.AntiLandauer.antiLandauerBits` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | proposition | `thm:nerve-euler-char` | Euler characteristic of the cover nerve | `Obsmetrologia.AntiLandauer.eulerChar` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:anti-landauer-index-balance` | The index balance $\check H^0-\check H^1=\chi$ | `Obsmetrologia.AntiLandauer.index_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | proposition | `thm:consensus-contradiction-charges` | Consensus and contradiction charges | `Obsmetrologia.AntiLandauer.consensusCharge` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:net-charge-balance` | The signed charge ledger | `Obsmetrologia.AntiLandauer.net_charge_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:matter-antimatter-balance` | Matter and anti-matter are the signed contributions | `Obsmetrologia.AntiLandauer.matter_antimatter_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:anti-landauer-vacuum` | The zero-net vacuum | `Obsmetrologia.AntiLandauer.vacuum_iff_charge_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:equal-pair-creation-preserves-net` | Equal pair creation preserves the index | `Obsmetrologia.AntiLandauer.equal_pair_creation_preserves_net` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:fixed-net-cycle-requires-consensus` | Fixed-net cycle creation requires consensus creation | `Obsmetrologia.AntiLandauer.fixed_net_cycle_requires_consensus` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:fixed-net-consensus-annihilation-requires-cycle-annihilation` | Fixed-net consensus annihilation requires cycle annihilation | `Obsmetrologia.AntiLandauer.fixed_net_consensus_annihilation_requires_cycle_annihilation` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:preserves-euler-balanced-delta` | Index-preserving steps have balanced cohomology deltas | `Obsmetrologia.AntiLandauer.preservesEuler_iff_balanced_h0_h1_delta` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:closure-index-step-conserves-net` | Closure index steps conserve net charge | `Obsmetrologia.AntiLandauer.ClosureIndexStep.preserves_matter_antimatter_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| frontier | theorem | `thm:gauge-noether-current-index-ledger` | Gauge Noether current for the index ledger |  | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| frontier | theorem | `thm:anti-descent-mirror-temperature` | Anti-descent and mirror temperature |  | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:reversible-index-harmonic` | A reversible nerve's index is all harmonic | `Obsmetrologia.AntiLandauer.reversible_index_all_harmonic` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| leanok | theorem | `thm:tree-index-balance` | The tree index balance | `Obsmetrologia.AntiLandauer.tree_index_balance` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/02-anti-landauer-index.tex` |
| frontier | theorem | `thm:cross-dimension-shift-equivalence` | Cross-dimension shift equivalence |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/01-substitution-growth.tex` |
| frontier | theorem | `thm:stepn-perron-growth` | Step-$n$ Perron growth rate |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/01-substitution-growth.tex` |
| frontier | theorem | `thm:fingraph-components-count` | Components-count from a finite graph |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/01-finite-nerve-coordination.tex` |
| frontier | theorem | `thm:coordination-value-converse` | Value-level coordination obstruction (the converse) |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/01-finite-nerve-coordination.tex` |
| frontier | theorem | `thm:bilattice-stable-top-conflict` | Bilattice consensus admits stable $\top$-conflict (the signed-Laplacian frontier) |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/02-bilattice-hull-obstruction.tex` |
| frontier | theorem | `thm:laplacianizer-moduli-orbifold` | Moduli of laplacianizers (orbifold) |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/03-laplacianizer-moduli.tex` |
| frontier | theorem | `thm:cellular-sheaf-laplacian-moduli-case` | Cellular sheaf Laplacian as a moduli case (Hansen--Ghrist subsumption) |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/03-laplacianizer-moduli.tex` |
| frontier | theorem | `thm:universality-cross-dim-se` | Cross-dimensional shift equivalence |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/moduli-universality/04-shift-equivalence-universality.tex` |
| leanok | proposition | `thm:tile-dirichlet` | Tile Dirichlet energy | `Obsmetrologia.Flow.ChromaticTileRayleigh.dirichlet` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:tile-laplacian-psd` | The tile Laplacian is positive semidefinite | `Obsmetrologia.Flow.ChromaticTileRayleigh.dirichlet_nonneg` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:tile-rayleigh-harmonic` | Zero Rayleigh energy $\iff$ harmonic | `Obsmetrologia.Flow.ChromaticTileRayleigh.dirichlet_zero_iff_flat` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:tile-rayleigh-bottom` | Rayleigh bottom eigenpair $(\lambda_0=0,\ker L)$ | `Obsmetrologia.Flow.ChromaticTileRayleigh.rayleigh_eigen_bottom` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:chromatic-tile-index` | The chromatic-Lorentzian tile index | `Obsmetrologia.Flow.ChromaticTileRayleigh.chain_index_balance` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:two-site-gap` | The 2-site tile gap is exactly $\lambda_1=2$ | `Obsmetrologia.Flow.ChromaticTileRayleigh.twoSite_gap` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:three-site-gap-lower` | The 3-site spectral gap is exactly $\lambda_1=1$ | `Obsmetrologia.Flow.ChromaticTileRayleigh.iThreeSite_gap_lower` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:tile-harmonic-kernel-constants` | The harmonic kernel is exactly the constants --- a positive gap for every tile | `Obsmetrologia.Flow.ChromaticTileRayleigh.harmonic_iff_constant` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/01-dirichlet-and-rayleigh-floor.tex` |
| leanok | theorem | `thm:tile4-irrational-gap` | The 4-site irrational gap $2-\sqrt2$ is a real root of $x^2-4x+2$ | `Obsmetrologia.Flow.tile4_gap_char_root` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/01-quadratic-tile-gaps.tex` |
| leanok | theorem | `thm:tile-crystallographic-gap` | The crystallographic gap family $2-\sqrt d$ | `Obsmetrologia.Flow.tile_gap_char_root` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/01-quadratic-tile-gaps.tex` |
| leanok | theorem | `thm:tile5-golden-gap` | The 5-site gap is the golden quadratic irrational $(3-\sqrt5)/2$ | `Obsmetrologia.Flow.tile5_gap_char_root` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/01-quadratic-tile-gaps.tex` |
| leanok | theorem | `thm:gap-quad-surd` | Every quadratic surd is a real root of its minimal quadratic | `Obsmetrologia.Real.Internal.quadratic_surd_sub_root` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/02-quadratic-surd-engine.tex` |
| leanok | theorem | `thm:tile7-cubic-gap` | The 7-site gap is a cubic irrational, root of $x^3-5x^2+6x-1$ | `Obsmetrologia.Flow.tile7_gap_root_of_cos7` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/03-cubic-gap.tex` |
| leanok | theorem | `thm:tile7-gap-bracket` | Intermediate-value bracket isolating the 7-site gap | `Obsmetrologia.Flow.tile7_gap_bracket` | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/03-cubic-gap.tex` |
| frontier | theorem | `thm:tile-spectral-gap` | The general tile spectral gap value $\lambda_1$ |  | `docs/blueprint/src/chapters/phase-invariants/spectral-tiles/rayleigh-gaps/algebraic-gap-values/04-general-frontier.tex` |
| leanok | theorem | `thm:order-lattice-carrier` | The order/lattice calculus carrier | `Obsmetrologia.Order.Lattice` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:order-le-iff-join` | Order is recovered from join | `Obsmetrologia.Order.Lattice.le_iff_join` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:complete-lattice-carrier` | The complete-lattice calculus carrier | `Obsmetrologia.Order.CompleteLattice` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:knaster-tarski-fixed-points` | Knaster--Tarski fixed points | `Obsmetrologia.Order.CompleteLattice.Mono.lfp_le_gfp` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:four-as-twist-two` | FOUR is the two-element twist product | `Obsmetrologia.Order.FOUR.four_is_twist_two` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:optimization-is-settling` | Optimization is fixed-point settling | `Obsmetrologia.Optimization.FixedPoint.settling_is_optimization` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:stochastic-semiring-carrier` | The stochastic semiring carrier | `Obsmetrologia.Probability.Stochastic.StochSemiring` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:markov-kernel-carrier` | The Markov-kernel carrier | `Obsmetrologia.Probability.Stochastic.MarkovKernel` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:markov-stationary-closure-fixed` | Stationary Markov states are closure fixed points | `Obsmetrologia.Probability.Stochastic.markov_stationary_is_closure_fixpoint` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:stochastic-is-value-settling` | Stochastic calculus is value settling | `Obsmetrologia.Probability.Stochastic.stochastic_is_value_settling` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:finite-probability-measure-carrier` | The finite probability-measure carrier | `Obsmetrologia.Probability.Measure.SampleSpace` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:measure-is-valuation` | Measure is valuation | `Obsmetrologia.Probability.Measure.measure_is_valuation` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:conditioning-is-reindex` | Conditioning is reindexing | `Obsmetrologia.Probability.Measure.conditioning_is_reindex` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:internal-real-carrier` | The internal-real carrier | `Obsmetrologia.Real.Internal.RReal` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:internal-real-completeness` | Internal real completeness | `Obsmetrologia.Real.Internal.RReal.real_completeness` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:reals-are-scott-settling-completion` | Reals are the Scott-continuous settling completion | `Obsmetrologia.Real.Internal.RReal.reals_are_the_scott_continuous_settling_completion` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| leanok | theorem | `thm:reals-close-value-settling-hub` | Reals close the value-settling hub | `Obsmetrologia.Real.Internal.RReal.reals_close_the_value_settling_hub` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/00-calculus-carriers.tex` |
| frontier | theorem | `thm:ordinal-indexed-settling-orbit` | Ordinal-indexed transfinite settling orbit |  | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/01-ordinal-settling.tex` |
| frontier | theorem | `thm:derived-integer-substrate` | The integer substrate should be a derived $\mathbb Z$ |  | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/01-ordinal-settling.tex` |
| leanok | theorem | `thm:real-stochastic-interval-value-category` | The real stochastic interval is a value category | `Obsmetrologia.Probability.RealStochastic.realUnitInterval_is_value_category` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/02-value-category-and-stochastic-reals.tex` |
| frontier | theorem | `thm:positive-temperature-free-energy-flow` | Positive-temperature settling free energy |  | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/02-value-category-and-stochastic-reals.tex` |
| frontier | theorem | `thm:myrheim-meyer-dimension-internal-reals` | Internal Myrheim--Meyer dimension |  | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/02-value-category-and-stochastic-reals.tex` |
| leanok | theorem | `thm:support-dequantization` | Support is the Maslov dequantization; magnitude is what it forgets | `Obsmetrologia.Probability.Dequantization.countingDequantization` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/03-magnitude-and-transcendence.tex` |


Additional claim-sites exist for this topic; see `references/blueprint-claim-site-ledger.md` for the full generated ledger.


## Caution

Do not read continuum dynamics into finite witnesses unless Blueprint and Lean carry that bridge.
