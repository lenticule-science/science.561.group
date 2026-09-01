---
name: cohesive-quadruple
type: morphism
class: adjoint-quadruple
symbol: "\\Pi^{\\to} \\dashv \\Box_r \\dashv \\Diamond_l \\dashv \\nabla^{\\leftarrow}"
realizes: [cohesive-infinity-topos]
depends-on:
  - cohesive-infinity-topos
  - "../../../../../relational-calculus/triage/concepts/cohesive-chain.md"
---

The **cohesive quadruple** of a [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$ is the adjoint quadruple

$$\Pi^{\to} \;\dashv\; \Box_r \;\dashv\; \Diamond_l \;\dashv\; \nabla^{\leftarrow}\; :\; \mathcal{H} \;\to\; \infty\text{-Grpd}$$

with $\Pi^{\to}$ and $\nabla^{\leftarrow}$ product-preserving (Lawvere's *connectedness* axiom) and the middle two functors composing into the [KZ comonad](kz-comonad-G.md) $G := \Box_r \, \Diamond_l$ on $\mathcal{H}$.

## Names of the four functors

| Symbol | Name (Lawvere–Schreiber) | English | Role |
|---|---|---|---|
| $\Pi^{\to}$ | shape | Shape | connected-components / outline |
| $\Box_r$ | flat | Flat / Discrete | discrete embedding (purely local) |
| $\Diamond_l$ | sharp | Sharp / Codiscrete | codiscrete embedding (purely global) |
| $\nabla^{\leftarrow}$ | crisp | Crisp / Global | global sections / coherent integration |

The Lawvere–Schreiber notation is the chosen primary; the English names are kept for prose reference; the modal-only $(\Box, \Diamond)$ notation is used in the modal reading [RITM](../objects/ritm.md). The three-functor variant $\Sigma \dashv \blacktriangleright \dashv \Pi$ from source draft 3 is recorded as the [cohesive-quadruple-notation question](../questions/cohesive-quadruple-notation.md).

## Each functor as morphism

Each functor is given its own typed morphism file:

- [`shape-functor`](shape-functor.md) — $\Pi^{\to}$.
- [`flat-comonad`](flat-comonad.md) — $\Box_r$.
- [`sharp-monad`](sharp-monad.md) — $\Diamond_l$.
- [`crisp-functor`](crisp-functor.md) — $\nabla^{\leftarrow}$.

This morphism types the *quadruple* — the relations between the four — as the adjoint chain.

## Relationship to the cohesive chain

The relational-calculus pilot's [cohesive chain](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) names the same four functors as a *concept*. This morphism types it: the `depends-on:` link is the typing relationship.

## Closes

This morphism `closes` the chapter anchored by [`cohesive-infinity-topos`](../teaching/explanations/cohesive-infinity-topos.md): it is the structural move that completes the concept's definition into a fully specified object.
