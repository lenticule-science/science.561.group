---
name: category
description: "A category — a tuple (Ob, Hom, compose, id) of an object-collection, a morphism-collection, a binary composition operation that is associative, and an identity-morphism assignment for every object. The fundamental algebraic structure of category theory, on which every other categorical construction builds."
specializing: thing
references:
  - id: eilenbergmaclane1945
    type: article-journal
    title: General theory of natural equivalences
    volume: 58
    issue: 2
    author:
      - literal: Eilenberg, Samuel
      - literal: Mac Lane, Saunders
    container-title: Transactions of the American Mathematical Society
    page: 231-294
    issued:
      - year: 1945
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
---

A **category** $\mathcal{C}$ is the quadruple $(\mathrm{Ob}(\mathcal{C}), \mathrm{Hom}_{\mathcal{C}}, \circ, \mathrm{id})$ [@eilenbergmaclane1945; @maclane1971, Ch. I §1; @awodey2010, §1.2]:

- $\mathrm{Ob}(\mathcal{C})$, the **object-collection**, is a collection of objects.
- $\mathrm{Hom}_{\mathcal{C}}$, the **morphism-collection**, assigns to every ordered pair of objects $A, B \in \mathrm{Ob}(\mathcal{C})$ a collection $\mathrm{Hom}_{\mathcal{C}}(A, B)$ of morphisms with domain $A$ and codomain $B$.
- $\circ$, **composition**, is a partial binary operation: for every $f \in \mathrm{Hom}(A, B)$ and $g \in \mathrm{Hom}(B, C)$, there is a composite $g \circ f \in \mathrm{Hom}(A, C)$.
- $\mathrm{id}$ assigns to every object $A$ an **identity morphism** $\mathrm{id}_A \in \mathrm{Hom}(A, A)$.

These data satisfy three axioms:

1. **Associativity.** For all composable $f, g, h$: $(h \circ g) \circ f = h \circ (g \circ f)$.
2. **Left identity.** For all $f \in \mathrm{Hom}(A, B)$: $\mathrm{id}_B \circ f = f$.
3. **Right identity.** For all $f \in \mathrm{Hom}(A, B)$: $f \circ \mathrm{id}_A = f$.

The schema captures the structural data — the objects-array and the morphisms-array. The three axioms are universally-quantified equations that JSON Schema cannot express; they are checked by category-axiom transformers operating over a candidate instance and reporting which equations hold and which fail.

**Composition closure** — the requirement that for every composable pair $(f, g)$ the composite $g \circ f$ appears in the morphisms-array — is also a transformer-level check rather than a schema constraint, because it quantifies over all pairs in the array.

Specific categories specialize this structure by adding further constraints. The [predicate-category](../predicate-category/predicate-category.md) restricts morphisms to the four bottom-preserving bilattice-homomorphism classes. Higher categorical structures (functor categories, slice categories, presheaf categories) are themselves categories with additional data on top.
