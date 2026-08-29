---
name: meeting-in-the-knowledge-order
description: The binary meet operation ∧_k of the knowledge order on a pre-bilattice. The lattice operation on the carrier B that, together with joining-in-the-knowledge-order, equips B with the lattice ⟨B, ∧_k, ∨_k⟩ inducing the knowledge order a ≤_k b ⟺ a ∧_k b = a.
gerund: meeting-in-the-knowledge-order
agent-noun: meeter-in-the-knowledge-order
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
    page: 8-37
    issued:
      - year: 1977
  - id: ginsberg1988
    type: article-journal
    title: "Multivalued logics: A uniform approach to inference in artificial intelligence"
    volume: 4
    issue: 3
    container-title: Computational Intelligence
    page: 265-316
    issued:
      - year: 1988
  - id: fitting1991
    type: article-journal
    title: Bilattices and the semantics of logic programming
    volume: 11
    issue: 2
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
    issued:
      - year: 1940
---

The binary operation $\wedge_k : B \times B \to B$ on the carrier of a pre-bilattice.

## Proof of existence and properties

A pre-bilattice $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ is defined (Ginsberg 1988 §2; Fitting 1991 §2) such that $\langle B, \wedge_k, \vee_k \rangle$ is a lattice on the carrier $B$. By the lattice axioms (Birkhoff 1940 §I.1), $\wedge_k$ satisfies associativity, commutativity, idempotence, and absorption with $\vee_k$:

- $(a \wedge_k b) \wedge_k c = a \wedge_k (b \wedge_k c)$
- $a \wedge_k b = b \wedge_k a$
- $a \wedge_k a = a$
- $a \wedge_k (a \vee_k b) = a$

The induced relation $a \leq_k b \iff a \wedge_k b = a$ is the knowledge order, with reflexivity, antisymmetry, transitivity proved as for the truth-order case. The knowledge order is the order along which evidence accumulates in a predication valuation (Belnap 1977 §2).

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
