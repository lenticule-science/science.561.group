---
name: identity-morphism
description: "The do-nothing morphism id_A : A → A on an object A — the neutral element for composition. Every object has exactly one identity morphism; uniqueness follows from the unit law of category composition."
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
---

An **identity morphism** $\mathrm{id}_A : A \to A$ is the morphism on an object $A$ that acts as the neutral element for [composition](../composition/composition.md) [@maclane1971, Ch. I §1; @eilenbergmaclane1945]. For every morphism $f : A \to B$:

$$f \circ \mathrm{id}_A = f \qquad \mathrm{id}_B \circ f = f$$

These unit laws together with associativity are one of the two axiom groups that distinguish a category from a bare quiver. Identity morphisms are required to exist for every object in a category.

**Uniqueness.** Each object has exactly one identity morphism. The proof: if $e : A \to A$ satisfies $f \circ e = f$ for all $f$ out of $A$, then $e = \mathrm{id}_A \circ e = \mathrm{id}_A$, applying the unit law for $\mathrm{id}_A$ on the left.

**Specialization shape.** The schema specializes [transformer](../../transformer.md) by recording the identity morphism's identity via a single `at-object` cell — the object on which the morphism acts. The transformer-level `domain` and `codomain` fields both equal `at-object`; rather than restating them, the schema records the constraint by carrying only `at-object`. A separate transformer (the identity-witness check) verifies that the morphism's stored domain and codomain agree with `at-object`.

**Role in further constructions.** Identity morphisms are required to define [isomorphism](../isomorphism/isomorphism.md) ("round trip equals doing nothing" requires "doing nothing" to have a name). They appear as canonical components in every [functor](../../../category/library/functor/functor.md) — functoriality requires $F(\mathrm{id}_A) = \mathrm{id}_{F(A)}$. They appear as canonical components of every [natural transformation](../../../category/library/functor/library/natural-transformation/natural-transformation.md) — the identity natural transformation $\mathrm{id}_F : F \Rightarrow F$ has every component an identity morphism.
