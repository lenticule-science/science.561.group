---
name: isomorphism
description: "A morphism f : A → B together with an inverse morphism g : B → A satisfying the round-trip-equals-identity laws g ∘ f = id_A and f ∘ g = id_B. Witnesses categorical indistinguishability — two isomorphic objects are interchangeable for every categorical purpose."
specializing: transformer
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

An **isomorphism** $f : A \to B$ is a morphism for which there exists an inverse morphism $g : B \to A$ satisfying [@maclane1971, Ch. I §5; @awodey2010, §1.5]:

$$g \circ f = \mathrm{id}_A \qquad f \circ g = \mathrm{id}_B$$

The two equations say that round-tripping through $f$ then $g$ returns to the starting object and acts as the identity, and likewise round-tripping through $g$ then $f$. The inverse $g$ is unique when it exists, written $f^{-1}$.

Two objects $A, B$ are **isomorphic** ($A \cong B$) when there exists at least one isomorphism between them. The Yoneda principle establishes that isomorphic objects are categorically indistinguishable: they have identical hom-functors and are interchangeable for every categorical purpose. An object has no internal constitution beyond its morphism participation — two objects that look the same from the outside *are* the same.

**Specializing shape.** The schema specializes [transformer](../../transformer.md) by adding an `inverse` cell naming the partner morphism. The transformer's `domain` and `codomain` cells carry the source and target; the inverse's `domain` and `codomain` are the reversed pair (the schema cannot enforce this reversal — a separate transformer checks it). The round-trip-equals-identity equations are universally-quantified across the morphism's action on every input, so they live in transformer territory.

**Examples by category.** In Set, isomorphisms are bijections. In Top, isomorphisms (called homeomorphisms) are continuous bijections with continuous inverse. In Grp, isomorphisms are bijective group homomorphisms. In a partial order viewed as a thin category, isomorphisms are equality (each pair of mutually-related elements is identical by antisymmetry).

**Specializations.** An [automorphism](../automorphism/automorphism.md) is an isomorphism whose domain and codomain coincide — `allOf` of `isomorphism` and [endomorphism](../endomorphism/endomorphism.md). The automorphism group of an object $A$, $\mathrm{Aut}(A)$, is the collection of all automorphisms at $A$ under composition.
