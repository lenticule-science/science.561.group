---
title: "Dendroidal Complex"
aliases:
  - "dendroidal complex"
  - "dendroidal complexes"
date-created: 2026-08-26
date-modified: 2026-08-26
tags: []
defines:
  - "Dendroidal Complex"
  - "dendroidal complexes"
type: term
---

A dendroidal complex is the correct target of a [Dold–Kan-type normalization](./dold-kan-correspondence.md) applied to a dendroidal (tree-shaped, rather than chain-shaped) [abelian group](./abelian-group.md), and it is not the same thing as an ordinary [chain complex](./chain-complex.md). Where a chain complex has one object $C_n$ per natural number and one differential $d_n: C_n \to C_{n-1}$, a dendroidal complex has one object per finite (planar) [tree](./tree.md), with a structure map for *every* face of that tree — and a tree, unlike a natural number, generally has more than one face, coming in two kinds (inner faces, contracting an internal edge, and outer faces, removing an outermost vertex), so a single differential is not enough data to record the structure. Gutiérrez, Lukács, and Weiss ("Dold–Kan correspondence for dendroidal abelian groups," *J. Pure Appl. Algebra* 215 (2011), 1669–1687) introduce the category of dendroidal complexes precisely because, in their words, "the category of chain complexes is not big enough" to be the target of normalization for dendroidal abelian groups.

Concretely, a dendroidal complex assigns to each planar tree $T$ (an object of the [planar tree category](./operadic-nerve.md) $\Omega_p$) an abelian group $C(T)$, together with a map for each face of $T$, subject to two conditions: the maps associated to *normal* faces (roughly, faces that do not collapse the tree onto a degenerate shape) behave functorially, and squares built from two different faces of the same tree anticommute — the dendroidal analogue of $d_{n-1} d_n = 0$, now stated one square at a time rather than as a single global identity, because there is no single "the" differential to square.

The normalization functor $N$ from dendroidal abelian groups (presheaves $\Omega_p^{\mathrm{op}} \to \mathbf{Ab}$) to dendroidal complexes, together with a right adjoint $\Gamma$ reconstructing the dendroidal abelian group, is proved to form an adjoint equivalence — the dendroidal Dold–Kan theorem — in the paper above, extending the classical simplicial Dold–Kan correspondence (recovered by restricting to linear trees, where a dendroidal complex's data collapses to a single sequence of composable differentials).

A dendroidal complex is *not* itself a chain complex, and nothing in its definition or in the cited equivalence supplies a way to turn one into a chain complex while preserving homology — such a *totalization* (the tree-shaped analogue of forming the total complex of a double complex, summing structure maps against a chosen total-degree function on trees with signs arranged to make the result square to zero) would be a separate construction, useful whenever chain-complex-only machinery — a single differential's homology, a Hodge Laplacian built from one adjoint pair $(d, d^*)$ — needs to be applied to dendroidal data, and is not established as part of the dendroidal Dold–Kan theorem itself.
