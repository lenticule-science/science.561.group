---
name: bilattice
description: A pre-bilattice equipped with an involutive negation antitone in the truth order and monotone in the knowledge order. The algebra ⟨B, ∧_t, ∨_t, ∧_k, ∨_k, ~⟩ on a carrier B.
extending: pre-bilattice
negating: bilattice
conflating: bilattice
meeting-in-the-truth-order: bilattice
joining-in-the-truth-order: bilattice
meeting-in-the-knowledge-order: bilattice
joining-in-the-knowledge-order: bilattice
homomorphizing-as-bilattice: bilattice
having-free-bilattice-on-no-generators: four-bilattice
representing-as-twist-product: twist-product
---

A **bilattice** is a pre-bilattice equipped with a unary operation $\sim$ called *negation* — the algebra

$$\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim \rangle$$

in which $\langle B, \wedge_t, \vee_t \rangle$ and $\langle B, \wedge_k, \vee_k \rangle$ are both lattices on the carrier $B$ and the negation satisfies, for all $a, b \in B$:

- $a \leq_t b \implies \sim b \leq_t \sim a$ &nbsp;&nbsp; (antitone in the truth order $\leq_t$),
- $a \leq_k b \implies \sim a \leq_k \sim b$ &nbsp;&nbsp; (monotone in the knowledge order $\leq_k$),
- $\sim\sim a = a$ &nbsp;&nbsp; (involutive).

A bilattice may additionally carry a unary *conflation* $-$ that is antitone in $\leq_k$, monotone in $\leq_t$, and involutive. When both involutions are present they are required to commute, $\sim\,- = -\,\sim$, and the two commuting involutions generate a $\mathbb{Z}_2 \times \mathbb{Z}_2$ symmetry of the carrier (the Klein four-group).

A bilattice is *interlaced* when each of the four lattice operations is monotone in both orders, *distributive* when all twelve binary distributive laws hold between the four operations. Every distributive bilattice is interlaced. The smallest non-trivial bilattice is the four-element bilattice FOUR, which is the free bilattice on no generators. By Avron's representation theorem every interlaced bounded bilattice is isomorphic to a twist product $\mathbf{L}^\bowtie$ of a bounded lattice $\mathbf{L}$ with itself.
