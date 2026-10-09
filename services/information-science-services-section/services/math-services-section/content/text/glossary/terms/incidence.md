---
term-kind: concept
class: graph-relation
depends-on: [vertex, edge]
aliases:
  - Incidence
type: concept
---

# Incidence

*Incidence* is **the relation between an [edge](edge.md) and a [vertex](vertex.md) that the edge meets**. An edge $e$ is *incident to* its endpoints; a vertex $v$ is *incident to* every edge with $v$ as an endpoint. The relation is symmetric in the sense that "incident to" can be read in either direction.

In an undirected graph, an edge $\{u, v\}$ is incident to both $u$ and $v$. In a [directed graph](./directed-graph.md), an edge $(u, v)$ is incident to both vertices but the source and target are distinguished. In a [multigraph](./multigraph.md), incidence is the data carried by the explicit incidence map $\iota : E \to \binom{V}{2} \cup \{\{v\} : v \in V\}$.

Incidence is the primitive datum of a graph; [adjacency](adjacency.md) (the relation between two vertices sharing an edge) and [degree](degree.md) (the count of incidences at a vertex) are derived from it.
