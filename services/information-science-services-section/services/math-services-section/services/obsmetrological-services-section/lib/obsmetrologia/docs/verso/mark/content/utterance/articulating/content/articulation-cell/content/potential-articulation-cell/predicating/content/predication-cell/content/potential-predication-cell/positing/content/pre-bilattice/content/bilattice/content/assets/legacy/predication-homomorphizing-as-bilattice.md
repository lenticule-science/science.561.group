---
name: homomorphizing-as-bilattice
description: A function h between bilattices preserving all four lattice operations and the negation. The natural-morphism class of the category of bilattices.
gerund: homomorphizing-as-bilattice
agent-noun: homomorphizer-as-bilattice
imperative: homomorphize-as-bilattice
domain: bilattice
codomain: bilattice
references:
  - id: ginsberg1988
    type: article-journal
    title: "Multivalued logics: A uniform approach to inference in artificial intelligence"
    volume: 4
    issue: 3
    container-title: Computational Intelligence
    page: 265-316
    issued:
      - year: 1988
  - id: fitting1991
    type: article-journal
    title: Bilattices and the semantics of logic programming
    volume: 11
    issue: 2
    container-title: Journal of Logic Programming
    page: 91-116
    issued:
      - year: 1991
---

A function $h : \mathbf{B}_1 \to \mathbf{B}_2$ between [bilattices](../structures/bilattice.md) preserving all four lattice operations and the negation:

- $h(a \wedge_t b) = h(a) \wedge_t h(b)$ and $h(a \vee_t b) = h(a) \vee_t h(b)$
- $h(a \wedge_k b) = h(a) \wedge_k h(b)$ and $h(a \vee_k b) = h(a) \vee_k h(b)$
- $h(\sim a) = \sim h(a)$

When the bilattices carry a conflation, a bilattice homomorphism is additionally required to preserve it: $h(-a) = -h(a)$ ([Fitting 1991]).

A bilattice homomorphism need not preserve bounds. A homomorphism that additionally preserves the knowledge-order bottom — $h(\bot) = \bot$ — is called *bottom-preserving*; the natural bottom-preserving bilattice homomorphisms between predication fiber algebras are exactly the maps induced by the four predicate-category generator classes ([predicate-specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md), [predicate-converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md), [predicate-subject-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md), [predicate-object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md)).
