---
name: knowledge-preceding
description: A predicate whose cells record the knowledge order — which bilattice-value carries less information than another.
title: knowledge-preceding
---

The knowledge order $\leq_k$ on $\mathbf{FOUR}$.
A cell $(v_1, \texttt{knowledge-preceding}, v_2)$ at $\mathbf{t}$ records that $v_1 \leq_k v_2$: $v_2$ carries at least as much information as $v_1$, regardless of direction.

Order structure: mystery is the minimum; contradiction is the maximum; true and false are incomparable, both strictly between mystery and contradiction.
These cells are encoded in the frontmatter of the subject bilattice-value entities: see [mystery](../../bilattice/mystery/mystery.md), [true](teaching/explanations/true.md), [false](teaching/explanations/false.md).

Properties not yet encodable as predication cells: [negating](negating.md) is a $\leq_k$-automorphism ($v_1 \leq_k v_2 \Rightarrow \sim v_1 \leq_k \sim v_2$).
Predication-settlings are $\leq_k$-monotone: the closure engine accumulates evidence without retraction.
The meet $\wedge_k$ and join $\vee_k$ of this order are the bilattice's knowledge-lattice operations, used for merging evidence from multiple sources.
