---
name: limit
description: "The universal cone over a diagram — the canonical solution to the universal property that picks out an apex through which every other cone factors uniquely. The general categorical construction unifying terminal objects, products, equalizers, pullbacks, and more."
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
title: limit
---

A **limit** of a diagram $D : J \to \mathcal{C}$ is the universal [cone](cone.md) over $D$ — the apex $L$ with legs $\ell_j : L \to D(j)$ such that for every other cone $(N, n_j)$ over $D$ there exists a unique morphism $u : N \to L$ with $\ell_j \circ u = n_j$ for every $j$ [@maclane1971, Ch. III §3-4; @awodey2010, §5].

The unifying construction. Specific limits arise from specific diagram shapes:

| `limit-kind` | Diagram shape | The limit is the |
|---|---|---|
| `terminal` | Empty diagram | [Terminal object](terminal-object.md) |
| `product` | Discrete diagram | [Product](product.md) of the diagram's objects |
| `equalizer` | Parallel pair | [Equalizer](equalizer.md) of the two morphisms |
| `pullback` | Cospan | [Pullback](pullback.md) of the cospan |
| `general` | Arbitrary $J$ | The universal cone over an arbitrary diagram |

**Primary `oneOf` discriminator.** The schema demonstrates JSON Schema 2020-12's primary-`oneOf`-as-tagged-union pattern: the `limit-kind` field is the discriminator, and each `oneOf` branch pins `limit-kind` via `const` and requires the witness field appropriate to that kind. The terminal branch requires `terminal-witness`; the product branch requires `product-witness`; and so on. New limit kinds extend the schema by adding a new branch.

The dispatch lets a single `limit` record represent any limit form without separate schemas for each kind. Records of specific kinds (product, equalizer, pullback) exist as their own schemas for direct reference; the `limit` record unifies them under one umbrella with the discriminator.

**Existence.** A category has *all small limits* (is *complete*) if every diagram of small shape has a limit. The standard example is Set — it has all small limits and all small colimits. Top, Grp, Ring, and most "everyday" categories are complete. The completeness of $\mathcal{C}$ is itself a universally-quantified property; checking it on a candidate category is a transformer-level operation.

**Limits as right adjoints.** The limit functor $\lim : [J, \mathcal{C}] \to \mathcal{C}$ is right adjoint to the constant-diagram functor $\Delta : \mathcal{C} \to [J, \mathcal{C}]$. This is the adjoint-functor framing: limits are right adjoints to constant-diagram, colimits are left adjoints to constant-diagram.

**Dual.** The dual is [colimit](colimit.md) — the universal cocone under a diagram.
