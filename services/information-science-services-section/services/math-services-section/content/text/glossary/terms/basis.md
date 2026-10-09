---
name: "basis"
---


A basis of a [vector space](./vector-space.md) is a collection of [vectors](./vector.md) that are, in a precise sense, both sufficient and minimal: sufficient to build every vector in the space, and minimal in that none of them is redundant. A basis gives a coordinate system — once you choose a basis, every vector can be described uniquely by a list of numbers (its coordinates with respect to that basis).

Formally, a set of vectors $\{v_1, v_2, \ldots, v_n\}$ in a vector space $V$ is a basis if it satisfies two conditions. First, the set spans $V$: every vector in $V$ can be expressed as a linear combination $a_1 v_1 + a_2 v_2 + \cdots + a_n v_n$ for some scalars $a_1, \ldots, a_n$ from the underlying [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md). Second, the set is linearly independent: the only way to produce the zero vector as a linear combination is with all coefficients zero ($a_1 v_1 + \cdots + a_n v_n = \mathbf{0}$ implies $a_1 = \cdots = a_n = 0$). These two conditions together guarantee that the representation of each vector as a linear combination is unique — spanning ensures existence, independence ensures uniqueness.

The most familiar basis is the standard basis of $\mathbb{R}^n$. In $\mathbb{R}^3$, the standard basis is $\{(1, 0, 0), (0, 1, 0), (0, 0, 1)\}$ — the three unit vectors along the coordinate axes. Every vector $(a, b, c)$ is $a(1, 0, 0) + b(0, 1, 0) + c(0, 0, 1)$, and the coordinates $(a, b, c)$ are the coefficients. But there are many other bases for $\mathbb{R}^3$: any three non-coplanar vectors will do. Choosing a different basis is like choosing a different coordinate system — the vectors don't change, but their numerical descriptions do.

A vector space may have a finite or infinite basis. The space of all polynomials with real coefficients has the infinite basis $\{1, x, x^2, x^3, \ldots\}$ — every polynomial is a *finite* linear combination of these monomials, even though the basis itself is infinite. Every vector space has at least one basis, though for infinite-dimensional spaces this fact requires the axiom of choice (specifically, Zorn's lemma).

The fundamental theorem about bases is that all bases of a given vector space have the same cardinality. This number is the [dimension](./dimension.md) of the space. The fact that different bases can have wildly different-looking vectors but always the same number of them is a deep structural fact — it means that dimension is an intrinsic property of the space, not an artifact of a particular choice of coordinates.

The choice of basis determines the [matrix](./matrix.md) representation of [linear maps](./linear-map.md). Once you fix bases for the source and target spaces, every linear map corresponds to a unique matrix, and vice versa. Changing the basis changes the matrix (by a similarity transformation) but not the underlying map. The [eigenvalues](./eigenvalue.md) and [determinant](./determinant.md) of the map — properties that are intrinsic to the map — are the same in every basis, while the specific matrix entries are not.
