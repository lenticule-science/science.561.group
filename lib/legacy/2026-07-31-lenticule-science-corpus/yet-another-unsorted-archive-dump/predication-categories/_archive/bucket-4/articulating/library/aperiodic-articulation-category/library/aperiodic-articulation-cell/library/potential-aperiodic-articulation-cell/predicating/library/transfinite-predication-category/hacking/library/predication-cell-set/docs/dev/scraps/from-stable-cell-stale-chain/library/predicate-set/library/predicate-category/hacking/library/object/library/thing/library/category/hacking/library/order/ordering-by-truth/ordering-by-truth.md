---
name: ordering-by-truth
description: The truth partial order ≤_t on a pre-bilattice, defined by a ≤_t b ⟺ a ∧_t b = a (equivalently a ∨_t b = b). Reflexive, antisymmetric, transitive on the carrier B.
gerund: ordering-by-truth
agent-noun: orderer-by-truth
domain: pair-of-pre-bilattice
codomain: pre-bilattice
references:
  - id: birkhoff1940
    type: book
    title: Lattice Theory
    publisher: American Mathematical Society
    location: Providence
    series: Colloquium Publications
    volume: 25
    author:
      - literal: Birkhoff, Garrett
    issued:
      - year: 1940
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
  - id: arieli-avron1996
    type: article-journal
    title: Reasoning with logical bilattices
    volume: 5
    issue: 1
    author:
      - literal: Arieli, Ofer
      - literal: Avron, Arnon
    container-title: Journal of Logic, Language and Information
    page: 25-63
    issued:
      - year: 1996
---

The partial order $\leq_t$ on the carrier $B$ of a pre-bilattice, induced by meeting-in-the-truth-order.

## Proof of partial-order properties

The pre-bilattice's first lattice $\langle B, \wedge_t, \vee_t\rangle$ has meet $\wedge_t$ satisfying associativity, commutativity, idempotence, and absorption with $\vee_t$ (Ginsberg 1988; Fitting 1991; Birkhoff 1940 §I.1). Define $a \leq_t b \iff a \wedge_t b = a$.

- **Reflexive.** By idempotence, $a \wedge_t a = a$, so $a \leq_t a$.
- **Antisymmetric.** Suppose $a \leq_t b$ and $b \leq_t a$. Then $a \wedge_t b = a$ and $b \wedge_t a = b$. By commutativity, $a \wedge_t b = b \wedge_t a$, so $a = b$.
- **Transitive.** Suppose $a \leq_t b$ and $b \leq_t c$. Then $a \wedge_t b = a$ and $b \wedge_t c = b$. So $a \wedge_t c = (a \wedge_t b) \wedge_t c = a \wedge_t (b \wedge_t c) = a \wedge_t b = a$, by associativity. Therefore $a \leq_t c$.

The equivalent definition $a \leq_t b \iff a \vee_t b = b$ coincides with the meet-definition by absorption (Birkhoff 1940 §I.2).

When the lattice is bounded, $\leq_t$ has bottom $\mathbf{f}$ and top $\mathbf{t}$.

In a twist-product $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the truth order is $\langle a_1, a_2\rangle \leq_t \langle b_1, b_2\rangle$ iff $a_1 \leq_1 b_1$ and $b_2 \leq_2 a_2$ — positive component raises with $\leq_t$, negative component lowers with $\leq_t$ (Fitting 1991 §3; Arieli & Avron 1996 §3).

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
