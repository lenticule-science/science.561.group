---
type: concept
class: condition
depends-on: [predication-settling, settling-bound]
---

# Settling quiescence

A [predication settling](../objects/predication-settling.md) $v = (v_\tau)_{\tau < \lambda}$ is **quiescent at $\tau^*$** if for every [predicate](predicate.md) $p$ and every $\tau$ with $\tau^* \leq \tau < \lambda$,

$$v_\tau(p) = v_{\tau^*}(p).$$

A quiescent settling has stabilized at $\tau^*$: no further changes occur at any subsequent step within the [settling bound](../objects/settling-bound.md) $\lambda$.
