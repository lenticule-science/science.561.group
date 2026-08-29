---
name: colimit
description: "The universal cocone under a diagram — the canonical solution to the dual universal property of limit. Unifies initial objects, coproducts, coequalizers, pushouts, and general colimits. Dual to limit."
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

A **colimit** of a diagram $D : J \to \mathcal{C}$ is the universal [cocone](../cocone/cocone.md) under $D$ — the cobase $L$ with legs $\ell_j : D(j) \to L$ such that for every other cocone $(N, n_j)$ under $D$ there exists a unique morphism $u : L \to N$ with $u \circ \ell_j = n_j$ for every $j$ [@maclane1971, Ch. III §3-4; @awodey2010, §5]. Dual to [limit](../limit/limit.md).

Specific colimits arise from specific diagram shapes:

| `colimit-kind` | Diagram shape | The colimit is the |
|---|---|---|
| `initial` | Empty diagram | [Initial object](../initial-object/initial-object.md) |
| `coproduct` | Discrete diagram | [Coproduct](../coproduct/coproduct.md) of the diagram's objects |
| `coequalizer` | Parallel pair | [Coequalizer](../coequalizer/coequalizer.md) of the two morphisms |
| `pushout` | Span | [Pushout](../pushout/pushout.md) of the span |
| `general` | Arbitrary $J$ | The universal cocone under an arbitrary diagram |

**Primary `oneOf` discriminator.** Same pattern as [limit](../limit/limit.md), dualized — the `colimit-kind` field is the discriminator; each branch pins it via `const` and requires the kind-specific witness.

**Cocompleteness and adjoints.** A category has *all small colimits* (is *cocomplete*) if every diagram of small shape has a colimit. The colimit functor $\mathrm{colim} : [J, \mathcal{C}] \to \mathcal{C}$ is left adjoint to the constant-diagram functor $\Delta : \mathcal{C} \to [J, \mathcal{C}]$. Where limits are *right adjoints to constant-diagram*, colimits are *left adjoints to constant-diagram* — a clean duality through adjointness.

**Filtered colimits.** A particularly important kind of colimit is over a *filtered* index category (where any two objects have a common successor, and any two parallel morphisms have a common coequalizing morphism). Filtered colimits commute with finite limits in Set and many other categories — a structural fact heavily used in algebraic geometry, model theory, and homological algebra.
