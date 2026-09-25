---
type: definition
class: category
realizes: [causal-evidence]
symbol: "\\mathcal{C}_{\\mathrm{cone}}"
depends-on: [predicate-category, light-cone, spacetime-entity-set]
title: Light-cone predicate category
description: "The predicate category appropriate to predicated cosmology: a small category $\\mathcal{C}{\\mathrm{cone}}$ whose objects are physical observable predicates and whose morphisms are restricted to those compatible with the light cone…"
---

# Light-cone predicate category

The [predicate category](../../documents/articles/research/humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) appropriate to predicated cosmology: a small category $\mathcal{C}_{\mathrm{cone}}$ whose objects are physical observable predicates and whose morphisms are restricted to those compatible with the [light cone](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/content/text/glossary/terms/light-cone.md) structure of the [spacetime entity set](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/documents/articles/notes/spacetime-entity-set.md).

The category inherits the four generator classes of the parent [predicate category](../../documents/articles/research/humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) — [specialization](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md), [converse](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md), and the two [projections](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md) — but adds a fifth class:

- **Light-cone restriction.** A morphism $\rho_{e \to e'} : p \to p$ for any $e, e' \in E_{\mathrm{cos}}$ with $e \preceq e'$. This morphism reindexes the value of $p$ at cells supported on $e$'s past light cone into the value at cells supported on $e'$'s past light cone, restricted to the intersection. It is the formal site of "evidence at $e$ is also evidence at $e'$ if $e$ causally precedes $e'$."

Compositionally, $\rho_{e \to e''} = \rho_{e' \to e''} \circ \rho_{e \to e'}$ when $e \preceq e' \preceq e''$, and the identity is $\rho_{e \to e}$. The light-cone restriction class is therefore a sub-2-category of $\mathcal{C}_{\mathrm{cone}}$ whose underlying 1-skeleton is the causal partial order on $E_{\mathrm{cos}}$.

## What is and is not admissible

A morphism $f : p_1 \to p_2$ in $\mathcal{C}_{\mathrm{cone}}$ is admissible iff its action on cells respects the light-cone structure: the reindexing of a value at $(s, p_2, o)$ to a value at $(s', p_1, o')$ is allowed only when there is a causal chain from $\{s', o'\}$ to $\{s, o\}$. This is the categorical formalization of relativistic locality.

Consequences:

- The [Beck-Chevalley](../../documents/articles/research/humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) commutation conditions in $\mathcal{C}_{\mathrm{cone}}$ are constrained by the causal order: squares of reindexings commute only when their underlying squares of light-cone restrictions commute, which holds in flat (Minkowski) spacetime but is *non-trivial* in curved spacetimes with non-globally-hyperbolic structure.
- A [closure rule](../../documents/articles/research/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) firing at event $e$ can only consume values from the past light cone of $e$ and produce values at $e$ or its future light cone. The closure-rule system is **spacetime-local** by construction.

## In Lambda-CDM

For a spacetime that is FLRW (the [cosmological principle](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/glossary/terms/cosmological-principle.md) holds), the causal order is determined by [cosmic time](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/content/text/glossary/terms/cosmic-time.md) and comoving distance, and the light-cone restriction morphisms have a clean parameterization in terms of [redshift](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/glossary/terms/redshift.md). The [redshift-reindexing](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/glossary/terms/redshift-reindexing.md) morphism is the special case of light-cone restriction along a null geodesic in FLRW spacetime.
