---
term-kind: morphism
class: operator
depends-on: [dag, directed-graph, reachability, acyclicity]
realizes: [acyclicity, reachability]
---

# Topological sort

A **topological sort** of a [DAG](./dag.md) $D = (V, E)$ is a linear ordering $v_1 < v_2 < \cdots < v_n$ of its vertices such that every edge points forward: $(v_i, v_j) \in E$ implies $i < j$.

## Signature

$$\mathrm{topo} : \mathrm{DAG}_V \to \mathrm{LinOrders}(V) / {\sim}_{\text{compatible}},$$

where the codomain is the set of linear orders on $V$ that are compatible with the DAG's [reachability](./reachability.md) order. The morphism returns *one* such ordering; multiple compatible orderings typically exist.

## Definition / Construction

Two standard constructions:

- **Kahn's algorithm.** Repeatedly remove a vertex with in-degree zero (a *source*) and append it to the output. Terminates with a valid topological order iff the digraph is a DAG.
- **DFS post-order.** Perform a depth-first search, push each vertex onto a stack at post-order time, and pop the stack to read the topological order.

Both run in $O(|V| + |E|)$ time.

## Invariants

- A topological sort exists iff $D$ is a DAG — this is the content of [dag-topological-sort](../../documents/articles/research-articles/dag-topological-sort.md).
- The sort is unique iff the DAG's reachability relation is a *total* order; otherwise multiple sorts are valid (one per linear extension of the reachability partial order).
- The sort of $D^{\mathrm{op}}$ (see [reverse-orientation](reverse-orientation.md)) is the reverse of the sort of $D$.

## Composition

Topological sort composes with [transitive closure](transitive-closure.md): the sort of $D$ is the same as the sort of $D^+$, since closure does not add edges going backward.

## Position

Topological sort is the canonical example of an algorithmic procedure that is *correct iff the input is a DAG*. It is what the corpus uses (implicitly, in the renderer) to convert a `depends-on:` graph into a linear reading order. The [dependency-soundness-iff-dag](../../documents/articles/research-articles/dependency-soundness-iff-dag.md) theorem makes the dependence on acyclicity explicit. Reference: [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §2.1.
