---
type: definition
class: combinatorial-structure
depends-on: [graph]
realizes: [vertex, edge, adjacency]
---

# Simple graph

A **simple graph** is a [graph](graph.md) $G = (V, E)$ with no self-loops and no parallel edges: $E \subseteq \binom{V}{2}$, every edge is a two-element subset of $V$, and no two edges are the same subset.

## Structure

A simple graph on $n$ vertices has at most $\binom{n}{2}$ edges. Equivalently, $E$ is a symmetric irreflexive relation on $V$: $u \sim v$ iff $\{u, v\} \in E$, with $u \not\sim u$ and $u \sim v \Leftrightarrow v \sim u$.

## Position

Simple graphs are the default object of most textbook treatments ([Diestel 2017](references/diestel2017.md), [Bondy–Murty 2008](references/bondy-murty2008.md)) — when a result is stated for "a graph" without qualification, "simple" is usually meant. A graph that is not simple is a [multigraph](multigraph.md). The [complete graph](complete-graph.md) $K_n$ is the simple graph on $n$ vertices with all $\binom{n}{2}$ possible edges. Whether multigraphs deserve first-class status alongside simple graphs is the subject of [questions/multigraph-first-class](questions/multigraph-first-class.md).
