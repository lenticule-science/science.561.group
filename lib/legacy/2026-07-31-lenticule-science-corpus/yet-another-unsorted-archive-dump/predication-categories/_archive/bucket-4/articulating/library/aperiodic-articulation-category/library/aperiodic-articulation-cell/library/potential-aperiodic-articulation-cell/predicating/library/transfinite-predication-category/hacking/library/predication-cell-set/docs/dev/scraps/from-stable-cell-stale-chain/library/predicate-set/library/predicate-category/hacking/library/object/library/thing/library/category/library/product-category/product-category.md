---
name: product-category
description: "The product category C × D with objects pairs (c, d) and morphisms component-wise pairs. The product in Cat — categorically the product of the underlying object-and-morphism data. Used for bifunctors (functors from C × D to E) and for parameterizing constructions over two categories simultaneously."
specializing: category
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

The **product category** $\mathcal{C} \times \mathcal{D}$ of two categories $\mathcal{C}$ and $\mathcal{D}$ has [@maclane1971, Ch. II §3; @awodey2010, §1.6]:

- **Objects:** pairs $(c, d)$ with $c \in \mathrm{Ob}(\mathcal{C})$ and $d \in \mathrm{Ob}(\mathcal{D})$.
- **Morphisms:** $(c, d) \to (c', d')$ is a pair $(f, g)$ with $f : c \to c'$ in $\mathcal{C}$ and $g : d \to d'$ in $\mathcal{D}$.
- **Composition:** $(f', g') \circ (f, g) = (f' \circ f, g' \circ g)$ — component-wise.
- **Identity:** $\mathrm{id}_{(c, d)} = (\mathrm{id}_c, \mathrm{id}_d)$.

**Universal property.** The product category $\mathcal{C} \times \mathcal{D}$ is the product in Cat (the category of small categories). It comes with projection functors $\pi_1 : \mathcal{C} \times \mathcal{D} \to \mathcal{C}$ and $\pi_2 : \mathcal{C} \times \mathcal{D} \to \mathcal{D}$, and for every category $\mathcal{E}$ with functors $F : \mathcal{E} \to \mathcal{C}$ and $G : \mathcal{E} \to \mathcal{D}$, there is a unique functor $\langle F, G \rangle : \mathcal{E} \to \mathcal{C} \times \mathcal{D}$ with $\pi_1 \circ \langle F, G \rangle = F$ and $\pi_2 \circ \langle F, G \rangle = G$.

**Use cases.**

- **Bifunctors.** A bifunctor $\mathcal{C} \times \mathcal{D} \to \mathcal{E}$ is a functor of two arguments. The tensor product $\otimes : \mathrm{Vect} \times \mathrm{Vect} \to \mathrm{Vect}$ and the hom-functor $\mathrm{Hom} : \mathcal{C}^{\mathrm{op}} \times \mathcal{C} \to \mathrm{Set}$ are both bifunctors.
- **Naturality in two variables.** A natural transformation between bifunctors is naturality with respect to both arguments jointly.
- **Parameterized constructions.** When a construction depends on two categories simultaneously, the product category is the natural domain.

**N-ary products.** The schema's `factors` array allows arbitrary finite arity. An n-ary product category $\mathcal{C}_1 \times \cdots \times \mathcal{C}_n$ has $n$-tuples of objects and morphisms, with componentwise composition.
