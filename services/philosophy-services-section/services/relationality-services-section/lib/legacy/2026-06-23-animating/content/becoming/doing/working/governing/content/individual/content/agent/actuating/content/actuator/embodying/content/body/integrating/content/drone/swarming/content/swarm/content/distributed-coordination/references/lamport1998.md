---
type: reference
class: academic
status: cited
authors: [Lamport, Leslie]
year: 1998
title: "The Part-Time Parliament"
venue: "ACM Transactions on Computer Systems, 16(2), 133–169"
---

## Source

L. Lamport. "The Part-Time Parliament." *ACM Transactions on Computer Systems*, 16(2):133–169, May 1998. https://doi.org/10.1145/279227.279229. (Originally written 1989, published in revised form 1998.)

## Form

Journal article, presented as a fictional reconstruction of the parliamentary procedure of the ancient Greek island of Paxos. The fiction is a pedagogical device — the algorithm is what later became known as *Paxos*, the foundational consensus protocol for asynchronous distributed systems with crash failures.

## Content summary

Develops a consensus protocol for a system of replicated state machines where messages may be lost, delayed, or reordered, and where individual processes may crash and recover. The protocol's *single-decree Paxos* core establishes a single agreed-upon value among a set of voters; *multi-decree Paxos* extends it to a sequence of values (a replicated log) by running single-decree instances in parallel for each log position. The protocol's safety argument turns on the *quorum-overlap* property — any two majority quorums share at least one process — which prevents two different values from being chosen in the same instance even under arbitrary message loss and reordering. The protocol's liveness depends on a single *distinguished proposer* (or leader); an election sub-protocol selects the proposer. The paper proves safety unconditionally and proves liveness conditionally on eventual stability of leader election and message delivery.

The paper introduces the proposer / acceptor / learner role separation, the prepare / promise / propose / accept / learn message sequence, the ballot-number ordering with associated promise discipline, and the proof technique of invariant maintenance under arbitrary message-handling order. These have become the standard vocabulary for consensus-protocol design.
