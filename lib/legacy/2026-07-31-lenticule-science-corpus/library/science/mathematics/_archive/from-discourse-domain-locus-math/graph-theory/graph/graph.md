---
type: definition
class: combinatorial-structure
status: settled
symbol: G
depends-on:
  - teaching/explanations/vertex.md
  - teaching/explanations/edge.md
  - teaching/explanations/incidence.md
realizes:
  - teaching/explanations/_index.md
  - teaching/explanations/vertex.md
  - teaching/explanations/edge.md
  - teaching/explanations/incidence.md
  - teaching/explanations/adjacency.md
see-also:
  - directed-graph.md
  - tree.md
  - dag.md
  - ../morphisms/graph-homomorphism.md
  - ../theorems/handshake-lemma.md
---

# Graph

A **graph** is an ordered pair $G = (V, E)$ where $V$ is a set of [vertices](teaching/explanations/vertex.md) and $E$ is a set of [edges](teaching/explanations/edge.md), each edge an unordered pair $\{u, v\}$ of vertices. The pair $\{u, v\}$ is the [incidence](teaching/explanations/incidence.md) of the edge with its endpoints; $u$ and $v$ are then [adjacent](teaching/explanations/adjacency.md). Drawn on paper, vertices are dots and edges are lines.

Graphs formalize any situation where things are related to other things: cities connected by roads, people who know each other, web pages linked by hyperlinks, atoms bonded in a molecule.

## Structure

- **Vertex set** $V$ — a (typically finite, sometimes infinite) set whose elements are the *vertices* (also called *nodes*).
- **Edge set** $E \subseteq \binom{V}{2} \cup \{\{v\} : v \in V\}$ — a set of unordered vertex pairs. The unordered-pair convention is what makes the graph *undirected*: $\{u, v\}$ and $\{v, u\}$ are the same edge. A self-loop is the singleton $\{v\}$.

Two endpoint refinements distinguish named special cases:
- A graph with no self-loops and at most one edge between any two vertices is a [simple graph](simple-graph.md).
- A graph allowing parallel edges between the same vertex pair is a [multigraph](multigraph.md).

## What the model commits to

1. **Vertices and edges are first-class.** A graph is a *combinatorial* structure; the vertices are an unstructured set, the edges are an unstructured set of pairs. There is no metric, no embedding, no orientation beyond what edges themselves provide.
2. **Edges connect vertices.** Every edge is a pair (or in a hypergraph, a subset) of vertices; there are no edges between edges, no vertices that float free of any edge except by explicit construction.
3. **Identity is up to relabelling.** Two graphs that differ only in vertex names but have the same edge structure are *isomorphic*; graph theory studies graphs up to isomorphism in most contexts.

## What this is not

A graph is *not* a directed graph: edges have no orientation, $\{u,v\}$ does not encode an asymmetric relation. For ordered-pair edges, see [directed-graph](directed-graph.md). A graph is *not* its drawing: the same graph admits arbitrarily many embeddings in the plane.

## Historical origin

Graphs were introduced by Euler in 1736 in his analysis of the [seven bridges of Königsberg](../examples/seven-bridges-of-konigsberg.md) (see [Euler 1736](references/euler1736.md)); the modern axiomatisation follows [Diestel 2017](references/diestel2017.md) §1.1 and [Bondy–Murty 2008](references/bondy-murty2008.md) §1.1.
