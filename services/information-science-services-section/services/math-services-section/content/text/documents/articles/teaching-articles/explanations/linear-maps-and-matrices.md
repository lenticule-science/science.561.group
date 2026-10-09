---
title: "Linear Maps and Matrices"
aliases:
  - "Linear Maps and Matrices"
date-created: 2026-03-05
tags: []
teaches:
  - "Linear Maps and Matrices"
id: linear-algebra-lesson-2
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
description: You should know the definition of a vector space and be comfortable with bases and dimension.
---

## Entry conditions

You should know the definition of a [vector space](../../../../glossary/terms/vector-space.md) and be comfortable with bases and dimension.

## Definitions

A **[linear map](../../../../glossary/terms/linear-map.md)** (or linear transformation) $T : V \to W$ between vector spaces over the same [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) preserves addition and scalar multiplication: $T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v})$ and $T(a\mathbf{v}) = aT(\mathbf{v})$.

Given bases for $V$ and $W$, every linear map corresponds to a **[matrix](../../../../glossary/terms/matrix.md)** — a rectangular array of scalars. Composing linear maps corresponds to multiplying their matrices.

The **[determinant](../../../../glossary/terms/determinant.md)** of a square matrix measures the factor by which the map scales volumes. A matrix is invertible if and only if its determinant is nonzero.

An **[eigenvalue](../../../../glossary/terms/eigenvalue.md)** of a linear map $T$ is a scalar $\lambda$ such that $T(\mathbf{v}) = \lambda \mathbf{v}$ for some nonzero vector $\mathbf{v}$ (the eigenvector). Eigenvalues reveal the directions along which a linear map acts by pure scaling.

## Vocabulary (plain language)

- **Linear map**: a function between vector spaces that respects addition and scaling.
- **Matrix**: a table of numbers representing a linear map relative to chosen bases.
- **Determinant**: a number encoding whether a matrix is invertible and how it scales volume.
- **Eigenvalue**: a scalar $\lambda$ for which $T(\mathbf{v}) = \lambda\mathbf{v}$ has a nonzero solution.

## Intuition

A linear map is completely determined by where it sends the basis vectors. The matrix is just a bookkeeping device that records this information. Matrix multiplication encodes composition of linear maps.

In [category theory](./categories.md), the category of vector spaces over $F$ has vector spaces as [objects](../../../../glossary/terms/object.md) and linear maps as [morphisms](../../../../glossary/terms/morphism.md). [Composition](../../../../glossary/terms/composition.md) is composition of linear maps (matrix multiplication).

## Common mistakes

- Confusing a linear map with its matrix. The map is basis-independent; the matrix depends on the choice of basis.
- Assuming every matrix has eigenvalues over $\mathbb{R}$. Some eigenvalues may be complex.
