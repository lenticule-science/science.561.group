---
id: semigroup
description: "A magma with associativity — the minimal structure where expressions like a ∗ b ∗ c are unambiguous."
aliases: [semigroups]
extends: magma
axioms: associativity
extends-to: monoid
categorical-role: endomorphisms-without-identity
date-created: 2025-12-31
date-modified: 2026-03-29

---

A semigroup is a [magma](./magma.md) whose operation is associative: $(a \ast b) \ast c = a \ast (b \ast c)$ for all elements a, b, c. Associativity means that the order of performing operations does not matter — you can drop the parentheses. The expression $a \ast b \ast c$ is unambiguous.

Associativity is the first axiom that most of mathematics needs. Without it, even simple chains of operations become ambiguous — $(a \ast b) \ast c$ might differ from $a \ast (b \ast c)$, and you would need parentheses everywhere. With it, you can talk about "the product of a, b, and c" without specifying grouping.

A semigroup with an [identity element](./identity-element.md) is a [monoid](./monoid.md). A monoid with inverses is a [group](./group.md). The positive integers under addition form a semigroup but not a monoid, since 0 is excluded and there is no identity. The set of all strings over an alphabet under concatenation is a semigroup and a monoid, with the empty string as identity.

Semigroups are the minimal structure needed for sequential composition. In a [category](./category.md), the collection of endomorphisms of any object (morphisms from the object to itself) forms a monoid under composition. Forgetting the identity morphism leaves a semigroup. Associativity of composition is one of the two axioms of a category — it comes from the semigroup level of the algebraic hierarchy. The other axiom, the identity law, comes from the monoid level.
