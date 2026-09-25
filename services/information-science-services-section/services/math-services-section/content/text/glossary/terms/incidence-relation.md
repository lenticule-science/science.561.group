---

introduces: relation
description: "A relation between objects and attributes recording which objects have which attributes. The data of a formal context."
aliases: [incidence relation, incidence, cross table]
specialization: binary-relation
component-of: formal-context
date-created: 2026-03-31

type: relation
---

An incidence relation $I$ between a set of objects $G$ and a set of attributes $M$ records which objects have which attributes.

In the binary case, $I \subseteq G \times M$: either object $g$ has attribute $m$ or it does not. A checkmark in a spreadsheet cell. A key present or absent in a YAML frontmatter block.

In the many-valued case, $I: G \times M \to L$ for some value set $L$: each object-attribute pair carries a value from $L$. When $L$ is the four-valued [bilattice](./bilattice.md) $\{\bot, t, f, \top\}$, the incidence records the [epistemic state](../../../../../../content/text/glossary/terms/epistemic-state.md) of each assertion — unattested, affirmed, denied, or contested.

An incidence relation is the data of a [formal context](./formal-context.md) $(G, M, I)$. The [Galois connection](./galois-connection.md) derived from $I$ extracts the [concept lattice](./concept-lattice.md): the formal concepts and their hierarchy.

A [Chu space](./chu-space.md) (Pratt 1999) is a generalization: a triple $(A, r, X)$ where $r: A \times X \to L$ is the evaluation function. A formal context with incidence $I: G \times M \to L$ is a Chu space with $A = G$, $X = M$, $r = I$.

---

## Additional formulation

```yaml
---

introduces: relation
description: "A relation between objects and attributes recording which objects have which attributes. The data of a formal context."
aliases: [incidence relation, incidence, cross table]
specialization: binary-relation
component-of: formal-context
date-created: 2026-03-31
---
```

An incidence relation $I$ between a set of objects $G$ and a set of attributes $M$ records which objects have which attributes.

In the binary case, $I \subseteq G \times M$: either object $g$ has attribute $m$ or it does not. A checkmark in a spreadsheet cell. A key present or absent in a YAML frontmatter block.

In the many-valued case, $I: G \times M \to L$ for some value set $L$: each object-attribute pair carries a value from $L$. When $L$ is the four-valued [bilattice](../../algebra/terms/bilattice.md) $\{\bot, t, f, \top\}$, the incidence records the [epistemic state](../../../../../../content/text/glossary/terms/epistemic-state.md) of each assertion — unattested, affirmed, denied, or contested.

An incidence relation is the data of a [formal context](formal-context.md) $(G, M, I)$. The [Galois connection](galois-connection.md) derived from $I$ extracts the [concept lattice](concept-lattice.md): the formal concepts and their hierarchy.

A [Chu space](chu-space.md) (Pratt 1999) is a generalization: a triple $(A, r, X)$ where $r: A \times X \to L$ is the evaluation function. A formal context with incidence $I: G \times M \to L$ is a Chu space with $A = G$, $X = M$, $r = I$.

## Earlier material

An incidence relation $I$ between a set of objects $G$ and a set of attributes $M$ records which objects have which attributes.

In the binary case, $I \subseteq G \times M$: either object $g$ has attribute $m$ or it does not. A checkmark in a spreadsheet cell. A key present or absent in a YAML frontmatter block.

In the many-valued case, $I: G \times M \to L$ for some value set $L$: each object-attribute pair carries a value from $L$. When $L$ is the four-valued [bilattice](../../documents/articles/research/2026/07/31/algebra/terms/bilattice.md) ${\bot, t, f, \top\}$, the incidence records the [epistemic state](../../../../../../content/text/glossary/terms/epistemic-state.md) of each assertion — unattested, affirmed, denied, or contested.

An incidence relation is the data of a [formal context](../../documents/articles/research/2026/07/31/logic/terms/formal-context.md) $(G, M, I)$. The [Galois connection](galois-connection.md) derived from $I$ extracts the [concept lattice](concept-lattice.md): the formal concepts and their hierarchy.

A [Chu space](chu-space.md) (Pratt 1999) is a generalization: a triple $(A, r, X)$ where $r: A \times X \to L$ is the evaluation function. A formal context with incidence $I: G \times M \to L$ is a Chu space with $A = G$, $X = M$, $r = I$.
