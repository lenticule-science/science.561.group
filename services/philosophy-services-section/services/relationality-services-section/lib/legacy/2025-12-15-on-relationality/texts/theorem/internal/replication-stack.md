---
title: Replication Stack
tags:
  - replication
  - consensus
  - storage
depends_on:
  - theorem/internal/relational-storage
  - theorem/internal/distribution-stack
  - theorem/internal/concurrency-stack
---
# Theorem (Replication Stack)

Replication requires that multiple copies of a snapshot remain in sync despite
concurrent updates.  The storage, distribution, and concurrency stacks already
provide these guarantees.

1. **Snapshot equality.**  
   Relational storage defines canonical snapshots; any replica stores the same
   triple (observations, baseline, fixed recognitions).

2. **Propagation.**  
   Distribution stack delivers updates to all replicas.

3. **Conflict resolution.**  
   Concurrency stack shows flow/nucleus operations commute, so applying updates
   in different orders yields equivalent states; scheduling enforces dependencies
   to avoid inconsistent merges.

Therefore we can replicate relational data across multiple stores without losing
consistency, giving us a replication stack.
