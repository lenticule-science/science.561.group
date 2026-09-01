---
name: constructibility
type: concept
class: well-formedness
symbol: "\\mathrm{Constr}"
depends-on:
  - cohesive-infinity-topos
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

A diagram $F : \mathcal{I} \to \mathcal{H}$ on a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) is **constructible** when each stratum's value is fully determined by its [latching](../morphisms/latching-functor.md) (forward, degree-raising) input and [matching](../morphisms/matching-functor.md) (backward, degree-lowering) constraints, after stabilization by the modalities $\Box, \Diamond$ and composition by *together*.

Equivalently — and this is the working definition — $F$ is constructible iff for every position $i$ of the stratification, the canonical comparison

$$L_i F \;\to\; F(i) \;\to\; M_i F$$

with $L_i$ the latching object at $i$ and $M_i$ the matching object at $i$ exhibits $F(i)$ as the stabilized reconciliation of the two: $F(i) \simeq G(L_i F \to M_i F)$ where $G$ is the [KZ comonad](kz-comonad.md).

## Used by

- The [SD-ambidexterity theorem](../theorems/sd-ambidexterity.md) — ambidexterity holds *for constructible $F$*.
- The [recursive realization theorem](../theorems/recursive-realization-theorem.md) — recursive realization terminates *on constructible $F$*.
- The [SD-constructible stack](../objects/sd-constructible-stack.md) — the stack of constructible diagrams; this concept names what an object of that stack is.
