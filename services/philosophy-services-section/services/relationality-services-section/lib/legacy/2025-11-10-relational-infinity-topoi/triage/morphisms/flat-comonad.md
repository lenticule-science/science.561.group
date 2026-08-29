---
name: flat-comonad
type: morphism
class: idempotent-comonad
symbol: "\\Box_r"
realizes: [modality]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md"
  - cohesive-quadruple
  - modality
---

The **flat comonad** $\Box_r : \mathcal{H} \to \mathcal{H}$ is the second functor of the [cohesive quadruple](cohesive-quadruple.md), acting as an *idempotent comonad* on the [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$.

## Definition

$\Box_r$ is the composite $r_!\, r^*$ in which $r^* : \mathcal{H} \to \infty\text{-Grpd}$ is the [shape functor](shape-functor.md) $\Pi^{\to}$ (here viewed as the *connected components* part of the global-sections geometric morphism) and $r_! : \infty\text{-Grpd} \to \mathcal{H}$ is its further left adjoint, the *discrete-objects* embedding. The composite is an idempotent comonad on $\mathcal{H}$ whose image consists of *discrete* objects — those $X \in \mathcal{H}$ whose local-cohesion content is trivial.

## Modal reading

As an idempotent comonad, $\Box_r$ is a **necessity modality**: $\Box_r X$ is "$X$ stripped to what is necessarily / locally true at every point of $X$." Coalgebras for $\Box_r$ — equivalently, $\Box_r$-modal objects — are the *Relational Dynamics* (RD) sub-modality of [RITM](../objects/ritm.md).

## Relationship to the bilattice-Kripke necessity

Predication categories' [modal necessity operator](../../../../theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ on world-indexed [predication fiber algebras](../../../../theories/predication-categories/objects/predication-fiber-algebra.md) is the *fiberwise shadow* of $\Box_r$: pick a $\mathbf{B}$-valued sheaf, restrict $\Box_r$ to its world-indexed fiber, and what survives is exactly $\Box_R$. This is one direction of the [Heyting-closure shadow theorem](../theorems/heyting-closure-shadow.md).

## KZ structure

$\Box_r$ is naturally a KZ-comonad in the sense of [Kock](../references/kock-1995.md): the comultiplication $\delta : \Box_r \Rightarrow \Box_r \Box_r$ is left adjoint to $\Box_r \varepsilon$ with identity unit. This lax-idempotence makes $\Box_r$-modal objects a reflective full sub-$\infty$-category of $\mathcal{H}$.
