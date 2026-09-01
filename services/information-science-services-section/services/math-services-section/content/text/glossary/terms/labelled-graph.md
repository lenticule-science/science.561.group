---
term-kind: definition
class: combinatorial-structure
depends-on: [graph, vertex, edge]
realizes: [vertex, edge]
---

# Labelled graph

A **labelled graph** is a graph (or [directed graph](directed-graph.md)) equipped with a labelling function $\ell$ on the vertices, the edges, or both. Formally, a vertex-labelled graph is a triple $(V, E, \ell_V)$ with $\ell_V : V \to L_V$, an edge-labelled graph is $(V, E, \ell_E)$ with $\ell_E : E \to L_E$, and a fully labelled graph carries both. The label sets $L_V, L_E$ may be finite alphabets, sets of types, or arbitrary structured sets.

## Structure

Labels are *data attached to* graph elements; they do not change the graph's combinatorial structure but they do change which graph homomorphisms are admissible: a [graph homomorphism](./graph-homomorphism.md) of labelled graphs is required to respect labels (mapping each vertex to one with the same label, each edge to one with the same label).

## Position

Labelled graphs are the natural object whenever the elements of a graph carry distinguishing data. Classic instances:

- **State machines** are edge-labelled directed graphs: vertices are states, edges are labelled transitions. See [examples/state-machine-as-labelled-digraph](../../documents/articles/teaching-articles/examples/state-machine-as-labelled-digraph.md).
- **[Quivers](quiver.md)** in representation theory carry vertex-labels (modules) and edge-labels (linear maps).
- **The corpus's `depends-on:` graph** is implicitly vertex-labelled by `type:` and `class:`: see [examples/dependency-graph-of-this-corpus](../../documents/articles/teaching-articles/examples/dependency-graph-of-this-corpus.md).
- **Knowledge graphs** (RDF, Wikidata) are edge-labelled directed multigraphs whose labels name the relation type.

A [weighted graph](weighted-graph.md) is the special case where the label set carries algebraic structure (a semiring, lattice, etc.). Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) (treats labels in passing); the labelled-graph perspective is more prominent in computer science treatments and in [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §15.
