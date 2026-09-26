---
term-kind: definition
class: combinatorial-structure
depends-on: [graph, bipartition, edge, vertex]
realizes: [bipartition]
aliases:
  - Bipartite graph
type: definition
---

# Bipartite graph

A **bipartite graph** is a [graph](graph.md) $G = (V, E)$ whose vertex set admits a [bipartition](./bipartition.md) $V = A \sqcup B$ such that every edge has one endpoint in $A$ and the other in $B$: $E \subseteq \{\{a, b\} : a \in A, b \in B\}$. The pair $(A, B)$ is the *bipartition*; vertices in $A$ are adjacent only to vertices in $B$, and vice versa.

## Structure

- **Two-class vertex set** $V = A \sqcup B$.
- **Cross edges only** — no edge has both endpoints in $A$ or both in $B$.
- The **complete bipartite graph** $K_{m,n}$ has $|A| = m$, $|B| = n$, and *every* possible cross edge.

A graph is bipartite iff it contains no [cycle](./cycle.md) of odd length; this characterization is established by [bipartite-iff-no-odd-cycle](../../documents/articles/research-articles/bipartite-iff-no-odd-cycle.md).

## Position

Bipartite graphs are the natural object whenever vertices come in two distinguished kinds with relations only across the divide: assignment problems (workers to jobs), matching problems (men to women, donors to recipients), authorship graphs (people to papers), Petri nets (places to transitions). The [Kuratowski subgraph](../../documents/articles/research-articles/kuratowski.md) $K_{3,3}$ that obstructs planarity is the complete bipartite graph on $3+3$ vertices. References: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.6, [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §1.2.
