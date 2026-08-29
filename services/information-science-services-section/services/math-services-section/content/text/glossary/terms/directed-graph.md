---
title: "Directed Graph"
description: "A directed graph is a set of vertices connected by edges that have a direction. An edge from u to v goes one way — it does not also go from v to u. This is the difference from an undirected graph, where edges have no direction."
defines: Directed Graph
date-created: 2026-03-29
aliases:
  - "digraph"
  - "directed graph"
contains: [vertex, edge, path, cycle]
enables: [morphism, partial-order, state-machine, topological-sort]
contrasts-with: undirected-graph
date-updated: 2026-03-29
type: term
---

A directed graph is a set of vertices connected by edges that have a direction. An edge from u to v goes one way — it does not also go from v to u. This is the difference from an undirected graph, where edges have no direction.

Formally, a directed graph G = (V, E) is a set V of vertices and a set E of ordered pairs from V. The ordering is what makes it directed: (u, v) and (v, u) are different edges.

A path is a sequence of edges that connect one vertex to another. A cycle is a path from a vertex back to itself. A directed acyclic graph (DAG) is a directed graph with no cycles — it can only move forward, never loop back. DAGs show up everywhere: build systems, dependency chains, scheduling, any process where steps have a fixed order.

Every vertex has an in-degree (how many edges point to it) and an out-degree (how many edges leave it). A vertex with in-degree zero is a source — nothing points to it, so it has no dependencies. A vertex with out-degree zero is a sink — nothing leaves it, so nothing depends on it.

Directed graphs are the simplest way to represent asymmetric relationships. "A must happen before B" is an edge from A to B. "Data flows from producer to consumer" is an edge from producer to consumer. The predicate relations in this library's frontmatter form a directed graph: each page is a vertex, each `predicate: value` pair is a directed edge.

A [partial order](./partial-order.md) is a directed graph with transitivity and antisymmetry. A [category](./category.md) is a directed graph with composition. A state machine is a directed graph with labeled edges representing transitions. The directed graph is the common foundation underneath all of them.
