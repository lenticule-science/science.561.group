---

introduces: algebraic-structure
description: "The complete lattice of formal concepts arising from a formal context — the central structure of formal concept analysis."
defines: concept-lattice
aliases: [concept lattices, Galois lattice]
specialization: complete-lattice
produced-by: [formal-context, galois-connection]
made-of: [formal-concept, extent, intent]
ordered-by: extent-inclusion
provides-complete-semantics-for: lambek-calculus
inherits-residuation-from: residuated-lattice
many-valued-generalization: belohlavek-2004
syntactic-version: wurm-2012
acts-on: formal-context
method: formal-concept-analysis
introduced-by: ganter-wille-1999
dual: priestley-duality
date-created: 2026-03-30
type: term

---

A concept [lattice](./lattice.md) is the complete lattice of formal concepts arising from a formal context.

A **formal context** (Ganter & Wille 1999) is a triple $(G, M, I)$ where $G$ is a set of objects, $M$ is a set of attributes, and $I \subseteq G \times M$ is an incidence relation ($I(g, m)$ holds when object $g$ has attribute $m$). Derivation operators define a Galois connection:

$$A' = \{m \in M : \forall g \in A,\ I(g, m)\} \qquad B' = \{g \in G : \forall m \in B,\ I(g, m)\}$$

$A'$ gives the attributes shared by all objects in $A$. $B'$ gives the objects sharing all attributes in $B$. A **formal concept** is a pair $(A, B)$ with $A' = B$ and $B' = A$. The set $A$ is the **extent** (the objects falling under the concept) and $B$ is the **intent** (the attributes defining the concept).

The set of all formal concepts, ordered by extent inclusion, forms a complete lattice — the concept lattice $\mathfrak{B}(G, M, I)$.

Belohlavek (2004) generalized: when $I: G \times M \to L$ for a complete [residuated lattice](./residuated-lattice.md) $L$, the Galois connection uses $L$'s residual implication and the concept lattice inherits $L$'s residuated structure.

Wurm (2012) proved that concept lattices arising from distributional data over formal languages are residuated lattices giving complete semantics for the [Lambek calculus](./lambek-calculus.md).

Pratt (1999) proved a formal context is a Chu space over $\{0,1\}$. Many-valued formal contexts are Chu spaces over the value set.

A collection of key-value records sharing attribute names is a formal context: the records are objects, the attribute names are the attributes, and the values give the incidence. The concept lattice of this context organizes the records by shared structure.
