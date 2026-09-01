---
term-kind: definition
class: combinatorial-structure
depends-on: [graph, vertex, edge]
realizes: [vertex, edge]
---

# Planar graph

A **planar graph** is a [graph](graph.md) that can be *embedded* in the plane: drawn with vertices as points and edges as continuous curves so that no two edges cross except at common endpoints. A specific embedding is a *planar embedding*; a graph is planar iff at least one planar embedding exists.

## Structure

A planar embedding partitions the plane into regions called *faces*; the unbounded region is the *outer face*. For a finite connected planar graph with $V$ vertices, $E$ edges, and $F$ faces, **Euler's formula** holds:

$$V - E + F = 2.$$

Consequences of Euler's formula include the bounds $E \leq 3V - 6$ for simple planar graphs with $V \geq 3$ and $E \leq 2V - 4$ for simple bipartite planar graphs with $V \geq 3$.

## What this is not

A planar graph is *not* its embedding: the same planar graph admits many planar embeddings. Planarity is a property of the graph; the embedding is extra structure.

## Position

Planar graphs sit at the intersection of graph theory and topology. The two foundational characterizations:

- **[Kuratowski's theorem](../../documents/articles/research-articles/kuratowski.md)** — a graph is planar iff it contains no subdivision of $K_5$ or $K_{3,3}$ as a subgraph.
- **[Four-colour theorem](../../documents/articles/research-articles/four-colour.md)** — every planar graph admits a proper vertex-colouring with four colours.

Both are stated here with `status: sketch` and proofs deferred to citations. References: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) Ch. 4; the four-colour proofs are [Appel–Haken 1977](../../documents/articles/bibliographies/appel-haken1977.md) and [Robertson–Sanders–Seymour–Thomas 1997](../../documents/articles/bibliographies/robertson-sanders-seymour-thomas1997.md); Kuratowski's theorem is [Kuratowski 1930](../../documents/articles/bibliographies/kuratowski1930.md).
