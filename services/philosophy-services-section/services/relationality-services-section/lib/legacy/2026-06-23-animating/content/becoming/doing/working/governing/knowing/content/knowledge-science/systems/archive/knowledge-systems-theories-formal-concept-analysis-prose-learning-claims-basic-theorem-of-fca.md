---
type: theorem
status: established
depends-on: [formal-context, concept-lattice, derivation-operator]
see-also: [duquenne-guigues-completeness, belohlavek-bridge]
references:
  - id: wille1982
    type: document
    title: Wille, Restructuring lattice theory: an approach based on hierarchies of concepts (1982)
  - id: ganter-wille1999
    type: document
    title: Ganter & Wille, Formal Concept Analysis: Mathematical Foundations (1999)
---

# The basic theorem of formal concept analysis

The structural theorem on which the FCA lineage rests. It characterises the concept lattices of formal contexts as exactly the complete lattices, and supplies the constructive correspondence in both directions.

## Statement

**Theorem (Wille 1982; Ganter & Wille 1999, Theorem 3).** Let $\mathbb{K} = (G, M, I)$ be a formal context. Then $\mathfrak{B}(\mathbb{K})$ is a complete lattice, and the maps $\gamma: G \to \mathfrak{B}(\mathbb{K})$, $\mu: M \to \mathfrak{B}(\mathbb{K})$ defined by

$$\gamma g := (\{g\}'', \{g\}'), \qquad \mu m := (\{m\}', \{m\}'')$$

satisfy:

1. $\gamma G$ is **supremum-dense** in $\mathfrak{B}(\mathbb{K})$ (every concept is a supremum of object concepts).
2. $\mu M$ is **infimum-dense** in $\mathfrak{B}(\mathbb{K})$ (every concept is an infimum of attribute concepts).
3. $\gamma g \le \mu m \iff g \, I \, m$.

Conversely, given any complete lattice $\mathbf{L}$ and maps $\tilde{\gamma}: G \to \mathbf{L}$, $\tilde{\mu}: M \to \mathbf{L}$ such that $\tilde{\gamma} G$ is supremum-dense, $\tilde{\mu} M$ is infimum-dense, and $\tilde{\gamma} g \le \tilde{\mu} m \iff g \, I \, m$, then $\mathbf{L} \cong \mathfrak{B}(\mathbb{K})$ via the unique isomorphism extending $\gamma g \mapsto \tilde{\gamma} g$ and $\mu m \mapsto \tilde{\mu} m$.

Equivalently: every complete lattice arises (up to isomorphism) as the concept lattice of some formal context.

## Proof sketch

**Concept lattice is complete.** Given a family $\{(A_i, B_i)\}_{i \in I}$ of concepts of $\mathbb{K}$, set $A = \bigcap_i A_i$. Then $A' = (\bigcap_i A_i)' \supseteq \bigcup_i A_i' = \bigcup_i B_i$, and in fact $A' = (\bigcup_i B_i)''$ (using the Galois closure). The pair $(A, A')$ is therefore a concept (since $A' = (\bigcup_i B_i)''$ is closed and $A'' = ((\bigcup_i B_i)'')' = \bigcap_i B_i' = \bigcap_i A_i = A$ by the Galois adjunction). It is the infimum of the family in the extent-inclusion order. Suprema are dual.

**Density.** For any concept $(A, B)$: the supremum $\bigvee_{g \in A} \gamma g$ has extent $(\bigcup_{g \in A} \{g\}'')'' = (\bigcup_{g \in A} \{g\}^{\uparrow\downarrow})'' \supseteq A$, and dually no larger; equality follows from the closure structure. So every concept is a supremum of object concepts. Infimum-density of $\mu M$ is dual.

**$\gamma g \le \mu m \iff g \, I \, m$.** $\gamma g \le \mu m$ iff $\{g\}'' \subseteq \{m\}'$ iff (since $g \in \{g\}''$) $g \in \{m\}'$ iff $g \, I \, m$.

**Converse.** Given $\mathbf{L}$, $\tilde{\gamma}$, $\tilde{\mu}$ satisfying the three conditions, the map $(A, B) \mapsto \bigvee_{g \in A} \tilde{\gamma}(g) \;( = \bigwedge_{m \in B} \tilde{\mu}(m))$ is a well-defined order-isomorphism $\mathfrak{B}(\mathbb{K}) \to \mathbf{L}$ (the equality of supremum and infimum follows from the density and incidence conditions).

## What the theorem buys

The basic theorem is the FCA lineage's central existence/uniqueness statement. Three operational consequences:

- **Concept lattices are exactly the complete lattices.** The class is closed under no further axioms; FCA does not give a proper subclass of complete lattices.
- **Every context has a canonical concept lattice; every complete lattice has many representing contexts.** The standard *clarified, reduced* representation (Ganter & Wille 1999, §1.2) is unique up to isomorphism for each finite complete lattice.
- **Constructing a concept lattice = constructing the closure operator.** Algorithms operate on the closure $({-})''$ and recover the lattice as the fixed-point set.

## Substrate reading

Read against the predicated framing: the basic theorem says the FCA-substrate's settlement under its single closure-rule system (the Galois-closure rule pair) produces a settlement-fixed-point set isomorphic to a complete lattice, and every complete lattice arises this way. The companion subtheory's [concept-lattice-as-degenerate-fiber](../../predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md) names this as the fixed-point structure of the trivial-vocabulary, $\mathbf{2}$-valued, Galois-only sub-substrate of the predication-cell.
