---
name: "linear map"
---


A linear map is a function between [vector spaces](./vector-space.md) that respects the vector space structure — it preserves both addition and scalar multiplication. If you add two vectors and then apply the map, you get the same result as applying the map to each vector separately and then adding. If you scale a vector and then apply the map, you get the same result as applying the map first and then scaling.

Formally, a linear map $T: V \to W$ between vector spaces over the same [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) satisfies two conditions: $T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v})$ for all vectors $\mathbf{u}, \mathbf{v}$ in $V$, and $T(a\mathbf{v}) = aT(\mathbf{v})$ for every scalar $a$ and vector $\mathbf{v}$. These two conditions together mean that $T$ preserves all linear combinations: $T(a\mathbf{u} + b\mathbf{v}) = aT(\mathbf{u}) + bT(\mathbf{v})$. A linear map is completely determined by what it does to a [basis](./basis.md) — once you know where each basis vector goes, linearity forces every other value.

The simplest examples are familiar operations. Rotation of the plane by a fixed angle is linear: rotating the sum of two vectors is the same as rotating each and adding. Projection onto a line through the origin is linear. Differentiation is a linear map on the space of differentiable functions — the derivative of a sum is the sum of derivatives, and the derivative of a constant times a function is the constant times the derivative. Integration (as a definite integral) is also linear.

Every linear map has two fundamental subspaces. The kernel $\ker(T) = \{\mathbf{v} \in V : T(\mathbf{v}) = \mathbf{0}\}$ consists of everything the map sends to zero — it measures how much information the map loses. The image $\operatorname{im}(T) = \{T(\mathbf{v}) : \mathbf{v} \in V\}$ is everything the map can hit — it measures how much of the target space the map covers. Both the kernel and the image are subspaces, and they are linked by the rank-nullity theorem: $\dim V = \dim \ker(T) + \dim \operatorname{im}(T)$. This says the dimension of the source space splits cleanly into what gets collapsed (the nullity, $\dim \ker T$) and what survives (the rank, $\dim \operatorname{im} T$).

Every linear map between finite-dimensional spaces can be represented by a [matrix](./matrix.md) once bases are chosen, and composition of linear maps corresponds to matrix multiplication. This is why linear algebra is simultaneously the theory of abstract linear maps and the practical theory of matrices and systems of equations — they are two views of the same thing.

Linear maps are the [homomorphisms](./homomorphism.md) of vector spaces — the structure-preserving maps, in the same sense that group homomorphisms preserve group structure and ring homomorphisms preserve ring structure. In [category theory](../../documents/articles/teaching-articles/explanations/categories.md), they are the [morphisms](./morphism.md) in the category **Vect**$_F$ of vector spaces over a field $F$.
