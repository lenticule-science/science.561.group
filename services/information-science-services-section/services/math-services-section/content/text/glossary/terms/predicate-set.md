---
title: "Predicate set"
description: "The set whose elements are predicates — equivalently, the object set of the predicate category. One of the base parameters of the predication framework, alongside the entity set and the residuated lattice."
defines:
  - predicate set
symbol: "Π"
related:
  - predicate
  - predicate-category
  - entity-set
  - predication-cell-set
date-created: 2026-04-29
type: term

---

A **predicate set**, denoted $\Pi$, is the object set of a [predicate category](predicate-category.md) $\mathcal{C}$:

$$\Pi := \mathrm{Ob}(\mathcal{C}).$$

The elements of the predicate set are [predicates](predicate.md). The predicate set is one of the base parameters of the predication framework; together with the [entity set](entity-set.md) $E$ and the residuated lattice $\mathbf{L}$ from which the [bilattice](bilattice.md) is built, it determines the framework's basic data.

## Set vs. category

The predicate set is the *underlying set* of the predicate category — the bare collection of predicates without the morphisms that relate them. The categorical structure (specialization, converse, the two projections) is layered on top of the set; many definitions and constructions can refer to the set alone when the category structure is not at issue.

When the structure matters — for example, when discussing reindexing along predicate morphisms in a [predication fibration](predication-fibration.md) — the category $\mathcal{C}$ is the operative object, and $\Pi$ is recovered from it.

## Cardinality

The predicate set may be finite or infinite. Finite predicate sets correspond to systems with a fixed vocabulary of predicates; infinite predicate sets accommodate systems where predicates can be derived, restricted, or composed through the morphisms of $\mathcal{C}$. The framework imposes no specific cardinality requirement on $\Pi$ in general; specific theorems may.

## See also

- [Predicate](predicate.md) — an element of the predicate set.
- [Predicate category](predicate-category.md) — the category whose objects are predicates.
- [Entity set](entity-set.md) — the parallel base structure on the entity side.
- [Predication cell set](predication-fiber-algebra.md) — the set $\Phi = E \times \Pi \times E$ built from the entity and predicate sets.
