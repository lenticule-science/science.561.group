---
type: concept
class: substrate-organisation
status: sketch
depends-on: [predicate-category, four-group-register-as-fibration, upper-ontology-as-predicate-vocabulary]
see-also: [discourse-community-as-fiber, four-group-register-as-regime]
title: Predicate-category stratification
description: The substrate-level organisation discipline by which a predicate category $\mathcal{C}$ is stratified into nested or partitioned sub-categories carrying different ontological, methodological, and operational roles.
---

# Predicate-category stratification

The substrate-level organisation discipline by which a predicate category $\mathcal{C}$ is *stratified* into nested or partitioned sub-categories carrying different ontological, methodological, and operational roles. Stratification is the substrate's mechanism for letting a single predicate category carry *multiple kinds of structure simultaneously*: an upper-ontology stratification (continuant/occurrent/etc.), a register stratification (governing/engaging/situating/defining), a domain stratification (per discourse community), a regime stratification (per closure-regime).

## The pattern

A *stratification* of a predicate category $\mathcal{C}$ is a functor $\Sigma: \mathcal{S} \to \mathrm{Sub}(\mathcal{C})$ from an *index category* $\mathcal{S}$ to the lattice of full sub-categories of $\mathcal{C}$. The functor assigns to each index-object an admissible sub-category and to each index-morphism an inclusion or refinement.

The standard stratifications the substrate names:

- **Upper-ontology stratification** (per [upper-ontology-as-predicate-vocabulary](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/upper-ontology-as-predicate-vocabulary.md)). Index $\mathcal{S}_{\mathrm{UO}}$ is the upper ontology's category-tree (BFO continuant/occurrent, DOLCE endurant/perdurant/quality/abstract, etc.); $\Sigma_{\mathrm{UO}}$ assigns each upper-ontology category the sub-category of $\mathcal{C}$ whose predicates inhabit that category.

- **Four-group register stratification** (per [four-group-register-as-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/four-group-register-as-fibration.md)). Index $\mathcal{S}_{\mathrm{4GR}}$ is the four-group lattice $\{G, E, S, D\}$ with sub-strata refinements; $\Sigma_{\mathrm{4GR}}$ assigns each register the corresponding sub-category of $\mathcal{C}$.

- **Domain stratification.** Index $\mathcal{S}_{\mathrm{Dom}}$ is a category of discourse-community-domains (per Hjorland) with refinement morphisms; $\Sigma_{\mathrm{Dom}}$ assigns each domain its admitted predicate-vocabulary.

- **Regime stratification.** Index $\mathcal{S}_{\mathrm{Reg}}$ is the four-regime poset $\{\mathrm{strict} < \mathrm{Scott\text{-}cts} < \mathrm{transf\text{-}bdd} < \mathrm{aperiodic}\}$; $\Sigma_{\mathrm{Reg}}$ assigns each regime the sub-category of predicates whose closure rules stay within that regime.

## How stratifications compose

A predicate category typically carries *multiple* stratifications simultaneously. The substrate-level fact: stratifications compose pointwise into a *multi-stratification* via the product index category $\mathcal{S}_1 \times \mathcal{S}_2 \times \cdots \to \mathrm{Sub}(\mathcal{C})$, where the joint assignment is the intersection of the individual sub-categories.

For example, a predicate $p$ might be:

- BFO-stratum: continuant
- 4GR-stratum: defining
- Domain-stratum: medical-vocabulary
- Regime-stratum: Scott-continuous

The substrate carries $p$ in the joint sub-category that is the intersection of all four. The multi-stratification supports queries like "what predicates are continuants in the medical defining-stratum and stay Scott-continuous?" by reading the joint stratification.

## Why stratification matters substrate-side

Three substrate-level properties depend on stratification:

**(S1) Per-stratum closure-rule discipline.** The [four-group-register-as-regime](four-group-register-as-regime.md) theorem assigns a typical closure regime per register stratum. A community can adopt different closure-rule sub-languages for different strata, with the substrate enforcing per-stratum regime constraints.

**(S2) Per-stratum scope discipline.** A scope (per [discourse-community-as-fiber](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/discourse-community-as-fiber.md)) restricts the predicate vocabulary to a sub-category. Stratification gives a principled way to define scopes: the scope is the join of stratifications corresponding to the community's choices (which upper-ontology categories, which registers, which domains).

**(S3) Per-stratum classification.** The [classify](../terms/classify.md) morphism places an entity in a stratum. Different stratifications support different kinds of classification: upper-ontology classification places entities in continuant/occurrent/etc.; register classification places them in governing/engaging/situating/defining; PMEST classification (per [pmest-as-five-axis-decomposition](pmest-as-five-axis-decomposition.md)) places them in five facets simultaneously.

## Status: sketch

`status: sketch` because the formal definition of multi-stratification (joint assignment via product index categories) requires care for cases where:

- The joint sub-category is empty (e.g., a predicate that doesn't fit any combination of stratification choices). The substrate must handle empty joint strata gracefully.
- The stratifications are incompatible (e.g., one stratification claims $p$ is in stratum A; another claims $p$ is in a stratum disjoint from A). The substrate should record the inconsistency rather than reject the assignments.
- The index categories themselves have non-trivial morphism structure that interacts with the joint assignment in unobvious ways.

The concept is named here as a substrate-level organising principle worth its own entry; the formal development is part of the predication-categories program (which already names [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) — the underlying machinery) and would extend that program with explicit multi-stratification operators.
