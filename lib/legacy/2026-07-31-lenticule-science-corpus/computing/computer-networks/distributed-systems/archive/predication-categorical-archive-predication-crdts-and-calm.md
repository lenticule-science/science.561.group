---
type: narrative
discusses: [distributed-settling-system, crdt-convergence, settling-calm-corollary, settling-merge-semilattice]
---

# predication settlings as a structurally enriched CRDT class

The [CRDT convergence theorem](../../theorems/crdt-convergence.md) establishes that a [distributed settling system](../../objects/distributed-settling-system.md) forms a CRDT class in the sense of [@shapiro-et-al2011]. The CALM theorem ([@hellerstein-alvaro2020] — that monotone computations are coordination-free — applies directly via the [predication settling CALM corollary](../../theorems/settling-calm-corollary.md).

This places predication settlings in the distributed-systems literature as a *structurally enriched* CRDT: more algebraic than a plain join-semilattice, but retaining the same convergence guarantees. The bilattice values give a richer state space than a simple semilattice; the settling structure gives a notion of inferential propagation absent from generic CRDTs; the predicate-category structure gives a naturality condition on the morphisms between fibers. Yet the CRDT machinery operates on the underlying $\leq_k$-semilattice, so the convergence theorem of Shapiro et al. lifts unchanged via the [predication settling merge semilattice](../../theorems/settling-merge-semilattice.md) result.

Related lattice-theoretic distributed-programming models — Kuper and Newton's LVars (2013, 2014) and Conway, Marczak, Alvaro, Hellerstein, and Maier's Bloom$^L$ (2012) — apply the same monotonicity principle at the language level. predication settlings provide the corresponding bilattice-valued model-theoretic substrate: any distributed system whose state can be modeled as a predication settling inherits eventual consistency without coordination. This includes distributed knowledge-graph stores, multi-agent belief systems, and decentralized reasoning systems where inference rules — encoded in the [closure operator](../../morphisms/closure-operator.md) — can be applied locally without cross-replica synchronization.

The delta-state CRDTs of [@almeida-et-al2018] specialize naturally: practical predication settling implementations ship the individual writes $u \in U$ rather than full states, with merge invariant under representation choice.
