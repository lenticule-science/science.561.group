---
type: term
term-kind: definition
class: combinatorial-structure
depends-on: [directed-graph, acyclicity, cycle]
realizes: [acyclicity, reachability]
symbol: D
---

# DAG

A **DAG** (*directed acyclic graph*) is a [directed graph](directed-graph.md) $D = (V, E)$ containing no directed [cycle](./cycle.md): there is no sequence of edges $v_0 \to v_1 \to \cdots \to v_k$ with $v_k = v_0$. DAGs are the canonical formalisation of any "before/after" or "depends on" relation: dependency graphs in build systems, task graphs in scheduling, citation graphs (in the idealised case where citation does not loop back), parse trees in compilers, the substantive subgraph of the corpus's own relation graph.

## Topological order

Every DAG admits a *topological order*: a total order on its vertices in which every edge runs from an earlier vertex to a later one. Equivalently, every DAG can be linearised so that, walking the linearisation left to right, no edge ever points backward. This is what licenses the standard "process tasks in dependency order" algorithm: topologically sort the DAG, then process in that order.

The topological order is generally not unique — many linearisations are compatible with the same DAG, and the choice among them matters for some applications (scheduling) but not for others (correctness of dependency resolution). Every finite DAG admits a *topological sort* by [dag-topological-sort](../../documents/articles/research-articles/dag-topological-sort.md).

## Sources, sinks, depth

In a DAG:

- A **source** is a vertex with in-degree zero (no edges pointing into it).
- A **sink** is a vertex with out-degree zero (no edges pointing out of it).
- The **depth** of a vertex is the length of the longest path from any source to it.
- A *finite* DAG always has at least one source and at least one sink (proof: walk backward from any vertex; if you never hit a source, you eventually revisit a vertex, contradicting acyclicity).

## Structure

- **Vertex set** $V$.
- **Edge set** $E \subseteq V \times V$ with no directed cycle.
- The [reachability](./reachability.md) relation $u \rightsquigarrow v$ on a DAG is a strict [partial order](./partial-order.md) (irreflexive, transitive, antisymmetric).

## DAGs vs trees

A [tree](tree.md), seen as a rooted tree with edges directed away from the root, is a DAG with the additional property that every vertex except the root has exactly one parent (in-degree one). General DAGs admit vertices with multiple parents — a DAG is a "tree with sharing", where multiple paths can lead to the same vertex.

This distinction matters in the corpus: the vault directory tree is a tree (each file has exactly one parent directory), but the relation graph is a DAG (a single note can be `depends-on`'d by many other notes, giving it multiple parents in the dependency DAG).

## What this is not

A DAG is *not* a tree (a DAG admits multiple paths between the same pair of vertices; a tree does not). A DAG is *not* its transitive closure (the closure is again a DAG, but a different one — see [transitive-closure](./transitive-closure.md)). Forgetting orientation does not yield an acyclic *undirected* graph: a DAG may have an underlying undirected cycle (e.g. $a \to b, a \to c, b \to c$) while remaining a DAG.

## Algorithmic affordances

DAGs admit efficient algorithms for several problems that are hard or undefined on cyclic graphs:

- **Topological sort** in linear time.
- **Longest path** in linear time (NP-hard for general graphs; polynomial for DAGs because the DAG's topological order admits dynamic programming).
- **Reachability** is a partial order on vertices; reachability questions reduce to transitive-closure computations.
- **Lowest common ancestor** is well-defined in rooted DAGs and admits efficient algorithms.
