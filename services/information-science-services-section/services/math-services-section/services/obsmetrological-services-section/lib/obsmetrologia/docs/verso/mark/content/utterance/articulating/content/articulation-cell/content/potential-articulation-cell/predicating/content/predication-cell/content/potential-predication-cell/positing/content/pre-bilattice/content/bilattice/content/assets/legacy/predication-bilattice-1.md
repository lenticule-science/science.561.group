---
kind: definition
realizes: [knowledge-order, truth-order]
type: algebra
lean: SpatiotemporalKnowledgeSystem.Homebrew.Algebra.Bilattice.Bilattice
depends-on: [pre-bilattice, negation, truth-order, knowledge-order]
---

# Bilattice

A [pre-bilattice](pre-bilattice.md) equipped with a unary [negation](../morphisms/negation.md) $\sim$ — the algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim \rangle$ where the negation satisfies $a \leq_t b \Rightarrow \sim b \leq_t \sim a$ (antitone in the [truth order](../concepts/truth-order.md)), $a \leq_k b \Rightarrow \sim a \leq_k \sim b$ (monotone in the [knowledge order](../concepts/knowledge-order.md)), and $\sim \sim a = a$ (involutive).

A bilattice may additionally carry a [conflation](../morphisms/conflation.md) $-$, antitone in $\leq_k$, monotone in $\leq_t$, with $-(-a) = a$. When both negation and conflation are present they are typically required to commute: $\sim\, - = -\, \sim$.

The smallest non-trivial bilattice is the [four-element bilattice](four-bilattice.md) $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$.
