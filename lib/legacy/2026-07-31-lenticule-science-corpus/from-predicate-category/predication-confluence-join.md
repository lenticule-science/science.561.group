---
type: morphism
class: operator
symbol: "\\nabla_k"
status: proved
depends-on: [predicatory-confluence, predication-settling-category, predication-settling-category-completeness, knowledge-order]
see-also: [knowledge-join, crdt-convergence]
---

# Confluence join

The **confluence join** is the canonical common-successor operator for divergent predication settlings:

$$\nabla_k(u,w) := u \vee_k w.$$

It is computed pointwise over settling ordinals, predicates, entity pairs, and bilattice values:

$$(u \vee_k w)_\tau(p)(s,o) := u_\tau(p)(s,o) \vee_k w_\tau(p)(s,o).$$

By [predication settling category completeness](../theorems/predication-settling-category-completeness.md), this pointwise join is again a predication settling. If $v \leq_k u$ and $v \leq_k w$, then $u \leq_k u \vee_k w$ and $w \leq_k u \vee_k w$, so $\nabla_k(u,w)$ is a common successor of both branches in $\mathbf{PS}$.

The operator is the order-theoretic core of predicatory confluence. Operational confluence is the stronger claim that the paths from $u$ and $w$ to $u \vee_k w$ can be realized by the admitted update operations.

