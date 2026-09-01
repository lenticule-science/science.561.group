---
kind: theorem
status: proved
depends-on: [distributed-settling-system, spatiotemporal-knowledge-presheaf, knowledge-order, twist-product]
---

# knowledge presheaf merge is a semilattice operation

The pointwise [knowledge-order](../concepts/knowledge-order.md) join $\vee_k$ on [spatiotemporal knowledge presheaves](../objects/spatiotemporal-knowledge-presheaf.md) — the merge operation of a [distributed settling system](../objects/distributed-settling-system.md) — is commutative, associative, and idempotent.

## Proof

Pointwise lift of the knowledge-order join being a semilattice operation on $\mathbf{L}^\bowtie$.
Commutativity, associativity, and idempotence of $\vee_k$ on $\mathbf{L}^\bowtie$ pass to pointwise application across the entity-pair index $E \times E$, predicates, and settling steps. $\square$
