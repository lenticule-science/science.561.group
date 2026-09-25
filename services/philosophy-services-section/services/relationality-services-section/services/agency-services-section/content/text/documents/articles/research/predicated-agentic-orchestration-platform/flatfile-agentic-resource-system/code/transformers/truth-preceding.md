---
name: truth-preceding
description: A predicate whose cells record the truth order — which bilattice-value carries less positive evidence than another.
title: truth-preceding
---

The truth order $\leq_t$ on $\mathbf{FOUR}$.
A cell $(v_1, \texttt{truth-preceding}, v_2)$ at $\mathbf{t}$ records that $v_1 \leq_t v_2$: $v_2$ carries at least as much positive evidence as $v_1$.

Order structure: false is the minimum; true is the maximum; mystery and contradiction are incomparable, both strictly between false and true.
These cells are encoded in the frontmatter of the subject bilattice-value entities: see [false](teaching/explanations/false.md), [mystery](../../bilattice/mystery/mystery.md), [contradiction](teaching/explanations/contradiction.md).

Properties not yet encodable as predication cells: [negating](negating.md) is antitone in this order ($v_1 \leq_t v_2 \Rightarrow \sim v_2 \leq_t \sim v_1$).
The meet $\wedge_t$ and join $\vee_t$ of this order are the bilattice's truth-lattice operations.
