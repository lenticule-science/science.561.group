---
type: question
class: internal
status: partial
explores: [four-bilattice, knowledge-order, truth-order, bilattice]
---

# The duality between knowledge and truth orders

> **Progress.** The [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md) gives the categorical statement asked for in sub-question 2: the order-swap involution $\sigma : \bot \leftrightarrow \mathbf{f}, \mathbf{t} \leftrightarrow \top$ is an involutive auto-equivalence of the predication-presheaves category that intertwines $T_k$-closure theory with $T_t$-closure theory (defined in [truth-order-closure](../objects/truth-order-closure.md)). The 8-element extended group $G_8 = \langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$ subsumes the Klein-four discussion in sub-question 3, and is now identified as $G_8 \cong D_4$ (dihedral of order 8) via the [dihedral symmetry on twist-products theorem](../theorems/dihedral-symmetry-on-twist-products.md), which also extends $\sigma$ canonically from $\mathbf{FOUR}$ to any de Morgan-based twist-product. Sub-question 1 is *partially resolved*: the "extreme of one order = incomparable middle of the other" property holds for *every* twist-product $\mathbf{L} \otimes \mathbf{L}$ (it's structural to the twist-product, not specific to $\mathbf{FOUR}$), so it's not a sub-class-distinguishing property; whether it *defines* distributive bilattices (the converse — every structure with this property is a distributive bilattice) remains open. Sub-question 4 (generalization to $\mathbf{NINE}$) remains open.

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

The corpus's [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md) noted that $\mathbf{FOUR}$ has *two* orders, *three* non-bottom values, *four* total values — the three structurally-distinguished cardinalities. The "incomparable middle = extreme of dual" property is what gives those cardinalities their structural distinguishedness.
