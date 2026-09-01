---
name: diagram
description: "A functor D : J → C from a small index category J into a category C. The shape of J determines what kind of diagram — parallel pair, span, cospan, discrete, sequence, simplex, n-cube. Diagrams are the input to limit and colimit constructions: a (co)limit is the universal (co)cone over a diagram."
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

A **diagram** of shape $J$ in a category $\mathcal{C}$ is a functor $D : J \to \mathcal{C}$ from a small *index category* $J$ to $\mathcal{C}$ [@maclane1971, Ch. III §1; @awodey2010, §5.6]. The diagram's image is a set of objects and morphisms in $\mathcal{C}$, arranged in the shape of $J$.

Common diagram shapes:

- **Discrete** — $J$ has only identity morphisms. Diagrams of discrete shape are families of objects. Their limits are products, colimits coproducts.
- **Parallel pair** — $J$ has two objects with two non-identity morphisms between them. Diagrams of parallel-pair shape are parallel morphisms. Their limits are equalizers, colimits coequalizers.
- **Cospan** — $J$ has three objects with two morphisms to a common third. Diagrams of cospan shape are arrangements $A \to C \leftarrow B$. Their limits are pullbacks.
- **Span** — Dual of cospan; $A \leftarrow C \to B$. Their colimits are pushouts.
- **Sequence** — $J = \mathbb{N}$ (or an ordinal). Diagrams of sequence shape are countable chains. Their colimits are directed colimits / direct limits.
- **Simplex** — $J = \Delta^n$, the n-simplex. Diagrams give n-simplices in $\mathcal{C}$.

**Cardinality constraint.** A diagram is *trivial* if its image is empty (the functor from the empty category). For most useful constructions the diagram has at least one object and (when not discrete) at least one morphism. The schema uses `minItems: 1` on `image-objects` to require non-empty image, and `contains` with `minContains: 1` on `image-morphisms` to assert at least one morphism — exercising the JSON Schema 2020-12 cardinality-assertion feature.

**Relation to limit and colimit.** A limit of $D$ is the universal cone over $D$; a colimit is the universal cocone under $D$. The specific kind of limit/colimit (product, equalizer, pullback, etc.) is determined by the shape of $J$. The [limit](../limit/limit.md) and [colimit](../colimit/colimit.md) records discriminate over the diagram shape via the `limit-kind` / `colimit-kind` discriminator.
