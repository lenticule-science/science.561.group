---
type: reference
class: academic
status: cited
authors: [Lamport, Leslie]
year: 1998
title: "The Part-Time Parliament"
venue: "ACM Transactions on Computer Systems 16(2), 133–169"
---

## Source

L. Lamport. "The Part-Time Parliament." *ACM Transactions on Computer Systems*, 16(2), 133–169, 1998. (Companion shorter exposition: "Paxos Made Simple," ACM SIGACT News 32(4), 18–25, 2001.)

## Form

Journal paper. The founding paper of the *Paxos* consensus protocol, presented through the famous Paxos-island parliamentary parable.

## Content summary

Introduces *Paxos*: a fault-tolerant distributed consensus protocol that achieves agreement among a set of processes (any majority of which must be available) on a single value, even in the presence of process failures and message loss/duplication/reordering. The protocol has two roles — *proposers* propose values; *acceptors* vote — and proceeds in numbered rounds: in each round, a proposer issues a *prepare* request to a majority of acceptors, learns the highest-numbered value any of them previously accepted (if any), then issues an *accept* request with either that value or a new one if none was previously accepted; once a majority accepts, the value is *chosen* and any subsequent proposer learns the chosen value through its own prepare phase. The protocol's correctness rests on the *invariant*: any value chosen in a round is also the value chosen in all higher-numbered rounds that succeed. Multi-Paxos extends the protocol to a sequence of consensus instances (used for replicated state machines); Paxos became the foundational reference for distributed-consensus in the production-systems literature, with subsequent simplifications (Raft — see [ongaro-ousterhout2014](ongaro-ousterhout2014.md)) and variants (Fast Paxos, Generalized Paxos, EPaxos) following.
