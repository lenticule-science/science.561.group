---
name: pre-bilattice
description: An algebra ⟨B, ∧_t, ∨_t, ∧_k, ∨_k⟩ on a carrier B in which ⟨B, ∧_t, ∨_t⟩ and ⟨B, ∧_k, ∨_k⟩ are both lattices. Adding a unary negation antitone in the truth order and monotone in the knowledge order yields a bilattice.
meeting-in-the-truth-order: pre-bilattice
joining-in-the-truth-order: pre-bilattice
meeting-in-the-knowledge-order: pre-bilattice
joining-in-the-knowledge-order: pre-bilattice
extended-by-adding-negation: bilattice
---

A **pre-bilattice** is an algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ in which both $\langle B, \wedge_t, \vee_t \rangle$ and $\langle B, \wedge_k, \vee_k \rangle$ are lattices on the carrier $B$. The first lattice induces the *truth order* $a \leq_t b \iff a \wedge_t b = a$; the second induces the *knowledge order* $a \leq_k b \iff a \wedge_k b = a$. When both lattices are bounded their extremes are denoted $\mathbf{f}, \mathbf{t}$ (bottom and top in $\leq_t$) and $\bot, \top$ (bottom and top in $\leq_k$).

A pre-bilattice is *interlaced* when each of the four lattice operations is monotone in both orders, *distributive* when all twelve binary distributive laws $x \circ (y \bullet z) = (x \circ y) \bullet (x \circ z)$ hold for distinct $\circ, \bullet \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$. Equipping a pre-bilattice with a unary negation antitone in the truth order, monotone in the knowledge order, and involutive yields a bilattice.
