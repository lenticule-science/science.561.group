---
type: narrative
status: current
introduces: [quorum-consensus, distributed-lock, leader-election]
discusses: [federation-convergence, consistent-hashing]
---

# When CRDT isn't enough

The parent corpus's default discipline for distributed substrate state is *commutative replicated data type* (CRDT) merge. Per [federation-convergence](../../../theorems/federation-convergence.md), substrate operations admit a join in the bilattice $\vee_k$ such that any two replicas of the substrate, given the same set of admitted operations in any order, converge to the same state. Most substrate operations fit this discipline: predication-cell additions are commutative, observed-remove sets are commutative, increment-only counters are commutative, last-writer-wins with monotonic timestamps is commutative.

This subtheory exists because not every operation fits.

## What CRDT can't do

There are four families of operation that genuinely break commutativity:

- **Exclusive resource access.** A distributed lock must grant the lock to exactly one holder at a time. Two holders is a safety violation, not a merge candidate. There is no commutative join that turns "Alice holds the lock" + "Bob holds the lock" into a coherent state — the only coherent answer is "exactly one of them does, and we need to decide which."
- **Sequential ID generation.** A monotonic counter that hands out distinct IDs to each requester cannot be a CRDT counter (which only supports increment, not "give me the next value and ensure no one else sees it"). Two replicas independently handing out ID 42 is a collision; the coherence requires consensus on which replica gets which range or which sequence position.
- **Atomic agreement on a single value.** Some decisions must be made once and the same way everywhere — "the database schema version is now N", "the leader of this cluster is process P". Two replicas disagreeing on the answer is not "we'll merge later"; it's "we have two truths and the system is now incoherent."
- **Election.** A specific case of atomic agreement: who is in charge. Multiple processes simultaneously believing themselves to be in charge is the *split-brain* failure mode that brings down distributed systems.

For these families, the substrate cannot rely on CRDT-merge to converge. It needs a *consensus protocol* — a discipline by which a set of replicas exchange messages until they agree on a single value, and that agreement is then the truth.

## Why this is a complement, not a replacement

A common confusion at this point is to read "CRDT isn't enough" as a critique of the parent's discipline and to propose replacing it with a consensus discipline everywhere. That would be a mistake.

Consensus has costs that CRDT doesn't:

- **Round-trip latency.** A consensus operation requires at least one round-trip to a majority quorum. The substrate's normal operation latency is one local write; consensus is fundamentally slower.
- **Availability under partition.** A consensus operation cannot complete when the participating replicas cannot reach a majority. The substrate's normal operation can; CRDT-merge tolerates arbitrary partition because there is no quorum to fail.
- **Configuration overhead.** A consensus protocol needs a known voter set; adding or removing voters is itself a consensus operation. CRDT-merge has no membership concept; replicas join and leave at will.

Using consensus for operations that don't need it would make the substrate slow and partition-intolerant for the 95% of operations that are commutative. Using CRDT for operations that do need consensus would silently produce incoherent states. The discipline is to recognize which family each operation belongs to and to use the right tool.

This subtheory is the place that recognition lives. Its concepts ([distributed-lock](../teaching/explanations/distributed-lock.md), [quorum-consensus](../teaching/explanations/quorum-consensus.md), [leader-election](../teaching/explanations/leader-election.md), [consistent-hashing](../teaching/explanations/consistent-hashing.md)) name the operation families that need consensus. Its morphisms ([acquire-distributed-lock](../morphisms/acquire-distributed-lock.md), [propose-and-vote](../morphisms/propose-and-vote.md), [elect-leader](../morphisms/elect-leader.md)) are the substrate operations that realize them. Its theorems ([quorum-consensus-safety](../theorems/quorum-consensus-safety.md), [quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md)) state what guarantees the consensus protocols make.

## What makes a problem belong here

The discriminator: ask whether the operation has a *commutative join*. If two replicas independently apply the operation and then exchange state, can the result be reconciled by any merge function? If yes, it's CRDT — leave it in the parent. If no — if the only coherent reconciliation is "we agree on one of the two outcomes and discard the other" — it belongs here.

The discriminator is mechanical. Most operations are CRDT-shaped under inspection (an "exclusive lock" represented as a leased grant with TTL is actually CRDT-mergeable, because the lease determines the holder and lease expiry is monotonic — only the *initial grant* needs consensus). Most consensus needs reduce, on close inspection, to a small number of genuinely-non-commutative operations: leader election, sequential ID allocation, single-value agreement. Once those are isolated, the rest of the substrate can stay CRDT-shaped.

The subtheory's job is to characterize that small number rigorously, supply the operations that handle them safely, and stay out of the way of the parent's CRDT-discipline for everything else. The [open question](../learning/questions/quorum-to-crdt-fallback-under-partition.md) of when fallback is admissible is the boundary maintenance question — when an operation can drift back into the CRDT regime and when it must stay strictly here.
