---
title: "Bilattice homomorphism"
description: "A function between bilattices preserving all four lattice operations and negation (and conflation, when present). The structure-preserving morphism class for bilattices; the natural bottom-preserving such homomorphisms between predication fiber algebras are exactly the maps induced by the four predicate-category generators."
symbol: h
date-created: 2026-04-29
---

A **bilattice homomorphism** is a function $h : \mathbf{B}_1 \to \mathbf{B}_2$ between [bilattices](bilattice.md) preserving all four lattice operations and the [negation](negation.md):

- $h(a \wedge_t b) = h(a) \wedge_t h(b)$ and $h(a \vee_t b) = h(a) \vee_t h(b)$;
- $h(a \wedge_k b) = h(a) \wedge_k h(b)$ and $h(a \vee_k b) = h(a) \vee_k h(b)$;
- $h(\sim a) = \sim h(a)$.

When the bilattices carry a [conflation](conflation.md), a bilattice homomorphism is additionally required to preserve it: $h(-a) = -h(a)$.

A bilattice homomorphism need not preserve bounds. A homomorphism that additionally preserves the knowledge-order bottom — $h(\bot) = \bot$ — is called **bottom-preserving**.

## Bottom-preserving homomorphisms and the predicate category

The natural bottom-preserving bilattice homomorphisms between [predication fiber algebras](predication-fiber-algebra.md) are exactly the maps induced by the four [predicate category](predicate-category.md) generator classes: [specialization](predicate-specialization.md), [converse](predicate-converse.md), [subject-projection](predicate-subject-projection.md), and [object-projection](predicate-object-projection.md). Each generator $f : q \to p$ induces a fiber-algebra map $f^* : A_p \to A_q$ that is a bottom-preserving bilattice homomorphism.

This is what makes the predicate category's structure cleanly fibrational: the morphisms in the base correspond to the structure-preserving maps in the fibers. The fiber algebras form a strict diagram of bilattices indexed by the predicate category, with the four generator classes giving the four kinds of structural relationship between predicates that the framework recognizes.

## See also

- [Bilattice](bilattice.md) — the structure between which homomorphisms map.
- [Negation](negation.md), [Conflation](conflation.md) — the unary operations homomorphisms preserve.
- [Predication fiber algebra](predication-fiber-algebra.md) — the bilattices the framework's natural homomorphisms act between.
- [Predicate category](predicate-category.md) — the category whose morphisms induce the bottom-preserving homomorphisms.
