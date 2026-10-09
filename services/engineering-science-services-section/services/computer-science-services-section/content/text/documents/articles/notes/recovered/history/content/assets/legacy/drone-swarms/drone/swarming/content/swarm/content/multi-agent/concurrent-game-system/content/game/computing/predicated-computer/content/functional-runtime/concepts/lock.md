---
type: concept
class: concurrency-primitive
depends-on: [predication-cell, settlement-determinism, predication-fiber-algebra, modal-necessity-operator]
see-also: [channel, async-future, locks-as-cardinality-refined-modal-restriction]
---

# Lock

A *substrate-recorded mutual-exclusion primitive*: a lock guarantees that at most one substrate operation holds it at a time, providing exclusive-access semantics for resources that don't compose under [federation-convergence](../../../theorems/federation-convergence.md)'s commutative merge.

Structurally — per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md) — a lock is a fiber $A_{p_L}$ of the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) with two structural commitments: (1) a *cardinality refinement* on the holder coordinate (at most one $\mathbf{t}$-holder cell at a time), and (2) a *modal-restriction discipline* admitting protected operations only when [modal necessity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_L}$ holds along the lock's accessibility relation $R_L$. [Acquire](../morphisms/acquire.md) is left-multiplication by the holder cell $\mathbf{t}_h$; [release](../morphisms/release.md) is the matching right residuation. The cardinality refinement is what distinguishes a lock from a [channel](channel.md): a channel uses the same residuation adjunction but without the refinement, so it $\vee_k$-merges across federation cleanly; the lock's refinement forfeits that property and is precisely what mutual exclusion costs.

A lock has the structure:

- **Lock-id** — substrate identifier.
- **Resource** — what the lock protects (a substrate entity, a scope, an external resource).
- **Holder** — currently held by which substrate operation, agent, or function-invocation context. Absent when the lock is free.
- **Waiters** — substrate operations queued to acquire the lock once it's released.
- **Acquisition policy** — `fair` (FIFO), `priority`, `preemptive`.
- **Timeout policy** — what happens when an acquisition wait exceeds a threshold.

Per [self-representation](../../teaching/explanations/self-representation.md), locks are substrate content. Lock acquisition, release, and contention events are substrate operations producing witnesses.

Locks vs. CRDT-shaped concurrency:

- **CRDT** (per [federation-convergence](../../../theorems/federation-convergence.md)): the substrate's default discipline. Concurrent operations commute via bilattice $\vee_k$ join; no coordination required.
- **Lock**: for cases where commutativity doesn't hold and exclusive access is needed. Locks are *less* substrate-friendly because they require coordination.

The exact structural reason for the trichotomy: per Part 5 of [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md), the lock's cardinality refinement is *not* a $\vee_k$-sub-semilattice of $A_{p_L}$. Two simultaneous acquires on different substrates merge under $\vee_k$ to two $\mathbf{t}$-holder cells, violating the refinement. CRDT operations on the unrefined fiber commute by the closure-merge commutation lemma of [crdt-convergence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md); lock operations on the refined fiber do not. The trichotomy below — use CRDTs by default, locks for non-commutative single-substrate cases, distributed locks for cross-substrate — is the engineering consequence of which $\vee_k$-confluence properties hold on each fiber type.

The substrate's discipline:

- **Use CRDTs by default.** Per [federation-convergence](../../../theorems/federation-convergence.md), most substrate operations don't need locks.
- **Use locks for non-commutative operations.** When the operation's effect depends on order (counter increment-and-read, sequential ID generation), a lock is required.
- **Locks are not federation-portable.** A lock held on substrate $A$ does not extend to substrate $B$ — structurally, because the cardinality refinement fails $\vee_k$-confluence per Part 5 of [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md). For cross-substrate exclusive access, the substrate escalates to the [distributed-coordination-platform](../../distributed-coordination-platform/_index.md) and reaches a unique global holder via [consensus-as-h0-construction](../../distributed-coordination-platform/theorems/consensus-as-h0-construction.md); the cross-substrate object is a [distributed-lock-record](../../distributed-coordination-platform/objects/distributed-lock-record.md), not a federation-extended lock-record.
- **Lock contention is observable.** Per [witness](../../../objects/witness.md), lock acquisition waits and contention events are recorded; auditors can identify lock-bottlenecks in substrate behavior.

Per [acquire](../morphisms/acquire.md) and [release](../morphisms/release.md), locks are acquired and released through substrate operations. Lock-holding operations are bounded by the lock's timeout policy.
