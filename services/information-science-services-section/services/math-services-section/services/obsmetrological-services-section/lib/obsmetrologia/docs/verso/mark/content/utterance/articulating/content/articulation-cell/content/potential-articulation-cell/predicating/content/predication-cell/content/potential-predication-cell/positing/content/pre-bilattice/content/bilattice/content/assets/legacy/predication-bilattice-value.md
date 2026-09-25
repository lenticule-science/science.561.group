---
name: bilattice-value
description: A designated element of a bilattice's carrier, paired with the bilattice it inhabits. Formally a pair ⟨B, v⟩ with v ∈ |B|; the type of input and output of every bilattice operation.
inhabiting: bilattice
negating: bilattice-value
conflating: bilattice-value
meeting-in-the-truth-order: bilattice-value
joining-in-the-truth-order: bilattice-value
meeting-in-the-knowledge-order: bilattice-value
joining-in-the-knowledge-order: bilattice-value
---

A **bilattice-value** is a pair $\langle \mathbf{B}, v \rangle$ where $\mathbf{B}$ is a bilattice and $v \in |\mathbf{B}|$ is an element of its carrier. Categorically, a bilattice-value is a global element $\mathbf{1} \to |\mathbf{B}|$ in $\mathbf{Set}$ under the forgetful functor $|\cdot| : \mathbf{Bilattice} \to \mathbf{Set}$, together with the bilattice $\mathbf{B}$ as ambient context.

Every operation of a bilattice — meet and join in either order, negation, conflation — takes one or two bilattice-values with a common $\mathbf{B}$ and produces a bilattice-value in the same $\mathbf{B}$. The bilattice context is preserved by every operation; only the carrier element varies. The collection of all bilattice-values across all bilattices forms a category fibered over $\mathbf{Bilattice}$ — the total category $\int |\cdot|$ of the carrier-set functor — whose objects are pairs $\langle \mathbf{B}, v \rangle$ and whose morphisms are bilattice homomorphisms $h : \mathbf{B} \to \mathbf{B}'$ satisfying $h(v) = v'$.
