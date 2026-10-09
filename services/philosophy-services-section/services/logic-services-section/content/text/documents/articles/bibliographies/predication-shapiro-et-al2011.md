---
type: reference
authors: [Shapiro, Marc, Preguiça, Nuno, Baquero, Carlos, Zawirski, Marek]
year: 2011
title: "Conflict-Free Replicated Data Types"
venue: "Stabilization, Safety, and Security of Distributed Systems (SSS 2011), LNCS 6976, 386–400"
description: M.
---

## Full citation

M. Shapiro, N. Preguiça, C. Baquero, M. Zawirski. "Conflict-Free Replicated Data Types." In X. Défago, F. Petit, V. Villain (eds.), *Stabilization, Safety, and Security of Distributed Systems (SSS 2011)*, LNCS 6976, Springer, 386–400, 2011. Also: INRIA RR-7687 extended version.

## Status

Pending direct access. The CRDT framework as established here is well-summarized in subsequent literature; we use it through that summary.

## Annotation

The **CRDT convergence theorem**: state-based merge equal to a join-semilattice join produces eventual consistency without consensus. Two flavors:
- **State-based (CvRDT)**: state space is a join-semilattice; merge is the join.
- **Operation-based (CmRDT)**: operations on the state are required to commute.

For the program: predication settlings over fixed $(\mathbf{L}, \mathcal{C}, E, \lambda)$ form a CvRDT under the cellwise $\vee_k$-merge — see [CRDT convergence](../../../glossary/concepts/crdt-convergence.md). The proof reduces to closure–merge commutation plus finiteness of the relevant fiber algebras.

The cohomological layer reformulates the convergence theorem as a Mayer–Vietoris vanishing result — see [CRDT convergence via Mayer–Vietoris](../../../glossary/concepts/crdt-convergence-via-mayer-vietoris.md): replica-cover obstructions vanish for settling-derived sheaves.
