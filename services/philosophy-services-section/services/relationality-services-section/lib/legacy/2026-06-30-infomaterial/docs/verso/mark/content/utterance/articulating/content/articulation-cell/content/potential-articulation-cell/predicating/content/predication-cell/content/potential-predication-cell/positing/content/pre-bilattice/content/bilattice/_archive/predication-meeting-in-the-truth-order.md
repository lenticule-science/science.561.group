---
name: meeting-in-the-truth-order
description: The binary meet operation ∧_t of the truth order on a pre-bilattice. The lattice operation on the carrier B that, together with joining-in-the-truth-order, equips B with the lattice ⟨B, ∧_t, ∨_t⟩ inducing the truth order a ≤_t b ⟺ a ∧_t b = a.
gerund: meeting-in-the-truth-order
agent-noun: meeter-in-the-truth-order
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

The binary operation $\wedge_t : B \times B \to B$ on the carrier of a pre-bilattice.

## Proof of existence and properties

A pre-bilattice $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ is defined (Ginsberg 1988 §2; Fitting 1991 §2) such that $\langle B, \wedge_t, \vee_t \rangle$ is a lattice on the carrier $B$. By the lattice axioms (Birkhoff 1940 *Lattice Theory* §I.1), $\wedge_t$ satisfies:

- Associativity: $(a \wedge_t b) \wedge_t c = a \wedge_t (b \wedge_t c)$.
- Commutativity: $a \wedge_t b = b \wedge_t a$.
- Idempotence: $a \wedge_t a = a$.
- Absorption with $\vee_t$: $a \wedge_t (a \vee_t b) = a$.

The induced relation $a \leq_t b \iff a \wedge_t b = a$ is the truth order. By idempotence, $a \leq_t a$ (reflexivity). By commutativity, $a \leq_t b$ and $b \leq_t a$ imply $a = b$ (antisymmetry). By associativity, $a \leq_t b$ and $b \leq_t c$ imply $a \wedge_t c = (a \wedge_t b) \wedge_t c = a \wedge_t (b \wedge_t c) = a \wedge_t b = a$, so $a \leq_t c$ (transitivity).

Mechanized in Lean at `PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice`.
