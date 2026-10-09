---
type: reference
class: academic
status: cited
authors: [Ongaro, Diego, Ousterhout, John]
year: 2014
title: "In Search of an Understandable Consensus Algorithm"
venue: "Proceedings of the USENIX Annual Technical Conference (USENIX ATC '14), 305–319"
---

## Source

D. Ongaro, J. Ousterhout. "In Search of an Understandable Consensus Algorithm." In *Proceedings of the 2014 USENIX Annual Technical Conference (USENIX ATC '14)*, 305–319, 2014. (Extended version: Diego Ongaro's Stanford PhD dissertation, 2014.)

## Form

Conference paper. The founding paper of the *Raft* consensus algorithm, the second-major-after-Paxos production-grade distributed-consensus protocol.

## Content summary

Introduces *Raft*: a consensus algorithm designed specifically for understandability, achieving the same fault-tolerance guarantees as Multi-Paxos through a different decomposition that the authors argue is easier to reason about and implement correctly. Raft separates consensus into three sub-problems: (1) *leader election* — at any time, exactly one server is leader (selected by majority vote in a numbered *term*); (2) *log replication* — the leader appends client requests to its log and replicates them to followers; an entry is *committed* once stored on a majority; (3) *safety* — the leader-election rules ensure that any newly-elected leader has all previously-committed entries (the *log matching* property). Raft also specifies *membership changes* (the joint-consensus discipline for safely adding or removing servers) and *log compaction* (snapshots). The paper became the load-bearing reference for production-grade consensus implementations (etcd, Consul, CockroachDB, TiKV, MongoDB), substantially supplanting Paxos in new systems due to its emphasis on implementability.
