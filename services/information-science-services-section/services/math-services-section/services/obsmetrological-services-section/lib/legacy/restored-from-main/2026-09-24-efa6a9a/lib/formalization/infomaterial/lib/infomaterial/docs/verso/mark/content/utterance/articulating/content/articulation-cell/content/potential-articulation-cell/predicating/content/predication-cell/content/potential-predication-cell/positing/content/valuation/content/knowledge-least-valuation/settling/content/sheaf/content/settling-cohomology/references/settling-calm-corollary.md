---
kind: theorem
status: proved
depends-on: [distributed-settling-system, spatiotemporal-knowledge-presheaf, crdt-convergence, knowledge-order]
---

# knowledge presheaf CALM corollary

settle-based computation is coordination-free: all queries computable as $\leq_k$-monotone functions of the [knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) state can be evaluated without cross-replica coordination.

## Proof

Direct instantiation of the CALM theorem ([@hellerstein-alvaro2020]: knowledge presheaf updates are monotone in the [knowledge order](../concepts/knowledge-order.md) $\leq_k$ — by the [CRDT convergence theorem](crdt-convergence.md) and the underlying [closure-driven settling monotonicity](closure-driven-settling-monotonicity.md) — and CALM says monotonicity is equivalent to coordination-freeness. $\square$
