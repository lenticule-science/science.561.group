---
term-kind: concept
class: graph-element
symbol: v
status: settled
depends-on:
  - _index.md
see-also:
  - edge.md
  - path.md
  - ../objects/graph.md
aliases:
  - Vertex
type: concept
---

# Vertex

A *vertex* is **a basic indivisible point of a [graph](./graph.md) — the carrier of identity that [edges](edge.md) connect**. Vertices are also called *nodes* or, in category-theoretic usage, *0-cells*.

A graph's vertices are the things being related; edges are the relations between them. Identity of vertices is given by the underlying set: two vertices are the same vertex iff they are the same element of $V$. A vertex carries no internal structure within graph theory itself; structure attached to vertices (a label, a colour, a weight, a state) lives in a [labelled graph](./labelled-graph.md), [weighted graph](./weighted-graph.md), or richer object built on top.

In a [directed graph](./directed-graph.md), each vertex has an in-[degree](degree.md) and an out-degree. A vertex with no incoming edges in a digraph is a *source*; a vertex with no outgoing edges is a *sink*.

## What "vertex" commits to

1. **Identity, not structure.** A vertex is a point of identity in the graph: two vertices are either the same vertex or different vertices, and there is nothing more to say at the graph level. Whatever structure attaches to a vertex (a label, a position, a type) is a *labelling* of the graph, not part of the graph itself.
2. **Adjacency is via edges.** Two vertices $u, v$ are *adjacent* iff there is an edge between them. The relation of adjacency is what graph theory studies; everything else is bookkeeping.
3. **Degree is the count of incident edges.** A vertex's *degree* is the number of edges incident to it (with self-loops typically counted twice). For directed graphs, this splits into *in-degree* and *out-degree*. The handshake lemma constrains the sum of degrees in any graph.

## Vertex labellings

Labelled vertices are the rule rather than the exception in applied graph theory: city names on a road graph, web URLs on a hyperlink graph, function names on a call graph. The discipline holds the labelling separate from the graph: a graph is unlabelled by default, and labelled graphs are an enriched structure.
