---
kind: question
status: partial
explores: [four-bilattice, knowledge-order, truth-order, bilattice]
---

# The duality between knowledge and truth orders

> **Progress.** The [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md) gives the categorical statement asked for in sub-question 2: the order-swap involution $\sigma : \bot \leftrightarrow \mathbf{f}, \mathbf{t} \leftrightarrow \top$ is an involutive auto-equivalence of the predication-presheaves category that intertwines $T_k$-closure theory with $T_t$-closure theory (defined in [truth-order-closure](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/truth-order-closure/truth-order-closure.md)). The 8-element extended group $G_8 = \langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$ subsumes the Klein-four discussion in sub-question 3. Sub-questions 1 (defining property of distributive bilattices?) and 4 (generalization to $\mathbf{NINE}$) remain open.

The two orders on $\mathbf{FOUR}$ aren't just "two different orders" — they have a specific structural relationship that I haven't seen formalised in the corpus or (to my knowledge) in the bilattice literature:

- $\leq_k$: $\bot$ is min, $\top$ is max, $\mathbf{t}$ and $\mathbf{f}$ are incomparable middle elements.
- $\leq_t$: $\mathbf{f}$ is min, $\mathbf{t}$ is max, $\bot$ and $\top$ are incomparable middle elements.

The **incomparable middle pair** of one order is the **extreme pair** of the other. $(\mathbf{t}, \mathbf{f})$ are extremes of $\leq_t$ but middle of $\leq_k$; $(\bot, \top)$ are extremes of $\leq_k$ but middle of $\leq_t$.

This is a real structural property, not just a coincidence of the four-element case. The general definition of a *bilattice* requires interlinked order relations, but the specific "extreme/middle swap" duality is more particular.

## Open

1. Is this a defining property of distributive bilattices, or a property that distinguishes some bilattice subclass?
2. Does the duality have a categorical statement — e.g., a functor or natural transformation between $(\mathbf{FOUR}, \leq_k)$-flavoured structures and $(\mathbf{FOUR}, \leq_t)$-flavoured structures?
3. The Klein-four involutions ([bilattice-klein-four-symmetry](bilattice-klein-four-symmetry.md)) act on these orders: negation preserves $\leq_k$ and reverses $\leq_t$ on $\{\mathbf{t}, \mathbf{f}\}$; conflation preserves $\leq_t$ and reverses $\leq_k$ on $\{\bot, \top\}$. So each involution flips one order on its extreme pair while preserving the other on those middle elements. Is this a general property — every involution of a bilattice flips one order's extremes while preserving the other?
4. For larger bilattices (more than 4 elements), does the extreme/middle duality generalize? E.g., for $\mathbf{NINE}$ (the bilattice $\mathbf{3}^\bowtie$), what's the structure?

The corpus's [step-$n$ / bilattice cardinality coincidence theorem](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md) noted that $\mathbf{FOUR}$ has *two* orders, *three* non-bottom values, *four* total values — the three structurally-distinguished cardinalities. The "incomparable middle = extreme of dual" property is what gives those cardinalities their structural distinguishedness.
