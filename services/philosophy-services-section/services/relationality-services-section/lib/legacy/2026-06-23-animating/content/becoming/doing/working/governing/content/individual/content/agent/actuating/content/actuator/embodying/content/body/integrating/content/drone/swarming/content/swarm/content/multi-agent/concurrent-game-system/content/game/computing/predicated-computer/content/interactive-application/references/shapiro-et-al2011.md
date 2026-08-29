---
type: reference
class: academic
status: cited
authors: [Shapiro, Marc, Preguiça, Nuno, Baquero, Carlos, Zawirski, Marek]
year: 2011
title: "A comprehensive study of Convergent and Commutative Replicated Data Types"
venue: "INRIA Research Report RR-7506"
---

## Source

M. Shapiro, N. Preguiça, C. Baquero, M. Zawirski. "A comprehensive study of Convergent and Commutative Replicated Data Types." *INRIA Research Report* RR-7506, January 2011. https://hal.inria.fr/inria-00555588. (Companion conference paper: "Conflict-Free Replicated Data Types" in SSS 2011.)

## Form

Technical research report. The systematizing survey that consolidated the *Conflict-Free Replicated Data Type* (CRDT) field, named the discipline, classified the existing variants (state-based / CvRDT, operation-based / CmRDT), and stated the convergence guarantees in their now-standard form. Companion to the SSS 2011 conference paper.

## Content summary

Establishes the CRDT discipline as a class of data types whose replicas can be modified independently and concurrently without coordination, with the guarantee that the replicas eventually converge to the same value once all updates have been propagated. Identifies two equivalent formalisms:

- *State-based CRDTs (CvRDTs).* Each replica's state is an element of a join-semilattice. Updates produce new states; replicas exchange states; the merge operation is the lattice join. Convergence follows from the join's commutativity, associativity, and idempotence.
- *Operation-based CRDTs (CmRDTs).* Each replica applies updates as operations; operations are broadcast to all replicas via a reliable causal-broadcast layer. Concurrent operations must commute — applying them in any order at any replica produces the same final state. Convergence follows from the operation commutativity plus reliable delivery.

Catalogs the canonical CRDT variants: counters (G-Counter increment-only, PN-Counter increment-and-decrement); registers (LWW-Register last-writer-wins, MV-Register multi-value); sets (G-Set grow-only, 2P-Set add-and-tombstone, OR-Set observed-remove, LWW-Set last-writer-wins); sequences (RGA Replicated Growable Array, WOOT, Treedoc, Logoot); graphs (2P2P-Graph, OR-Graph); maps. For each variant, gives the data structure, the operations, the merge function (state-based) or commutativity argument (operation-based), and the convergence proof.

Discusses the engineering tradeoffs: state-based CRDTs are conceptually simple and tolerate any message-delivery semantics but have larger state-exchange overhead; operation-based CRDTs are smaller per-operation but require reliable causal broadcast. Most production CRDT deployments are a hybrid (state-based with operation-style optimizations).
