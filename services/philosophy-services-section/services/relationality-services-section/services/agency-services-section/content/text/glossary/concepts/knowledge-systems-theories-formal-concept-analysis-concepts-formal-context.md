---
type: concept
class: substrate-unit
status: stable
depends-on: []
see-also: [concept-as-closed-pair, intent-extent-duality]
title: Formal context
description: The substrate unit of formal concept analysis.
---

# Formal context

The substrate unit of formal concept analysis. A **formal context** is a triple $(G, M, I)$ where $G$ is a set of *objects*, $M$ is a set of *attributes*, and $I \subseteq G \times M$ is an *incidence relation* read "object $g$ has attribute $m$" when $(g, m) \in I$.

The formal context is what FCA stores. Everything the lineage proves is proved about properties of contexts and properties of the structures derived from them. Two contexts are equal when they have the same objects, the same attributes, and the same incidence; two contexts are *equivalent* (in the FCA-internal sense) when their concept lattices are isomorphic.

## Three readings

A formal context admits three equivalent readings, each useful in different settings:

- **Set-theoretic.** $(G, M, I)$ is a triple; $I$ is a binary relation between sets. The Galois connection between $\mathcal{P}(G)$ and $\mathcal{P}(M)$ (per [intent-extent-duality](intent-extent-duality.md)) is set-theoretic in this reading.
- **Matrix.** $I$ is a $|G| \times |M|$ Boolean matrix. The basic theorem of FCA is then a structural theorem about Boolean matrices; algorithms for computing the concept lattice operate on the matrix representation.
- **Bipartite graph.** $(G, M, I)$ is a bipartite graph with vertex classes $G$ and $M$ and edge set $I$. Concepts are then maximal complete bipartite subgraphs (bicliques); the concept lattice is the biclique lattice.

The three readings are isomorphic. The matrix reading is the standard pedagogical one (Ganter & Wille 1999, Chapter 1); the set-theoretic reading is the standard mathematical one; the bipartite-graph reading is the standard algorithmic one.

## Generalisations

The binary incidence $I \subseteq G \times M$ has two important generalisations the lineage admits:

- **Many-valued contexts.** Replace the Boolean incidence by a partial function $I: G \times M \rightharpoonup W$ where $W$ is a set of *attribute values*. A many-valued context is reduced to a binary context by *conceptual scaling* (per [scale](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/scale.md)): each attribute is replaced by a set of binary attributes generated from a chosen scale, and the resulting binary context is analysed.
- **Residuated-lattice-valued contexts.** Replace the Boolean incidence by an $\mathbf{L}$-valued one $I: G \times M \to \mathbf{L}$ where $\mathbf{L}$ is a complete residuated lattice. Belohlavek (2004) shows the Galois connection generalises and the basic theorem survives; this is the bridge to fuzzy and many-valued logics. See [residuated-context](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/residuated-context.md).

In the predicated framing, all three contexts (binary, many-valued, residuated) are degenerate sub-substrates of the [predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) substrate; see the companion subtheory's [concept-lattice-as-degenerate-fiber](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md).
