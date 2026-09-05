---
name: predication settling
description: A family v = (v_τ)_{τ<λ} of predication valuations indexed by ordinals up to a settling bound λ, satisfying settling monotonicity v_σ(p) ≤_k v_τ(p) for σ ≤ τ < λ pointwise in A_p. The fundamental dynamic object of predication category theory — a trajectory of valuations in the knowledge order under a closure operator.
modeling-morphism: predication-settling
predication-settling-preorder-morphism: predication-settling
closure-2-monad: predication-settling
---

Fix a residuated lattice $\mathbf{L}$, a [predicate category](predicate-category.md) $\mathcal{C}$, an [entity set](entity-set.md) $E$, and a settling bound $\lambda$. A **predication settling** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ in which each $v_\tau$ is a [predication valuation](predication-valuation.md) — assigning to every predicate $p \in \mathcal{C}$ an element $v_\tau(p) \in A_p$ of the [predication fiber algebra](predication-fiber-algebra.md) at $p$ — and the family satisfies settling monotonicity: for all $\sigma \leq \tau < \lambda$ and every $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in $A_p$, where $\leq_k$ is the knowledge order.
