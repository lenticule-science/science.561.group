---
name: hom-functor
description: "The functor Hom_C(-, A) or Hom_C(A, -) obtained by fixing one argument of the hom-bifunctor. Contravariant or covariant depending on which argument is fixed. The Yoneda lemma's principal subject: every functor C^op → Set is naturally isomorphic to some hom-functor exactly when it is representable."
specializing: functor
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
  - id: yoneda1954
    type: article-journal
    title: On the homology theory of modules
    volume: 7
    author:
      - literal: Yoneda, Nobuo
    container-title: Journal of the Faculty of Science of the University of Tokyo Section I
    page: 193-227
    issued:
      - year: 1954
title: hom-functor
---

A **hom-functor** is one of the two unary functors obtained by fixing one argument of the hom-bifunctor $\mathrm{Hom}_{\mathcal{C}}(-, -) : \mathcal{C}^{\mathrm{op}} \times \mathcal{C} \to \mathrm{Set}$ [@maclane1971, Ch. III §2; @awodey2010, §8.1]:

- **Covariant** hom-functor $\mathrm{Hom}_{\mathcal{C}}(A, -) : \mathcal{C} \to \mathrm{Set}$ — fixes the source $A$. Sends each object $X$ to the set $\mathrm{Hom}_{\mathcal{C}}(A, X)$ and each morphism $f : X \to Y$ to post-composition $f \circ - : \mathrm{Hom}_{\mathcal{C}}(A, X) \to \mathrm{Hom}_{\mathcal{C}}(A, Y)$.

- **Contravariant** hom-functor $\mathrm{Hom}_{\mathcal{C}}(-, A) : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$ — fixes the target $A$. Sends each object $X$ to $\mathrm{Hom}_{\mathcal{C}}(X, A)$ and each morphism $f : X \to Y$ to pre-composition $- \circ f : \mathrm{Hom}_{\mathcal{C}}(Y, A) \to \mathrm{Hom}_{\mathcal{C}}(X, A)$ (note arrow reversal because the functor is contravariant).

**`oneOf` direction discriminator.** The schema uses a primary `oneOf` over `direction ∈ {covariant, contravariant}` to dispatch between the two cases. Each branch pins direction by `const`. This is one of the schemas demonstrating JSON Schema 2020-12's primary-oneOf-tagged-union pattern, applied to a categorical primitive whose two variants are structurally distinct.

**The Yoneda lemma.** The contravariant hom-functor $\mathrm{Hom}_{\mathcal{C}}(-, A)$ is the prototypical *representable presheaf* on $\mathcal{C}$. The Yoneda lemma [@yoneda1954; @maclane1971, Ch. III §2] states that for any functor $F : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$:

$$\mathrm{Nat}(\mathrm{Hom}_{\mathcal{C}}(-, A), F) \cong F(A)$$

The natural transformations from a representable hom-functor into $F$ are in bijection with the elements of $F(A)$. As a corollary, the Yoneda embedding $\mathcal{Y} : \mathcal{C} \to [\mathcal{C}^{\mathrm{op}}, \mathrm{Set}]$, $A \mapsto \mathrm{Hom}_{\mathcal{C}}(-, A)$, is fully faithful — an object is determined up to canonical isomorphism by its contravariant hom-functor.

**The principle "an object IS its hom-functor."** This is the deep content of Yoneda: there is no internal data on an object beyond what its hom-functor captures. Two objects with naturally isomorphic hom-functors are isomorphic. Categorical reasoning leans on this principle whenever it argues "by Yoneda."
