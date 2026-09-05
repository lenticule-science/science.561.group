---
type: definition
class: structural-invariant
status: stable
depends-on: [formal-context, derivation-operator]
see-also: [basic-theorem-of-fca, concept-as-closed-pair]
---

# Concept lattice

The **concept lattice** of a formal context $\mathbb{K} = (G, M, I)$ is the partially ordered set $\mathfrak{B}(\mathbb{K}) = (\{(A, B) \mid A' = B, B' = A\}, \le)$ where $(A_1, B_1) \le (A_2, B_2) \iff A_1 \subseteq A_2 \iff B_2 \subseteq B_1$.

It is the *primary structural invariant* the FCA lineage extracts from a context. Two contexts are conceptually equivalent (in the sense of [formal-context](formal-context.md)) iff their concept lattices are isomorphic.

## Lattice structure

$\mathfrak{B}(\mathbb{K})$ is a **complete lattice**: arbitrary infima and suprema exist. Explicitly:

$$\bigwedge_{i \in I} (A_i, B_i) = \Big( \bigcap_{i} A_i,\ \big( \bigcup_{i} B_i \big)'' \Big), \qquad \bigvee_{i \in I} (A_i, B_i) = \Big( \big( \bigcup_{i} A_i \big)'',\ \bigcap_{i} B_i \Big).$$

The infimum of a family of concepts is the concept whose extent is the intersection of the extents (no closure needed; intersections of extents are extents); the supremum requires the closure operator on the union. The two formulas are dual under context-duality.

The lattice has:

- A **bottom** $0_{\mathfrak{B}} = (\emptyset'', \emptyset' = M) = (\bigcap_{m \in M} \{m\}', M)$.
- A **top** $1_{\mathfrak{B}} = (G, G' = \bigcap_{g \in G} \{g\}')$.

## Embedding objects and attributes

Every object $g \in G$ embeds into $\mathfrak{B}(\mathbb{K})$ as the **object concept** $\gamma g := (\{g\}'', \{g\}')$ — the smallest concept whose extent contains $g$. Every attribute $m \in M$ embeds as the **attribute concept** $\mu m := (\{m\}', \{m\}'')$ — the largest concept whose intent contains $m$.

The maps $\gamma: G \to \mathfrak{B}(\mathbb{K})$ and $\mu: M \to \mathfrak{B}(\mathbb{K})$ satisfy: $\gamma g \le \mu m \iff g \, I \, m$. So the original incidence relation can be recovered from the concept lattice plus the embeddings; this is one direction of the basic theorem (per [basic-theorem-of-fca](../theorems/basic-theorem-of-fca.md)).

## Concept lattice as a structural invariant

The concept lattice is the FCA lineage's name for what the wider order-theoretic literature would call the *Dedekind–MacNeille completion* of the partially ordered set obtained from the incidence relation. The basic theorem of FCA says exactly this: every complete lattice is (up to isomorphism) the concept lattice of *some* formal context, and every formal context's concept lattice is a complete lattice.

This means concept lattices are precisely complete lattices, with no extra structure. The FCA lineage's contribution is not the lattice class itself (that was Birkhoff) but the *constructive* extraction from a context, the *Galois-connection* presentation of the closure operator, and the *propositional* content (per [implication-base](implication-base.md)) carried by the same context.

## Reading against the predicated framing

Per the companion subtheory's [concept-lattice-as-degenerate-fiber](../../predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md): the concept lattice is the substrate's settlement-fixed-point set when the predication-cell substrate is restricted to the trivial predicate `has-attribute`, the value-domain $\mathbf{L} = \mathbf{2}$, and the closure-rule system consisting of the two derivation rules. The lattice ordering is the substrate's specialisation ordering on fixed-points.
