---
type: question
class: theory-organisation
status: open
depends-on:
  - ../_index.md
see-also:
  - ../objects/dag.md
  - ../objects/tree.md
title: Graph algorithms — promote to a child theory?
description: "A substantial body of graph-theoretic content lies on the algorithmic side: BFS, DFS, shortest-paths (Dijkstra, Bellman-Ford, Floyd-Warshall), minimum spanning tree (Prim, Kruskal), max-flow (Ford-Fulkerson, Edmonds-Karp, push-relabel),…"
---

# Graph algorithms — promote to a child theory?

## Statement

A substantial body of graph-theoretic content lies on the algorithmic side: BFS, DFS, shortest-paths (Dijkstra, Bellman-Ford, Floyd-Warshall), minimum spanning tree (Prim, Kruskal), max-flow (Ford-Fulkerson, Edmonds-Karp, push-relabel), bipartite matching (Hungarian algorithm), graph colouring algorithms, planarity-testing algorithms, treewidth and tree-decomposition algorithms.

Should the corpus open a `graph-algorithms` child theory under `graph-theory`, or should the algorithmic material live elsewhere (under `engineering/theories/computing/`, under a new `algorithms` theory, or distributed across the relevant graph-theoretic concepts and theorems)?

## Why it matters

The discipline's theory-discipline commitment is that each theory is a coherent organisation locale: notes that belong together substantively belong in the same theory. Graph algorithms have two homes:

- They are *graph-theoretic* in subject matter — the structures they manipulate are graphs, and the correctness of each algorithm is a graph-theoretic claim.
- They are *algorithmic* in form — they have run-time complexity, space complexity, implementation choices, and fit into the algorithmic-complexity literature alongside non-graph algorithms.

A `graph-algorithms` child of `graph-theory` would emphasise the first; a `graph-algorithms` subdirectory of an `algorithms` theory under `engineering/theories/computing/` would emphasise the second.

## What would count as an acceptable answer

A captain decision plus a rationale: which home, with what scope, and under what edge discipline. The decision should:

1. Name the home (single-home) for the algorithmic content. Distributing it across multiple homes is admissible only if the discipline's directory-tree-carries-meaning commitment can absorb the splitting (e.g., proofs of correctness here, complexity analyses there).
2. State what `depends-on:` edges algorithm notes will declare into the graph-theory parent (concepts, objects, theorems).
3. State whether the algorithmic notes are themselves typed `definition`, `morphism`, or a new note-type the discipline has not yet committed to.

## Bounds

- Out of scope: deciding *which specific algorithms* to author first. That is a per-author choice once the home is fixed.
- Out of scope: implementation language (the discipline's notes are language-agnostic; runnable code lives in `predicated-computing`'s FARS subtree, not in the typed library).

## Earlier material

The discipline's [theory-discipline](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/specifications/theory-discipline.md) commitment is that each theory is a coherent organisation locale: notes that belong together substantively belong in the same theory. Graph algorithms have two homes:

1. Name the home (single-home) for the algorithmic content. Distributing it across multiple homes is admissible only if the discipline's [directory-tree-carries-meaning](../../research/2026/07/31/lenticule-import/science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/concepts/directory-tree-carries-meaning.md) commitment can absorb the splitting (e.g., proofs of correctness here, complexity analyses there).
2. State what `depends-on:` edges algorithm notes will declare into the graph-theory parent (concepts, objects, theorems).
3. State whether the algorithmic notes are themselves typed `definition`, `morphism`, or a new note-type the discipline has not yet committed to.
