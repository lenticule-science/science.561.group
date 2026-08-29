---
type: morphism
realizes: [internal-z2-gauge]
class: operation
symbol: "-"
depends-on: [bilattice]
---

# Conflation

An optional unary operation $-$ on a [bilattice](../objects/bilattice.md) satisfying:

- $a \leq_k b \Rightarrow -b \leq_k -a$ (antitone in the [knowledge order](../concepts/knowledge-order.md));
- $a \leq_t b \Rightarrow -a \leq_t -b$ (monotone in the [truth order](../concepts/truth-order.md));
- $-(-a) = a$ (involutive).

When both [negation](negation.md) and conflation are present on a bilattice, they are typically required to commute: $\sim\, - = -\, \sim$.
