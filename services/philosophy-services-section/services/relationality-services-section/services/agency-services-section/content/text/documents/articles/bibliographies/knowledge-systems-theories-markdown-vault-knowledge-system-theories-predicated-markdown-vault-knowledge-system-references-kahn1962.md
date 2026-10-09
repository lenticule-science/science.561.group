---
type: reference
class: academic
status: cited
authors: [Kahn, Arthur B.]
year: 1962
title: "Topological Sorting of Large Networks"
venue: "Communications of the ACM 5 (11), 558–562"
description: Kahn, A.
---

# Kahn (1962) — Topological Sorting of Large Networks

## Source

Kahn, A. B. (1962). "Topological Sorting of Large Networks." *Communications of the ACM* 5 (11), 558–562. <https://doi.org/10.1145/368996.369025>

## Form

Journal article (algorithms / graph theory).

## Content summary

Establishes the standard algorithm for producing a topological ordering of a finite directed acyclic graph: maintain a working set of vertices with no remaining inbound edges; repeatedly remove a vertex from the working set, append it to the output sequence, remove its outbound edges, and add any newly inbound-edge-free vertices to the working set. The algorithm terminates with every vertex in the output sequence iff the graph is acyclic; a non-empty residue at termination certifies a cycle. Equivalently: every finite DAG admits at least one topological sort, and the algorithm constructs one.
