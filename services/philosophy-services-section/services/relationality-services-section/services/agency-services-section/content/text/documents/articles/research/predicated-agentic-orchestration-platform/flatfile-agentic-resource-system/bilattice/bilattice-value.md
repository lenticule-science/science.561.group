---
name: bilattice-value
description: An element of the four-valued bilattice FOUR — the value assigned to every predication-cell in the FARS substrate.
title: bilattice-value
---

The value space of the [predication-fibration](../structures/predication-fibration.md): the set $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \mathbf{\bot}, \mathbf{\top}\}$.
Every predication-cell $(e_1, q, e_2)$ is assigned exactly one element of $\mathbf{FOUR}$ by the fiber $\mathcal{E}_q(e_1, e_2)$.

The four elements are [true](true.md), [false](false.md), [mystery](mystery/mystery.md), and [contradiction](contradiction.md).
Their algebraic relationships are encoded as predication cells in those entities' frontmatter, using [negating](../transformers/negating.md), [truth-preceding](../code/transformers/truth-preceding.md), and [knowledge-preceding](../code/transformers/knowledge-preceding.md).
