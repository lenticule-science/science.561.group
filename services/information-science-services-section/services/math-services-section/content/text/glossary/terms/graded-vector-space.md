---
title: "Graded Vector Space"
aliases:
  - "graded vector space"
  - "graded vector spaces"
  - "grading"
date-created: 2026-08-26
tags: []
defines:
  - "Graded Vector Space"
  - "grading"
type: term
---

A graded [vector space](./vector-space.md) is a vector space $V$ presented as a direct sum $V = \bigoplus_{n} V_n$ indexed by the integers (or the natural numbers, when only non-negative degrees occur). Each summand $V_n$ is the *degree-$n$ piece*, and every vector decomposes uniquely as a finite sum of homogeneous vectors, one from each of finitely many degrees. A linear map $f: V \to W$ between graded vector spaces has degree $k$ when $f(V_n) \subseteq W_{n+k}$ for all $n$; degree-$0$ maps are the ones that respect the grading strictly, and are the usual morphisms between graded vector spaces as objects of a category.

Grading records where a piece of data "lives" beyond its bare vector-space structure — a bookkeeping device that turns out to be exactly what is needed to state naturality conditions. A [chain complex](./chain-complex.md) is precisely a graded vector space equipped with a degree $-1$ (or degree $+1$, for cochain complexes) map squaring to zero; the grading is what makes "degree $-1$" a meaningful condition on the differential in the first place, rather than an arbitrary endomorphism.

Familiar examples: a polynomial ring $k[x]$ is graded by degree, $V_n = k \cdot x^n$; an exterior algebra $\Lambda^\bullet W$ is graded by the number of wedge factors; the cohomology ring $H^\bullet(X)$ of a topological space is graded by cohomological degree, with cup product a degree-preserving (indeed degree-additive) multiplication. Graded vector spaces over a field $\Bbbk$ form the objects of the category $\mathbf{grVect}_\Bbbk$, itself an [abelian category](./abelian-category.md), and a graded-vector-space-valued [functor](./functor.md) out of some category $\mathcal C$ — written $H^\bullet: \mathcal C \to \mathbf{grVect}_\Bbbk$ — is the standard shape of a cohomology theory: it assigns to each object of $\mathcal C$ not a single vector space but a whole graded family of them, one per cohomological degree.

When each graded piece $V_n$ additionally carries an inner product, $V$ is a graded [Hilbert space](./hilbert-space.md); this is the setting in which a graded differential acquires a Hilbert adjoint and, via the Hodge construction, a Laplacian in each degree.
