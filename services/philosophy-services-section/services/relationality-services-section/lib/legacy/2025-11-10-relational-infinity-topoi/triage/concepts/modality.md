---
name: modality
type: concept
class: modal-operator
symbol: "\\Box, \\Diamond"
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md"
  - cohesive-infinity-topos
---

A **modality** on a [cohesive ∞-topos](cohesive-infinity-topos.md) $\mathcal{H}$ is one of the two middle functors of the cohesive quadruple — $\Box_r$ (necessity) or $\Diamond_l$ (possibility) — read as an *idempotent (co)monad* on $\mathcal{H}$ rather than as an adjoint pair.

## Reading the cohesive quadruple modally

Of the four functors in $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$, the middle two are exactly the operators that endo-act on $\mathcal{H}$:

- $\Box_r := r_! \, r^*\, : \, \mathcal{H} \to \mathcal{H}$ is an **idempotent comonad** (necessity / discrete embedding). $\Box_r X$ is "$X$ stripped of its non-local content."
- $\Diamond_l := s^* \, s_*\, : \, \mathcal{H} \to \mathcal{H}$ is an **idempotent monad** (possibility / codiscrete embedding). $\Diamond_l X$ is "$X$ stripped of its non-global distinctions."

The outer two functors $\Pi^{\to}, \nabla^{\leftarrow}$ leave $\mathcal{H}$ for $\infty\text{-Grpd}$ and so are not modalities in the on-$\mathcal{H}$ sense; the modal reading of the cohesive quadruple is the reading that retains *only* the part that fits on $\mathcal{H}$.

This is exactly the split that drives [RITM](../objects/ritm.md): RITM is the cohesive-quadruple's data *together with* the modal reading of the middle pair as $(\Box, \Diamond)$.

## Relationship to predication-categories' modal operators

Predication categories defines the [modal necessity operator](../../../../theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ on world-indexed [predication fiber algebras](../../../../theories/predication-categories/objects/predication-fiber-algebra.md) — the *bilattice-Kripke* necessity operator. That $\Box_R$ is the **fiberwise shadow** of the cohesive necessity $\Box_r$: pick a [bilattice](../../../../theories/predication-categories/objects/bilattice.md)-valued sheaf on $\mathcal{H}$, restrict $\Box_r$ to the world-indexed fiber, and what remains is exactly the bilattice-Kripke $\Box_R$.

The two modalities — geometric ($\Box_r$ on the topos) and bilattice-fiberwise ($\Box_R$ on the predication algebra) — are linked by the [Heyting-closure shadow theorem](../theorems/heyting-closure-shadow.md) and are the geometric / fiberwise faces of the same operator.
