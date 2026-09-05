---
term-kind: morphism
class: structure-preserving-map
depends-on: [graph-homomorphism, graph]
---

# Graph isomorphism

A **graph isomorphism** $f : G \to H$ is a [graph homomorphism](graph-homomorphism.md) that is bijective on vertex sets and whose inverse is also a graph homomorphism. Equivalently, $f$ is a bijection $V_G \to V_H$ such that $\{u, v\} \in E_G \iff \{f(u), f(v)\} \in E_H$ — adjacency is preserved *and reflected*.

## Signature

$$f : V_G \xrightarrow{\sim} V_H \quad \text{with} \quad \{u, v\} \in E_G \iff \{f(u), f(v)\} \in E_H.$$

## Definition / Construction

Two graphs are *isomorphic*, written $G \cong H$, when an isomorphism between them exists. Isomorphism is an equivalence relation on graphs. A property of a graph is a *graph invariant* iff it is preserved by isomorphism — number of vertices, number of edges, [degree](./degree.md) sequence, planarity, chromatic number are all invariants.

## Composition

Identity isomorphisms exist; isomorphisms compose; inverses are isomorphisms. The isomorphisms in $\mathbf{Grph}$ are exactly the *invertible morphisms*, so they form a groupoid sitting inside $\mathbf{Grph}$.

## Position

Graph isomorphism is the equivalence relation under which graph theory works: when graph theorists say "the [Petersen graph](../../documents/articles/teaching-articles/examples/petersen-graph.md)", they mean the isomorphism class. Determining whether two given graphs are isomorphic is the *graph isomorphism problem*, of long-standing complexity-theoretic interest (neither known to be in P nor known NP-complete; Babai 2016 gave a quasipolynomial algorithm). Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.1, [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §1.2.
