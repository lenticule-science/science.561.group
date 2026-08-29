---
introduces: relation
description: "A subset of the Cartesian product of two sets — a collection of ordered pairs specifying which elements of one set are related to which elements of another."
defines: binary-relation
aliases: [relation]
between: set, set
made-of: ordered-pair
generalizes: function
properties: reflexive, symmetric, antisymmetric, transitive
composes-with: binary-relation
characterizes-via: subobject-classifier
date-created: 2026-03-29
id: binary-relation
specializes-to: function, equivalence-relation, partial-order
type: term

---

A binary relation from a [set](./set.md) A to a [set](./set.md) B is a [subset](./subset.md) $R \subseteq A \times B$. It is a collection of [ordered pairs](./ordered-pair.md) $(a, b)$ where $a \in A$ and $b \in B$. When $(a, b) \in R$, we say a is related to b by R, written $a \mathrel{R} b$.

A relation is more general than a [function](./function.md). A [function](./function.md) requires that each [element](./element.md) of A appears in exactly one pair. A relation has no such constraint. An [element](./element.md) of A may be related to many [elements](./element.md) of B, to one, or to none. An [element](./element.md) of B may be related to by many [elements](./element.md) of A, one, or none.

A relation on a single set — a [subset](./subset.md) $R \subseteq A \times A$ — is called a relation on A. Relations on a single set can have properties that relations between two different sets cannot:

- [**Reflexive**](./reflexive.md): every element is related to itself. $\forall a \in A : a \mathrel{R} a$.
- **Symmetric**: if a is related to b then b is related to a. $a \mathrel{R} b \Rightarrow b \mathrel{R} a$.
- [**Antisymmetric**](./antisymmetric.md): if a is related to b and b is related to a, then they are the same. $a \mathrel{R} b \wedge b \mathrel{R} a \Rightarrow a = b$.
- [**Transitive**](./transitive.md): if a is related to b and b is related to c, then a is related to c. $a \mathrel{R} b \wedge b \mathrel{R} c \Rightarrow a \mathrel{R} c$.

These properties combine into named structures. A relation that is [reflexive](./reflexive.md), symmetric, and [transitive](./transitive.md) is an equivalence relation — it partitions A into classes of equivalent elements. A relation that is [reflexive](./reflexive.md), [antisymmetric](./antisymmetric.md), and [transitive](./transitive.md) is a [partial order](./partial-order.md).

The identity relation on A is $\{(a, a) : a \in A\}$ — every element related only to itself. The empty relation is $\emptyset$ — no element related to any other. The total relation is $A \times A$ — every element related to every other.

Relations compose. If $R \subseteq A \times B$ and $S \subseteq B \times C$, the composition $S \circ R \subseteq A \times C$ contains $(a, c)$ whenever there exists $b \in B$ with $(a, b) \in R$ and $(b, c) \in S$. Composition is associative. The identity relation is neutral under composition.

In the category Set, a relation from A to B is equivalently a [function](./function.md) $A \times B \to \{0, 1\}$ — a characteristic function that says yes or no for each pair. In a topos, this generalizes: a relation is a morphism $A \times B \to \Omega$ into the subobject classifier, where $\Omega$ may have more truth values than just true and false.
