---
title: "determinant"
type: term
---


The determinant is a single number you can compute from a square [matrix](./matrix.md) that tells you something fundamental about the [linear map](./linear-map.md) the matrix represents: whether it collapses space, and if not, by how much it scales volumes and whether it flips orientation.

For a $2 \times 2$ matrix, the formula is simple: $\det \begin{pmatrix} a & b \\ c & d \end{pmatrix} = ad - bc$. Consider the matrix $\begin{pmatrix} 3 & 0 \\ 0 & 2 \end{pmatrix}$, which stretches the $x$-axis by 3 and the $y$-axis by 2. Its determinant is $3 \cdot 2 - 0 \cdot 0 = 6$ — exactly the factor by which it scales areas. A unit square becomes a $3 \times 2$ rectangle with area 6. Now consider $\begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$, which swaps the two axes (a reflection). Its determinant is $0 \cdot 0 - 1 \cdot 1 = -1$: the area is preserved ($|{-1}| = 1$) but orientation is reversed (the sign is negative).

This geometric meaning generalizes to all dimensions. For any $n \times n$ matrix $A$, the absolute value $|\det(A)|$ measures the factor by which the corresponding linear map scales $n$-dimensional volumes. The sign tells you whether orientation is preserved (positive) or reversed (negative). When $\det(A) = 0$, the map collapses at least one dimension entirely — it squashes $n$-dimensional space into something of lower dimension, and the "volume" of the image is zero.

This is why the determinant encodes invertibility. A matrix $A$ is invertible if and only if $\det(A) \neq 0$. When the determinant is zero, the linear map is not bijective — it collapses some direction, so you cannot recover the original vector from the output. When the determinant is nonzero, no information is lost, and the map can be reversed.

The determinant is multiplicative: $\det(AB) = \det(A)\det(B)$. If $A$ scales volumes by a factor of 3 and $B$ scales volumes by a factor of 5, then applying both scales volumes by a factor of 15. This multiplicative property makes the determinant a [homomorphism](./homomorphism.md) from the ring of matrices to the underlying [field](./field.md).

The abstract characterization is clean: the determinant is the unique function from square matrices to the field that is alternating (swapping two columns negates it), multilinear (linear in each column separately), and normalized (it sends the identity matrix to 1). Everything else — the cofactor expansion formula, Cramer's rule, the connection to [eigenvalues](./eigenvalue.md) (the determinant is the product of all eigenvalues) — follows from these three properties.

Gottfried Wilhelm Leibniz introduced determinants in 1693 while studying systems of linear equations. Independently, Seki Takakazu developed similar methods in Japan, published in *Kai Fukudai no Hō* (1683). Augustin-Louis Cauchy gave the first systematic treatment in 1815, standardizing notation and proving the multiplication theorem $\det(AB) = \det(A)\det(B)$. Carl Gustav Jacob Jacobi advanced the theory further in *De determinantibus functionalibus* (1841), introducing the functional determinant now called the Jacobian — essential for changing variables in multivariable integration.
