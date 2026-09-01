---
name: automorphism
description: "A morphism f : A → A that is both an endomorphism (domain equals codomain) and an isomorphism (has a two-sided inverse). Automorphisms at a single object form the automorphism group Aut(A) under composition."
specializing: endomorphism
references:
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

An **automorphism** of an object $A$ in a category $\mathcal{C}$ is a morphism $f : A \to A$ that is both an [endomorphism](../endomorphism/endomorphism.md) (domain and codomain coincide) and an [isomorphism](../isomorphism/isomorphism.md) (has a two-sided inverse) [@maclane1971, Ch. I §5; @awodey2010, §1.5].

The collection of all automorphisms of $A$, denoted $\mathrm{Aut}_{\mathcal{C}}(A)$, forms a **group** under composition. The group operation is composition; the unit is the identity morphism; every element has an inverse by definition. This makes the automorphism group a one-object subcategory of $\mathcal{C}$ in which every morphism is invertible — equivalently, a group viewed as a one-object groupoid.

**Specializing shape.** The schema is `allOf` over both [endomorphism](../endomorphism/endomorphism.md) and [isomorphism](../isomorphism/isomorphism.md) — an automorphism inherits the structural constraints of both. From endomorphism it gets the `at-object` cell (recording the object whose endomorphism this is); from isomorphism it gets the `inverse` cell (the partner morphism witnessing invertibility). `unevaluatedProperties: false` locks the surface.

**Examples.** In Set, $\mathrm{Aut}(A)$ is the symmetric group $S_A$ — the group of permutations of $A$. In Grp, $\mathrm{Aut}(G)$ is the group of group-automorphisms of $G$ — bijective group homomorphisms $G \to G$ — which includes the inner automorphisms induced by conjugation and may include more (outer automorphisms). In Vect, $\mathrm{Aut}(V)$ is $\mathrm{GL}(V)$, the general linear group on $V$.

**Role in symmetry theory.** Automorphism groups are the categorical home of symmetry. When a structure has a non-trivial automorphism group, its self-symmetries are exactly the elements of that group. The Klein-four group $K_4 = \langle \sim, - \rangle$ that acts on the bilattice (negation and conflation) is the automorphism group of the bilattice viewed in the category of bounded bilattice algebras.
