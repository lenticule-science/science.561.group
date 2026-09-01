---
type: theorem
status: proved
depends-on: [distributed-settling-system, predication-settling, crdt-convergence, knowledge-order]
---

# predication settling CALM corollary

settle-based computation is coordination-free: all queries computable as $\leq_k$-monotone functions of the [predication settling](../objects/predication-settling.md) state can be evaluated without cross-replica coordination.

## Proof

Direct instantiation of the CALM theorem ([@hellerstein-alvaro2020]: predication settling updates are monotone in the [knowledge order](../concepts/knowledge-order.md) $\leq_k$ — by the [CRDT convergence theorem](crdt-convergence.md) and the underlying [closure-driven settling monotonicity](closure-driven-settling-monotonicity.md) — and CALM says monotonicity is equivalent to coordination-freeness. $\square$
