---
title: Replication Structure
id: replication-structure
kind: structure
status: plan
role: "Replicate snapshots across stores using distribution and commutation."
inputs: []
outputs:
  - {id: replication-structure, name: replication}
program:
  ["struct", "replication-structure"]
depends_on:
  - storage-snapshot
  - distribution-channel-carrier
  - distribution-route
  - task-commutation
  - task-parallelization
# Replication Structure

The storage, distribution, and concurrency structures induce a replication
structure: a way to maintain multiple copies of a snapshot in sync despite
concurrent updates.

Formally, there exists a structure

```text
Replication = (Replicas, Snapshot, UpdateLog, Propagate, Resolve)
```

such that:

1. **Snapshot equality.**
   `Snapshot` ranges over canonical snapshots from the storage structure;
   each element of `Replicas` stores the same triple (observations, baseline,
   fixed recognitions) when it is in a consistent state.

2. **Propagation.**
   `Propagate` uses the distribution structure to deliver updates (derived
   from new observations or evaluation results) to all replicas by routing
   packets along appropriate channels.

3. **Conflict resolution.**
   The concurrency structure shows that the relevant flow/nucleus operations
   commute, so applying updates in different orders yields equivalent states;
   the scheduling structure enforces dependencies to avoid inconsistent
   merges. `UpdateLog` records the sequence of updates applied at each replica,
   and `Resolve` reconciles logs when divergence is detected by rebuilding
   from a canonical snapshot.

Therefore we can replicate relational data across multiple stores without
losing consistency: replication is captured by the `Replication` structure and
its relation to storage, distribution, and concurrency.
