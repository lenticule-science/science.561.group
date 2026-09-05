---
name: negating
description: A unary operation ~ on a pre-bilattice that is antitone in the truth order, monotone in the knowledge order, and involutive. A pre-bilattice equipped with a negation is a bilattice.
gerund: negating
agent-noun: negator
imperative: negate
domain: bilattice
codomain: bilattice
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

A unary operation $\sim$ on a [pre-bilattice](../structures/pre-bilattice.md) is a **negation** if it is:

- antitone in the truth order: $a \leq_t b \Rightarrow \sim b \leq_t \sim a$;
- monotone in the knowledge order: $a \leq_k b \Rightarrow \sim a \leq_k \sim b$;
- involutive: $\sim \sim a = a$.

A pre-bilattice equipped with a negation is a [bilattice](../structures/bilattice.md) ([Ginsberg 1988], [Fitting 1991]). On the [four-element bilattice](../structures/four-bilattice.md), negation fixes $\bot$ and $\top$ and swaps $\mathbf{t}$ and $\mathbf{f}$.
