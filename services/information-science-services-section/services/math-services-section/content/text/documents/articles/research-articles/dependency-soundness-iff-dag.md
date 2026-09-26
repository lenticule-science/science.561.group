---
type: theorem
status: proved
depends-on: [dag, directed-graph, acyclicity, cycle, reachability, topological-sort, transitive-closure, dag-topological-sort]
title: Dependency soundness iff DAG
description: "Let $D = (V, E)$ be a finite directed graph on a vertex set $V$ of typed notes, with $(u, v) \\in E$ iff \"$u$ has $v$ in its depends-on: list\" (i.e."
---

# Dependency soundness iff DAG

Let $D = (V, E)$ be a finite [directed graph](../../../glossary/terms/directed-graph.md) on a vertex set $V$ of typed notes, with $(u, v) \in E$ iff "$u$ has $v$ in its `depends-on:` list" (i.e. $u$ depends on $v$). A *sound reading order* is a linear ordering of $V$ in which every dependency is read before the note that depends on it: if $(u, v) \in E$, then $v$ appears before $u$.

**Theorem.** A sound reading order on $D$ exists if and only if $D$ is a [DAG](../../../glossary/terms/dag.md).

## Proof

A sound reading order on $D$ — namely, an ordering in which dependencies are read first — is precisely a topological sort of the *reverse* digraph $D^{\mathrm{op}}$ (see [reverse-orientation](../../../glossary/terms/reverse-orientation.md)), since "$v$ appears before $u$ when $(u, v) \in E$" matches "$v$ appears before $u$ when $(v, u) \in E^{\mathrm{op}}$", which is the topological-sort condition on $E^{\mathrm{op}}$.

By [dag-topological-sort](dag-topological-sort.md), $D^{\mathrm{op}}$ admits a topological sort iff $D^{\mathrm{op}}$ is a DAG. Since $D^{\mathrm{op}}$ is a DAG iff $D$ is a DAG (acyclicity is preserved by edge-reversal — see [reverse-orientation](../../../glossary/terms/reverse-orientation.md)), we conclude that a sound reading order on $D$ exists iff $D$ is a DAG. $\square$

## Corollary

If $D$ is *not* a DAG, then $D$ contains a directed cycle $u_1 \to u_2 \to \cdots \to u_k \to u_1$, and every $u_i$ in the cycle is required to appear *after* $u_{i+1}$ and *before* $u_{i+1}$ — an impossible constraint. Cycles in `depends-on:` are therefore corpus-level *soundness diagnostics*: they signal that the `depends-on:` claims as written cannot all be honest. The [reachability](../../../glossary/terms/reachability.md) relation on $D$ is a strict [partial order](../../../glossary/terms/partial-order.md) iff $D$ is a DAG (see [transitive-closure](../../../glossary/terms/transitive-closure.md)), so requiring `depends-on:` to be a DAG is the same as requiring the transitive `depends-on*` to be a partial order on the corpus.

## Remarks

This theorem is the load-bearing graph-theoretic claim of this directory: it is what underwrites the corpus's commitment, made in the predicated-markdown-vault-knowledge-system frontmatter-relations spec, that "`depends-on:` cycles are a soundness diagnostic". The spec phrases that claim without proof; this theorem supplies the proof. Without graph theory in the corpus, that load-bearing claim has nowhere to land. The downstream `depends-on:` edge added to [partial-order](../../../glossary/terms/partial-order.md) (which is a transitive antisymmetric DAG by exactly this argument) makes the dependence on graph theory typographically explicit.

The [dependency-graph-of-this-corpus](../teaching-articles/examples/dependency-graph-of-this-corpus.md) example walks through what this looks like at the corpus level: counting the `depends-on:` edges that exist, verifying the graph is a DAG, exhibiting the topological sort the renderer uses.
