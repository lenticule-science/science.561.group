---
name: sd-constructible-stack
type: object
class: stack
symbol: "\\mathfrak{M}^{\\mathrm{Constr}}_{\\mathcal{S}}"
realizes: [constructibility]
depends-on: [stratified-directed-infinity-site, constructibility, relational-infinity-topos]
---

The **SD-constructible stack** of a [stratified directed ∞-site](stratified-directed-infinity-site.md) $\mathcal{S}$ in a [relational ∞-topos](relational-infinity-topos.md) $(\mathcal{H}, \mathbf{B}, \mathcal{S})$ is the $\infty$-stack

$$\mathfrak{M}^{\mathrm{Constr}}_{\mathcal{S}} \;:\; \mathcal{H}^{\mathrm{op}} \to \infty\text{-Grpd}$$

assigning to each $X \in \mathcal{H}$ the $\infty$-groupoid of [SD-constructible](../teaching/explanations/constructibility.md) diagrams $F : \mathcal{S} \to \mathcal{H}_{/X}$ over $X$.

## Universal property

The SD-constructible stack is the *terminal* SD-stratified well-formed diagram: any well-formed diagram on $\mathcal{S}$ factors uniquely through it. This is the geometric face of the relational-calculus pilot's claim that constructibility is the "forced" assembly: the universal forcing is the universal property of $\mathfrak{M}^{\mathrm{Constr}}_{\mathcal{S}}$.

## Interaction with theorems

- The [SD-ambidexterity theorem](../theorems/sd-ambidexterity.md) holds *over* this stack: ambidexterity is the assertion that every point of the stack admits a canonical norm-map equivalence.
- The [recursive realization theorem](../theorems/recursive-realization-theorem.md) is a *constructive* presentation of points of this stack: every point is the recursive realization of its degree-0 input.
- The [Verdier duality functor on the SD site](../morphisms/verdier-duality-functor.md) acts on this stack as an autoequivalence — its [theorem](../theorems/verdier-duality-on-sd-site.md) states the action.
