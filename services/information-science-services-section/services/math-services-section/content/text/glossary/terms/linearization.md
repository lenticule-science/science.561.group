---
title: "Linearization"
aliases:
  - "linearization"
  - "free vector space functor"
  - "vectorization"
date-created: 2026-08-26
tags: []
defines:
  - "Linearization"
  - "free vector space functor"
type: term
---

Linearization is the passage from a bare [set](./set.md) to a [vector space](./vector-space.md) built freely from it: given a set $X$ and a field $\Bbbk$, the linearization $\Bbbk[X]$ is the vector space of formal $\Bbbk$-linear combinations $\sum_i c_i \cdot x_i$ of elements of $X$, with $X$ itself sitting inside as the basis. This is the *free* vector space on $X$ — it imposes no relations beyond those forced by the vector space axioms, so a [function](./function.md) $X \to V$ into any vector space extends uniquely to a linear map $\Bbbk[X] \to V$.

That universal property makes $\Bbbk[-]: \mathbf{Set} \to \mathbf{Vect}_\Bbbk$ left [adjoint](./adjunction.md) to the forgetful functor $\mathbf{Vect}_\Bbbk \to \mathbf{Set}$, and this adjointness is what makes linearization functorial and well-behaved: a function $f: X \to Y$ linearizes to the unique linear map $\Bbbk[f]: \Bbbk[X] \to \Bbbk[Y]$ sending each basis vector $x$ to $f(x)$, and this assignment respects composition and identities.

Applied levelwise, linearization turns a [simplicial set](./simplicial-set.md) $X_\bullet$ into a simplicial vector space $\Bbbk[X_\bullet]$ — the vector space $\Bbbk[X_n]$ in each simplicial degree $n$, with the face and degeneracy maps linearized. This is the standard first step in producing a [chain complex](./chain-complex.md) from purely combinatorial (set-valued) data: linearize, then apply the [Dold–Kan correspondence](./dold-kan-correspondence.md) to the resulting simplicial vector space to obtain an honest chain complex. The same recipe applies to any presheaf category built on shapes other than $\Delta$ — dendroidal sets among them — wherever an analogous normalization functor is available.

Linearizing loses information relative to the original set-valued object exactly to the extent that formal linear combinations can cancel: a nontrivial relation among basis elements in $\Bbbk[X]$ can only come from the differential imposed afterward, never from linearization itself, since $\Bbbk[-]$ is free. All of the "collapsing" that turns a combinatorial shape into something with homology happens downstream, in the differential and in normalization — linearization only supplies the linear structure those steps require.
