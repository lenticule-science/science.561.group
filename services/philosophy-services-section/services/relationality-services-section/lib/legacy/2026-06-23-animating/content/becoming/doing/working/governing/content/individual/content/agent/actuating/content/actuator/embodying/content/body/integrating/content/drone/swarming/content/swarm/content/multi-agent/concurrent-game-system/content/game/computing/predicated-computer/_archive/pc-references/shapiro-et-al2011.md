---
type: reference
class: academic
status: cited
authors: [Shapiro, Marc, Preguiça, Nuno, Baquero, Carlos, Zawirski, Marek]
year: 2011
title: "Conflict-Free Replicated Data Types"
venue: "Stabilization, Safety, and Security of Distributed Systems, Springer, 386–400"
---

## Source

Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M. (2011). "Conflict-Free Replicated Data Types." In *Stabilization, Safety, and Security of Distributed Systems*, Springer, 386–400.

## Form

Conference paper.

## Content summary

Establishes the structural conditions under which distributed replicas converge without a coordination protocol: the operations on replicated state must form a join semilattice (commutative-associative-idempotent merge), and replicas exchange state or operations whose effects compose under the semilattice's join. Two main families: state-based CRDTs (replicas exchange whole state, merge by lattice join) and operation-based CRDTs (replicas exchange operations, apply commutative effects).
