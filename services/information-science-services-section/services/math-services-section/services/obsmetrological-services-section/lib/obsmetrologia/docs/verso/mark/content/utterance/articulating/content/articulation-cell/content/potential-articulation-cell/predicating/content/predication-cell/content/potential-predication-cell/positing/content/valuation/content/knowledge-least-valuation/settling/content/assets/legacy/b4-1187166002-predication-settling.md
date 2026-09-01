---
type: definition
realizes: [settling-monotonicity, settling-continuity, settling-quiescence, evidence, knowledge-order, truth-order]
symbol: "(v_\\tau)_{\\tau<\\lambda}"
lean: PredicationCategories.Homebrew.Settling.PredicationSettling.PredicationSettling
depends-on: [predication-valuation, settling-monotonicity, settling-bound, residuated-lattice, predicate-category, entity-set]
---

# Predication settling

Fix a [residuated lattice](residuated-lattice.md) $\mathbf{L}$, a [predicate category](predicate-category.md) $\mathcal{C}$, an [entity set](entity-set.md) $E$, and a [settling bound](settling-bound.md) $\lambda$. A **predication settling** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ in which each $v_\tau$ is a [predication valuation](predication-valuation.md) — assigning to every [predicate](../concepts/predicate.md) $p \in \mathcal{C}$ an element $v_\tau(p) \in A_p$ of the [predication fiber algebra](predication-fiber-algebra.md) at $p$ — and the family satisfies [settling monotonicity](../concepts/settling-monotonicity.md): for all $\sigma \leq \tau < \lambda$ and every $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in $A_p$, where $\leq_k$ is the [knowledge order](../concepts/knowledge-order.md).
