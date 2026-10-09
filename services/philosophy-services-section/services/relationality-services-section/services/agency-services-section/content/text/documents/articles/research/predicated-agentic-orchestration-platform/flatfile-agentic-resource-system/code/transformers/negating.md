---
name: negating
description: A predicate whose cells record the bilattice negation — which bilattice-value is the evidential opposite of another.
title: negating
---

The negation operation $\sim$ on $\mathbf{FOUR}$.
In the twist-product representation $\langle a_+, a_- \rangle$, negation is the coordinate swap $\sim\langle a_+, a_- \rangle = \langle a_-, a_+ \rangle$.

A cell $(v_1, \texttt{negating}, v_2)$ at $\mathbf{t}$ records that $v_2 = \sim v_1$.
These cells are encoded in the frontmatter of the subject bilattice-value entities: see [true](teaching/explanations/true.md), [false](teaching/explanations/false.md), [mystery](../../bilattice/mystery/mystery.md), [contradiction](teaching/explanations/contradiction.md).

Properties not yet encodable as predication cells: negating is antitone in the truth order and a $\leq_k$-automorphism.
It is an involution ($\sim\!\sim v = v$).
