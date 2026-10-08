---
kind: definition
type: category
symbol: "\\mathbf{B}"
depends-on: [residuated-lattice, predicate-category, entity-set, settling-bound]
title: Parameter base category
description: The 1-category whose objects are knowledge presheaf base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are 4-tuples $(\ell, e, \pi, \phi\lambda)$.
---

# Parameter base category

The 1-category whose objects are knowledge presheaf base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are 4-tuples $(\ell, e, \pi, \phi_\lambda)$.

$$\mathbf{B} \;:=\; \mathrm{ResLat} \times \mathrm{PredCat} \times \mathbf{Set} \times \mathbf{Ord}$$

where:

- $\mathrm{ResLat}$ — integral commutative [residuated lattices](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/residuated-lattice.md) with residuated-lattice homomorphisms.
- $\mathrm{PredCat}$ — small categories equipped with a four-generator inventory ([specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md), [converse](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md), [subject-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md), [object-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-object-projection.md)), with functors preserving the generator structure.
- $\mathbf{Set}$ — the usual category of sets and functions, parametrizing [entity sets](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/entity-set.md).
- $\mathbf{Ord}$ — ordinals and order-preserving maps, parametrizing [settling bounds](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/settling-bound.md).

A morphism $(\ell, e, \pi, \phi_\lambda) : (\mathbf{L}, \mathcal{C}, E, \lambda) \to (\mathbf{L}', \mathcal{C}', E', \lambda')$ is a 4-tuple of morphisms in the respective factor categories, composing componentwise.

## Structural facts

**Finite limits.** Each factor has finite limits: $\mathrm{ResLat}$ via underlying-set computation; $\mathrm{PredCat}$ pointwise on objects and generators; $\mathbf{Set}$ and $\mathbf{Ord}$ classical. Finite limits in $\mathbf{B}$ are componentwise, so $\mathbf{B}$ has finite limits.

**1-category, not 2-category.** Cross-parameter 2-cells (e.g., natural transformations between predicate-category functors) are not part of $\mathbf{B}$'s structure. If a natural-transformation 2-cell arises, it factors through the fiber-level automorphism group of the moduli point ([settling-automorphism 1-truncation](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md)), not through $\mathbf{B}$.

## Role

The base of the [settling moduli prestack](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-prestack.md) and ultimately of the [settling moduli stack](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md). The product structure isolates the four parameters of a knowledge presheaf cleanly; the [parameter base topology](../../../../glossary/terms/parameter-base-topology.md) puts a Grothendieck topology on $\mathbf{B}$ that supports the stack theorem.
