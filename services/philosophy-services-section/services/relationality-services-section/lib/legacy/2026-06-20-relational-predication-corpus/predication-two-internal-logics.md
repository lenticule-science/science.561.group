---
type: theorem
status: proved
depends-on: [predication-hyperdoctrine, classical-equality, paraconsistent-equality, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, truth-order, knowledge-order]
---

# Two internal logics on every predication hyperdoctrine

Every [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) $\mathcal{E}$ supports:

- A **classical first-order theory** $T_t(\mathcal{E})$ over the [truth-order](teaching/explanations/truth-order.md) adjoint system, with [classical equality](../objects/classical-equality.md) $=_E$ and [classical Lawvere comprehension](lawvere-comprehension-classical.md) $\{-\}_\mathbf{t}$.

- A **paraconsistent first-order theory** $T_k(\mathcal{E})$ over the [knowledge-order](teaching/explanations/knowledge-order.md) adjoint system, with [paraconsistent equality](../objects/paraconsistent-equality.md) $\Delta_E^k$ and [paraconsistent Lawvere comprehension](lawvere-comprehension-paraconsistent.md) $\{-\}_\top$.

These theories are distinct: a sentence derivable in one need not be derivable in the other.

## Proof

The two systems have different adjoints, different equalities, different comprehension. A concrete example of divergence: $\forall x, y.\, x = y \vee x \neq y$ is classically derivable from excluded middle on $=_E$, which is two-valued, but is not paraconsistently derivable — $\Delta_E^k$ admits $\top$ as a non-classical value at off-diagonal cells in inconsistent states. $\square$

## Remark

Applications select the logic matching their intended semantics:

- *Distributed / CRDT / paraconsistent reasoning:* use $T_k$. The $\top$ on the diagonal of $\Delta_E^k$ means "information-maximal"; $\bot$ off means "no claim." Stable under $\vee_k$-merge.
- *Classical knowledge-base / database queries:* use $T_t$. Two-valued, compatible with classical entailment.
- *Paraconsistent KR with designated values* (e.g., [@ma-hitzler2009]): use $T_k$, treating $\top$-cells as conflicts that do not trivialize.

Both logics are internal to the same fibration; queries can be framed in either.
