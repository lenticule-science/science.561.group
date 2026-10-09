---
name: conflating
description: An optional unary operation - on a bilattice, antitone in the knowledge order, monotone in the truth order, and involutive. The Z/2 dual of negation; together with negation it generates the Klein-four symmetry of a bilattice.
gerund: conflating
agent-noun: conflator
imperative: conflate
domain: bilattice
codomain: bilattice
references:
  - id: ginsberg1988
    type: article-journal
    title: "Multivalued logics: A uniform approach to inference in artificial intelligence"
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
title: conflating
---

An optional unary operation $-$ on a [bilattice](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/structures/bilattice.md) satisfying:

- $a \leq_k b \Rightarrow -b \leq_k -a$ (antitone in the knowledge order);
- $a \leq_t b \Rightarrow -a \leq_t -b$ (monotone in the truth order);
- $-(-a) = a$ (involutive).

When both [negating](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/conflating/negating.md) and conflating are present on a bilattice, they are required to commute: $\sim\, - = -\, \sim$. The four involutive automorphisms $\{\mathrm{id},\, \sim,\, -,\, \sim\circ-\}$ they generate form the Klein-four group $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$ acting on the bilattice ([Fitting 1991]).

On the [four-element bilattice](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/structures/four-bilattice.md), conflation swaps $\bot \leftrightarrow \top$ and fixes $\mathbf{t}, \mathbf{f}$. (Negation swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and fixes $\bot, \top$.) The orbits of $K_4$ on $\mathbf{FOUR}$ are $\{\mathbf{t}, \mathbf{f}\}$ and $\{\bot, \top\}$ — each orbit is the extreme pair of one order and the incomparable middle pair of the other.
