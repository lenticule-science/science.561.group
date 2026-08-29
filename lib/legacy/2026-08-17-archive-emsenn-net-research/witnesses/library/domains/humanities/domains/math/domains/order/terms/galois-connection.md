---

description: "A pair of order-reversing maps between posets satisfying f(a) ≥ b iff a ≥ g(b). The order-theoretic form of an adjunction."
defines: galois-connection
aliases: [Galois connection, Galois connections, Galois correspondence]
specialization: partial-order
order-theoretic-form-of: adjoint-pair
fixed-points-form: concept-lattice
central-example: formal-concept-analysis
bilattice-version: galois-biconnection
bilattice-biconnection: jakl-jung-rivieccio-2021
instances: [extent-intent, ideal-variety, theory-model, residuation]
prototype: ganter-wille-1999
algebraic-geometry-instance: nullstellensatz
date-created: 2026-03-30
---

A Galois connection between two partially ordered sets $(A, \leq)$ and $(B, \leq)$ is a pair of maps $f: A \to B$ and $g: B \to A$ satisfying:

$$f(a) \geq b \quad\text{if and only if}\quad a \geq g(b)$$

(antitone form) or equivalently a pair of monotone maps between opposite orders. This is the order-theoretic form of an [adjunction](../../categories/domains/ordinary-categories/terms/adjoint-pair.md).

The central example is [formal concept analysis](../../logic/terms/formal-context.md) (Ganter & Wille 1999): given a formal context $(G, M, I)$, the derivation operators $A \mapsto A'$ and $B \mapsto B'$ form a Galois connection between subsets of objects and subsets of attributes. The closed elements of this connection are the formal concepts; they form a [concept lattice](./concept-lattice.md).

In a [residuated lattice](../../algebra/terms/residuated-lattice.md), for each fixed element $a$, the maps $x \mapsto a \cdot x$ and $y \mapsto a \to y$ form a (monotone) Galois connection. This is the residuation.

On the four-valued [bilattice](../../algebra/terms/bilattice.md), Jakl, Jung, & Rivieccio (2021) defined **Galois biconnections**: bilattice analogues of Galois connections compatible with both the truth and knowledge orderings.
