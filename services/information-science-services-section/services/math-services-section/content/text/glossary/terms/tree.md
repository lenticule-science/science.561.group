---
term-kind: definition
class: combinatorial-structure
status: settled
symbol: T
depends-on:
  - graph.md
  - teaching/explanations/connectivity.md
  - teaching/explanations/acyclicity.md
  - teaching/explanations/cycle.md
  - teaching/explanations/path.md
realizes:
  - teaching/explanations/connectivity.md
  - teaching/explanations/acyclicity.md
see-also:
  - graph.md
  - dag.md
aliases:
  - Tree
type: definition
---

# Tree

A **tree** is a [graph](graph.md) that is [connected](./connectivity.md) and contains no [cycles](./cycle.md). Equivalently — and the equivalence is itself a load-bearing fact — a tree is a graph in which any two vertices are connected by exactly one [path](./path.md). Trees are the foundational data structure of computer science (file systems, parse trees, decision trees, search trees) and the foundational object of structural recursion (every tree admits induction on subtrees).

## Equivalent definitions

For an undirected graph $ with $ vertices, the following are equivalent:

1. $ is a tree (connected, acyclic).
2. $ is connected and has exactly  - 1$ edges.
3. $ is acyclic and has exactly  - 1$ edges.
4. Any two vertices in $ are connected by exactly one simple path.
5. $ is connected, but removing any edge disconnects it.
6. $ is acyclic, but adding any edge creates a [cycle](./cycle.md).

The equivalence of these characterizations is established by [tree-equivalences](../../documents/articles/research-articles/tree-equivalences.md). The proofs are induction-on-vertex-count arguments using the [handshake lemma](../../documents/articles/research-articles/handshake-lemma.md) and the fact that a connected graph has at least  - 1$ edges.

## Structure

- **Vertex set** $.
- **Edge set** $ such that the underlying graph is connected and acyclic.
- A *leaf* is a vertex of [degree](./degree.md) one. A finite tree with $|V| \geq 2$ has at least two leaves.
- A *rooted tree* is a tree with one distinguished vertex called the *root*. Selecting a root induces an orientation on every edge (away from the root or toward the root, depending on convention), turning the tree into a [DAG](dag.md) — a tree-DAG, with a unique source (the root) and one path from the root to every other vertex.

Rooted trees give rise to the standard parent-child terminology: the *parent* of a non-root vertex is the unique vertex one step closer to the root; the *children* of a vertex are its neighbours that are one step further from the root; *leaves* (in the rooted sense) are vertices with no children.

## Forests

A *forest* is an acyclic graph — equivalently, a disjoint union of trees. Forests are what you get when you drop the connectedness requirement from the definition of tree. The number of trees in a forest is the forest's number of *connected components*.

## Spanning trees

A *spanning tree* of a connected graph $ is a subgraph that is a tree and includes every vertex of $. Every connected graph has at least one spanning tree (built greedily by removing edges of cycles); a graph with $ vertices and $ edges has  - n + 1$ "extra" edges beyond what any spanning tree uses, and these extra edges generate the *cycle space* of the graph.

## Earlier material

A **tree** is a [graph](graph.md) that is [connected](connectivity.md) and contains no [cycles](../../documents/articles/research/2026/07/31/lenticule-import/scripts/graphing/content/graph/scripts/spanning/content/tree/teaching/explanations/cycle.md). Equivalently — and the equivalence is itself a load-bearing fact — a tree is a graph in which any two vertices are connected by exactly one [path](path.md). Trees are the foundational data structure of computer science (file systems, parse trees, decision trees, search trees) and the foundational object of structural recursion (every tree admits induction on subtrees).

The equivalence of these characterizations is established by [tree-equivalences](../../documents/articles/research-articles/tree-equivalences.md). The proofs are induction-on-vertex-count arguments using the [handshake lemma](../../documents/articles/research-articles/handshake-lemma.md) and the fact that a connected graph has at least  - 1$ edges.
