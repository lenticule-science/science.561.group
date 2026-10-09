---
name: coproduct
description: "The universal cocone over a discrete diagram — an object C with injection morphisms from each cofactor A_i, such that any compatible cocone factors uniquely through C. The categorical coproduct generalizes disjoint union (Set), free product (Grp), direct sum (Ab), and more. Dual to product."
specializing: object
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
title: coproduct
---

A **coproduct** of objects $A_1, A_2, \ldots, A_n$ in a category $\mathcal{C}$ is an object $C = A_1 + A_2 + \cdots + A_n$ together with injection morphisms $\iota_i : A_i \to C$, satisfying the universal property [@maclane1971, Ch. III §3; @awodey2010, §5.1]:

> For every object $Q$ with morphisms $q_i : A_i \to Q$ for each $i$, there exists a unique morphism $u : C \to Q$ such that $u \circ \iota_i = q_i$ for every $i$.

Dual to [product](product.md). Where the product is "every object maps into the product compatibly with projections," the coproduct is "every cofactor maps out compatibly into anywhere else."

**Examples by category.**

- In Set, the coproduct is the disjoint union $A \sqcup B$, with $\iota_1(a) = (a, 1)$ and $\iota_2(b) = (b, 2)$ (tagging which side each element came from).
- In Top, the coproduct is the disjoint union space.
- In Grp, the coproduct is the free product $A * B$ — strikingly different from the direct product.
- In Ab (abelian groups), the coproduct is the direct sum $A \oplus B$, which coincides with the binary product (abelian groups are *additive*: binary product equals binary coproduct).
- In a partial order viewed as a thin category, the coproduct of $a$ and $b$ is their join $a \vee b$.

**Binary vs n-ary.** Same discriminator pattern as product. Binary coproducts (two cofactors) are the most common; n-ary coproducts generalize to finite indexed sums.

**Relation to colimit.** A coproduct is the colimit of a discrete diagram — the dual of how product is a limit of a discrete diagram. The general [colimit](colimit.md) record has a `colimit-kind` discriminator with `coproduct` as one branch.
