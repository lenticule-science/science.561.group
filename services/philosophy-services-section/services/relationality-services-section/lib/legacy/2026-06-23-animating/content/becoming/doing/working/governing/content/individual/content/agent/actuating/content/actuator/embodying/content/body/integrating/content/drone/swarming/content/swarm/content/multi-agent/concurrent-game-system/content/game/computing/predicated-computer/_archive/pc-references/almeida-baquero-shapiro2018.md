---
type: reference
class: academic
status: cited
authors: [Almeida, Paulo Sérgio, Shoker, Ali, Baquero, Carlos]
year: 2018
title: "Delta State Replicated Data Types"
venue: "Journal of Parallel and Distributed Computing 111, 162–173"
---

## Source

P. S. Almeida, A. Shoker, C. Baquero. "Delta State Replicated Data Types." *Journal of Parallel and Distributed Computing*, 111, 162–173, 2018. (Earlier conference and arXiv versions: 2014–2016.)

## Form

Journal paper. The mature reference for *delta-state CRDTs* — a refinement of the state-based CRDT discipline ([shapiro-et-al2011](shapiro-et-al2011.md)) that achieves operation-based-style efficiency (small deltas exchanged) while preserving state-based reliability (no message-delivery guarantees needed).

## Content summary

Develops *delta-state CRDTs* (δ-CRDTs): a refinement of state-based replicated data types in which each operation produces a *delta* — a small representation of the operation's effect on the state — and replicas exchange and merge deltas rather than full states. Deltas are themselves elements of the state's join-semilattice (so the state's join operation extends naturally to deltas), and the delta-state framework gives a discipline for designing efficient delta-mutator pairs for standard CRDT data types (counters, sets, registers, maps, sequences). The paper provides an anti-entropy protocol that exchanges accumulated deltas between replicas and demonstrates substantial bandwidth savings over full-state shipping while preserving the strong-eventual-consistency guarantee state-based CRDTs offer. δ-CRDTs are the engineering refinement that made state-based CRDTs practical for production deployment.
