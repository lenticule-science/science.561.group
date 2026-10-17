---
type: definition
realizes: [knowledge-order, truth-order]
class: algebra
lean: PredicationCategories.Homebrew.Algebra.Bilattice.PreBilattice
---

# Pre-bilattice

An algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ in which $\langle B, \wedge_t, \vee_t \rangle$ and $\langle B, \wedge_k, \vee_k \rangle$ are both lattices.

The order associated with the first lattice is the [truth order](../../truth-order/truth-order.md) $\leq_t$; the order associated with the second is the [knowledge order](teaching/explanations/knowledge-order.md) $\leq_k$. When both lattices are bounded, their extremes are denoted $\mathbf{f}, \mathbf{t}$ (bottom and top in $\leq_t$) and $\bot, \top$ (bottom and top in $\leq_k$).

A pre-bilattice is *interlaced* if each of the four lattice operations is monotone with respect to both orders; it is *distributive* if all twelve distributive laws $x \circ (y \bullet z) \approx (x \circ y) \bullet (x \circ z)$ hold for distinct $\circ, \bullet \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$.

A pre-bilattice equipped with a unary [negation](../morphisms/negation.md) is a [bilattice](bilattice.md).
