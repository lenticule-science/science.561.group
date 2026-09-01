---
kind: definition
realizes: [evidence, knowledge-order, truth-order]
type: function
symbol: v
depends-on: [predicate, predication-fiber-algebra, settling-bound]
---

# Predication valuation

A function $v$ that assigns to each [predicate](../concepts/predicate.md) $p$ an element $v(p) \in A_p$ of the [predication fiber algebra](predication-fiber-algebra.md) at $p$.
This determines a value $v(p)(s, o) \in \mathbf{L}^\bowtie$ at each [predication cell](../concepts/predication-cell.md) $(s, p, o)$.

When valuations are organized into a settling — a family $v = (v_\tau)_{\tau < \lambda}$ over a [settling bound](settling-bound.md) $\lambda$ — each $v_\tau$ is a predication valuation in the above sense, recording the values assigned at settling step $\tau$.
When the family satisfies [settling monotonicity](../concepts/settling-monotonicity.md), it is the data of a [spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md).
