---
title: Cohomology Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Cohomology.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - cohomology
---
# Cohomology Coverage Reference

Settling cohomology, coordination, H1, defects, entropy, bypass, and structured obstruction surfaces.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/cohomology-path.md` |
| Guide | `guides/cohomology-maintenance.md` |
| Explanation | `explanations/cohomology.md` |
| Reference | `references/cohomology-coverage.md` |
| Concept atlas | `references/cohomology-concept-atlas.md` |
| Term ledger | `references/cohomology-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Cohomology` | `Obsmetrologia/Cohomology.lean` |
| `Obsmetrologia.Cohomology.AlexandrovHusainov` | `Obsmetrologia/Cohomology/AlexandrovHusainov.lean` |
| `Obsmetrologia.Cohomology.AntiLandauerEntropy` | `Obsmetrologia/Cohomology/AntiLandauerEntropy.lean` |
| `Obsmetrologia.Cohomology.BigradedSettlingCohomology` | `Obsmetrologia/Cohomology/BigradedSettlingCohomology.lean` |
| `Obsmetrologia.Cohomology.BigradedTruthKnowledgeLES` | `Obsmetrologia/Cohomology/BigradedTruthKnowledgeLES.lean` |
| `Obsmetrologia.Cohomology.CRDTCohomologicalCALM` | `Obsmetrologia/Cohomology/CRDTCohomologicalCALM.lean` |
| `Obsmetrologia.Cohomology.CoordinationCohomology` | `Obsmetrologia/Cohomology/CoordinationCohomology.lean` |
| `Obsmetrologia.Cohomology.Defect` | `Obsmetrologia/Cohomology/Defect.lean` |
| `Obsmetrologia.Cohomology.DifferentialBypass` | `Obsmetrologia/Cohomology/DifferentialBypass.lean` |
| `Obsmetrologia.Cohomology.FrobeniusTQFT` | `Obsmetrologia/Cohomology/FrobeniusTQFT.lean` |
| `Obsmetrologia.Cohomology.InconsistencySheaf` | `Obsmetrologia/Cohomology/InconsistencySheaf.lean` |
| `Obsmetrologia.Cohomology.KZCoherentSheaf` | `Obsmetrologia/Cohomology/KZCoherentSheaf.lean` |
| `Obsmetrologia.Cohomology.LandauerEntropy` | `Obsmetrologia/Cohomology/LandauerEntropy.lean` |
| `Obsmetrologia.Cohomology.LawvereHarmonicCohomology` | `Obsmetrologia/Cohomology/LawvereHarmonicCohomology.lean` |
| `Obsmetrologia.Cohomology.NegativeParaconsistentSheaf` | `Obsmetrologia/Cohomology/NegativeParaconsistentSheaf.lean` |
| `Obsmetrologia.Cohomology.PairwiseStoneClopen` | `Obsmetrologia/Cohomology/PairwiseStoneClopen.lean` |
| `Obsmetrologia.Cohomology.ScottFace` | `Obsmetrologia/Cohomology/ScottFace.lean` |
| `Obsmetrologia.Cohomology.SettlingCohomologyH1` | `Obsmetrologia/Cohomology/SettlingCohomologyH1.lean` |
| `Obsmetrologia.Cohomology.SettlingLocalConstancy` | `Obsmetrologia/Cohomology/SettlingLocalConstancy.lean` |
| `Obsmetrologia.Cohomology.TransfiniteCellComplex` | `Obsmetrologia/Cohomology/TransfiniteCellComplex.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| leanok | theorem | `thm:lawvere-harmonic-clinv-zero` | Lawvere-harmonic section $=$ cohomologically-trivial global section | `Obsmetrologia.Cohomology.lawvere_harmonic_section_classifying_invariant_zero` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/02-hodge-and-harmonic-sections.tex` |
| leanok | proposition | `thm:cover-nerve` | Cover nerve (Euler counts) | `Obsmetrologia.Cohomology.CoverNerve` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | proposition | `thm:coordination-h1rank` | Coordination $\check H^1$ as cycle rank | `Obsmetrologia.Cohomology.CoverNerve.H1rank` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | theorem | `thm:coordination-h1-iff-forest` | Coordination--cohomology correspondence (direction 1, the iff) | `Obsmetrologia.Cohomology.CoverNerve.h1_vanishes_iff_forest` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | theorem | `thm:coordination-cost` | Rank $\check H^1$ $=$ coordination cost | `Obsmetrologia.Cohomology.CoverNerve.h1rank_is_coordination_cost` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | theorem | `thm:coordination-laplacian-dual` | The Laplacian dual: $\check H^0=\ker$, $\check H^1=\mathrm{coker}$ | `Obsmetrologia.Cohomology.CoverNerve.laplacian_kernel_cokernel` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | theorem | `thm:tree-coordination-free` | A finite tree-cover is coordination-free (graph-backed) | `Obsmetrologia.Cohomology.tree_coordination_free` | `docs/blueprint/src/chapters/phase-invariants/cohomological-splitting/coordination-anti-landauer/01-cover-nerve-coordination.tex` |
| leanok | theorem | `thm:frobenius-tqft-instance` | Abrams' correspondence on the worked Frobenius algebra | `Obsmetrologia.Cohomology.FrobeniusTQFT.commutative_frobenius_is_tqft` | `docs/blueprint/src/chapters/recurring-four/04-the-four-corner-coherence-cell-at-successive-depths.tex` |
| leanok | proposition | `thm:four-priestley-dual` | The FOUR has a finite Priestley dual | `Obsmetrologia.Stone.four_priestley_dual` | `docs/blueprint/src/chapters/sheaf-cohomology/00-bitopological-settling-site.tex` |
| leanok | theorem | `thm:pairwise-stone-order-recovery` | The pairwise-Stone topology recovers the order | `Obsmetrologia.Stone.order_recovered_from_tauPlus` | `docs/blueprint/src/chapters/sheaf-cohomology/00-bitopological-settling-site.tex` |
| leanok | proposition | `thm:settling-sheaf` | Settling sheaf | `Obsmetrologia.Sheaf` | `docs/blueprint/src/chapters/sheaf-cohomology/01-the-settling-sheaf-and-its-crdt-section-merge.tex` |
| leanok | proposition | `thm:sheaf-designated` | Designated cell | `Obsmetrologia.Sheaf.designated` | `docs/blueprint/src/chapters/sheaf-cohomology/01-the-settling-sheaf-and-its-crdt-section-merge.tex` |
| leanok | proposition | `thm:sheaf-cover` | Cover of the base | `Obsmetrologia.Sheaf.Cover` | `docs/blueprint/src/chapters/sheaf-cohomology/01-the-settling-sheaf-and-its-crdt-section-merge.tex` |
| leanok | theorem | `thm:sheaf-separated` | Sheaf separation | `Obsmetrologia.Sheaf.separated` | `docs/blueprint/src/chapters/sheaf-cohomology/01-the-settling-sheaf-and-its-crdt-section-merge.tex` |
| leanok | theorem | `thm:settling-associated-sheaf` | The settling-associated sheaf is a presheaf on the site | `Obsmetrologia.AssocSheaf.settling_associated_sheaf` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:designated-short-exact-sequence` | The designated short exact sequence splits | `Obsmetrologia.AssocSheaf.designated_short_exact_sequence` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:h0-count` | $H^0$ --- count of designated cells | `Obsmetrologia.Cohomology.H0` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:settling-cohomology-h1-vanishes` | $H^0$ is the designated-cell count | `Obsmetrologia.Cohomology.h0_is_designated_count` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:cech1` | \v{C}ech $1$-datum | `Obsmetrologia.Cohomology.Cech1` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:cocycle` | $1$-cocycle --- agreeing family | `Obsmetrologia.Cohomology.Cocycle` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:coboundary` | Coboundary | `Obsmetrologia.Cohomology.Coboundary` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:glue` | The glued global section | `Obsmetrologia.Cohomology.glue` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:h1-vanishes` | Existence --- an agreeing family glues | `Obsmetrologia.Cohomology.glue_coboundary` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:classifying-invariant-zero` | Uniqueness --- by separation | `Obsmetrologia.Cohomology.glue_unique` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:h1-zero-iff-confluent` | $H^1$ vanishes; cohomology trivial above degree one | `Obsmetrologia.Cohomology.settling_cohomology_h1_vanishes` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | theorem | `thm:classifying-invariant-zero-strict` | The classifying invariant is zero in the settling regime | `Obsmetrologia.Cohomology.classifying_invariant_zero_strict` | `docs/blueprint/src/chapters/sheaf-cohomology/02-cech-cohomology-of-the-associated-sheaf.tex` |
| leanok | proposition | `thm:confluent` | Confluence (order form) | `Obsmetrologia.CRDT.Confluent` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | theorem | `thm:confluent-total` | Confluence is total --- the join is the witness | `Obsmetrologia.CRDT.confluent_joinK` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | theorem | `thm:crdt-order-independent` | CRDT convergence --- order-independent merge | `Obsmetrologia.CRDT.crdt_merge_order_independent` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | theorem | `thm:calm-convergence-facts` | Convergence facts of the confluent modal settling | `Obsmetrologia.CRDT.calm_convergence_facts` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| frontier | theorem | `thm:calm-convergence-equivalence` | CALM convergence equivalence |  | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | theorem | `thm:calm-monotone` | CALM --- monotone settling is coordination-free | `Obsmetrologia.CRDT.calm_monotone_coordination_free` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | theorem | `thm:mayer-vietoris` | Mayer--Vietoris overlap gluing | `Obsmetrologia.CRDT.mayer_vietoris_overlap_glues` | `docs/blueprint/src/chapters/sheaf-cohomology/03-convergence-crdt-calm-and-predicatory-confluence.tex` |
| leanok | proposition | `thm:munu-agreement-differential` | The $\mu/\nu$ agreement and differential predicates | `Obsmetrologia.Cohomology.MuNuAgreement` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:coalgebra-dual-of-algebra` | Algebra/coalgebra duality for settling orbits | `Obsmetrologia.Coalgebra.coalgebra_dual_of_algebra` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | proposition | `thm:differential-bypass` | Differential bypass certificate | `Obsmetrologia.Cohomology.DifferentialBypass` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:differential-bypass-agreement` | Bypass collapses the $\mu/\nu$ gap | `Obsmetrologia.Cohomology.differential_bypass_agreement` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:differential-bypass-regime` | Bypass routes $\kappa$ to the regime classifier | `Obsmetrologia.Cohomology.differential_bypass_regime` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:obstruction-charged-iff` | Charged obstruction regimes | `Obsmetrologia.Cohomology.obstruction_charged_iff` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:differential-bypass-sound` | Bypass soundness | `Obsmetrologia.Cohomology.differential_bypass_sound` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:differential-bypass-h1-vanishes` | Bypass inherits $H^1$ vanishing in strict/Scott regimes | `Obsmetrologia.Cohomology.differential_bypass_h1_vanishes` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:scott-face-omega-bridge` | The Scott face is the $\kappa=\omega$ vanishing bridge | `Obsmetrologia.Cohomology.ScottFace.closureOrdinal_lub_of_finite_approximations`, `Obsmetrologia.Cohomology.ScottFace.finite_antecedent_closure_scott_continuous`, `Obsmetrologia.Cohomology.ScottFace.h1_vanishes`, `Obsmetrologia.Cohomology.ScottFace.differential_bypass_h1_vanishes` | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| frontier | theorem | `thm:landauer-collatz-zeta-kappa-synthesis` | Landauer--Collatz--Zeta $\kappa$-stratified synthesis |  | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| frontier | theorem | `thm:contextual-obstruction-differential-bypass` | Contextual obstruction as differential bypass consumer |  | `docs/blueprint/src/chapters/sheaf-cohomology/03-differential-bypass.tex` |
| leanok | theorem | `thm:alexandrov-recovers-poset` | The Alexandrov topology recovers the poset | `Obsmetrologia.Alexandrov.alexandrov_specialization_recovers_poset` | `docs/blueprint/src/chapters/sheaf-cohomology/04-alexandrov-topology-and-the-husainov-comparison.tex` |
| leanok | theorem | `thm:husainov-cech-acyclic` | \v{C}ech cohomology vanishes on the bounded sub-sites | `Obsmetrologia.Alexandrov.husainov_cech_acyclic_on_bounded_sites` | `docs/blueprint/src/chapters/sheaf-cohomology/04-alexandrov-topology-and-the-husainov-comparison.tex` |
| frontier | theorem | `thm:husainov-cech-derived` | Husainov: \v{C}ech $=$ derived-functor cohomology |  | `docs/blueprint/src/chapters/sheaf-cohomology/04-alexandrov-topology-and-the-husainov-comparison.tex` |
| leanok | theorem | `thm:tarski-sheaf-closure` | Tarski sheaf closure identifies the harmonic kernel with $H^0$ | `Obsmetrologia.Tarski.harmonic_kernel_h0_iso` | `docs/blueprint/src/chapters/sheaf-cohomology/04-alexandrov-topology-and-the-husainov-comparison.tex` |
| leanok | proposition | `thm:dframe-carrier` | D-frames are the algebraic dual carrier | `Obsmetrologia.DFrame.DFrame` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | theorem | `thm:bitopological-dframe-relations` | The bitopological d-frame has disjointness and covering relations | `Obsmetrologia.DFrame.dframe_of_bitopological_relations` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | theorem | `thm:dframe-valued-sheaf` | The settling sheaf is d-frame-valued | `Obsmetrologia.DFrame.dframe_valued_sheaf` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | proposition | `thm:charge-quantale` | The FOUR is a charge quantale | `Obsmetrologia.QEnriched.chargeQuantale` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | theorem | `thm:qcat-is-quantale-category` | Q-categories form over the charge quantale | `Obsmetrologia.QEnriched.qcat_is_quantale_category` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | theorem | `thm:q-fuzzy-equivalence-composes` | Q-fuzzy equivalence composes by multiplying grades | `Obsmetrologia.QEnriched.q_fuzzy_equivalence_composes` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |
| leanok | theorem | `thm:h0-q-laplacian-fixed-points` | Degree-zero Q-cohomology is Laplacian fixed points | `Obsmetrologia.QEnriched.h0_laplacian_fixed_points` | `docs/blueprint/src/chapters/sheaf-cohomology/05-dframe-and-q-enriched-refinements.tex` |



## Caution

Say exactly which obstruction or vanishing claim is settled and which stronger comparison remains frontier.
