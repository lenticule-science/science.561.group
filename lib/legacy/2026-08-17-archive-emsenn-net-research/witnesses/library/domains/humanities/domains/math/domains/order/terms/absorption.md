---

introduces: property
description: "The lattice law tying meet and join together: a ∧ (a ∨ b) = a and a ∨ (a ∧ b) = a. Combining with something larger and then taking the smaller recovers the original."
aliases: [absorption, absorption law, absorption laws]
applies-to: lattice
date-created: 2026-03-30
---

The absorption laws are the two identities that tie [meet](./meet.md) and [join](./join.md) together in a [lattice](./lattice.md):

$$a \wedge (a \vee b) = a \qquad a \vee (a \wedge b) = a$$

The first says: joining $a$ with $b$ gives something at least as large as $a$, and meeting that with $a$ recovers $a$. The second says: meeting $a$ with $b$ gives something at most as large as $a$, and joining that with $a$ recovers $a$.

Absorption is what makes a lattice a lattice rather than just a set with two unrelated operations. Without absorption, meet and join could behave independently. Absorption forces them to interact: each operation partially undoes the other.

A lattice can be defined equivalently as a set with two binary operations satisfying [commutativity](../../algebra/terms/commutativity.md), [associativity](../../algebra/terms/associativity.md), [idempotence](../../algebra/terms/idempotence.md), and absorption. The [partial order](./partial-order.md) is then recoverable: $a \leq b$ iff $a \wedge b = a$.
