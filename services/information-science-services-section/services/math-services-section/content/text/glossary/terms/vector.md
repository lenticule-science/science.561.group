---
name: "vector"
---


A vector is an element of a [vector space](./vector-space.md) — anything that can be added to others of its kind and scaled by numbers from a [field](./field.md). The word brings to mind arrows in space: a direction and a magnitude, drawn as a line segment with a pointed tip. That image is useful but narrow. Arrows in two- or three-dimensional space are vectors, but so are columns of numbers, polynomials, continuous functions, and sequences of real numbers. What makes something a vector is not what it looks like, but what you can do with it.

In $\mathbb{R}^n$ — the most concrete setting — a vector is an ordered $n$-tuple of real numbers: $(3, -1, 4)$ is a vector in $\mathbb{R}^3$. Addition is componentwise: $(3, -1, 4) + (1, 2, -1) = (4, 1, 3)$. Scalar multiplication scales every component: $2 \cdot (3, -1, 4) = (6, -2, 8)$. You can visualize these as arrows from the origin — adding two vectors places one arrow at the tip of the other (the parallelogram rule), and scaling a vector stretches or shrinks the arrow.

But the same operations work for [polynomials](./polynomial.md). The polynomials $3x^2 + x - 1$ and $x^2 - 2x + 5$ can be added: $4x^2 - x + 4$. You can scale by a real number: $2(3x^2 + x - 1) = 6x^2 + 2x - 2$. These operations satisfy all the vector space axioms, so polynomials are vectors in the vector space of polynomials. Similarly, continuous [functions](./function.md) from $[0, 1]$ to $\mathbb{R}$ form a vector space — you add functions pointwise and scale them pointwise — making each function a vector.

The distinction between "vector" and "scalar" is relational, not intrinsic. A real number is a scalar when it multiplies a vector, but the real numbers themselves form a one-dimensional vector space over $\mathbb{R}$, in which they are vectors. A $2 \times 2$ matrix is a vector in the space of all $2 \times 2$ matrices (you can add matrices and scale them), and simultaneously a representation of a [linear map](./linear-map.md) that acts on other vectors. Context determines which role an object plays.

The term "vector" comes from the Latin *vehere* (to carry), introduced in its mathematical sense by William Rowan Hamilton in the 1840s as part of his quaternion theory. Hamilton distinguished between the "scalar part" and the "vector part" of a quaternion. Josiah Willard Gibbs and Oliver Heaviside extracted the vector concept from quaternions in the 1880s and 1890s, developing the three-dimensional vector analysis still used in physics and engineering. The modern abstract sense — a vector as any element of any vector space — emerged through the axiomatization work of Giuseppe Peano and Hermann Grassmann, and became standard in the early twentieth century.
