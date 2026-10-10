---
title: Closure Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Closure.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - closure
---
# Closure Coverage Reference

Operators, ordinals, regimes, monads, Scott tests, rule dynamics, and Collatz settlement surfaces.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/closure-path.md` |
| Guide | `guides/closure-maintenance.md` |
| Explanation | `explanations/closure.md` |
| Reference | `references/closure-coverage.md` |
| Concept atlas | `references/closure-concept-atlas.md` |
| Term ledger | `references/closure-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Closure` | `Obsmetrologia/Closure.lean` |
| `Obsmetrologia.Closure.Coalgebra` | `Obsmetrologia/Closure/Coalgebra.lean` |
| `Obsmetrologia.Closure.Collatz.AffineTrace` | `Obsmetrologia/Closure/Collatz/AffineTrace.lean` |
| `Obsmetrologia.Closure.Collatz.BackwardMargin` | `Obsmetrologia/Closure/Collatz/BackwardMargin.lean` |
| `Obsmetrologia.Closure.Collatz.BackwardSeed` | `Obsmetrologia/Closure/Collatz/BackwardSeed.lean` |
| `Obsmetrologia.Closure.Collatz.CanonicalBarrierSeed` | `Obsmetrologia/Closure/Collatz/CanonicalBarrierSeed.lean` |
| `Obsmetrologia.Closure.Collatz.FirstPassage` | `Obsmetrologia/Closure/Collatz/FirstPassage.lean` |
| `Obsmetrologia.Closure.Collatz.OddRunSeed` | `Obsmetrologia/Closure/Collatz/OddRunSeed.lean` |
| `Obsmetrologia.Closure.Collatz.PadovanShape` | `Obsmetrologia/Closure/Collatz/PadovanShape.lean` |
| `Obsmetrologia.Closure.Collatz.Reduction` | `Obsmetrologia/Closure/Collatz/Reduction.lean` |
| `Obsmetrologia.Closure.Collatz.ResidueGap` | `Obsmetrologia/Closure/Collatz/ResidueGap.lean` |
| `Obsmetrologia.Closure.Collatz.SemigroupGap` | `Obsmetrologia/Closure/Collatz/SemigroupGap.lean` |
| `Obsmetrologia.Closure.Collatz.Settlement` | `Obsmetrologia/Closure/Collatz/Settlement.lean` |
| `Obsmetrologia.Closure.Collatz.Valuation` | `Obsmetrologia/Closure/Collatz/Valuation.lean` |
| `Obsmetrologia.Closure.LaxSlackDiagnosis` | `Obsmetrologia/Closure/LaxSlackDiagnosis.lean` |
| `Obsmetrologia.Closure.Modal` | `Obsmetrologia/Closure/Modal.lean` |
| `Obsmetrologia.Closure.Monad` | `Obsmetrologia/Closure/Monad.lean` |
| `Obsmetrologia.Closure.Monad.KZ` | `Obsmetrologia/Closure/Monad/KZ.lean` |
| `Obsmetrologia.Closure.Operator` | `Obsmetrologia/Closure/Operator.lean` |
| `Obsmetrologia.Closure.Ordinal` | `Obsmetrologia/Closure/Ordinal.lean` |
| `Obsmetrologia.Closure.Ordinal.Finite` | `Obsmetrologia/Closure/Ordinal/Finite.lean` |
| `Obsmetrologia.Closure.OrdinalCore` | `Obsmetrologia/Closure/OrdinalCore.lean` |
| `Obsmetrologia.Closure.Regime` | `Obsmetrologia/Closure/Regime.lean` |
| `Obsmetrologia.Closure.RuleDynamics` | `Obsmetrologia/Closure/RuleDynamics.lean` |
| `Obsmetrologia.Closure.RuleSystem` | `Obsmetrologia/Closure/RuleSystem.lean` |
| `Obsmetrologia.Closure.Scott` | `Obsmetrologia/Closure/Scott.lean` |
| `Obsmetrologia.Closure.SettlingMonotonicityQuiescence` | `Obsmetrologia/Closure/SettlingMonotonicityQuiescence.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| leanok | theorem | `thm:collatz-affine-trace` | Affine trace of an orbit | `Obsmetrologia.Closure.Collatz.affine_trace_parityWord` | `docs/blueprint/src/chapters/collatz/01-the-affine-trace.tex` |
| leanok | lemma | `lem:collatz-trace-powers` | Trace coefficients are powers | `Obsmetrologia.Closure.Collatz.trace_A_eq_three_pow_oddCount` | `docs/blueprint/src/chapters/collatz/01-the-affine-trace.tex` |
| leanok | theorem | `thm:collatz-descent-iff` | Descent is coefficient surplus | `Obsmetrologia.Closure.Collatz.descent_iff_coeff` | `docs/blueprint/src/chapters/collatz/01-the-affine-trace.tex` |
| leanok | theorem | `thm:collatz-last-E` | A first-passage word ends in E | `Obsmetrologia.Closure.Collatz.firstPassage_last_E` | `docs/blueprint/src/chapters/collatz/02-first-passage-and-parent-barriers.tex` |
| leanok | theorem | `thm:collatz-firstpassage-iff` | First passage iff parent barrier | `Obsmetrologia.Closure.Collatz.firstPassage_append_E_iff_parentBarrier` | `docs/blueprint/src/chapters/collatz/02-first-passage-and-parent-barriers.tex` |
| leanok | lemma | `lem:collatz-power-bounds` | Exponent sandwich at the crossing | `Obsmetrologia.Closure.Collatz.firstPassage_power_bounds` | `docs/blueprint/src/chapters/collatz/02-first-passage-and-parent-barriers.tex` |
| leanok | theorem | `thm:collatz-nondescent-iff` | Non-descent is a semigroup certificate | `Obsmetrologia.Closure.Collatz.nonDescent_iff_semigroup_certificate` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | proposition | `thm:collatz-gap` | Parent-barrier gap | `Obsmetrologia.Closure.Collatz.ParentBarrierGap` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-gap-implies-descent` | Gap implies first-passage descent | `Obsmetrologia.Closure.Collatz.parentBarrierGap_implies_firstPassageDescent` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-cylinder-seeds-descend` | Gap is first-passage cylinder descent | `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_cylinderSeeds_descend` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-backward-seeds-descend` | Gap is backward-seed descent | `Obsmetrologia.Closure.Collatz.BackwardCylinderSeed`, `Obsmetrologia.Closure.Collatz.FirstPassageBackwardSeed`, `Obsmetrologia.Closure.Collatz.BadFirstPassageBackwardSeed`, `Obsmetrologia.Closure.Collatz.parentBarrier_inverseResidue_is_backwardSeed`, `Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badBackwardSeed`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badBackwardSeed`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardSeeds_descend` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-backward-margin-carry` | Gap is ordinal backward-margin carry | `Obsmetrologia.Ord.ofNat_le_ofNat_iff`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardMargin`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardDescentAmount`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardModulus`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardCarryQuotient`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_margin_positive`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_fullCarry`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardCarryQuotient_eq_descentAmount`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_carryQuotient_positive`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_fullCarry_iff_carryQuotient_positive`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_fullCarry_iff_not_bad`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_stable_iff_bad`, `Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_absurd_iff_not_bad`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardMargins_positive`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardMargins_fullCarry`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardCarryQuotients_positive`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_stableBackwardSeedCell`, `Obsmetrologia.Blowup.cellType`, `Obsmetrologia.Blowup.stable_nontrivial_forward_cellType_top`, `Obsmetrologia.Blowup.stable_cellType_top_iff_absurd`, `Obsmetrologia.Blowup.claimSide_firing_negates_to_tokenSide`, `Obsmetrologia.Blowup.stable_d4_bypass_cycle`, `Obsmetrologia.Blowup.stable_d4_bypass_first_firing`, `Obsmetrologia.Order.CommutingNuclei.transferring_without_saturating_pi_ascends`, `Obsmetrologia.Order.NuclearQuartet.stable_not_active_absurd_ascends`, `Obsmetrologia.Persistence.Aperiodic.Autopoiesis.cellCorner_active`, `Obsmetrologia.Persistence.Aperiodic.Autopoiesis.cellCorner_stable`, `Obsmetrologia.Persistence.Aperiodic.badBackwardSeedCell_induces_fSideFiring`, `Obsmetrologia.Persistence.Aperiodic.badBackwardSeedCell_negates_to_tSideFiring`, `Obsmetrologia.Persistence.Aperiodic.badBackwardSeedCell_d4_bypasses_to_tSideFiring`, `Obsmetrologia.Persistence.Aperiodic.badBackwardSeedCell_stableToAbsurd_isTopFiring`, `Obsmetrologia.Persistence.Aperiodic.badBackwardSeedCell_isTransferring`, `Obsmetrologia.Persistence.Aperiodic.parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier`, `Obsmetrologia.Articulating.utter_ne_pair` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-all-firstpassage-descent` | Every first-passage cylinder descends | `Obsmetrologia.Closure.Collatz.parentBarrierGap_implies_all_firstPassage_descent` | `docs/blueprint/src/chapters/collatz/03-the-semigroup-gap.tex` |
| leanok | theorem | `thm:collatz-crossing-firstpassage` | Crossing words are first-passage | `Obsmetrologia.Closure.Collatz.firstCoeffCrossing_word_is_firstPassage` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-reduction` | Descent below self reduces to termination | `Obsmetrologia.Closure.Collatz.reachesTerminal_of_all_fall_below` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-conditional` | Conditional Collatz termination | `Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierGap_and_crossing` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-residue-conditional` | Residue-gap conditional Collatz termination | `Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierResidueGap_and_crossing` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-residue-no-infinite-stream` | Residue gap plus no infinite barrier stream | `Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-residue-exact-obstruction` | Exact obstruction after the residue gap | `Obsmetrologia.Closure.Collatz.acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_residueGap` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs` | Packaged Collatz frontier inputs | `Obsmetrologia.Closure.Collatz.collatz_from_frontierInputs` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-exact` | Packaged frontier exactness | `Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_and_acceleratedCollatz` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-one-gap-collapse` | Frontier package collapses to the residue gap exactly at no-stream | `Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_of_residueGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-parent-gap-collapse` | Frontier package collapses to the semigroup gap exactly at no-stream | `Obsmetrologia.Closure.Collatz.frontierInputs_iff_parentBarrierGap_of_parentBarrierGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-collapse` | Named one-lock collapse proposition | `Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-supplies-stream-frontier` | Named one-lock supplies no-stream, crossing, and contraction | `Obsmetrologia.Closure.Collatz.noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.everyNonterminalContracts_of_parentBarrierGap_and_oneLock` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-supplies-descent` | Named one-lock supplies descent and termination | `Obsmetrologia.Closure.Collatz.allFallBelow_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.allFallBelow_of_residueGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.collatz_from_residueGap_and_oneLock` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-gap-and-one-lock` | Frontier package is gap plus named one-lock | `Obsmetrologia.Closure.Collatz.frontierInputs_iff_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_and_oneLock` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-one-frontier-criterion` | One-frontier reduction criterion | `Obsmetrologia.Closure.Collatz.residueGap_alone_solves_collatz_iff_residueGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-gap-one-frontier-criterion` | Parent-gap one-frontier reduction criterion | `Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-termination` | Named one-lock termination criterion | `Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_collatz` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-one-frontier-eventual-contracts` | One-frontier eventual-contraction criterion | `Obsmetrologia.Closure.Collatz.residueGap_alone_solves_collatz_iff_residueGap_implies_everyNonterminalContracts` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| leanok | theorem | `thm:collatz-parent-gap-eventual-contracts` | Parent-gap eventual-contraction criterion | `Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_everyNonterminalContracts` | `docs/blueprint/src/chapters/collatz/04-reduction-to-termination.tex` |
| frontier | theorem | `thm:collatz-gap-holds` | Parent-barrier gap holds | `Obsmetrologia.Closure.Collatz.parentBarrierGap_holds` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:collatz-residue-gap-holds` | Parent-barrier residue gap holds | `Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_holds` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:collatz-residue-carry-gap-holds` | Parent-barrier residue carry gap holds | `Obsmetrologia.Closure.Collatz.parentBarrierResidueCarryGap_holds` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:collatz-crossing-holds` | Every nonterminal seed has a crossing |  | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | theorem | `thm:collatz-crossing-no-infinite-stream` | Crossing is no positive infinite barrier stream | `Obsmetrologia.Closure.Collatz.everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | theorem | `thm:collatz-crossing-reduces` | Crossing reduces to "eventually contracts" | `Obsmetrologia.Closure.Collatz.everyNonterminalContracts_iff_crossing` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | theorem | `thm:collatz-eventual-contracts-no-infinite-stream` | Eventual contraction is no positive infinite barrier stream | `Obsmetrologia.Closure.Collatz.everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | theorem | `thm:collatz-no-stream-parent-cylinder-extraction` | No-stream is parent-barrier cylinder extraction | `Obsmetrologia.Closure.Collatz.EveryNonterminalHasParentBarrierCylinder`, `Obsmetrologia.Closure.Collatz.everyNonterminalHasParentBarrierCylinder_iff_crossing`, `Obsmetrologia.Closure.Collatz.everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream`, `Obsmetrologia.Closure.Collatz.infiniteBarrierStream_excludes_parentBarrierCylinder`, `Obsmetrologia.Closure.Collatz.CylinderAvoidingBarrierStream`, `Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_iff_positive_infiniteBarrierStream`, `Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_iff_infinite_and_no_parentCylinder`, `Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_excludes_noPositiveInfiniteBarrierStream`, `Obsmetrologia.Closure.Collatz.noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | theorem | `thm:collatz-purl` | The purl: descent contains the crossing | `Obsmetrologia.Closure.Collatz.everyNonterminalContracts_of_allFallBelow` | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:collatz-accelerated` | Accelerated Collatz |  | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:collatz-residue-frontier-accelerated` | Residue-frontier accelerated Collatz |  | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:zeta-star-analytic-delone` | The zeta-star zero-set is analytically Delone |  | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| frontier | theorem | `thm:zeta-star-rh-pure-point` | Dyson/RH as pure-point diffraction of \(Z(\zeta^\star)\) |  | `docs/blueprint/src/chapters/collatz/05-the-frontier.tex` |
| leanok | proposition | `thm:collatz-padovan` | The Padovan and Fibonacci sequences | `Obsmetrologia.Closure.Collatz.PadovanShape.padovan`, `Obsmetrologia.Closure.Collatz.PadovanShape.fibSeq` | `docs/blueprint/src/chapters/collatz/06-the-smallest-pisot-number-padovan-slow-growth.tex` |
| leanok | theorem | `thm:collatz-padovan-slow-growth` | Extremal slow growth: $P\le F$ pointwise | `Obsmetrologia.Closure.Collatz.PadovanShape.padovan_le_fibSeq` | `docs/blueprint/src/chapters/collatz/06-the-smallest-pisot-number-padovan-slow-growth.tex` |
| frontier | theorem | `thm:collatz-settlement-spiral-extremal` | $\rho$ is the smallest Pisot number |  | `docs/blueprint/src/chapters/collatz/06-the-smallest-pisot-number-padovan-slow-growth.tex` |
| frontier | theorem | `thm:collatz-padovan-shape-law` | Collatz shape-count is Padovan, not Fibonacci |  | `docs/blueprint/src/chapters/collatz/06-the-smallest-pisot-number-padovan-slow-growth.tex` |
| leanok | theorem | `thm:collatz-saturating-depth` | Saturating run is the 2-adic depth | `Obsmetrologia.Closure.Collatz.shortcut_odd_part` | `docs/blueprint/src/chapters/collatz/07-the-2-adic-saturating-valuation-layer.tex` |
| frontier | theorem | `thm:collatz-two-adic-unique-one-lock-frontier` | Unique-residue one-lock frontier |  | `docs/blueprint/src/chapters/collatz/07-the-2-adic-saturating-valuation-layer.tex` |
| frontier | theorem | `thm:collatz-v2-geometric` | Geometric distribution of $v_2(3n+1)$ |  | `docs/blueprint/src/chapters/collatz/07-the-2-adic-saturating-valuation-layer.tex` |
| leanok | theorem | `thm:collatz-settlement-realised` | Collatz settlement realised ($Cl = id$) | `Obsmetrologia.Closure.Collatz.settlement_accumulates` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-kappa-stopping-time` | Stopping time is the closure ordinal under descent | `Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_all_fall_below` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-kappa-is-total-stopping-stage` | Closure ordinal stage is total stopping stage | `Obsmetrologia.Closure.Collatz.closureOrdinalStage_iff_totalStoppingStage` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-kappa-stage-exists` | Finite closure ordinal stage exists exactly at terminal reachability | `Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-total-stopping-stage-exists` | Total stopping stage exists exactly at terminal reachability | `Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_all_fall_below` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-residue-kappa-stopping-time` | Residue-gap stopping-time bridge | `Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-residue-no-infinite-stream-kappa` | Residue gap plus no-infinite-stream stopping-time bridge | `Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-residue-no-infinite-stream-kappa-stage` | Residue gap plus no-infinite-stream closure-ordinal stage | `Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-kappa-stage` | Packaged frontier closure-ordinal stage | `Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_frontierInputs` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-frontier-inputs-total-stopping-stage` | Packaged frontier total stopping stage | `Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_frontierInputs` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-one-frontier-kappa-package` | One-frontier kappa package criterion | `Obsmetrologia.Closure.Collatz.residueGap_alone_solves_kappa_package_iff_residueGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-parent-gap-kappa-package` | Parent-gap kappa package criterion | `Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_kappa_package_iff_parentBarrierGap_implies_noStream` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-kappa-package` | Named one-lock kappa package criterion | `Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-kappa-bridge` | Named one-lock stopping-time bridge | `Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-parent-one-lock-kappa-package-forward` | Named one-lock kappa package, forward form | `Obsmetrologia.Closure.Collatz.kappaPackage_of_parentBarrierGap_and_oneLock`, `Obsmetrologia.Closure.Collatz.kappaPackage_of_residueGap_and_oneLock` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| frontier | theorem | `thm:collatz-residue-frontier-kappa-stage` | Residue-frontier closure-ordinal stage |  | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| frontier | theorem | `thm:collatz-unconditional-kappa-stopping-time` | Unconditional stopping-time bridge |  | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| leanok | theorem | `thm:collatz-quiesce-of-terminal` | Revisit makes the reached-set quiesce | `Obsmetrologia.Closure.Collatz.quiesce_of_revisit` | `docs/blueprint/src/chapters/collatz/settlement-reading/01-reached-set-quiescence.tex` |
| frontier | theorem | `thm:collatz-mod6-commute` | Parity projections commute on residues mod 6 |  | `docs/blueprint/src/chapters/collatz/settlement-reading/02-modular-frontier.tex` |
| frontier | theorem | `thm:collatz-prime-power` | Prime-power reduction via local settledness |  | `docs/blueprint/src/chapters/collatz/settlement-reading/02-modular-frontier.tex` |
| leanok | theorem | `thm:collatz-bezout` | B\'ezout / modular inverse | `Obsmetrologia.Closure.Collatz.bezout` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | theorem | `thm:collatz-residue-gap` | Residue-gap refinement | `Obsmetrologia.Closure.Collatz.residue_characterization` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | theorem | `thm:collatz-residue-gap-reduces` | Gap reduces to the residue inequality | `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_parentBarrierResidueGap` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | theorem | `thm:collatz-residue-gap-carry` | Residue gap is the carry inequality | `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_parentBarrierResidueCarryGap` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | theorem | `thm:collatz-residue-gap-cylinder-descent` | Residue gap is first-passage cylinder descent | `Obsmetrologia.Closure.Collatz.firstPassage_seed_residue`, `Obsmetrologia.Closure.Collatz.parentBarrier_residue_realizes_firstPassage`, `Obsmetrologia.Closure.Collatz.parentBarrier_residue_descent_iff_gap`, `Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_iff_cylinderSeeds_descend` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | theorem | `thm:collatz-bad-cylinder-language` | Semigroup certificates are bad cylinder seeds | `Obsmetrologia.Closure.Collatz.badCylinderSeed_of_semigroup_certificate`, `Obsmetrologia.Closure.Collatz.semigroup_certificate_of_badCylinderSeed`, `Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badCylinderSeed`, `Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badCylinderSeed` | `docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex` |
| leanok | proposition | `thm:directed-family-carrier` | Directed joins are the Scott-continuity test carrier | `Obsmetrologia.Closure.Scott.DirectedFamily` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |
| leanok | theorem | `thm:finite-scott-continuous` | Finite charge closures are Scott-continuous | `Obsmetrologia.Closure.Scott.finite_scott_continuous` | `docs/blueprint/src/chapters/phase-invariants/causal-spacetime/dimension-curvature-continuum/02-closure-flow-curvature-regime.tex` |



## Caution

Separate strict-finite settlement from transfinite, analytic, or Collatz frontier obligations.
