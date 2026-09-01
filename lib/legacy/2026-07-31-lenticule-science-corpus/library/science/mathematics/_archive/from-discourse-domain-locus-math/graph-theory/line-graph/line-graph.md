---
type: morphism
class: functor
depends-on: [graph, edge, adjacency, incidence]
---

# Line graph

The **line graph** functor $L : \mathbf{Grph} \to \mathbf{Grph}$ sends a [graph](../objects/graph.md) $G = (V, E)$ to the graph $L(G)$ whose vertices are the edges of $G$ and whose edges are the [incidences](teaching/explanations/incidence.md) — two vertices of $L(G)$ are adjacent iff the corresponding edges of $G$ share an endpoint.

## Signature

$$L(G) = (E_G, \{\{e, e'\} : e \cap e' \neq \emptyset, e \neq e'\}).$$

## Definition / Construction

Each edge of $G$ becomes a vertex of $L(G)$. Each vertex of $G$ of [degree](teaching/explanations/degree.md) $d$ contributes a clique $K_d$ to $L(G)$, since all $d$ edges incident at that vertex are pairwise adjacent in $L(G)$. So $L(G)$ has $|E_G|$ vertices and $\sum_{v \in V_G} \binom{\deg(v)}{2}$ edges.

On graph homomorphisms: a homomorphism $f : G \to H$ induces $L(f) : L(G) \to L(H)$ sending an edge $e = \{u, v\}$ of $G$ to the edge $\{f(u), f(v)\}$ of $H$ (assuming $f(u) \neq f(v)$; the degenerate case requires care).

## Composition

$L$ is functorial: $L(g \circ f) = L(g) \circ L(f)$. Iteration $L^k(G)$ produces a sequence of graphs with rich combinatorics; for most graphs $L^k(G)$ grows without bound.

## Position

The line graph functor is the canonical way of moving from "graph as set of vertices with edges between them" to "graph as set of edges with shared-incidence between them". An *Eulerian circuit* in $G$ corresponds to a *Hamiltonian cycle* in $L(G)$. The line-graph construction is one of the fundamental endofunctors on $\mathbf{Grph}$. Reference: [Bondy–Murty 2008](references/bondy-murty2008.md) §1.7, [Harary 1969](references/harary1969.md) Ch. 8.
