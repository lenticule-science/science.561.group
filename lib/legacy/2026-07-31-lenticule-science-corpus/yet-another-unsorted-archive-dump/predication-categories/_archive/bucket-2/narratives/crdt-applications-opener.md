---
type: narrative
introduces: [settling-merge-semilattice]
---

# Distributed-systems applications: CRDT convergence and Mayer–Vietoris

The settling dynamics support a direct interpretation as a model of *distributed inference*: settlings over a common base, evolving independently across replicas, merge cellwise via the [knowledge-order](../concepts/knowledge-order.md) join $\vee_k$. The merge is associative, commutative, and idempotent — a [join-semilattice](../theorems/settling-merge-semilattice.md) operation — which is exactly the structure required by the CRDT (conflict-free replicated data type) framework of Shapiro et al. for replicated systems that converge without consensus.

Three results form the chapter:

- **[CRDT convergence](../theorems/crdt-convergence.md)**: replicas evolving independently and merging cellwise via $\vee_k$ converge to a common limit state — without coordination, without consensus, and without information loss. The proof reduces to the closure–merge commutation lemma plus finiteness of the fiber algebras.

- **[Mayer–Vietoris reformulation](../theorems/crdt-convergence-via-mayer-vietoris.md)**: the convergence theorem reformulates cohomologically. For a replica cover $U = U_1 \cup U_2$ in the [bitopological settling site](../objects/bitopological-settling-site.md), the connecting Mayer–Vietoris homomorphism $\delta^0$ is identically zero on the [settling-associated sheaf](../objects/settling-associated-sheaf.md). CRDT convergence becomes "no obstruction to gluing" — a sheaf-theoretic invariant.

- **[Cohomological CALM](../theorems/cohomological-calm.md)**: extends Hellerstein–Alvaro's CALM theorem (Consistency As Logical Monotonicity) to the cohomological setting. CALM-compatibility for a settling-derived sheaf ≡ vanishing of all Mayer–Vietoris obstructions across replica covers.

The chapter also contains the [distributed settling system](../objects/distributed-settling-system.md) construction (replicas indexed by a network), the [multi-agent epistemic settling](../examples/multi-agent-epistemic-settling.md) example, and the [three-replica Mayer–Vietoris](../examples/three-replica-mayer-vietoris.md) computation.

This connects the program to existing literature on distributed-systems topology — see [distributed-systems topology relation](distributed-systems-topology-relation.md) for the relation to Herlihy–Kozlov–Rajsbaum, Felber et al., and Ghrist–Ding.
