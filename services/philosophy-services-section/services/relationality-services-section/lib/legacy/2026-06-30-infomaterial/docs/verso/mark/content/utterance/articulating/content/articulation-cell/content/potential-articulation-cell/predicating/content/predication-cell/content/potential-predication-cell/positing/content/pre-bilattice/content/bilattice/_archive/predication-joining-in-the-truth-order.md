---
name: joining-in-the-truth-order
description: The binary join operation ∨_t of the truth order on a pre-bilattice. The lattice operation on the carrier B that, together with meeting-in-the-truth-order, equips B with the lattice ⟨B, ∧_t, ∨_t⟩ inducing the truth order a ≤_t b ⟺ a ∨_t b = b.
gerund: joining-in-the-truth-order
agent-noun: joiner-in-the-truth-order
domain: pair-of-pre-bilattice
codomain: pre-bilattice
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

The binary operation $\vee_t : B \times B \to B$ on the carrier of a pre-bilattice.

## Proof of existence and properties

A pre-bilattice $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ is defined (Ginsberg 1988 §2; Fitting 1991 §2) such that $\langle B, \wedge_t, \vee_t \rangle$ is a lattice on the carrier $B$. By the lattice axioms (Birkhoff 1940 §I.1), $\vee_t$ satisfies:

- Associativity: $(a \vee_t b) \vee_t c = a \vee_t (b \vee_t c)$.
- Commutativity: $a \vee_t b = b \vee_t a$.
- Idempotence: $a \vee_t a = a$.
- Absorption with $\wedge_t$: $a \vee_t (a \wedge_t b) = a$.

The dual induced relation $a \leq_t b \iff a \vee_t b = b$ equals the relation defined by $\wedge_t$ (by absorption, the two definitions coincide; Birkhoff 1940 §I.2). Reflexivity, antisymmetry, transitivity follow as for $\wedge_t$.

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
