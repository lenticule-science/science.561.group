---
type: definition
realizes: [knowledge-order, truth-order, evidence]
class: algebra
symbol: "⋈"
lean: PredicationCategories.Homebrew.Algebra.TwistProduct.TwistProduct
depends-on: [pre-bilattice, bilattice, negation, truth-order, knowledge-order]
---

# Twist product

For lattices $\mathbf{L}_1$ and $\mathbf{L}_2$ with operations $\sqcap_i, \sqcup_i$ and orders $\leq_i$, the **twist product** $\mathbf{L}_1 \bowtie \mathbf{L}_2$ is the [pre-bilattice](pre-bilattice.md) with carrier $L_1 \times L_2$ and operations

$$\langle a_1, a_2 \rangle \wedge_t \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1,\, a_2 \sqcup_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \vee_t \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1,\, a_2 \sqcap_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \wedge_k \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1,\, a_2 \sqcap_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \vee_k \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1,\, a_2 \sqcup_2 b_2 \rangle$$

The induced orders are
$$\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } b_2 \leq_2 a_2,$$
$$\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } a_2 \leq_2 b_2.$$

The first coordinate tracks positive [evidence](teaching/explanations/evidence.md); the second tracks negative evidence. The truth order raises positive and lowers negative; the knowledge order raises both.

When $\mathbf{L}_1 = \mathbf{L}_2 = \mathbf{L}$, the twist product is denoted $\mathbf{L}^\bowtie$ and equipped with the [negation](../morphisms/negation.md) $\sim \langle a, b \rangle = \langle b, a \rangle$, making it a [bilattice](bilattice.md). If $\mathbf{L}$ is distributive, so is $\mathbf{L}^\bowtie$. Specializing to $\mathbf{L} = \mathbf{2}$ yields $\mathbf{2}^\bowtie \cong$ [$\mathbf{FOUR}$](four-bilattice.md), with $\mathbf{f} = \langle 0, 1 \rangle$, $\bot = \langle 0, 0 \rangle$, $\top = \langle 1, 1 \rangle$, $\mathbf{t} = \langle 1, 0 \rangle$.
