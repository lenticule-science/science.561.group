---
name: matching-functor
type: morphism
class: functor
symbol: "M_i"
realizes: [latching-matching]
depends-on: [latching-matching, stratified-directed-infinity-site]
---

For a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) $\mathcal{S}$ and a position $i \in \mathcal{S}$, the **matching functor** at $i$ is

$$M_i \;:\; \mathrm{Diag}(\mathcal{S}, \mathcal{H}) \to \mathcal{H},\qquad M_i F \;:=\; \lim_{i \to k,\; \deg k > \deg i}\; F(k)$$

— the homotopy limit over forward arrows out of $i$ into higher strata.

## Dual to latching

The matching functor is the limit-side dual to the [latching functor](latching-functor.md)'s colimit-side. Where latching gathers what arrives at $i$ from below, matching gathers what $i$ must reconcile with above. Together they bracket $F(i)$:

$$L_i F \;\to\; F(i) \;\to\; M_i F$$

— the *latching-to-matching span* whose stabilization $G(L_i F \to M_i F)$ recovers $F(i)$ exactly when $F$ is [SD-constructible](../teaching/explanations/constructibility.md).

## Reedy heritage

In classical model-category theory, $M_i$ being a fibration is one of the two Reedy-fibrancy conditions on diagrams over a Reedy category. The SD ∞-site is the $\infty$-categorical lift of a Reedy category and the matching functor is the lift of the Reedy matching object; SD-constructibility lifts Reedy-fibrant-and-cofibrant.
