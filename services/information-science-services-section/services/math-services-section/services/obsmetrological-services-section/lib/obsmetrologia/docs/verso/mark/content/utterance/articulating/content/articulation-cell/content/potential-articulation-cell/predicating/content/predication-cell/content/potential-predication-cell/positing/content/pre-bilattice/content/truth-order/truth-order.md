---
type: concept
class: order
symbol: "\\leq_t"
depends-on: [pre-bilattice]
---

# Truth order

The order, denoted $\leq_t$, associated with the first lattice $\langle B, \wedge_t, \vee_t \rangle$ of a [pre-bilattice](../objects/pre-bilattice.md).
When the lattice is bounded, the truth order has bottom $\mathbf{f}$ and top $\mathbf{t}$.

In a [twist product](../objects/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the truth order is $\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle$ iff $a_1 \leq_1 b_1$ in $\mathbf{L}_1$ and $b_2 \leq_2 a_2$ in $\mathbf{L}_2$.
The truth order raises positive [evidence](evidence.md) and lowers negative evidence.

On a [bilattice](../objects/bilattice.md), [negation](negation.md) is antitone in the truth order: $a \leq_t b \Rightarrow \sim b \leq_t \sim a$.
