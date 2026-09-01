---
type: morphism
class: operator
symbol: "\\Diamond_R"
depends-on: [world-set, bilattice-accessibility-relation, predication-fiber-algebra, twist-product-fusion, truth-order]
---

# Modal possibility operator

The **modal possibility operator** $\Diamond_R$ acts dually to the [modal necessity operator](modal-necessity-operator.md): for a family $u = (u_w)_{w \in W}$ over a [world set](../objects/world-set.md) $W$, where each $u_w \in A_p$ is in the [predication fiber algebra](../objects/predication-fiber-algebra.md) at some [predicate](../concepts/predicate.md) $p$,

$$(\Diamond_R u)_w(s, o) := \bigvee_t \{ R(w, w') \odot u_{w'}(s, o) : w' \in W \},$$

where $\bigvee_t$ is the [truth-order](../concepts/truth-order.md) join on $\mathbf{L}^\bowtie$, $R$ is a [bilattice accessibility relation](../objects/bilattice-accessibility-relation.md), and $\odot$ is the [twist-product fusion](twist-product-fusion.md) per-cell.

This is the four-valued analogue of the classical Kripke possibility operator. When $\mathbf{L} = \mathbf{2}$ and $R$ is $\{0, 1\}$-valued, $\Diamond_R$ reduces to the classical Boolean possibility operator.
