---
title: "Abelian Category"
aliases:
  - "abelian category"
  - "abelian categories"
date-created: 2026-08-26
tags: []
defines:
  - "Abelian Category"
  - "abelian categories"
type: term
---

An abelian category is a [category](./category.md) in which morphisms can be added, and in which every morphism has a well-behaved image and cokernel — the minimal setting in which the machinery of homological algebra (kernels, exact sequences, [chain complexes](./chain-complex.md), homology) makes sense. Formally: $\mathcal A$ is abelian when it is additive (every hom-set is an [abelian group](./abelian-group.md), composition is bilinear, and finite biproducts exist), has a zero object, has kernels and cokernels for every morphism, and every monomorphism is the kernel of some morphism while every epimorphism is the cokernel of some morphism. Equivalently and more usably: every morphism $f$ factors canonically as an epimorphism followed by a monomorphism, $f: X \twoheadrightarrow \mathrm{im}(f) \hookrightarrow Y$, and this factorization behaves the way image factorizations do in $\mathbf{Ab}$.

The prototypical examples are $\mathbf{Ab}$ itself (abelian groups and homomorphisms), $\mathbf{Vect}_\Bbbk$ (vector spaces over a field), $R\text{-}\mathbf{Mod}$ (modules over a ring), and categories of sheaves of abelian groups on a topological space or [site](./site.md). The Freyd–Mitchell embedding theorem shows these are, in a precise sense, the only examples: every small abelian category admits a fully faithful, exact embedding into $R\text{-}\mathbf{Mod}$ for some ring $R$. This is what licenses "diagram chasing" — proofs by tracking elements through a diagram, as if working in a category of modules — in an arbitrary abelian category.

Abelian categories are exactly the categories in which a sequence $X \to Y \to Z$ can meaningfully be called exact (the image of the first map equals the kernel of the second), and hence the categories in which [chain complexes](./chain-complex.md), their homology, and derived functors are defined. A category merely additive but not abelian — such as the category of finitely generated projective modules over a ring that is not semisimple — lacks enough kernels or cokernels to support this theory in full; abelianness is precisely the added closure that makes homological algebra self-contained.

The category $\mathbf{Ch}_\bullet(\mathcal A)$ of [chain complexes](./chain-complex.md) over an abelian category $\mathcal A$ is itself abelian, with kernels, cokernels, and exactness computed degreewise — a fact used freely whenever chain complexes are manipulated as if they were ordinary objects (taking their own kernels, cokernels, and short exact sequences of complexes).
