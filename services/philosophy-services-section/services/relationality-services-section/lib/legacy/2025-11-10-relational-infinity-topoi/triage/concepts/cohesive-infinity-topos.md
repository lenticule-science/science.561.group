---
name: cohesive-infinity-topos
type: concept
class: topos
symbol: "\\mathcal{H}"
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md"
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md"
  - "../../../../../relational-calculus/triage/concepts/cohesive-chain.md"
---

A **cohesive ∞-topos** is an $(\infty, 1)$-topos $\mathcal{H}$ over the base $\infty$-topos $\infty\text{-Grpd}$ whose global-sections geometric morphism extends to an adjoint quadruple

$$\Pi^{\to} \;\dashv\; \Box_r \;\dashv\; \Diamond_l \;\dashv\; \nabla^{\leftarrow}\; :\; \mathcal{H} \;\to\; \infty\text{-Grpd}$$

in which the outer two adjoints $\Pi^{\to}$ and $\nabla^{\leftarrow}$ preserve finite products. The middle two ($\Box_r$ as the *idempotent comonad* on $\mathcal{H}$ obtained as $\Box_r := r_!\, r^*$ from the discrete-objects right adjoint $r_!$, and $\Diamond_l := s^*\, s_*$ from the codiscrete-objects left adjoint $s^*$) compose into the *flow comonad* $G := \Box_r\, \Diamond_l$ that animates the topos's directed dynamics.

The four functors are the *cohesive quadruple*; this subtheory's [`morphisms/cohesive-quadruple.md`](../morphisms/cohesive-quadruple.md) types it as a single morphism-of-data, and the [`objects/relational-infinity-topos.md`](../objects/relational-infinity-topos.md) packages the entire $(\mathcal{H}, \Pi^{\to}, \Box_r, \Diamond_l, \nabla^{\leftarrow})$ tuple as one typed object.

## Position in this subtheory

Every typed object and morphism in this subtheory ultimately depends on this concept: the [relational ∞-topos](../objects/relational-infinity-topos.md) *is* a cohesive ∞-topos with extra structure (a chosen [bilattice](../../../../theories/predication-categories/objects/bilattice.md) of valuations and a directed refinement to a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md)); [RITM](../objects/ritm.md) *is* the modal reading of the cohesive quadruple; the [Heyting-closure shadow](../theorems/heyting-closure-shadow.md) is the statement that the cohesive quadruple, restricted to a Heyting-algebra fiber, reduces to the four operations of the [Movement-I closure theorem](../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md).

## Cross-vault relationships

- The relational-calculus pilot's [cohesive chain](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) is the *narrative* version of this concept; this concept types it as an $(\infty, 1)$-topos.
- Predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) is the *1-categorical* analogue of the flow comonad $G = \Box_r\, \Diamond_l$ — see the [kz-comonad-vs-closure-2-monad question](../questions/kz-comonad-vs-closure-2-monad.md) for the relationship.

## Models

The minimal model is the [presheaf cell](../examples/minimal-presheaf-cell.md) $\mathrm{PSh}(\{0 \to 1\})$ over the walking arrow. Larger models include $\mathrm{PSh}(\mathrm{CartSp})$ on Cartesian spaces and Schreiber's "synthetic differential ∞-cohesion" — see [presheaf-vs-cartsp-base](../questions/presheaf-vs-cartsp-base.md) for the choice.
