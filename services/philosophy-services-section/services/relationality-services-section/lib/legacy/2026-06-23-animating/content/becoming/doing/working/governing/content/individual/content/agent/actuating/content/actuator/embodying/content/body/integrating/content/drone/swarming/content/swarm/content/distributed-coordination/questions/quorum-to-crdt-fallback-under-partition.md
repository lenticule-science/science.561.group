---
type: question
status: open
explores: [quorum-consensus, distributed-lock, federation-convergence, quorum-safety-under-partition]
---

# When is fallback from quorum-consensus to CRDT-merge admissible under partition?

The parent's discipline default is CRDT-merge: per [federation-convergence](../../../theorems/federation-convergence.md), substrate operations are commutative and replicas converge regardless of arrival order. Distributed-coordination-platform's discipline is consensus-when-CRDT-can't-suffice — exclusive locks, sequential ID generation, atomic agreement on a single value, leader election. Per [quorum-consensus-safety](../theorems/quorum-consensus-safety.md), consensus protocols guarantee that two values are never both decided in the same instance, provided fewer than majority of voters fail.

Network partition is the case where this tradeoff bites. A consensus protocol blocks under partition: when a quorum is unreachable, the protocol cannot make progress. The system has two choices: *wait for the partition to heal* (preserving the consensus safety guarantee but losing availability) or *fall back to CRDT-merge* (preserving availability but losing the consensus safety guarantee for operations admitted during the partition).

The fallback is sometimes admissible and sometimes not. The question is what discipline declares which.

## Concrete cases that would resolve the question

1. **Per-operation classification.** Each substrate operation declares whether it can degrade. Exclusive-lock acquisition cannot degrade — granting two locks in two partitions is a safety violation. ID generation can degrade if the ID-allocator is sharded so each partition draws from a disjoint range. The discipline is per-operation metadata: a `degrade-policy: {block, crdt-fallback, sharded-fallback}` field on the operation's record.

2. **Per-cell classification.** Each predication cell declares its discipline. Cells whose predicates are CRDT-shaped (counters, sets, observed-remove sets) tolerate partition trivially; cells whose predicates are consensus-shaped (single-value-with-history, exclusive-resource) block under partition. The discipline lives in the predicate-schema rather than in the operation.

3. **Per-deployment policy.** The substrate deployment declares a global posture (CP or AP per CAP). All operations follow the deployment's posture; operations that cannot live under the chosen posture are simply unavailable in that deployment. The discipline is deployment-time configuration.

4. **Witness-recorded degradation.** Operations admitted during partition are tagged in the witness chain with a `degraded: true` marker; on partition-heal, the substrate runs a reconciliation pass that surfaces conflicts (per the [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) $\top$-disagreement) for human or rule-based resolution. The discipline is in the recovery rather than in the prevention.

## Why the question matters

[quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md) currently states the consensus-safety guarantee under partition assuming the protocol simply blocks. The theorem is silent on what happens if the substrate operator (or deployment policy) chooses to admit non-quorum operations during the partition. Without an explicit fallback discipline, every realization invents its own ad-hoc policy (etcd refuses writes; Cassandra accepts writes with last-writer-wins on heal; Riak accepts writes with sibling values for merge) and the subtheory cannot make a definite claim about how the substrate behaves.

The question also bears on the discipline boundary between this subtheory and the parent: every CRDT-shaped operation lives at the parent level (covered by [federation-convergence](../../../theorems/federation-convergence.md)); every consensus-shaped operation lives here. A clean fallback story would let some operations migrate from here back to the parent (the operations whose fallback is genuinely safe) and would harden the boundary for the operations that genuinely need consensus.
