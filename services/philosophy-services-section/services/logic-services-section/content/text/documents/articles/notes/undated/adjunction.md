---
name: adjunction
description: "A pair of functors L: C -> D and R: D -> C together with unit and counit natural transformations satisfying the triangle identities. The most pervasive structural relationship in category theory; quantifiers, free constructions, limits and colimits, and Galois connections are all instances."
specializing: thing
references:
  - id: kan1958
    type: article-journal
    title: Adjoint functors
    volume: 87
    issue: 2
    author:
      - literal: Kan, Daniel M.
    container-title: Transactions of the American Mathematical Society
    page: 294-329
    issued:
      - year: 1958
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
title: adjunction
---

An **adjunction** $L \dashv R$ between functors $L : \mathcal{C} \to \mathcal{D}$ and $R : \mathcal{D} \to \mathcal{C}$ is the data [@kan1958; @maclane1971, Ch. IV]:

- A **left adjoint** functor $L : \mathcal{C} \to \mathcal{D}$.
- A **right adjoint** functor $R : \mathcal{D} \to \mathcal{C}$.
- A **unit** natural transformation $\eta : \mathrm{Id}_{\mathcal{C}} \Rightarrow R \circ L$.
- A **counit** natural transformation $\varepsilon : L \circ R \Rightarrow \mathrm{Id}_{\mathcal{D}}$.

The four pieces satisfy the **triangle identities** [@maclane1971, Ch. IV §1, Theorem 2]:

1. $(R \varepsilon) \circ (\eta R) = \mathrm{id}_R$ at every object of $\mathcal{D}$.
2. $(\varepsilon L) \circ (L \eta) = \mathrm{id}_L$ at every object of $\mathcal{C}$.

Equivalently, the hom-set bijection holds: $\mathrm{Hom}_{\mathcal{D}}(L A, B) \cong \mathrm{Hom}_{\mathcal{C}}(A, R B)$ naturally in $A$ and $B$.

Adjunctions are the workhorse of categorical logic. Lawvere's hyperdoctrine [@lawvere1969] grounds the existential and universal quantifiers as left and right adjoints to substitution; this construction is the math source of the predication-hyperdoctrine's quantifier adjoints that the 561 OS uses for closure-rule reasoning.

The schema captures the four-component data — left-adjoint, right-adjoint, unit, counit — and locks the surface with `unevaluatedProperties: false`, rejecting stray fields. The triangle identities are universally-quantified equations checked by adjunction-axiom transformers operating over a candidate adjunction together with its component functors and natural transformations.
