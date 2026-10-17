---
kind: definition
realizes: [knowledge-order, truth-order, evidence]
type: algebra
symbol: A
depends-on: [twist-product, entity-set, residuated-lattice]
class: algebra
---

# Predication fiber algebra

Fix a [residuated lattice](residuated-lattice.md) $\mathbf{L}$ and an [entity set](entity-set.md) $E$.
For each [predicate](../concepts/predicate.md) $p$, the **predication fiber algebra** at $p$ is the pointwise [twist product](../../../../../residuated-lattice/content/twist-product/twist-product.md) on the entity-pair index:

$$A_p := \mathbf{L}^{\bowtie\, E \times E}.$$

As an abstract algebra, $A_p$ is the same for every predicate; the subscript $p$ records which predicate's values are held.
An element of $A_p$ is a function $E \times E \to L \times L$ — a value $v(s, o) \in \mathbf{L}^\bowtie$ at each [predication cell](../concepts/predication-cell.md) $(s, p, o)$ with predicate coordinate fixed at $p$.
The [bilattice](bilattice.md) operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ on $\mathbf{L}^\bowtie$ lift pointwise to $A_p$: for example, $(v \wedge_k v')(s, o) := v(s, o) \wedge_k v'(s, o)$.
When $\mathbf{L}$ is distributive, so is $A_p$.
