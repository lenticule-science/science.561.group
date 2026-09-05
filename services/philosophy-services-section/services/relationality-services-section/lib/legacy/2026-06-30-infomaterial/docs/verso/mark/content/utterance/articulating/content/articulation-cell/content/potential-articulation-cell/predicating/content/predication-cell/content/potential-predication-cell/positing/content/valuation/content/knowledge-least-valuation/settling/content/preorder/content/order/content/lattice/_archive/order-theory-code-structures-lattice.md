---

introduces: algebraic-structure
description: "A partial order in which every pair of elements has a greatest lower bound (meet) and a least upper bound (join)."
aliases: [lattices]
specialization: partial-order
operations: meet, join
laws: commutativity, associativity, idempotence, absorption
variants: complete-lattice, bounded-lattice, distributive-lattice
date-created: 2025-12-26
date-modified: 2026-03-29
---

A lattice is a [partial order](./partial-order.md) in which every pair of elements has a [meet](../morphisms/meet.md) (greatest lower bound) and a [join](../morphisms/join.md) (least upper bound).

The meet $a \wedge b$ and join $a \vee b$ give the lattice two binary operations. These operations satisfy four laws: commutativity ($a \wedge b = b \wedge a$), associativity ($a \wedge (b \wedge c) = (a \wedge b) \wedge c$), idempotence ($a \wedge a = a$), and absorption ($a \wedge (a \vee b) = a$ and $a \vee (a \wedge b) = a$). Absorption is the law that ties meet and join together — it says that combining an element with something larger than it (via join) and then taking the meet recovers the original.

A lattice can equivalently be defined as a [set](../../sets/objects/set.md) with two binary operations satisfying these four laws, without reference to an underlying order. The order is recoverable: $a \leq b$ if and only if $a \wedge b = a$. The order-theoretic and algebraic definitions produce the same structure.

A lattice is **complete** if meets and joins exist for all subsets, not just pairs. A lattice is **bounded** if it has a top element $\top$ (join of everything) and a bottom element $\bot$ (meet of everything). Every complete lattice is bounded, since the join of the empty set is $\bot$ and the meet of the empty set is $\top$. A lattice is **distributive** if meet distributes over join: $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$.

A Heyting algebra is a bounded distributive lattice with an additional operation — the Heyting implication — satisfying the residuation law: $c \leq (a \to b)$ if and only if $c \wedge a \leq b$. Implication is right adjoint to meet. A Boolean algebra is a Heyting algebra where every element has a complement ($\neg\neg a = a$). Every Boolean algebra is a Heyting algebra. The converse is false — Heyting algebras allow a constructive logic where excluded middle does not hold.

The power [set](../../sets/objects/set.md) of any set, ordered by [inclusion](../../sets/objects/subset.md), is a complete Boolean algebra. The open sets of a topological space, ordered by inclusion, form a complete Heyting algebra that is generally not Boolean. These are the two most basic examples, and the gap between them — Boolean versus Heyting — is the gap between classical and constructive logic.
