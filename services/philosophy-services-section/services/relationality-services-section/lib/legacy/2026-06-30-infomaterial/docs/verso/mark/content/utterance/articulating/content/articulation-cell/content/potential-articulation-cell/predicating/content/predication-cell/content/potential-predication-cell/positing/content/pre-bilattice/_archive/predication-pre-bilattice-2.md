---
name: pre-bilattice
description: An algebra ⟨B, ∧_t, ∨_t, ∧_k, ∨_k⟩ on a carrier B in which ⟨B, ∧_t, ∨_t⟩ and ⟨B, ∧_k, ∨_k⟩ are both lattices. The signature underlying a bilattice once a unary negation is added.
category: category
meeting-in-the-truth-order: pre-bilattice
joining-in-the-truth-order: pre-bilattice
meeting-in-the-knowledge-order: pre-bilattice
joining-in-the-knowledge-order: pre-bilattice
references:
  - id: ginsberg1988
    type: article-journal
    title: Multivalued logics: A uniform approach to inference in artificial intelligence
    volume: 4
    issue: 3
    author:
      - literal: Ginsberg, Matthew L.
    container-title: Computational Intelligence
    page: 265-316
    issued:
      - year: 1988
  - id: fitting1991
    type: article-journal
    title: Bilattices and the semantics of logic programming
    volume: 11
    issue: 2
    author:
      - literal: Fitting, Melvin
    container-title: Journal of Logic Programming
    page: 91-116
    issued:
      - year: 1991
---

An algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k\rangle$ in which both $\langle B, \wedge_t, \vee_t\rangle$ and $\langle B, \wedge_k, \vee_k\rangle$ are lattices on the carrier $B$. The first lattice induces the truth order $a \leq_t b \iff a \wedge_t b = a$; the second induces the knowledge order $a \leq_k b \iff a \wedge_k b = a$. When both orders are bounded, their extremes are denoted $\mathbf{f}, \mathbf{t}$ (bottom and top of $\leq_t$) and $\bot, \top$ (bottom and top of $\leq_k$).

A pre-bilattice is *interlaced* when each of the four lattice operations is monotone in both orders; *distributive* when all twelve binary distributive laws hold. Equipping a pre-bilattice with a unary [negation](../transformers/negating.md) yields a [bilattice](bilattice.md) ([@ginsberg1988], [@fitting1991]).
