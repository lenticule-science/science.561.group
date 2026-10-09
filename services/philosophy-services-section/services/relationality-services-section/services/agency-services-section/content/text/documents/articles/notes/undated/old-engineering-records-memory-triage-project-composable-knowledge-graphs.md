---
name: project_composable-knowledge-graphs
description: Future architecture where colocated graphs compose upward — repo-root graph is the AST of all sub-graphs, most of which are ASTs themselves except leaves.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_composable-knowledge-graphs
---

The user envisions a future where the single monolithic knowledge-graph.json is replaced by colocated graphs that compose upward:

- Each domain/directory has its own local graph
- Parent graphs compose from children
- The repo-root graph is the "abstract syntax tree" of all sub-graphs
- Most intermediate nodes are themselves ASTs, only leaves are terminal
- This mirrors the charter-as-AST-root principle: the org structure IS a tree, and each node has its own coherent graph

**Why:** The current graph (10,977 entities, 7.4MB) is rebuilt monolithically. As the repo grows, this won't scale. Colocated graphs would also enable partial rebuilds — change a term, rebuild only its domain graph, then compose upward.

**How to apply:** This is future architecture, not current work. When the graph generator or datastore module is being modified, keep this shape in mind. Don't introduce patterns that assume a single flat graph. The `patchGraphForFile` function (which patches one entity at a time) is already a step toward incremental updates. The full composable architecture would make those patches scoped to the relevant sub-graph.
