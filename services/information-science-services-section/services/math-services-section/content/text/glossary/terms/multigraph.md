---
type: term
term-kind: definition
class: combinatorial-structure
depends-on: [graph, vertex, edge, incidence]
realizes: [vertex, edge, incidence]
---

# Multigraph

A **multigraph** is a triple $G = (V, E, \iota)$ where $V$ is a vertex set, $E$ is an *edge set* whose elements are abstract edges (not vertex-pairs), and $\iota : E \to \binom{V}{2} \cup \{\{v\}: v \in V\}$ is the [incidence](./incidence.md) map assigning to each edge its (unordered) pair of endpoints. Multiple edges may share the same endpoint pair (called *parallel* edges), and self-loops $\iota(e) = \{v\}$ are permitted.

## Structure

The triple presentation distinguishes the *edge* (an abstract token in $E$) from the *vertex pair* it is incident to. This separation is what lets two distinct edges $e_1 \neq e_2$ both have $\iota(e_1) = \iota(e_2) = \{u, v\}$. A [simple graph](simple-graph.md) is exactly the multigraph in which $\iota$ is injective and never lands on a singleton.

## Position

Multigraphs are the natural object whenever the same kind of connection can occur multiple times between the same pair of vertices: parallel highway lanes, multiple bridges between two land masses (the original [seven bridges of Königsberg](../../documents/articles/teaching-articles/examples/seven-bridges-of-konigsberg.md) is a multigraph, not a simple graph), or repeated bonds in a chemical structure. The [line-graph morphism](./line-graph.md) is naturally defined on multigraphs. Whether the corpus should always work with multigraphs and treat simple graphs as a degenerate case is the subject of [questions/multigraph-first-class](../../documents/articles/research-articles/questions/multigraph-first-class.md). Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.10 (multigraphs and hypergraphs).
