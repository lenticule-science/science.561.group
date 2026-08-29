---
name: latching-functor
type: morphism
class: functor
symbol: "L_i"
realizes: [latching-matching]
depends-on: [latching-matching, stratified-directed-infinity-site]
---

For a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) $\mathcal{S}$ and a position $i \in \mathcal{S}$, the **latching functor** at $i$ is

$$L_i \;:\; \mathrm{Diag}(\mathcal{S}, \mathcal{H}) \to \mathcal{H},\qquad L_i F \;:=\; \mathrm{colim}_{j \to i,\; \deg j < \deg i}\; F(j)$$

— the homotopy colimit over forward (degree-raising) arrows into $i$.

## Pairing with matching

The pairing of $L_i$ with the [matching functor](matching-functor.md) $M_i$ at every position is the data of the [ambidexterity comparison](ambidexterity-comparison.md): for SD-constructible $F$, the canonical map $L_i F \to M_i F$ factorizes as $L_i F \to F(i) \to M_i F$, and constructibility says $F(i) = G(L_i F \to M_i F)$ where $G$ is the [KZ comonad](kz-comonad-G.md).
