---
type: reference
class: academic
status: cited
authors: [Shapiro, Marc, Preguiça, Nuno, Baquero, Carlos, Zawirski, Marek]
year: 2011
title: "Conflict-Free Replicated Data Types"
venue: "Stabilization, Safety, and Security of Distributed Systems, Springer, 386–400"
description: Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M.
---

## Source

Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M. (2011). "Conflict-Free Replicated Data Types." In *Stabilization, Safety, and Security of Distributed Systems*, Springer, 386–400.

## Form

Conference paper.

## Content summary

Establishes the structural conditions under which distributed replicas converge without a coordination protocol: the operations on replicated state must form a join semilattice (commutative-associative-idempotent merge), and replicas exchange state or operations whose effects compose under the semilattice's join. Two main families: state-based CRDTs (replicas exchange whole state, merge by lattice join) and operation-based CRDTs (replicas exchange operations, apply commutative effects).

## Position in the corpus

Cited as engineering analog for the substrate's [federation-convergence](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) result. The CRDT literature establishes the load-bearing claim — convergence under exchange given a commutative-associative-idempotent merge — at the distributed-systems layer. The substrate's contribution is making the claim hold at the *substrate level*, where the commutative-associative-idempotent join is the substrate's value-domain join (per the adjoint paper, Proposition 7), so that every higher-level concern (applications, agents, federation between organizations) inherits convergence without re-deriving it.
