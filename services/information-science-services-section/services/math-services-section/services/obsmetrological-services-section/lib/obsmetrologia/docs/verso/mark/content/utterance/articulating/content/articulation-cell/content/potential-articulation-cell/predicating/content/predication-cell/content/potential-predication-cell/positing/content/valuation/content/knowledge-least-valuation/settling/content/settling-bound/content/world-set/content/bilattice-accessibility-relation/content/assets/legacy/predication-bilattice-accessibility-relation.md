---
type: definition
class: relation
symbol: R
depends-on: [world-set, twist-product, residuated-lattice]
---

# Bilattice accessibility relation

A four-valued relation, denoted $R$, between worlds: a function

$$R : W \times W \to \mathbf{L}^\bowtie$$

from ordered pairs of worlds in a [world set](world-set.md) $W$ to elements of the [twist product](twist-product.md) $\mathbf{L}^\bowtie$ over a [residuated lattice](residuated-lattice.md) $\mathbf{L}$. The value $R(w, w') \in \mathbf{L}^\bowtie$ records the bilattice-valued accessibility from $w$ to $w'$.

When $\mathbf{L} = \mathbf{2}$, $R$ takes values in $\mathbf{FOUR}$; restricting further to the consistent sub-algebra recovers a Boolean accessibility relation in the classical Kripke sense.
