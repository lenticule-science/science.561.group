---
name: bilattice
description: A pre-bilattice equipped with a unary negation. The algebra B = ⟨B, ∧_t, ∨_t, ∧_k, ∨_k, ~⟩ in which both lattice structures of the pre-bilattice hold and the negation is antitone in the truth order, monotone in the knowledge order, and involutive.
category: category
extending: pre-bilattice
negating: bilattice
references:
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
  - id: arieli-avron1996
    type: article-journal
    title: Reasoning with logical bilattices
    volume: 5
    issue: 1
    container-title: Journal of Logic, Language and Information
    page: 25-63
    issued:
      - year: 1996
---

A [pre-bilattice](../../../../../pre-bilattice.md) equipped with a unary [negation](../transformers/negating.md) $\sim$ — the algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim \rangle$ where the negation satisfies:

- $a \leq_t b \Rightarrow \sim b \leq_t \sim a$ (antitone in the truth order),
- $a \leq_k b \Rightarrow \sim a \leq_k \sim b$ (monotone in the knowledge order),
- $\sim \sim a = a$ (involutive).

A bilattice may additionally carry a [conflation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/conflating.md) $-$, antitone in $\leq_k$, monotone in $\leq_t$, involutive. When both negation and conflation are present, they are required to commute: $\sim\, - = -\, \sim$; the two commuting involutions generate the [Klein-four symmetry](../../klein-four-symmetry/klein-four-symmetry.md) of the bilattice. The smallest non-trivial bilattice is [four-bilattice](four-bilattice.md) $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$.

Introduced by [@ginsberg1988] and developed for logic-programming semantics by [@fitting1991]; the algebraic axiomatization of bilattice negation is consolidated in [@arieli-avron1996].
