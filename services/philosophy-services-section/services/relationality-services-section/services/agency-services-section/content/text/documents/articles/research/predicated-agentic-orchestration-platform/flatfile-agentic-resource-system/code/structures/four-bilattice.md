---
name: four-bilattice
description: The four-element bilattice FOUR — the fixed value space of every predication fiber in the FARS substrate.
title: four-bilattice
---

The smallest non-trivial bilattice, $\mathbf{FOUR}$, with carrier $\{\mathbf{t}, \mathbf{f}, \mathbf{\bot}, \mathbf{\top}\}$: [true](teaching/explanations/true.md), [false](teaching/explanations/false.md), [mystery](../../bilattice/mystery/mystery.md), and [contradiction](teaching/explanations/contradiction.md).

The four elements are equipped with two partial orders whose cells are encoded in those entities' frontmatter: the truth order (recorded by [truth-preceding](../transformers/truth-preceding.md)) and the knowledge order (recorded by [knowledge-preceding](../transformers/knowledge-preceding.md)).
The negation operation (recorded by [negating](../transformers/negating.md)) swaps the evidence sides.

As a twist product, $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$: each element is a pair $\langle a_+, a_- \rangle \in \{0,1\}^2$ tracking positive evidence ($a_+$) and negative evidence ($a_-$).
Negation is the coordinate swap; the truth order raises $a_+$ and lowers $a_-$; the knowledge order raises both.

$\mathbf{FOUR}$ is fixed as the residuated lattice $\mathbf{L}$ in the FARS [predication-fibration](predication-fibration.md) base $(\mathbf{FOUR}, \mathcal{C}, E)$.
