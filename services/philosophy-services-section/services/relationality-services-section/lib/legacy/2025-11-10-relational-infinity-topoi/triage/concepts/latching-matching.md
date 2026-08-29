---
name: latching-matching
type: concept
class: neighborhood-pair
symbol: "L, M"
depends-on:
  - exit-infinity-category
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

For a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) and a position $i$, the **latching** and **matching** neighborhoods at $i$ are the two finite sub-$\infty$-categories of the indexing $\infty$-category that capture, respectively, what enters $i$ from below and what constrains $i$ from above.

## Latching

The **latching object** at $i$ is

$$L_i F \;:=\; \mathrm{colim}_{j \to i,\; \deg j < \deg i}\; F(j)$$

— the homotopy colimit over all forward (degree-raising) arrows *into* $i$. $L_i F$ is everything that has been built and sent toward $i$ from lower strata; $F(i)$ must accept this data.

## Matching

The **matching object** at $i$ is

$$M_i F \;:=\; \lim_{i \to k,\; \deg k > \deg i}\; F(k)$$

— the homotopy limit over all forward arrows *out of* $i$ (equivalently, the matching data is what $i$'s contribution must be compatible with at higher strata). $M_i F$ is everything $i$ must reconcile with above.

## Reeves analogy

This is the higher analogue of the **Reedy structure** in classical model-category theory: a Reedy category has degree-raising and degree-lowering arrows, and Reedy-fibrant diagrams are characterized by the matching maps being fibrations and Reedy-cofibrant by the latching maps being cofibrations. The SD ∞-site is the $\infty$-categorical lift of a Reedy category; SD-constructibility is the lift of Reedy-fibrant-and-cofibrant.

## Used by

- [`morphisms/latching-functor.md`](../morphisms/latching-functor.md) and [`morphisms/matching-functor.md`](../morphisms/matching-functor.md) — the typed functors $F \mapsto L_i F$ and $F \mapsto M_i F$.
- [`morphisms/ambidexterity-comparison.md`](../morphisms/ambidexterity-comparison.md) — the comparison morphism between the two.
- [`theorems/sd-ambidexterity.md`](../theorems/sd-ambidexterity.md) — the equivalence statement.
