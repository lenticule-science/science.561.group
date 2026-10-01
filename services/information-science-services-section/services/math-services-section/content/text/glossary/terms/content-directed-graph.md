---
type: definition
class: combinatorial-structure
status: settled
symbol: D
depends-on:
  - graph.md
  - teaching/explanations/vertex.md
  - teaching/explanations/edge.md
  - ../../sets/objects/ordered-pair.md
realizes:
  - teaching/explanations/_index.md
  - teaching/explanations/vertex.md
  - teaching/explanations/edge.md
  - teaching/explanations/adjacency.md
  - teaching/explanations/reachability.md
see-also:
  - graph.md
  - dag.md
  - tree.md
  - ../morphisms/graph-homomorphism.md
name: Directed graph
description: "A directed graph (or digraph) is a graph whose edges are ordered pairs of vertices: each edge has a source and a target, and the edge runs from the former to the latter."
derives-from: scripts
---

# Directed graph

A **directed graph** (or **digraph**) is a [graph](graph.md) whose edges are *ordered* pairs of vertices: each edge has a *source* and a *target*, and the edge runs from the former to the latter. Directed graphs are the natural formalisation of any asymmetric relation: $a$ depends on $b$, $a$ points to $b$, $a$ refers to $b$, $a$ comes before $b$.

Formally, a directed graph $D = (V, E)$ consists of a set $V$ of [vertices](vertex.md) and a set $E \subseteq V \times V$ of [ordered pairs](ordered-pair.md) of vertices. The vertex $u$ is the *source* (or *tail*) of the edge; the vertex $v$ is the *target* (or *head*). Two functions $s, t: E \to V$ recover the source and target of each edge; this $(V, E, s, t)$ presentation is the standard one in category theory, where a directed graph is also called a *quiver*.

## Structure

- **Vertex set** $V$.
- **Edge set** $E \subseteq V \times V$ — ordered pairs. A loop is a pair $(v, v)$.
- **Source** and **target** maps $s, t : E \to V$ defined by $s(u, v) = u$, $t(u, v) = v$. This generalizes to multiple edges between the same pair in a [quiver](quiver.md).

Each vertex $v$ has an **in-degree** $\deg^-(v) = |\{e \in E : t(e) = v\}|$ and an **out-degree** $\deg^+(v) = |\{e \in E : s(e) = v\}|$. A vertex with in-degree zero is a *source*; a vertex with out-degree zero is a *sink*.

A directed graph is *simple* if it has no parallel edges (no two distinct edges share the same source-target pair) and no self-loops (no edges of the form $(v, v)$). It is a *multidigraph* if parallel edges are admitted.

## What "directed" adds beyond a graph

A directed graph is more structured than its underlying undirected graph: the latter forgets the source-target distinction, replacing each ordered pair $(u, v)$ with the unordered pair $\{u, v\}$. The forgetful functor from directed to undirected graphs has no canonical inverse — given an undirected edge $\{u, v\}$, neither orientation $(u, v)$ nor $(v, u)$ is privileged.

What "directed" buys you:
- **Asymmetric relations** are first-class. The "$a$ before $b$" relation in a partial order, the "$a$ calls $b$" relation in a function call graph, the "$a$ depends on $b$" relation in a dependency manager — all are directed-graph structures and lose information when undirected.
- **Reachability is asymmetric.** $b$ may be reachable from $a$ (via a directed path) without $a$ being reachable from $b$. This is what licenses topological sorting on [DAGs](dag.md).
- **Strong vs weak connectivity** become distinct. A digraph is *weakly* connected if its underlying undirected graph is connected; it is *strongly* connected if every vertex is reachable from every other vertex via directed paths.

## What this is not

A directed graph is *not* an undirected graph with orientation tags glued on: forgetting orientation lands you in [graph](graph.md), but the digraph carries strictly more information. A directed graph is *not* automatically a [DAG](dag.md): cycles are permitted unless ruled out.

## Specialisations

- A [DAG](dag.md) is a directed graph with no directed cycles.
- A [tree](tree.md), seen as a rooted tree, is a DAG with a unique source.
- A *tournament* is a directed graph in which every pair of vertices is connected by exactly one edge in some direction.
- An *Eulerian digraph* is a directed graph admitting an Eulerian circuit (a closed walk traversing every edge exactly once).
