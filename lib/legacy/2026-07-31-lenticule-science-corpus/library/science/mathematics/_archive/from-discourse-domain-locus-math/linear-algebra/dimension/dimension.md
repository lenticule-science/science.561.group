---

title: "Dimension"
aliases:
  - "dimension"
date-created: 2026-03-05
tags: []
---

The dimension of a [vector space](../objects/vector-space.md) is the number of [vectors](../objects/vector.md) in any [basis](../objects/basis.md) — the number of independent directions in the space. The real line $\mathbb{R}$ is one-dimensional: a single number determines a point. The plane $\mathbb{R}^2$ is two-dimensional: you need two numbers (an $x$-coordinate and a $y$-coordinate). Ordinary space $\mathbb{R}^3$ is three-dimensional: three numbers are needed. The pattern extends: $\mathbb{R}^n$ has dimension $n$, meaning $n$ independent numbers are needed to specify a point.

Dimension is well-defined because all bases of a given vector space have the same cardinality. This is a nontrivial theorem, not an obvious fact. A priori, you might worry that one basis could have 3 vectors and another could have 4. But this cannot happen: any two bases of the same space are in bijection. (In the finite-dimensional case, this is proved by the Steinitz exchange lemma; the infinite-dimensional case requires the axiom of choice.) Because the basis size is invariant, dimension is an intrinsic property of the space — it does not depend on which basis you happen to choose.

Dimension is the complete invariant for finite-dimensional vector spaces over a given [field](../../algebra/objects/field.md). Two such spaces are isomorphic — structurally identical as vector spaces — if and only if they have the same dimension. $\mathbb{R}^3$ and the space of real polynomials of degree at most 2 (which has basis $\{1, x, x^2\}$) are both 3-dimensional real vector spaces, and are therefore isomorphic: there exists a bijective [linear map](../morphisms/linear-map.md) between them. This is a remarkable classification result — a single number (the dimension) completely determines the structure. Most algebraic structures are not this simple to classify.

Familiar examples: $\mathbb{R}^n$ has dimension $n$. The space of polynomials of degree at most $d$ has dimension $d + 1$ (the basis is $\{1, x, x^2, \ldots, x^d\}$, which has $d + 1$ elements). The space of $m \times n$ [matrices](../objects/matrix.md) has dimension $mn$ (each of the $mn$ entries is an independent coordinate). The space of all polynomials (of any degree) is infinite-dimensional: no finite set of polynomials spans it.

Dimension governs many key facts in linear algebra. The rank-nullity theorem says that for a linear map $T: V \to W$, the dimension of the kernel (nullity) plus the dimension of the image (rank) equals the dimension of $V$. A system of $m$ linear equations in $n$ unknowns has a nontrivial solution whenever $n > m$ — because the kernel of the corresponding linear map must have positive dimension. The number of [eigenvalues](./eigenvalue.md) of a map on an $n$-dimensional space is at most $n$. At every turn, dimension is the number that controls what is possible.
