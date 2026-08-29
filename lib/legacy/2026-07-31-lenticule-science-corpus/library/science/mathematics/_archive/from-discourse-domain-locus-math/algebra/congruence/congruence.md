---

introduces: relation
description: "An equivalence relation on an algebraic structure that respects the operations: equivalent inputs always produce equivalent outputs. The condition needed to form a well-defined quotient."
defines: congruence
aliases: [congruence, congruence relation, congruences]
specialization: equivalence-relation
enables: quotient
date-created: 2026-03-31
---

A congruence on an algebraic structure is an [equivalence relation](../../sets/objects/equivalence-relation.md) that respects the operations: if $a \sim a'$ and $b \sim b'$, then $a \ast b \sim a' \ast b'$ for every operation $\ast$ in the structure.

This is the condition needed to form a well-defined [quotient](./quotient.md). Without it, the quotient's operations would depend on which representative you picked from each equivalence class — the result would change depending on your choice, which is not well-defined.

On a [group](../objects/group.md), congruences correspond to normal [subgroups](../objects/subgroup.md). On a [ring](../objects/ring.md), to [ideals](../objects/ideal.md). On a [lattice](../../order/objects/lattice.md), to lattice congruences (equivalence relations compatible with both [meet](../../order/morphisms/meet.md) and [join](../../order/morphisms/join.md)).

A [homomorphism](../morphisms/homomorphism.md) $f: A \to B$ always induces a congruence on $A$: the relation $a \sim a'$ iff $f(a) = f(a')$. The first isomorphism theorem says $A$ modulo this congruence is isomorphic to the image of $f$. Every quotient arises from a homomorphism, and every homomorphism induces a quotient.
