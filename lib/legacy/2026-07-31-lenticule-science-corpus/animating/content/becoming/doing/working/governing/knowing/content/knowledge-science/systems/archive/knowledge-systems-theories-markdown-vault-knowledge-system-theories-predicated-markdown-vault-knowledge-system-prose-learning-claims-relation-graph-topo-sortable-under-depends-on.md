---
type: theorem
status: proved
depends-on:
  - ../objects/relation-graph.md
  - ../teaching/explanations/frontmatter-relation.md
  - references/kahn1962.md
see-also:
  - ../specifications/frontmatter-relations.md
  - ../specifications/theory-discipline.md
---

# The `depends-on` subgraph admits a topological sort

**Theorem.** Let $G = (V, E)$ be the [relation graph](../objects/relation-graph.md) of a vault, and let $G_d = (V, E_d)$ be its restriction to `depends-on`-edges only ($E_d = \{(n, \mathit{depends\text{-}on}, n') \in E\}$). If the discipline's validation rule "no cycles in `depends-on`" holds, then $G_d$ admits a topological sort: a linear order $\preceq$ on $V$ such that whenever $(n, \mathit{depends\text{-}on}, n') \in E_d$, $n' \preceq n$ (the dependency comes before the dependent in any sound reading).

## Proof

$G_d$ is a directed graph on a finite vertex set (any vault is finite at any moment in its history). The validation rule excludes cycles in $G_d$, so $G_d$ is a finite DAG. By the standard topological-sort theorem for finite DAGs (Kahn 1962), every finite DAG admits at least one topological sort.

Concretely, Kahn's algorithm constructs one: maintain a working set $W$ of vertices with no remaining inbound `depends-on`-edges; repeatedly remove a vertex from $W$, append it to the output sequence, remove its outbound edges, add any newly-incoming-edge-free vertices to $W$. The algorithm terminates with every vertex in the output sequence (because $G_d$ is finite and acyclic, $W$ is non-empty until the algorithm finishes), and the output sequence is a topological sort. $\square$

## Corollaries

**(C1) The corpus has at least one sound reading order.** A "sound reading order" is one where every dependency is read before any dependent. The theorem says one exists; the renderer's reading-order pass (`fars context` and the monograph build) computes one.

**(C2) Sound reading orders are not unique.** Multiple linear extensions of a DAG generally exist; the renderer picks one by additional criteria (alphabetical within rank, declared `chapters:` order, `introduces:` cues for narratives). The theorem says *any* extension is sound.

**(C3) The validation rule is load-bearing.** Without "no cycles in `depends-on`," the theorem fails: a cycle $n \to n' \to n$ has no topological sort. The discipline's rule is the precondition that makes the corpus readable in topological order; the cost of the rule is that contributors cannot express mutual dependency via `depends-on:` and must use `see-also:` for cross-references that carry no priority commitment.

**(C4) Topological sortability is a closure invariant.** Adding a `depends-on:` edge that introduces a cycle violates the substrate's invariant; the validation pass is the closure rule that surfaces such violations on commit. The substrate does not silently accept a cyclic edge.

