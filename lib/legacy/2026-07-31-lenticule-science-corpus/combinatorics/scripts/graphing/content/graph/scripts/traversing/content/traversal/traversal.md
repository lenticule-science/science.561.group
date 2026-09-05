---
type: concept
class: graph-process
depends-on: [vertex, edge, path]
---

# Traversal

*Traversal* is **the act of visiting [vertices](vertex.md) and [edges](edge.md) of a [graph](../objects/graph.md) by following a [path](path.md)**. The concept is structural rather than algorithmic: it names the role that any walk-the-graph procedure plays, abstracted from the specific order it visits things in.

Two traversal disciplines characterize the textbook external theory:

- A traversal that visits every *vertex* exactly once is a *Hamiltonian* traversal; the cycle case is a *Hamiltonian cycle*. Existence of a Hamiltonian cycle is NP-complete in general — no efficient characterization is known.
- A traversal that visits every *edge* exactly once is an *Eulerian* traversal; the closed case is an *Eulerian circuit*. Existence of an Eulerian circuit *is* characterized efficiently — by the [Eulerian-circuit criterion](../theorems/eulerian-circuit-criterion.md), every vertex has even [degree](degree.md).

Algorithmic traversal disciplines (BFS, DFS, etc.) are operational refinements that the corpus's `algorithms` theory should carry; this concept names the role they instantiate without authoring the algorithms.
