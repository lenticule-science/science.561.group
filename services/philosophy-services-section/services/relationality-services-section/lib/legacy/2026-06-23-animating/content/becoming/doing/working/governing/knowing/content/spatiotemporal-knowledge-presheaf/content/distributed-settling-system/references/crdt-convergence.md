---
kind: theorem
status: proved
lean: SpatiotemporalKnowledgeSystem.Homebrew.Settling.CRDT.applyWrites_perm_invariant
closes: settling-merge-semilattice
depends-on: [distributed-settling-system, spatiotemporal-knowledge-presheaf, closure-operator, closure-drivenness, settling-merge-semilattice, predication-fiber-algebra, knowledge-order, residuated-lattice, entity-set, predicate-category]
---

# CRDT convergence (knowledge presheaves are CRDTs)

Let $\{v^{(i)}\}_{i \in I}$ be a [distributed settling system](../objects/distributed-settling-system.md) with finite [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L}$, [entity set](../objects/entity-set.md) $E$, and [predicate category](../objects/predicate-category.md) $\mathcal{C}$.
Suppose each replica applies a common [closure operator](../morphisms/closure-operator.md) $\mathrm{cl}$ after each merge, and suppose every write on any replica is eventually merged into every other replica.
Then all replicas converge to the same limit valuation $v^\infty$, reached in finitely many merge steps.
No consensus protocol is required.

## Proof

Let $U_{i, \tau}$ denote the set of writes received by replica $i$ at or before local time $\tau$, and $U = \bigcup_{i, \tau} U_{i, \tau}$ the (eventually finite) set of all writes issued anywhere in the system.

**Lemma (closure-merge commutation).** For a [closure operator](../morphisms/closure-operator.md) $\mathrm{cl}$ and elements $X, Y$ of a [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$:

$$\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) = \mathrm{cl}_p(X \vee_k Y).$$

*Proof of lemma.* By inflationarity, $X \leq_k \mathrm{cl}_p(X)$, so $X \vee_k Y \leq_k \mathrm{cl}_p(X) \vee_k Y$; by monotonicity, $\mathrm{cl}_p(X \vee_k Y) \leq_k \mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y)$.
Conversely, $\mathrm{cl}_p(X) \leq_k \mathrm{cl}_p(X \vee_k Y)$ and $Y \leq_k \mathrm{cl}_p(X \vee_k Y)$ (both by monotonicity of $\vee_k$-join followed by inflationarity), so $\mathrm{cl}_p(X) \vee_k Y \leq_k \mathrm{cl}_p(X \vee_k Y)$; applying $\mathrm{cl}_p$ and using idempotence gives $\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) \leq_k \mathrm{cl}_p(\mathrm{cl}_p(X \vee_k Y)) = \mathrm{cl}_p(X \vee_k Y)$.
Both inequalities give equality, proving the lemma.

By induction on the local settling using the lemma, replica $i$'s state at time $\tau$ equals $\mathrm{cl}_p(\bigvee_k U_{i, \tau})$ cellwise, regardless of the order in which writes were received and closures applied.
Once every replica has received every write — i.e., $U_{i, \tau} = U$ for all $i$ — each replica's state is $\mathrm{cl}_p(\bigvee_k U)$, the same common limit.
Convergence is finite because $\bigvee_k U$ is an element of the finite lattice $\mathbf{L}^\bowtie$ (writes are finite; $\mathbf{L}^\bowtie$ is finite) and closure is idempotent.
No replica needs to negotiate with any other. $\square$

## Remark on delta-state representation

Practical distributed knowledge presheaf implementations ship not full states but *deltas* — the individual writes $u \in U$.
By the [knowledge presheaf merge semilattice](settling-merge-semilattice.md) result, merging deltas is the same as merging full states: the semilattice structure is invariant under the choice of representation.
This corresponds to the delta-state CRDTs of [@almeida-et-al2018], specialized to this setting.
