---
name: categorizing
description: The category-membership morphism. Maps a structure to the category it is an object of. The cell (X, categorizing, C) asserts X ∈ Ob(C).
gerund: categorizing
agent-noun: categorizer
domain: structure
codomain: category
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    series: Graduate Texts in Mathematics
    volume: 5
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
title: categorizing
---

The morphism a record bears toward the category it is an object of.

## Proof of well-formedness

A category $C$ (Mac Lane 1971 *Categories for the Working Mathematician* ch. I §2) consists of:

- a class $\mathrm{Ob}(C)$ of objects,
- for each pair $A, B \in \mathrm{Ob}(C)$ a hom-set $C(A, B)$ of morphisms,
- an identity $\mathrm{id}_A \in C(A, A)$ for each $A$,
- a composition operation,

satisfying associativity and identity laws.

Object membership in $C$ is the binary relation $X \in \mathrm{Ob}(C)$ between an entity $X$ and a category $C$. The cell $(X, \text{categorizing}, C)$ records this relation. Well-definedness: $\mathrm{Ob}(C)$ is a class given by the definition of $C$, so $X \in \mathrm{Ob}(C)$ is decidable per the definition; the relation is functional in $X$ (one cell per (X, C) pair) modulo the fact that $X$ may be an object of many categories (multi-categoricity), in which case multiple categorizing cells exist on $X$.

In this corpus, $X$ is identified with a record at `code/structures/<X>.md` and $C$ is identified with a record at `code/structures/<C>.md` that itself bears `(C, categorizing, ...)` placing $C$ in some containing category. The recursion proceeds until it bottoms out at a foundational category whose containing category is itself by self-reference, or up to a foundational meta-category whose membership is taken as a primitive.
