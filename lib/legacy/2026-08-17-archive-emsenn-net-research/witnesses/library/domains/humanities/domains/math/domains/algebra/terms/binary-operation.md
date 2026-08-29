---

description: "A function that takes two elements of a set and produces a third element of the same set. Addition, multiplication, meet, join, and composition are all binary operations."
defines: binary-operation
aliases: [binary operation, binary operations]
specialization: function
examples: [addition, multiplication, meet, join, composition]
date-created: 2026-03-30
---

A binary operation on a set $S$ is a [function](../../../terms/function.md) $\ast: S \times S \to S$ — it takes two elements of $S$ and produces another element of $S$.

Addition on integers: $3 + 5 = 8$. All three are integers. Multiplication: $3 \times 5 = 15$. [Meet](../../order/terms/meet.md) on a lattice: $a \wedge b$ is in the lattice. [Composition](../../categories/domains/ordinary-categories/terms/composition.md) of morphisms: $g \circ f$ is a morphism.

A binary operation can have properties:
- [Associative](./associativity.md): $(a \ast b) \ast c = a \ast (b \ast c)$. Grouping does not matter.
- [Commutative](./commutativity.md): $a \ast b = b \ast a$. Order does not matter.
- [Idempotent](./idempotence.md): $a \ast a = a$. Doing it twice is the same as doing it once.
- Has an [identity](./identity-element.md): there exists $e$ with $e \ast a = a \ast e = a$.

A set with an associative binary operation is a [semigroup](./semigroup.md). Add an identity and it is a [monoid](./monoid.md). Add inverses and it is a [group](./group.md). Add a second operation with distributivity and it is a [ring](./ring.md). These algebraic structures are all built by adding conditions to binary operations.
