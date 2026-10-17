---
kind: concept
type: order
symbol: "\\leq_k"
depends-on: [pre-bilattice]
---

# Knowledge order

The order, denoted $\leq_k$, associated with the second lattice $\langle B, \wedge_k, \vee_k \rangle$ of a [pre-bilattice](../../pre-bilattice.md). When the lattice is bounded, the knowledge order has bottom $\bot$ and top $\top$.

In a [twist product](../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the knowledge order is $\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle$ iff $a_1 \leq_1 b_1$ in $\mathbf{L}_1$ and $a_2 \leq_2 b_2$ in $\mathbf{L}_2$. The knowledge order raises both positive and negative [evidence](evidence.md).

On a [bilattice](../objects/bilattice.md), [negation](negation.md) is monotone in the knowledge order: $a \leq_k b \Rightarrow \sim a \leq_k \sim b$.

The [settling monotonicity](settling-monotonicity.md) condition asserts that knowledge values accumulate monotonically in $\leq_k$, growing as evidence is added and never retracted.
