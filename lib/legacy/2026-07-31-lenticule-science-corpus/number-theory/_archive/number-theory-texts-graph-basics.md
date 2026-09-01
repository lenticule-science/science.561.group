---
title: "Graph Basics"
aliases:
  - "Graph Basics"
id: combinatorics-lesson-2
authors:
- claude-opus-4-6
date-created: 2026-03-05
type: lesson
tags: []
teaches:
  - "Graph Basics"
---

## Entry conditions

You should be comfortable with [sets](../../../objects/sets/terms/set.md) and [relations](../../../concepts/relation/index.md).

## Definitions

A **[graph](../terms/graph.md)** $G = (V, E)$ consists of a set $V$ of **vertices** and a set $E$ of **edges**, where each edge connects two vertices. If the edges have direction, the graph is **directed**; otherwise it is **undirected**.

A **path** is a sequence of vertices $v_1, v_2, \ldots, v_k$ where each consecutive pair is connected by an edge. A graph is **connected** if there is a path between every pair of vertices.

The **degree** of a vertex is the number of edges incident to it. The **handshaking lemma** states that the sum of all degrees equals twice the number of edges: $\sum_{v \in V} \deg(v) = 2|E|$.

A **tree** is a connected graph with no cycles. A tree on $n$ vertices has exactly $n - 1$ edges.

## Vocabulary (plain language)

- **Graph**: a set of points (vertices) connected by lines (edges).
- **Path**: a walk through the graph following edges.
- **Connected**: every vertex can reach every other.
- **Tree**: a connected graph with no loops.

## Intuition

A graph is a [relation](../../../concepts/relation/index.md) made visual. The vertices are the things; the edges are the connections between them. This makes graphs a natural tool for modeling any situation where relationships are the primary data — social networks, dependencies, state transitions.

In the context of [relationality](../../../../relationality/index.md), graphs provide one of the simplest formal structures in which relations are prior to entities: a vertex is characterized by its edges, not by an intrinsic identity.

## Common mistakes

- Confusing graphs with their visual drawings. The same graph can be drawn many different ways.
- Forgetting that a tree requires *both* connectivity and acyclicity.
