---
name: learn-linear-algebra
description: Learn vector spaces, linear maps, and matrix representations — sufficient to reason about linearity, dimension, and computation.
---

# Learn Linear Algebra

The structural and computational language of linear maps: vector spaces (objects), linear maps between them (morphisms), and matrices as a coordinate-dependent representation of those maps.

## What you will be able to do

- Given a structure, decide whether it is a vector space (over a stated field) and identify its dimension.
- Given a linear map, choose a basis on each side and write the matrix representation.
- Distinguish properties of a map (rank, kernel, image, invertibility) from properties of a particular matrix representation (which depend on basis choice).
- Compute with matrices when computation is needed (multiplication, inversion, eigenstructure) without losing track of the underlying linear-algebraic content.

## Reference

- `library/domains/humanities/domains/math/domains/linear-algebra/` — the linear-algebra domain.

## Verification

Take a linear map you can write down concretely (a rotation in $\mathbb{R}^2$, the derivative on polynomials of bounded degree). Choose two bases and write the map as a matrix in each. Compute kernel, image, and rank both directly and from the matrices, and verify that those computations agree.
