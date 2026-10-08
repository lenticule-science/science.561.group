---
name: transformer
description: "A morphism in the predication category C — an element of Hom_C(A, B) for objects A, B in Ob(C). A transformer takes things of its domain kind to things of its codomain kind, composing associatively with other transformers when codomain matches the next morphism's domain. Specializes thing by carrying domain and codomain cells naming the source and target objects."
specializing: thing
references:
  - id: lambek1958
    type: article-journal
    title: The mathematics of sentence structure
    volume: 65
    issue: 3
    author:
      - literal: Lambek, Joachim
    container-title: American Mathematical Monthly
    page: 154-170
    issued:
      - year: 1958
  - id: lawvere1969
    type: article-journal
    title: Adjointness in foundations
    volume: 23
    issue: 3-4
    author:
      - literal: Lawvere, F. William
    container-title: Dialectica
    page: 281-296
    issued:
      - year: 1969
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
title: transformer
---

A **transformer** is a morphism in the predication category $\mathcal{C}$ — an element of $\mathrm{Hom}_{\mathcal{C}}(A, B)$ for objects $A, B \in \mathrm{Ob}(\mathcal{C})$ [@maclane1971, Ch. I]. The 561 predication category's morphisms include the four bottom-preserving bilattice-homomorphism classes that exhaust morphisms between predicates (specialization, converse, subject-projection, object-projection), along with all their compositions [@lambek1958].

A transformer's identity-data has three parts:

- **Name** — the morphism's identifier in the morphism-set, inherited from object-via-thing.
- **Domain** — the source object $A$ at the start of the arrow. Recorded as a name referring to a thing.
- **Codomain** — the target object $B$ at the end of the arrow. Recorded as a name referring to a thing.

Composition is the categorical composition $\circ : \mathrm{Hom}(B, C) \times \mathrm{Hom}(A, B) \to \mathrm{Hom}(A, C)$. A transformer $g \circ f$ exists when the codomain of $f$ equals the domain of $g$. Composition is associative and admits identity morphisms $\mathrm{id}_A : A \to A$ for every object [@maclane1971, Ch. I §1].

Adjoint structure on the morphism set — left and right adjoints, unit and counit natural transformations — is the apparatus [@lawvere1969] uses to ground quantification and equality in categorical logic. The 561 predication-hyperdoctrine inherits this apparatus; its quantifier adjoints are specific transformers carrying the adjunction laws.

The schema captures the inherent morphism-data — name, domain, codomain — and nothing else. Specific transformers (specialization morphisms, converse morphisms, projection morphisms, naming-grammar morphisms, etc.) specialize transformer further via additional `allOf` extensions, adding their own domain-codomain-specific cells.
