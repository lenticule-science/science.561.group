---
term-kind: morphism
class: structure-preserving-map
depends-on: [graph-homomorphism, subgraph, graph]
aliases:
  - Subgraph inclusion
type: morphism
---

# Subgraph inclusion

The **subgraph inclusion** $\iota : H \hookrightarrow G$ for a [subgraph](./subgraph.md) $H = (V', E')$ of $G = (V, E)$ is the [graph homomorphism](graph-homomorphism.md) given by the set-theoretic inclusion $V' \hookrightarrow V$. It is the canonical way of presenting "$H$ is a part of $G$" as a morphism.

## Signature

$$\iota : H \hookrightarrow G, \quad \iota(v) = v \quad \text{for } v \in V'.$$

## Definition / Construction

The map is the identity on vertices in $V'$. The homomorphism condition is automatic: every edge $\{u, v\} \in E'$ satisfies $\{u, v\} \in E$ by the subgraph definition.

## Composition

Subgraph inclusions compose: $K \subseteq H \subseteq G$ gives $K \hookrightarrow H \hookrightarrow G$ whose composition is the inclusion $K \hookrightarrow G$. They are the monomorphisms in $\mathbf{Grph}$ when "subgraph" is understood as the induced-subgraph notion.

## Position

Subgraph inclusion is how parts of graphs are tracked: the [Kuratowski subgraphs](./planar-graph.md) of a non-planar graph are presented as inclusions of $K_5$ or $K_{3,3}$ subdivisions; the spanning subgraphs of an arbitrary graph are presented as inclusions $H \hookrightarrow G$ with $V(H) = V(G)$. Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.1.
