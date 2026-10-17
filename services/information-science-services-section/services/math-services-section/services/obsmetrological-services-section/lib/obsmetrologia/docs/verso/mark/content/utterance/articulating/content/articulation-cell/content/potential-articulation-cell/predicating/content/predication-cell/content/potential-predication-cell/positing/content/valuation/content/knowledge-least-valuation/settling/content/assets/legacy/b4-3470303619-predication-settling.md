---
name: predication-settling
description: A family v = (v_τ)_{τ < λ} of predication valuations indexed by ordinals up to a settling bound λ, satisfying settling monotonicity v_σ(p) ≤_k v_τ(p) for σ ≤ τ < λ pointwise in A_p. The fundamental dynamic object of predication category theory — a trajectory of valuations in the knowledge order under a closure operator.
indexing-bound: predication-settling
collecting-valuations: predication-valuation
monotonic-in-knowledge-order: predication-settling
object-of-settling-category: predication-settling-category
closure-2-monad: predication-settling
---

Fix a residuated lattice $\mathbf{L}$, a [predicate category](../predicate-category/predicate-category.md) $\mathcal{C}$, an [entity set](../entity-set/entity-set.md) $E$, and a settling bound $\lambda$. A **predication settling** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ in which each $v_\tau$ is a [predication valuation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) — assigning to every predicate $p \in \mathcal{C}$ an element $v_\tau(p) \in A_p$ of the [predication fiber algebra](../predication-fiber-algebra/predication-fiber-algebra.md) at $p$ — and the family satisfies **settling monotonicity**: for all $\sigma \leq \tau < \lambda$ and every $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in $A_p$, where $\leq_k$ is the knowledge order.

## What a settling represents

A settling is a knowledge-monotone trajectory: as $\tau$ advances, the value at every cell either rises in $\leq_k$ or stays fixed. A closure operator on the fiber-algebra drives the trajectory — each step takes the current valuation, applies the operator pointwise at every predicate, and yields the next valuation. The settling-bound $\lambda$ is either the ordinal at which the trajectory stabilizes (the least $\lambda$ with $v_\lambda = v_{\lambda+1}$) or a stipulated cap.

## Stabilization as fixed point

Settling monotonicity gives the family the shape of a chain in the poset $(A_\bullet, \leq_k)$ — pointwise across $\Pi$ and stepwise across ordinals up to $\lambda$. When $\lambda$ is the stabilization ordinal, $v_\lambda$ is a fixed point of the closure operator. The closure-operator fixed-points are exactly the *settled* valuations; a settling is the trajectory by which an asserted starting valuation reaches a settled valuation through closure-rule firing.
