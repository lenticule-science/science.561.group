---
name: joining-in-the-knowledge-order
description: The binary join operation ∨_k of the knowledge order on a pre-bilattice. The lattice operation on the carrier B that, together with meeting-in-the-knowledge-order, equips B with the lattice ⟨B, ∧_k, ∨_k⟩ inducing the knowledge order a ≤_k b ⟺ a ∨_k b = b.
gerund: joining-in-the-knowledge-order
agent-noun: joiner-in-the-knowledge-order
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
---

The binary operation $\vee_k : B \times B \to B$ on the carrier of a pre-bilattice.

## Proof of existence and properties

A pre-bilattice $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ is defined (Ginsberg 1988 §2; Fitting 1991 §2) such that $\langle B, \wedge_k, \vee_k \rangle$ is a lattice on the carrier $B$. By the lattice axioms (Birkhoff 1940 §I.1), $\vee_k$ satisfies associativity, commutativity, idempotence, and absorption with $\wedge_k$:

- $(a \vee_k b) \vee_k c = a \vee_k (b \vee_k c)$
- $a \vee_k b = b \vee_k a$
- $a \vee_k a = a$
- $a \vee_k (a \wedge_k b) = a$

The dual induced relation $a \leq_k b \iff a \vee_k b = b$ equals the relation defined by $\wedge_k$ (absorption coincidence; Birkhoff 1940 §I.2). The join $\vee_k$ is the pointwise-lifted operation by which knowledge values aggregate from evidence sources; see joining-by-knowledge for the valuation-level lift.

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
