---
type: morphism
class: structure-preserving-map
depends-on: [graph-homomorphism, graph, vertex, edge]
---

# Quotient graph

The **quotient graph** of a [graph](../objects/graph.md) $G = (V, E)$ by an equivalence relation $\sim$ on $V$ is the graph $G/\sim = (V/\sim, E/\sim)$ whose vertices are equivalence classes and whose edges are $E/\sim = \{\{[u], [v]\} : \{u, v\} \in E\}$. The **quotient morphism** $q : G \to G/\sim$ sends each vertex to its equivalence class.

## Signature

$$q : V \twoheadrightarrow V/\sim, \quad q(v) = [v].$$

## Definition / Construction

Edges incident on identified vertices may collapse to self-loops or parallel edges; whether the quotient is taken to be a [simple graph](../objects/simple-graph.md) (collapsing parallels and dropping loops) or a [multigraph](../objects/multigraph.md) (preserving them) is a convention to declare. The corpus convention follows the multigraph version: quotients land in $\mathbf{MultiGrph}$.

## Composition

Quotients compose: $G \to G/\sim_1 \to (G/\sim_1)/\sim_2$ equals the quotient of $G$ by the join $\sim_1 \vee \sim_2$. The quotient morphisms are the regular epimorphisms in $\mathbf{Grph}$ (or $\mathbf{MultiGrph}$).

## Position

Quotient graphs are how graph theory carries out *contractions*: the contraction of an [edge](teaching/explanations/edge.md) $\{u, v\}$ identifies its endpoints, and the corresponding quotient morphism is the universal map identifying $u$ with $v$. Edge contractions underlie the minor relation that figures in the [Robertson–Seymour graph minors theorem](references/robertson-sanders-seymour-thomas1997.md) tradition. They also underlie the construction of [bipartite-iff-no-odd-cycle](../theorems/bipartite-iff-no-odd-cycle.md) when read constructively. Reference: [Diestel 2017](references/diestel2017.md) §1.7 (minors).
