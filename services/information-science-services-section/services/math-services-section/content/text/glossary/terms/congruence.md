---

introduces: relation
description: "An equivalence relation on an algebraic structure that respects the operations: equivalent inputs always produce equivalent outputs. The condition needed to form a well-defined quotient."
aliases: [ congruence, congruence relation, congruences, Congruence ]
specialization: equivalence-relation
enables: quotient
date-created: 2026-03-31

---

A congruence on an algebraic structure is an [equivalence relation](./equivalence-relation.md) that respects the operations: if $a \sim a'$ and $b \sim b'$, then $a \ast b \sim a' \ast b'$ for every operation $\ast$ in the structure.

This is the condition needed to form a well-defined [quotient](./quotient.md). Without it, the quotient's operations would depend on which representative you picked from each equivalence class — the result would change depending on your choice, which is not well-defined.

On a [group](./group.md), congruences correspond to normal [subgroups](./subgroup.md). On a [ring](./ring.md), to [ideals](./ideal.md). On a [lattice](./lattice.md), to lattice congruences (equivalence relations compatible with both [meet](./meet.md) and [join](./join.md)).

A [homomorphism](./homomorphism.md) $f: A \to B$ always induces a congruence on $A$: the relation $a \sim a'$ iff $f(a) = f(a')$. The first isomorphism theorem says $A$ modulo this congruence is isomorphic to the image of $f$. Every quotient arises from a homomorphism, and every homomorphism induces a quotient.

---

## Additional formulation

```yaml
---

introduces: relation
description: "An equivalence relation on an algebraic structure that respects the operations: equivalent inputs always produce equivalent outputs. The condition needed to form a well-defined quotient."
aliases: [congruence, congruence relation, congruences]
specialization: equivalence-relation
enables: quotient
date-created: 2026-03-31
---
```

A congruence on an algebraic structure is an [equivalence relation](equivalence-relation.md) that respects the operations: if $a \sim a'$ and $b \sim b'$, then $a \ast b \sim a' \ast b'$ for every operation $\ast$ in the structure.

This is the condition needed to form a well-defined [quotient](quotient.md). Without it, the quotient's operations would depend on which representative you picked from each equivalence class — the result would change depending on your choice, which is not well-defined.

On a [group](./group.md), congruences correspond to normal [subgroups](./subgroup.md). On a [ring](./ring.md), to [ideals](./ideal.md). On a [lattice](../../order/terms/lattice.md), to lattice congruences (equivalence relations compatible with both [meet](../../order/terms/meet.md) and [join](../../order/terms/join.md)).

A [homomorphism](./homomorphism.md) $f: A \to B$ always induces a congruence on $A$: the relation $a \sim a'$ iff $f(a) = f(a')$. The first isomorphism theorem says $A$ modulo this congruence is isomorphic to the image of $f$. Every quotient arises from a homomorphism, and every homomorphism induces a quotient.

## Earlier material

A congruence on an algebraic structure is an [equivalence relation](equivalence-relation.md) that respects the operations: if $a \sim a'$ and $b \sim b'$, then $a \ast b \sim a' \ast b'$ for every operation $\ast$ in the structure.

On a [group](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/algebra/objects/group.md), congruences correspond to normal [subgroups](subgroup.md). On a [ring](ring.md), to [ideals](ideal.md). On a [lattice](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/order/objects/lattice.md), to lattice congruences (equivalence relations compatible with both [meet](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/order/morphisms/meet.md) and [join](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/order/morphisms/join.md)).
