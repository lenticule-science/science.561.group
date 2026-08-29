---
name: product
description: "The universal cone over a discrete diagram — an object P with projection morphisms to each factor A_i, such that any compatible cone factors uniquely through P. The categorical product generalizes Cartesian product (Set), product space (Top), direct product (Grp), tensor product on free objects, and more."
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
---

A **product** of objects $A_1, A_2, \ldots, A_n$ in a category $\mathcal{C}$ is an object $P = A_1 \times A_2 \times \cdots \times A_n$ together with projection morphisms $\pi_i : P \to A_i$, satisfying the universal property [@maclane1971, Ch. III §5; @awodey2010, §5.1]:

> For every object $Q$ with morphisms $q_i : Q \to A_i$ for each $i$, there exists a unique morphism $u : Q \to P$ such that $\pi_i \circ u = q_i$ for every $i$.

The unique morphism $u$ is called the *induced morphism* or the *pairing* $\langle q_1, \ldots, q_n \rangle$. The universal property says $P$ is the categorically-canonical object equipped with maps into each $A_i$ — any object $Q$ with such maps factors through $P$ uniquely.

**Uniqueness.** Products, when they exist, are unique up to unique isomorphism, by the standard universal-property argument.

**Examples by category.**

- In Set, the product is the Cartesian product $A \times B = \{(a, b) : a \in A, b \in B\}$ with $\pi_1(a, b) = a$ and $\pi_2(a, b) = b$.
- In Top, the product is the product space with the product topology.
- In Grp, the product is the direct product group $A \times B$ with componentwise multiplication.
- In a partial order, the product of $a$ and $b$ is their meet $a \wedge b$ when it exists.
- In a poset category, the binary product is the greatest lower bound.

**Binary vs n-ary discriminator.** The schema uses `oneOf` to distinguish two structural cases: binary products (exactly two factors) and n-ary products (three or more). Each branch pins the factor and projection cardinality via `minItems` / `maxItems`. The binary case is the most common; the n-ary case generalizes to finite products. Infinite products (over an arbitrary index set $I$) would require lifting `factors` to a function $I \to \mathrm{Ob}(\mathcal{C})$; that extension is out of this schema's scope.

**Relation to limit.** A product is the limit of a discrete diagram — a functor from a discrete (only-identities) index category to $\mathcal{C}$. The general [limit](../limit/limit.md) record carries the discriminator `limit-kind` with `product` as one of its branches; the product record is the specific case factored out for direct reference.

**Dual.** The dual is the [coproduct](../coproduct/coproduct.md) — the universal cocone over a discrete diagram.
