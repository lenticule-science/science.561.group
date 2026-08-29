---
title: "Duality"
description: "A duality is a correspondence between two structures where everything in one has a mirror in the other, but with the directions reversed. If you flip all the arrows in one structure, you get the other."
date-created: 2026-03-29
defines:
  - "Duality"
  - "dual-of"
  - "dual"
requires: [category, morphism]
type: term
---

A duality is a correspondence between two structures where everything in one has a mirror in the other, but with the directions reversed. If you flip all the arrows in one structure, you get the other.

The strict mathematical sense requires a named shared structure and a specified reversal, commonly realized by a contravariant equivalence. Broader claims that two things are “dual” are analogies unless they provide that structure.

In category theory, every [category](./category.md) has an opposite category formed by reversing all [morphisms](./morphism.md). A statement that is true in a category is also true in the opposite category, but with all arrows reversed. Products become coproducts. Limits become colimits. Monomorphisms become epimorphisms. This is why duality is powerful — every theorem you prove gives you a second theorem for free.

A duality between two concepts means they occupy the same structural position viewed from opposite sides. Supply and demand are dual — one is the buyer's perspective, the other is the seller's, and the market is the structure they share. Cost and value are dual — marginal cost is the supply-side boundary of a transaction, willingness to pay is the demand-side boundary, and the price is where they meet. Acquisition and retention are dual — conversion rate measures gaining customers, churn rate measures losing them, and the business is the structure between.

Duality is symmetric. If A is dual to B, then B is dual to A. It is not the same as opposition or contrast — dual things share structure. Contrasting things may have nothing in common except being meaningfully different.

When this library uses `dual-of` as a frontmatter predicate, it means the subject and object are the same shape seen from opposite directions. Reversing the perspective that defines one gives you the other.
