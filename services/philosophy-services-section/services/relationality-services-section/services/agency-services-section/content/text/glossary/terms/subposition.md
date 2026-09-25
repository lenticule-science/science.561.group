---
type: morphism
class: context-combination
status: stable
depends-on: [formal-context]
see-also: [apposition]
title: Subposition
description: The combination of two formal contexts that share an attribute set, by union of their object sets.
---

# Subposition

The combination of two formal contexts that share an attribute set, by union of their object sets. Given $\mathbb{K}_1 = (G_1, M, I_1)$ and $\mathbb{K}_2 = (G_2, M, I_2)$ with $G_1 \cap G_2 = \emptyset$, their **subposition** is

$$\frac{\mathbb{K}_1}{\mathbb{K}_2} := (G_1 \cup G_2, M, I_1 \cup I_2).$$

Subposition is the FCA-lineage's "vertical" combination — stacking rows of one context onto another. The shared attribute set is the join axis; the disjoint object sets are concatenated.

## Effect on the concept lattice

Subposition is dual to apposition (per [apposition](apposition.md)) under the context-duality $\mathbb{K} \mapsto \mathbb{K}^d$. So:

- Every intent of $\mathbb{K}_1 / \mathbb{K}_2$ is the intersection of an intent of $\mathbb{K}_1$ with an intent of $\mathbb{K}_2$.
- Every extent of $\mathbb{K}_1 / \mathbb{K}_2$ is the disjoint union of an extent of $\mathbb{K}_1$ with an extent of $\mathbb{K}_2$.
- $\mathfrak{B}(\mathbb{K}_1 / \mathbb{K}_2)$ embeds into $\mathfrak{B}(\mathbb{K}_1) \times \mathfrak{B}(\mathbb{K}_2)$ as a sub-infimum-lattice.

## Substrate reading

Subposition corresponds to the substrate's [federate](federate.md) under disjoint object-sets and identity attribute-predicate-mapping — the dual case to apposition. Together, apposition and subposition give two of the four "directions" of substrate federation; the other two are diagonal cases handled by federation under non-trivial cross-mappings.
