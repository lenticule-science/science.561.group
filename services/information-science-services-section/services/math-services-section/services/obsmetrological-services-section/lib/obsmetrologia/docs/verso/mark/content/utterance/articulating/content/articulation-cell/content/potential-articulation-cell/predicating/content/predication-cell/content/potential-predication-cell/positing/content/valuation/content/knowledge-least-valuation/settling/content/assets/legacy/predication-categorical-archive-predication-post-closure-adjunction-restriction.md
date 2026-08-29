---
type: theorem
status: proved
depends-on: [four-bilattice, twist-product-fusion, twist-product-right-residual, twist-product-residuation, truth-order, settling-quiescence]
---

# Post-closure adjunction restriction

The subset $\{\mathbf{t}, \mathbf{f}, \top\} \subseteq$ [$\mathbf{FOUR}$](../objects/four-bilattice.md) is closed under the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$. The monoidal identity $\top$ lies in $\{\mathbf{t}, \mathbf{f}, \top\}$, and the [twist-product residuation](twist-product-residuation.md) adjunction restricts:

$$a \odot p \leq_t q \iff p \leq_t (a \Rightarrow q) \quad \text{for } a, p, q \in \{\mathbf{t}, \mathbf{f}, \top\},$$

where $\leq_t$ is the [truth order](teaching/explanations/truth-order.md).

## Proof

**Closure under $\odot, \Rightarrow$.** Enumeration on the 9 ordered pairs of $\{\mathbf{t}, \mathbf{f}, \top\} \times \{\mathbf{t}, \mathbf{f}, \top\}$: each $a \odot b$ and $a \Rightarrow b$ computed from the twist-product fusion and right-residual formulas lies in $\{\mathbf{t}, \mathbf{f}, \top\}$.

**Identity in subset.** The monoidal unit $\top \in \{\mathbf{t}, \mathbf{f}, \top\}$.

**Adjointness restriction.** The full $\odot \dashv \Rightarrow$ adjunction of the [twist-product residuation theorem](twist-product-residuation.md) restricts to the subset because the subset contains witnesses for all $a, p, q$. $\square$

## Interpretation

When a settling reaches [quiescence](teaching/explanations/settling-quiescence.md), $\bot$-valued cells correspond to predicate-triples on which no evidence can be inferred by the closure. The effective algebra after quiescence operates on $\{\mathbf{t}, \mathbf{f}, \top\}$ — the "told something" sub-algebra of $\mathbf{FOUR}$.
