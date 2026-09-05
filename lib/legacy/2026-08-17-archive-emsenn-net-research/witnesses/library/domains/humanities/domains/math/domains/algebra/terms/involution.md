---

description: "A function that is its own inverse: f(f(x)) = x. Negation and conflation on bilattices are involutions."
aliases: [involution, involutions, involutory]
specialization: function
laws: self-inverse
date-created: 2026-03-30
---

An involution is a function $f$ satisfying $f(f(x)) = x$ for all $x$. Applying it twice returns to the starting point.

On the four-valued [bilattice](./bilattice.md), there are two involutions:

- **Negation** $\mathord{\sim}$: swaps $t \leftrightarrow f$, fixes $\bot$ and $\top$. In the [twist product](./twist-product.md): $\mathord{\sim}(a, b) = (b, a)$.
- **Conflation** $-$: swaps $\bot \leftrightarrow \top$, fixes $t$ and $f$. In the twist product: $-(a, b) = (1-b, 1-a)$.

Together they generate the Klein four-group $\mathbb{Z}_2 \times \mathbb{Z}_2$, the symmetry group of the bilattice.

An involution on a [lattice](../../order/terms/lattice.md) that reverses the ordering ($x \leq y$ implies $f(y) \leq f(x)$) produces a [De Morgan algebra](./de-morgan-algebra.md). Kalman's (1958) twist product construction generates De Morgan algebras from involutions on bounded distributive lattices.
