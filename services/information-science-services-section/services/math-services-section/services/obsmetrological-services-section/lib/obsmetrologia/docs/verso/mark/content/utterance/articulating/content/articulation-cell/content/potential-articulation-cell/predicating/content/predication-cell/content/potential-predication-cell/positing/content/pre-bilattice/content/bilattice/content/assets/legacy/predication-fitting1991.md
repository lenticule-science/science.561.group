---
kind: reference
year: 1991
title: "Bilattices and the Semantics of Logic Programming"
venue: "Journal of Logic Programming 11(2), 91–116"
---

## Full citation

M. Fitting. "Bilattices and the Semantics of Logic Programming." *Journal of Logic Programming* 11(2), 91–116, 1991.

## Status

Pending direct access; covered via [@fitting2006] and [@rivieccio2010].

## Annotation

Establishes **fixed-point semantics for logic programs over any bilattice**. Generalizes Kripke's three-valued construction to bilattices: every monotone-in-$\leq_k$ operator on a bilattice has a least fixed point, computed by transfinite iteration from $\bot$.

Two contributions our program directly inherits:
1. The **closure operator** framing — bilattice-valued logic programs evaluate to fixed points of monotone-in-$\leq_k$ operators. This is the conceptual origin of the foundational-layer's closure operator $\mathrm{cl}$ on fiber algebras.
2. The **pointwise lift** $B^S$ — for any bilattice $B$ and index set $S$, the function space $B^S$ inherits bilattice structure pointwise. This is what licenses the foundational-layer's fiber algebra $A_p = \mathbf{L}^{\bowtie\, E \times E}$ as a bilattice.

Cited in the foundational layer for closure-and-equilibrium content and for the fiber-algebra construction.
