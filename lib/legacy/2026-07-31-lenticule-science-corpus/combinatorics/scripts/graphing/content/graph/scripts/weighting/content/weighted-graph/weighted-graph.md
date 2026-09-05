---
type: definition
class: combinatorial-structure
depends-on: [graph, edge]
realizes: [edge]
symbol: (G, w)
---

# Weighted graph

A **weighted graph** is a pair $(G, w)$ where $G = (V, E)$ is a [graph](graph.md) (or [directed graph](directed-graph.md)) and $w : E \to W$ is an *edge-weight function* into a value-domain $W$. The choice of $W$ determines what "weight" means: $W = \mathbb{R}_{\geq 0}$ for non-negative real weights (the textbook default; distances, costs, capacities), $W = \mathbb{R}$ when negative weights are admitted (potential differences), $W$ a *semiring* $(W, \oplus, \otimes)$ when path-weights are to be combined and aggregated (the algorithmic-shortest-path framework), or $W$ a *residuated lattice* when weights live in a logic-of-resources (the [bilattice](../../algebra/objects/bilattice.md) substrate of [predication categories](../../categories/theories/predication-categories/_index.md)).

## Structure

- **Underlying graph** $G$.
- **Weight function** $w : E \to W$.
- The induced **path-weight** of a path $e_1 e_2 \ldots e_k$ is $w(e_1) \otimes w(e_2) \otimes \cdots \otimes w(e_k)$ when $W$ carries a multiplication; the induced **path-cost** is the sum when $W$ is additive.

## Position

Weighted graphs are the substrate of algorithmic graph theory (Dijkstra, Bellman–Ford, max-flow) and of network optimization. The textbook treatment ([Diestel 2017](references/diestel2017.md), [Bondy–Murty 2008](references/bondy-murty2008.md) Ch. 7) takes $W = \mathbb{R}$ or $\mathbb{R}_{\geq 0}$. The semiring generalization (tropical semiring for shortest paths, max-times semiring for max-capacity paths) is standard in algebraic-graph-theory and quantale-enriched category theory. The right level of generality at which the corpus should commit — real-valued, semiring-valued, or residuated-lattice-valued — is the subject of [questions/weighted-graph-generality](questions/weighted-graph-generality.md).
