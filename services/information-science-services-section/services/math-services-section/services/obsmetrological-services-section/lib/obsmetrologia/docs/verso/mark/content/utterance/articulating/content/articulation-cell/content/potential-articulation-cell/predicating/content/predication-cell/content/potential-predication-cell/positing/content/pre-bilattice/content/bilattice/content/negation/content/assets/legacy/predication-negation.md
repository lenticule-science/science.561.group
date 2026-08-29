---
kind: morphism
realizes: [internal-z2-gauge]
type: operation
symbol: "\\sim"
lean: SpatiotemporalKnowledgeSystem.Homebrew.Algebra.TwistProduct.negation
depends-on: [pre-bilattice, truth-order, knowledge-order]
see-also: [bilattice, twist-product, four-bilattice, evidence]
---

# Negation

A unary operation $\sim$ on a [pre-bilattice](../objects/pre-bilattice.md) is a **negation** if it is

- antitone in the [truth order](../concepts/truth-order.md): $a \leq_t b \Rightarrow \sim b \leq_t \sim a$;
- monotone in the [knowledge order](../concepts/knowledge-order.md): $a \leq_k b \Rightarrow \sim a \leq_k \sim b$;
- involutive: $\sim \sim a = a$.

A pre-bilattice equipped with a negation is a [bilattice](../objects/bilattice.md). On a [twist product](../objects/twist-product.md) $\mathbf{L}^\bowtie$, negation is given by coordinate swap, $\sim \langle a, b \rangle = \langle b, a \rangle$, exchanging positive and negative [evidence](../concepts/evidence.md); on the [four-element bilattice](../objects/four-bilattice.md) it fixes $\bot$ and $\top$ and swaps $\mathbf{t}$ and $\mathbf{f}$.
