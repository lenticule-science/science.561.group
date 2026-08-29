---
type: term
term-kind: morphism
class: operator
depends-on: [directed-graph, reachability, path]
realizes: [reachability]
symbol: D^+
---

# Transitive closure

The **transitive closure** of a [directed graph](./directed-graph.md) $D = (V, E)$ is the digraph $D^+ = (V, E^+)$ where $(u, v) \in E^+$ iff there is a directed [path](./path.md) of length $\geq 1$ from $u$ to $v$ in $D$. The closure is the smallest transitive digraph on $V$ containing $E$.

## Signature

$$(\,\cdot\,)^+ : \mathbf{Digrph}_V \to \mathbf{Digrph}_V, \quad D \mapsto D^+.$$

The variant $D^*$ (the *reflexive transitive closure*) additionally adds a loop at every vertex, so $u \in V$ counts as reachable from itself.

## Definition / Construction

Operationally, $E^+ = \bigcup_{k \geq 1} E^k$ where $E^k$ is the set of pairs connected by a length-$k$ directed walk. On a finite digraph, this stabilizes by $k = |V|$.

In matrix form: if $A \in \{0,1\}^{V \times V}$ is the [adjacency](./adjacency.md) matrix, then $A^+$ is the Boolean matrix $\bigvee_{k \geq 1} A^k$ (with Boolean addition / multiplication). Computed in $O(|V|^3)$ by Warshall's algorithm.

## Invariants

- $D^+$ is transitive: $(u, v) \in E^+$ and $(v, w) \in E^+$ implies $(u, w) \in E^+$.
- $D \subseteq D^+$ (the closure contains the original).
- $(D^+)^+ = D^+$ (idempotent).
- $D$ is a [DAG](./dag.md) iff $D^+$ is a strict partial order on $V$ — in which case $D^+$ *is* the [reachability](./reachability.md) relation, viewed as a digraph.

## Composition

Transitive closure is the closure operator (in the order-theoretic sense — see [closure-operator](./closure-operator.md)) for the property "is transitive" on the lattice of digraphs on $V$ ordered by edge-set inclusion.

## Position

Transitive closure is what computes [reachability](./reachability.md) from local edge information. The corpus's `depends-on:` graph is implicitly closed under transitive closure when the renderer asks "what does this note transitively depend on?"; the [dependency-soundness-iff-dag](../../documents/articles/research-articles/dependency-soundness-iff-dag.md) result depends on the closure being a partial order, which forces the original graph to be a DAG. Reference: [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §2.2.
