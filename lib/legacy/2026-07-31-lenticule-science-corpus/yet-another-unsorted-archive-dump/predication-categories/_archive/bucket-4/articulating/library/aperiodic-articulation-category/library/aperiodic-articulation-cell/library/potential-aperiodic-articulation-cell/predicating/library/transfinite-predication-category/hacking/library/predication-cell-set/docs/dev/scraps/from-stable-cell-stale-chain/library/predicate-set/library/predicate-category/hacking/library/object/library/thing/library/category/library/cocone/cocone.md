---
name: cocone
description: "An object N together with a family of leg morphisms n_j : D(j) → N from each vertex of a diagram D, such that the legs commute with the diagram's morphisms. Dual to cone. Cocones are the candidate solutions for colimits; the colimit is the universal cocone."
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
---

A **cocone** under a diagram $D : J \to \mathcal{C}$ is an object $N$ (the *cobase*) together with a family of morphisms $\{n_j : D(j) \to N\}_{j \in \mathrm{Ob}(J)}$ (the *legs*), satisfying [@maclane1971, Ch. III §3]:

$$n_{j'} \circ D(f) = n_j \qquad \text{for every } f : j \to j' \text{ in } J.$$

Dual to [cone](../cone/cone.md). Visually, the cocone has the diagram at the top with leg morphisms ascending to a common cobase below. Commutativity says the diagram's morphisms route consistently into the legs.

**Cocones are candidates for colimits.** The [colimit](../colimit/colimit.md) of $D$ is the *universal* cocone — the cocone such that every other cocone factors uniquely through it. The colimit is the cobase equipped with the universal cocone's legs; the universal property says every alternative cobase (with its own legs) admits a unique mediating morphism from the colimit's cobase.

**Cocone category.** For a fixed diagram $D$, the cocones under $D$ form a category $\mathrm{Cocone}(D)$: objects are cocones, morphisms are cobase-mediating morphisms compatible with the legs. The colimit, when it exists, is the initial object of $\mathrm{Cocone}(D)$.
