---
type: theorem
status: sketch
depends-on: [predication-fibration, four-group-register-as-fibration, classify, predicate-category]
see-also: [four-group-register-as-regime, predicate-category-stratification]
title: PMEST as five-axis decomposition (sketch)
description: Claim (sketch).
---

# PMEST as five-axis decomposition (sketch)

**Claim** (sketch). Ranganathan's PMEST facets — Personality, Matter, Energy, Space, Time — are the five projections of the substrate's [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) onto five orthogonal sub-fibrations of $\mathcal{C}$, and a subject's PMEST class number is exactly the tuple of values its diagnostic predications take on the five sub-fibrations.

## Setup

Let $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ be a predicated knowledge system. Recall (per [knowledge-fiber-algebra](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/knowledge-fiber-algebra.md)) that for each predicate $p \in \mathcal{C}$ and scope $S \in \Sigma$ the substrate carries a fiber algebra $K_p^S \subseteq A_p$. For a subject $s \in E$ write
$$K(s) := \bigsqcup_{p \in \mathcal{C}} K_p^S \big|_{(s, p, \cdot)}$$
for the *knowledge-fiber-restriction at $s$* — the bilattice-valued tuple of $s$'s participation as subject across every predicate of $\mathcal{C}$ in scope $S$.

A **PMEST schema on $\mathcal{C}$** is a choice of five full subcategories $\mathcal{C}_P, \mathcal{C}_M, \mathcal{C}_E, \mathcal{C}_S, \mathcal{C}_T \hookrightarrow \mathcal{C}$ and an isomorphism
$$\Phi: \mathcal{C} \xrightarrow{\;\sim\;} \mathcal{C}_P \times \mathcal{C}_M \times \mathcal{C}_E \times \mathcal{C}_S \times \mathcal{C}_T$$
of predicate categories, called a **strict PMEST factorisation**. We treat each $\mathcal{C}_X$ as the predicate-vocabulary fragment carrying the corresponding facet's content.

## Statement

**Theorem (sketch).** Suppose $\Phi$ is a strict PMEST factorisation of $\mathcal{C}$. Then for every scope $S$ and every subject $s \in E$:

1. **(Projection)** The five composites $\pi_X \circ \Phi$ (for $X \in \{P, M, E, S, T\}$) induce projections of fiber-algebras $\rho_X^S: K(s) \to K_X(s)$ where $K_X(s)$ is the knowledge-fiber-restriction at $s$ over $\mathcal{C}_X$.

2. **(Tuple recovery)** The map
$$\mathrm{PMEST}^S(s) := (\rho_P^S, \rho_M^S, \rho_E^S, \rho_S^S, \rho_T^S)(K(s))$$
is a *bilattice-isomorphism* between $K(s)$ and $K_P(s) \times K_M(s) \times K_E(s) \times K_S(s) \times K_T(s)$.

3. **(Class-number correspondence)** When $\mathbf{L} = \mathbf{2}$ and the diagnostic-predication discipline of Ranganathan's *Colon Classification* is admitted as the closure-rule subset for facet-recognition, $\mathrm{PMEST}^S(s)$ projected to its $t$-coordinate is the same compound class number Ranganathan's analyst would assign to $s$.

## Proof sketch

**(1)** Since $\Phi$ is a category isomorphism it preserves the predicate-category morphism structure. The substrate's [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) is functorial over $\mathcal{C}$, so it pulls back along $\Phi^{-1}$ to a fibration over the product. The product fibration's sub-fibrations along each $\pi_X$ give the five $\rho_X^S$.

**(2)** Bilattice-algebra structure on $K(s)$ is defined pointwise per cell. Under $\Phi$, each cell $(s, p, o)$ corresponds to a unique tuple $(p_P, p_M, p_E, p_S, p_T) = \Phi(p)$, so the fiber over $p$ decomposes into independent fibers over each $p_X$. The pointwise bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ commute with each $\rho_X^S$ because the operations are defined per coordinate and $\Phi$ is invertible.

**(3)** Ranganathan's Colon Classification analyst, presented with a subject $s$, asks five questions ("what is the focal entity?", "what is the material?", etc.) and records one term per facet. The term-recording operation in substrate language is "assert the diagnostic predication for facet $X$ with $s$ as subject", and the term selected is the object of that predication. Under closure that derives the facet term from accumulated subject-evidence (the diagnostic-predication discipline), the $t$-projection of $\rho_X^S(K(s))$ is exactly that selected term. The five-tuple of terms is the colon-notation class number.

## Failure modes (where the sketch is fragile)

The strict factorisation $\Phi$ is the load-bearing assumption. It fails when:

- **Cross-axis dependence**: Energy predicates whose application depends on Matter (e.g., `oxidises` requires the matter of both reactants) cannot be expressed as a single $\mathcal{C}_E$ predicate independent of $\mathcal{C}_M$. The strict product must be replaced by a Grothendieck construction $\mathcal{C}_E \rtimes \mathcal{C}_M$ — a fibered, not strict, decomposition.
- **Domain-relative PMEST**: Different domains (Hjorland) admit different PMEST analyses. A medical PMEST schema and an agricultural PMEST schema may both be valid factorisations of their respective sub-categories, but neither is a factorisation of the union $\mathcal{C}$. The substrate-level claim then holds *per scope* rather than globally.
- **Compound personality**: Subjects that are themselves compound (e.g., "the relationship between two species") have their Personality facet living in $\mathcal{C}_P \times \mathcal{C}_P$ rather than in $\mathcal{C}_P$ proper. The factorisation absorbs this only if $\mathcal{C}_P$ is closed under products — a non-trivial requirement.

The substrate-level treatment of these failure modes lifts to the [predicate-category-stratification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/teaching/explanations/predicate-category-stratification.md) discipline: PMEST is a five-fold stratification of $\mathcal{C}$, and the strict-product factorisation is the special case where the stratification is *orthogonal* (no cross-stratum dependencies). The fibered-product replacement handles non-orthogonal cases by letting one stratum vary over the values of another via a Grothendieck construction.

The synthesis text [knowledge-organization-survey](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-organization-survey.md) §1 and §7 traces the upstream commitment.
