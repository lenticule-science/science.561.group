---
title: "Vector Spaces"
aliases:
  - "Vector Spaces"
date-created: 2026-03-05
tags: []
teaches:
  - "Vector Spaces"
id: linear-algebra-lesson-1
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
description: You should know what a field is and be comfortable with groups.
---

## Entry conditions

You should know what a [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) is and be comfortable with [groups](../../../../glossary/terms/group.md).

## Definitions

A **[vector space](../../../../glossary/terms/vector-space.md)** over a [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) $F$ is a set $V$ equipped with two operations — vector addition and scalar multiplication — satisfying:

1. $(V, +, \mathbf{0})$ is an [abelian group](../../../../glossary/terms/abelian-group.md).
2. Scalar multiplication $F \times V \to V$ satisfies: $1 \cdot \mathbf{v} = \mathbf{v}$, $a(b\mathbf{v}) = (ab)\mathbf{v}$, $(a + b)\mathbf{v} = a\mathbf{v} + b\mathbf{v}$, and $a(\mathbf{u} + \mathbf{v}) = a\mathbf{u} + a\mathbf{v}$.

A **subspace** is a subset of $V$ that is itself a vector space under the same operations.

A set of vectors $\{\mathbf{v}_1, \ldots, \mathbf{v}_n\}$ is **linearly independent** if no nontrivial linear combination $a_1 \mathbf{v}_1 + \cdots + a_n \mathbf{v}_n = \mathbf{0}$ exists (i.e., all $a_i = 0$ is the only solution). A **[basis](../../../../glossary/terms/basis.md)** is a linearly independent set that spans $V$. The number of vectors in any basis is the **[dimension](../../../../glossary/terms/dimension.md)** of $V$.

## Vocabulary (plain language)

- **Vector space**: a set where you can add elements and scale them by numbers from a field.
- **Basis**: a minimal spanning set — the "coordinates" of the space.
- **Dimension**: how many basis vectors you need.

## Intuition

The plane $\mathbb{R}^2$ is a vector space over $\mathbb{R}$. You can add arrows and stretch them. The standard basis $\{(1,0), (0,1)\}$ lets you express every vector as a linear combination. Dimension is $2$ because you need exactly two basis vectors.

Vector spaces abstract this: any set where addition and scaling obey the right rules is a vector space, regardless of what the "vectors" actually are. Polynomials of degree at most $n$ form a vector space of dimension $n + 1$.

## Common mistakes

- Confusing a vector space with $\mathbb{R}^n$. Many vector spaces are not collections of columns of real numbers.
- Forgetting that the zero vector must be in every subspace.
