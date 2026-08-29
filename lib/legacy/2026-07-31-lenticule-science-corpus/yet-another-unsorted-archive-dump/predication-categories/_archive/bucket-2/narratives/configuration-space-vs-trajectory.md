---
type: narrative
recaps: [predication-fiber-functor, predication-fiber-algebra, predication-settling]
---

# Configuration space vs. trajectory

The data of a [predication settling](../objects/predication-settling.md) decomposes into two structurally distinct parts.

The first is the [predication fiber functor](../theorems/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$, which assigns to each predicate its [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie\, E \times E}$. The fiber functor depends only on the base parameters $(\mathbf{L}, \mathcal{C}, E)$ — not on any specific settling — and is shared across every predication settling over the same base.

The second is the settling trajectory $(v_\tau)_{\tau < \lambda}$ of valuations in the product $\prod_p A_p$. Two predication settlings over the same base differ only in their trajectories.

This is the configuration-space-versus-trajectory split familiar from physical state-space dynamics: the fiber functor specifies the configuration space — the set of all possible valuations — and is fixed by the parameters of the system. The settling is a path through this space, evolving in the [knowledge order](../concepts/knowledge-order.md) $\leq_k$ as evidence accumulates and inference fires.

The split is not just expository: it determines what is parameterized in the moduli layer. The base parameters $(\mathbf{L}, \mathcal{C}, E)$ give a family of predication settlings over a common configuration space; varying the base is a second order of variation — the moduli of configuration spaces themselves — handled by the [settling moduli stack](../theorems/settling-moduli-stack-theorem.md) over the [parameter base category](../objects/parameter-base-category.md).
