---
name: ambidexterity-comparison
type: morphism
class: natural-transformation
symbol: "\\mathrm{Nm}"
realizes: [ambidexterity, latching-matching]
closes: stratified-directed-infinity-site
depends-on: [latching-functor, matching-functor, ambidexterity, kz-comonad-G]
---

The **ambidexterity comparison** at a position $i$ of a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md), applied to a diagram $F : \mathcal{S} \to \mathcal{H}$, is the canonical norm map

$$\mathrm{Nm}_{F, i} \;:\; L_i F \;\to\; M_i F$$

from the [latching object](latching-functor.md) at $i$ to the [matching object](matching-functor.md) at $i$, factoring through $F(i)$.

## Globalization

The pointwise comparison globalizes to a natural transformation between two assemblies of $F$:

$$\mathrm{Nm}_F \;:\; \mathrm{colim}_{\mathcal{S}}\, F \;\to\; \lim_{\mathcal{S}}\, F$$

obtained by gluing the per-position norm maps using the SD structure. The norm map is functorial in $F$ and natural in $\mathcal{S}$.

## When it is an equivalence

The [SD-ambidexterity theorem](../theorems/sd-ambidexterity.md) is the assertion that for [SD-constructible](../teaching/explanations/constructibility.md) $F$, the norm map $\mathrm{Nm}_F$ is an equivalence. Equivalently — and this is the local form — the per-position factorization $L_i F \to F(i) \to M_i F$ exhibits $F(i)$ as the [KZ comonad](kz-comonad-G.md) $G$ applied to the span $L_i F \to M_i F$.

## Closes

This morphism `closes` the [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) chapter: it is the structural move that completes the SD-site definition into a full ambidexterity calculus.
