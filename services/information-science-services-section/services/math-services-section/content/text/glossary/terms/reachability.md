---
type: term
term-kind: concept
class: graph-relation
depends-on: [vertex, path]
---

# Reachability

*Reachability* is **the relation $u \rightsquigarrow v$ that holds when there is a directed [path](path.md) from $u$ to $v$ in a [directed graph](./directed-graph.md)**. Equivalently, $u$ reaches $v$ if $v$ lies in the *forward cone* of $u$ — the set of vertices touchable by following edge orientations.

Reachability is always reflexive (every vertex reaches itself by the empty path) and transitive (concatenating paths). Antisymmetry — "$u \rightsquigarrow v$ and $v \rightsquigarrow u$ implies $u = v$" — holds iff the digraph is a [DAG](./dag.md); on a DAG, reachability is therefore a strict [partial order](./partial-order.md). On a digraph with cycles, reachability is a *preorder*; the equivalence classes of the symmetric kernel are the *strongly connected components*.

The reachability relation is computed by the [transitive closure morphism](./transitive-closure.md), which takes any digraph to its reachability digraph. The corpus's `depends-on:` reachability is what underwrites the [dependency-soundness-iff-dag](../../documents/articles/research-articles/dependency-soundness-iff-dag.md) result.
