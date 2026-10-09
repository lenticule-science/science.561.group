---
name: knowledge-order
description: The partial order ≤_k on a bilattice's carrier, induced by the knowledge-meet ∧_k. Distinct from the truth-order ≤_t (induced by ∧_t). The order along which evidence accretes — ⊥ to t/f to ⊤, more-told from less-told.
specializing: partial-order
order-on: bilattice-value
induced-by: knowledge-meet
distinct-from: truth-order
having-bottom: knowledge-bottom
---

The **knowledge-order** $\leq_k$ on a [bilattice](../../../../../../../object/library/thing/library/category/library/variety/library/bilattice/bilattice.md)'s carrier $|\mathbf{B}|$ is the partial order induced by the bilattice's knowledge-meet operation $\sqcap_k$:

$$a \leq_k b \iff a \sqcap_k b = a.$$

Equivalently, $a \leq_k b$ iff $a \sqcup_k b = b$ for the knowledge-join $\sqcup_k$. The pair $\langle |\mathbf{B}|, \leq_k \rangle$ is a lattice — the *knowledge-lattice* of $\mathbf{B}$.

## Distinct from the truth-order

A bilattice carries two orders simultaneously: the knowledge-order $\leq_k$ (this one) and the truth-order $\leq_t$ (induced by the truth-meet $\sqcap_t$). The two orders are independent — neither refines the other in general. The four-element bilattice $\mathbf{FOUR}$ is the canonical example: $\bot \leq_k \mathbf{f} \leq_k \top$ and $\bot \leq_k \mathbf{t} \leq_k \top$ along knowledge, while $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ and $\mathbf{f} \leq_t \top \leq_t \mathbf{t}$ along truth.

A bilattice is *interlaced* exactly when each operation of one lattice is monotone in the other order. Interlacing relates the two orders without collapsing one into the other.

## Role in evidence accretion

The knowledge-order is the order along which evidence accretes. The bottom $\bot \in |\mathbf{B}|$ is the no-evidence state; movement in $\leq_k$ from $\bot$ toward the classical values $\mathbf{t}$ (told true) or $\mathbf{f}$ (told false), or toward the held-contradiction $\top$ (told both), records the deposition of evidence. The settling-monotonicity condition on a [predication-settling](../../../../../../../predication-settling-category/library/predication-settling/predication-settling.md) is pointwise monotonicity in $\leq_k$: as the trajectory advances, every cell's value rises in $\leq_k$ or stays fixed; nothing is ever forgotten.

The order's bottom element is named explicitly as a sub-structure: [knowledge-bottom](library/knowledge-bottom/knowledge-bottom.md). It is the floor of every cell's evidence-trajectory.
