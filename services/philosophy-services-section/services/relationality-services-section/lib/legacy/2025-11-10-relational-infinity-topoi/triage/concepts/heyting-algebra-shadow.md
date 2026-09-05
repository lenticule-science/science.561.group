---
name: heyting-algebra-shadow
type: concept
class: algebraic-shadow
symbol: "h(\\mathcal{H})"
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md"
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md"
  - cohesive-infinity-topos
---

The **Heyting-algebra shadow** of a [cohesive ∞-topos](cohesive-infinity-topos.md) $\mathcal{H}$ at an object $X$ is the Heyting algebra $h(X)$ of subobjects of $X$ — equivalently, the $(-1)$-truncation of the slice $\mathcal{H}_{/X}$.

The shadow operation is functorial, so the cohesive quadruple $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$ on $\mathcal{H}$ descends to a quadruple of operations on $h(X)$. The [Heyting-closure shadow theorem](../theorems/heyting-closure-shadow.md) is the assertion that this descended quadruple is exactly the four-operation closure of Movement I in the relational-calculus pilot — i.e. that the *complete-Heyting-algebra* structure produced by [Movement I's closure theorem](../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md) is the shadow of the cohesive quadruple.
