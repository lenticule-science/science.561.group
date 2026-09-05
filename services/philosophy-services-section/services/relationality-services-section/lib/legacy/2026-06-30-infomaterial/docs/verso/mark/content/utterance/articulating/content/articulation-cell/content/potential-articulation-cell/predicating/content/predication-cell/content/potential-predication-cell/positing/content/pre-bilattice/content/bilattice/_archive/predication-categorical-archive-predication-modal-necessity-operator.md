---
type: morphism
class: operator
symbol: "\\Box_R"
depends-on: [world-set, bilattice-accessibility-relation, predication-fiber-algebra, twist-product-right-residual, truth-order]
---

# Modal necessity operator

The **modal necessity operator** $\Box_R$ acts on world-indexed valuations: for a family $u = (u_w)_{w \in W}$ over a [world set](../objects/world-set.md) $W$, where each $u_w \in A_p$ is in the [predication fiber algebra](../objects/predication-fiber-algebra.md) at some [predicate](teaching/explanations/predicate.md) $p$,

$$(\Box_R u)_w(s, o) := \bigwedge_t \{ R(w, w') \to u_{w'}(s, o) : w' \in W \},$$

where $\bigwedge_t$ is the [truth-order](teaching/explanations/truth-order.md) meet on $\mathbf{L}^\bowtie$, $R$ is a [bilattice accessibility relation](../objects/bilattice-accessibility-relation.md), and $\to$ is the strong implication on $\mathbf{L}^\bowtie$ — equivalently, the [twist-product right residual](twist-product-right-residual.md) $\Rightarrow$ restricted to per-cell action.

This is the four-valued analogue of the classical Kripke necessity operator. When $\mathbf{L} = \mathbf{2}$ and $R$ is $\{0, 1\}$-valued, $\Box_R$ reduces to the classical Boolean necessity operator.
