---
name: verdier-duality-functor
type: morphism
class: autoequivalence
symbol: "\\mathbb{D}"
realizes: [ambidexterity, constructibility]
depends-on: [stratified-directed-infinity-site, sd-constructible-stack, ambidexterity-comparison]
---

The **Verdier-duality functor** on a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) $\mathcal{S}$ in a [relational ∞-topos](../objects/relational-infinity-topos.md) is the autoequivalence

$$\mathbb{D} \;:\; \mathrm{Sh}_{\mathrm{Constr}}(\mathcal{S}, \mathcal{H})^{\mathrm{op}} \;\xrightarrow{\sim}\; \mathrm{Sh}_{\mathrm{Constr}}(\mathcal{S}, \mathcal{H})$$

on [SD-constructible](../teaching/explanations/constructibility.md) sheaves on $\mathcal{S}$, sending $F \mapsto \mathbb{D}(F)$ where $\mathbb{D}(F)(i) := \mathrm{Hom}(F(i), \omega_i)$ for $\omega_i$ the dualizing sheaf at $i$ — the fiber at $i$ of the dualizing complex on $\mathcal{S}$ associated to its stratification.

## Existence requires ambidexterity

$\mathbb{D}$ exists as an autoequivalence — and not merely a duality bifunctor — exactly because the [ambidexterity comparison](ambidexterity-comparison.md) is an equivalence on SD-constructible sheaves. Without ambidexterity, $\mathbb{D}$ would interchange limits and colimits without identification, so $\mathbb{D}^2$ would not return to the original sheaf. The [SD-ambidexterity theorem](../theorems/sd-ambidexterity.md) is exactly what supplies the canonical $\mathbb{D}^2 \simeq \mathrm{id}$ involution.

## Theorem statement

The [Verdier-duality theorem on the SD site](../theorems/verdier-duality-on-sd-site.md) packages this morphism as a theorem: $\mathbb{D}$ is well-defined, an involution up to canonical equivalence, and it acts on the [SD-constructible stack](../objects/sd-constructible-stack.md) as an autoequivalence.

## Comparison with predication-categories' Verdier dual

Predication categories carries a [Verdier dual on a bitopological site](../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/verdier-duality-bitopological-site.md) — the 1-categorical bitopological-cohomology-side analogue. The relationship is the same as everywhere else in this subtheory: the SD-site $\mathbb{D}$ is the $\infty$-categorical lift of the bitopological-site $\mathbb{D}$, with stratification replacing bitopology as the source of the duality.
