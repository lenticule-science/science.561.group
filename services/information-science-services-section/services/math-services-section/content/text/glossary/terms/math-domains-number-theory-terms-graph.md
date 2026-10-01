---
name: "Graph"
date-created: 2026-03-05
---

A graph is a mathematical structure consisting of objects (called vertices or nodes) and connections between them (called edges). Draw a dot for each vertex and a line for each edge, and you have a picture of a graph. Graphs formalize any situation where things are related to other things: cities connected by roads, people who know each other, web pages linked by hyperlinks, atoms bonded in a molecule.

Formally, a graph $G = (V, E)$ consists of a set $V$ of vertices and a set $E$ of edges. In an undirected graph, each edge is an unordered pair {u,v}\{u, v\} — the connection between $u$ and $v$ runs both ways. In a directed graph (or digraph), each edge is an [ordered pair](ordered-pair.md) $(u, v)$ — the connection runs from $u$ to $v$ but not necessarily back. A graph with no multiple edges between the same pair of vertices and no edges from a vertex to itself is called simple.

Graph theory was born from a recreational puzzle. In 1736, Leonhard Euler published &ldquo;Solutio problematis ad geometriam situs pertinentis,&rdquo; analyzing the Seven Bridges of Königsberg: is it possible to walk through the city crossing each of its seven bridges exactly once? Euler proved it is not, by reducing the problem to its essential structure — four land masses (vertices) connected by seven bridges (edges) — and showing that such a walk requires each vertex to have an even number of edges, which Königsberg&rsquo;s graph does not satisfy. This paper founded graph theory and, more broadly, the field of topology (which Euler called &ldquo;geometria situs,&rdquo; the geometry of position).

Graphs formalize [relations](../../documents/articles/research/2026/07/concepts/relation/index.md) between discrete objects. A symmetric binary relation on a set corresponds exactly to an undirected graph; a general binary relation corresponds to a directed graph. This correspondence makes graph theory the natural language for networks of all kinds: social networks, communication networks, transportation networks, dependency graphs in software, and metabolic pathways in biology.

In [category theory](../../documents/articles/research/2026/07/objects/categories/index.md), a directed graph (also called a quiver) is a pair of [functions](../../documents/articles/research/2026/07/concepts/function/index.md) $s, t: E \to V$ assigning a source and target vertex to each edge. A [category](../../documents/articles/research/2026/07/objects/categories/ordinary-categories/terms/category.md) can be seen as a graph enriched with composition (a way to chain edges) and identity edges (a self-loop at every vertex). This perspective makes the graph the simplest precursor to a category — a category is a graph where you can compose paths.
