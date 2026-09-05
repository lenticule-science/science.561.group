---
type: concept
class: graph-relation
depends-on: [vertex, edge, incidence]
---

# Adjacency

*Adjacency* is **the relation between two [vertices](vertex.md) that share an [edge](edge.md)**. Two vertices $u$ and $v$ are adjacent, written $u \sim v$, if there is an edge with $u$ and $v$ as its endpoints.

Adjacency is symmetric in an undirected [graph](../objects/graph.md): $u \sim v$ iff $v \sim u$. It is in general *not* symmetric in a [directed graph](../objects/directed-graph.md), where the relation is naturally split into "$u$ is a *predecessor* of $v$" (there is an edge $(u, v)$) and "$u$ is a *successor* of $v$" (there is an edge $(v, u)$). The undirected adjacency relation $u \sim v$ is the symmetric closure of the directed one.

The adjacency relation is encoded by the *adjacency matrix* $A \in \{0,1\}^{V \times V}$ (or $\mathbb{N}^{V \times V}$ for [multigraphs](../objects/multigraph.md), or $W^{V \times V}$ for [weighted graphs](../objects/weighted-graph.md)), with $A_{u,v} = 1$ iff $u \sim v$. The matrix encoding lets graph properties be read off via linear-algebraic computations on $A$ — the substrate of spectral graph theory.
