---
name: ordering-by-knowledge
description: The knowledge partial order ≤_k on a pre-bilattice, defined by a ≤_k b ⟺ a ∧_k b = a (equivalently a ∨_k b = b). Reflexive, antisymmetric, transitive on the carrier B.
gerund: ordering-by-knowledge
agent-noun: orderer-by-knowledge
domain: pair-of-pre-bilattice
codomain: pre-bilattice
references:
  - id: belnap1977
    type: chapter
    title: A useful four-valued logic
    in: Modern Uses of Multiple-Valued Logic
    editors: Dunn, J. Michael,Epstein, George
    publisher: Reidel
    location: Dordrecht
    author:
      - literal: Belnap, Nuel D.
    page: 8-37
    issued:
      - year: 1977
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
---

The partial order $\leq_k$ on the carrier $B$ of a pre-bilattice, induced by meeting-in-the-knowledge-order.

## Proof of partial-order properties

The pre-bilattice's second lattice $\langle B, \wedge_k, \vee_k\rangle$ has meet $\wedge_k$ satisfying associativity, commutativity, idempotence, and absorption with $\vee_k$ (Ginsberg 1988; Fitting 1991; Birkhoff 1940 §I.1). Define $a \leq_k b \iff a \wedge_k b = a$.

- **Reflexive.** By idempotence, $a \wedge_k a = a$.
- **Antisymmetric.** $a \leq_k b$ and $b \leq_k a$ imply $a \wedge_k b = a$ and $b \wedge_k a = b$; by commutativity, $a = b$.
- **Transitive.** $a \leq_k b$ and $b \leq_k c$ imply $a \wedge_k c = (a \wedge_k b) \wedge_k c = a \wedge_k (b \wedge_k c) = a \wedge_k b = a$, by associativity.

When the lattice is bounded, $\leq_k$ has bottom $\bot$ (no evidence) and top $\top$ (told both — contradiction held as state).

In a twist-product $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the knowledge order is $\langle a_1, a_2\rangle \leq_k \langle b_1, b_2\rangle$ iff $a_1 \leq_1 b_1$ and $a_2 \leq_2 b_2$ — both components raise with $\leq_k$ (Fitting 1991 §3). The knowledge order is the order along which evidence accumulates in a predication valuation: settling monotonicity asserts $v_\sigma(p) \leq_k v_\tau(p)$ pointwise for $\sigma \leq \tau$ (Belnap 1977 §2; settling-monotonicity claim in the math library).

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
