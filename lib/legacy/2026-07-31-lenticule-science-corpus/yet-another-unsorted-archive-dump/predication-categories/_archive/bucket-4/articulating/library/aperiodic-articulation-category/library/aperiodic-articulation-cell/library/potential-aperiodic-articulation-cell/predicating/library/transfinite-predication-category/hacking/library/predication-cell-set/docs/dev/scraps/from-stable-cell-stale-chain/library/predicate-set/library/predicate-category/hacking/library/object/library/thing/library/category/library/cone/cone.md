---
name: cone
description: "An object N together with a family of leg morphisms n_j : N → D(j) into each vertex of a diagram D, such that the legs commute with the diagram's morphisms. Cones are the candidate solutions for limits; the limit is the universal cone."
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

A **cone** over a diagram $D : J \to \mathcal{C}$ is an object $N$ (the *apex*) together with a family of morphisms $\{n_j : N \to D(j)\}_{j \in \mathrm{Ob}(J)}$ (the *legs*), satisfying [@maclane1971, Ch. III §3]:

$$D(f) \circ n_j = n_{j'} \qquad \text{for every } f : j \to j' \text{ in } J.$$

Visually, the cone is the apex above the diagram with leg morphisms descending to each diagram vertex; commutativity says the diagram's own morphisms route consistently through the legs.

**Cones are candidates for limits.** The [limit](../limit/limit.md) of $D$ is the *universal* cone — the cone such that every other cone factors uniquely through it. The limit is the apex equipped with the universal cone's legs; the universal property says every alternative apex (with its own legs) admits a unique mediating morphism into the limit's apex.

**Dual.** The dual is the [cocone](../cocone/cocone.md) — same shape but with legs pointing *out* of the diagram vertices into a common cobase. Colimits are universal cocones.

**Cone category.** For a fixed diagram $D$, the cones over $D$ form a category $\mathrm{Cone}(D)$: objects are cones, morphisms are apex-mediating morphisms compatible with the legs. The limit, when it exists, is the terminal object of $\mathrm{Cone}(D)$.
