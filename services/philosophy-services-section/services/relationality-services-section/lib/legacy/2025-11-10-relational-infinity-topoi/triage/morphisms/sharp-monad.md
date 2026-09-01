---
name: sharp-monad
type: morphism
class: idempotent-monad
symbol: "\\Diamond_l"
realizes: [modality]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md"
  - cohesive-quadruple
  - modality
---

The **sharp monad** $\Diamond_l : \mathcal{H} \to \mathcal{H}$ is the third functor of the [cohesive quadruple](cohesive-quadruple.md), acting as an *idempotent monad* on the [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$.

## Definition

$\Diamond_l$ is the composite $s^*\, s_*$ in which $s_* : \mathcal{H} \to \infty\text{-Grpd}$ is the global-sections functor $\Gamma$ and $s^* : \infty\text{-Grpd} \to \mathcal{H}$ is its further right adjoint, the *codiscrete-objects* embedding. The composite is an idempotent monad on $\mathcal{H}$ whose image consists of *codiscrete* objects — those $X \in \mathcal{H}$ on which all global-sections data has been collapsed into local form.

## Modal reading

As an idempotent monad, $\Diamond_l$ is a **possibility modality**: $\Diamond_l X$ is "$X$ projected onto what is possibly / globally true." Algebras for $\Diamond_l$ — equivalently, $\Diamond_l$-modal objects — are the *Relational Topology* (RT) sub-modality of [RITM](../objects/ritm.md).

## Relationship to the bilattice-Kripke possibility

Predication categories' [modal possibility operator](../../../../theories/predication-categories/morphisms/modal-possibility-operator.md) on world-indexed [predication fiber algebras](../../../../theories/predication-categories/objects/predication-fiber-algebra.md) is the *fiberwise shadow* of $\Diamond_l$, dual to the necessity-side relationship between the [flat comonad](flat-comonad.md) and the bilattice-Kripke necessity.

## KZ structure

$\Diamond_l$ is naturally a KZ-monad: the multiplication $\mu : \Diamond_l \Diamond_l \Rightarrow \Diamond_l$ is right adjoint to $\eta \Diamond_l$ with identity counit. The lax-idempotence makes $\Diamond_l$-modal objects a coreflective full sub-$\infty$-category of $\mathcal{H}$, and is exactly what the [RT self-stabilization theorem](../theorems/rt-self-stabilization.md) needs.

## Composite with flat

The composite $G := \Box_r \, \Diamond_l$ is the [KZ comonad on $\mathcal{H}$](kz-comonad-G.md) — the directed-flow operator that the relational-calculus pilot's [Flow](../../../../../relational-calculus/triage/concepts/flow.md) names.
