---
type: concept
class: graph-element
symbol: e
status: settled
depends-on:
  - _index.md
  - vertex.md
see-also:
  - path.md
  - cycle.md
  - ../objects/graph.md
  - ../objects/directed-graph.md
---

# Edge

An *edge* is **a connection between two [vertices](vertex.md) of a [graph](../objects/graph.md)**. In an undirected graph, an edge is an unordered pair $\{u, v\}$; in a [directed graph](../objects/directed-graph.md), an edge is an ordered pair $(u, v)$ with a designated source and target.

An edge whose two endpoints are the same vertex is a *self-loop*. Two edges with the same endpoint pair are *parallel edges*; graphs admitting parallel edges are [multigraphs](../objects/multigraph.md), graphs forbidding both self-loops and parallel edges are [simple graphs](../objects/simple-graph.md).

[Incidence](incidence.md) is the relation between an edge and its endpoint(s); [adjacency](adjacency.md) is the derived relation between two vertices that share an edge. The number of edges incident to a vertex is its [degree](degree.md).

## What "edge" commits to

1. **Edges are pairs of vertices.** An edge is constituted by its endpoints. Two edges are the same edge iff they have the same endpoints (in the same order, for directed graphs); two edges with the same endpoints in a multigraph are *parallel* edges and require additional identity (often an edge label or an edge index) to distinguish.
2. **Edges encode adjacency.** The presence of an edge $\{u, v\}$ is what makes $u$ and $v$ *adjacent*. Graph-theoretic results are often best stated as facts about adjacency rather than about edges directly.
3. **Edges are unstructured by default.** A bare graph attaches no information to its edges beyond their endpoints. *Weighted* graphs attach a real number to each edge; *labelled* graphs attach a label; *coloured* graphs attach a colour. These are enrichments of the bare-graph object.

## Special edges

- A **self-loop** (or *loop*) is an edge from a vertex to itself: $(v, v)$ in the directed case, $\{v, v\}$ in the undirected case (the latter is sometimes excluded by definition; conventions vary).
- A **multiedge** (or *parallel edge*) is one of two or more distinct edges sharing the same endpoint pair. Multigraphs admit them; *simple* graphs forbid them.
- A **bridge** (or *cut edge*) is an edge whose removal disconnects the graph.
- An **isthmus** is a synonym for bridge in some classical texts.

## Edges and incidence

A vertex $v$ is *incident* to an edge $e$ iff $v$ is an endpoint of $e$. The *incidence relation* between $V$ and $E$ is what makes a graph more than just a pair of sets — it tells you which vertices each edge connects. The [graph](../objects/graph.md) object's $(V, E)$ presentation packages the incidence into the structure of $E$ (by making edges literally pairs of vertices); the alternative $(V, E, s, t)$ presentation (used in category theory's quiver framing) makes the incidence functions $s, t: E \to V$ explicit.
