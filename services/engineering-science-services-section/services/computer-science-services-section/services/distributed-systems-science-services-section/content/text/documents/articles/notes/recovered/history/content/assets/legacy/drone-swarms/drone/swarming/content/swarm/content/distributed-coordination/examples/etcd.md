---
type: example
status: documented
instantiates: [quorum-consensus, leader-election, distributed-lock, propose-and-vote, quorum-consensus-safety]
---

# etcd as a distributed-coordination-platform realization

etcd is a distributed key-value store implementing the Raft consensus protocol, deployed widely as the coordination substrate for Kubernetes and as a standalone leader-election / distributed-lock service. It is the realization against which this subtheory's [quorum-consensus-safety](../theorems/quorum-consensus-safety.md) and [quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md) theorems are most easily checked, and the operational reference for what consensus looks like as a deployable service.

## Mapping to subtheory structure

| Subtheory structure | etcd realization |
|---|---|
| [cluster-membership](teaching/explanations/cluster-membership.md) | The cluster's member list; managed via `etcdctl member add/remove` with quorum-confirmed configuration changes |
| [cluster-record](../objects/cluster-record.md) | The Raft membership log entries; cluster ID and member IDs |
| [leader-election](teaching/explanations/leader-election.md) | Raft leader election: candidates increment term, request votes, become leader on majority |
| [leader-record](../objects/leader-record.md) | The leader's term, leader ID; visible via `etcd_server_is_leader` metric and `etcdctl endpoint status` |
| [elect-leader](../morphisms/elect-leader.md) | The Raft RequestVote round triggered by election timeout |
| [quorum-consensus](teaching/explanations/quorum-consensus.md) | Raft log replication: leader appends to its log, replicates to followers, commits on majority ack |
| [propose-and-vote](../morphisms/propose-and-vote.md) | Raft AppendEntries: leader proposes log entry, followers acknowledge, leader commits on majority |
| [quorum-record](../objects/quorum-record.md) | The committed log: each entry's index and term, with the quorum's ack record implicit in the commit |
| [quorum-consensus-safety](../theorems/quorum-consensus-safety.md) | Verified by Raft's safety proof (Election Safety, Leader Append-Only, Log Matching, Leader Completeness, State Machine Safety) |
| [quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md) | etcd refuses writes when leader cannot reach majority of cluster — preserves safety, sacrifices availability per CP discipline |
| [distributed-lock](teaching/explanations/distributed-lock.md) | etcd lease-based locks: client acquires lease, registers lock key with lease, lease auto-expires on disconnect |
| [acquire-distributed-lock](../morphisms/acquire-distributed-lock.md) | `etcdctl lock <name>` or the `clientv3/concurrency.NewMutex` API |
| [release-distributed-lock](../morphisms/release-distributed-lock.md) | `mutex.Unlock()` or lease expiration |
| [consistent-hashing](teaching/explanations/consistent-hashing.md) | Not built-in; Kubernetes uses etcd as the source of truth and computes its own consistent-hashing on top |

## The quorum-consensus-safety theorem realized

etcd's Raft implementation (specifically `etcd/raft` library) is the reference implementation against which the subtheory's safety theorem can be empirically checked. The theorem's argument structure — quorum-overlap, vote-discipline, decision-witness — maps to Raft's safety proof:

- **Quorum-overlap** is Raft's "Election Safety" property: a candidate must win votes from a majority quorum to become leader; any two majority quorums share at least one voter; that voter votes for at most one candidate per term; therefore at most one leader per term.
- **Vote-discipline** is Raft's per-term vote: each follower votes for at most one candidate per term and persists the vote before responding (so a crash-restart doesn't allow double-voting).
- **Decision-witness** is Raft's commit-record: an entry is committed only when replicated to a majority; the commit-index is monotonic; auditors can verify by inspecting the committed log.

## Where the realization deviates from the subtheory

etcd is not predicated-computing. Its keys are flat byte-strings, not predication cells; its watch mechanism is per-key-prefix, not per-predication-pattern; its witness chain is the Raft log, not the substrate's signed witness sequence. A predicated-computing realization that uses etcd as its consensus substrate would use etcd to coordinate the *consensus operations* on the substrate (lease-based leader for the substrate's heartbeat tick, sequential ID generation, exclusive resource locks) while the substrate's predication cells live in a separate store (PostgreSQL or a flat-file vault) that the leader writes to on commit.

etcd's CP posture under partition is the answer to the [quorum-to-CRDT fallback question](questions/quorum-to-crdt-fallback-under-partition.md) for one specific class of operations (the operations etcd is built for): no fallback, refuse writes, wait for partition to heal. The subtheory's discipline must accommodate operations that etcd's stance is wrong for; etcd is the example of the no-fallback policy, not the discipline-wide answer.

## Reference

etcd Authors. *etcd Documentation v3.5*. https://etcd.io/docs/v3.5/. Particularly the *Learning > Why etcd*, *Learning > Data model*, and *op-guide > Hardware* sections. The Raft paper (Ongaro & Ousterhout 2014, USENIX ATC) is the protocol reference; etcd's `raft/` library README is the implementation reference.
