---
type: concept
class: condition
depends-on: [predication-valuation, settling-bound, knowledge-order]
---

# Settling monotonicity

The condition on a settle-indexed family $v = (v_\tau)_{\tau < \lambda}$ of [predication valuations](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) over a [settling bound](../objects/settling-bound.md) $\lambda$ that, for all $\sigma \leq \tau < \lambda$ and every [predicate](predicate.md) $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$, where $\leq_k$ is the [knowledge order](knowledge-order.md).

Settling monotonicity ensures that values in $\leq_k$ grow over time: no information is retracted, and conflicts accumulate as $\top$ rather than trivializing.
