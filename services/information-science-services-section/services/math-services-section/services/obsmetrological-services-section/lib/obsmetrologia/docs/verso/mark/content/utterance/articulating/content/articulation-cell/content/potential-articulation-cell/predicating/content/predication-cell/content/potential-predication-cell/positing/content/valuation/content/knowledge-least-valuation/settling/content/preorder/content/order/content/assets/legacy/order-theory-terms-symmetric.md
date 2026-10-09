---
id: symmetric
description: "A property of a binary relation: if a is related to b, then b is related to a."
aliases: [symmetry]
property-of: binary-relation
combined-with-reflexive-and-transitive: equivalence-relation
contrasts-with: antisymmetric
date-created: 2026-03-29
---

A [binary relation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/binary-relation.md) R on a [set](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/set.md) S is symmetric if the relation goes both ways: for all $a, b \in S$, if $a \mathrel{R} b$ then $b \mathrel{R} a$. The direction of the pair does not matter. If a is related to b, b is related to a.

Symmetry says: the relation treats both sides equally. Equality is symmetric — if $a = b$ then $b = a$. "Is a sibling of" is symmetric. "Is less than" is not: $3 < 5$ does not give $5 < 3$.

Symmetry contrasts with [antisymmetry](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/antisymmetric.md). Antisymmetry says: if the relation goes both ways, the elements must be the same. Symmetry says: the relation always goes both ways. A relation cannot be both symmetric and antisymmetric unless it only relates elements to themselves — the identity relation is the only relation that is both.

Symmetry combines with other properties to define named structures. A relation that is [reflexive](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/reflexive.md), symmetric, and [transitive](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/transitive.md) is an equivalence relation — it partitions the set into classes where every element within a class is related to every other. A relation that is [reflexive](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/reflexive.md) and symmetric but not necessarily [transitive](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/transitive.md) is a tolerance relation — it expresses similarity without requiring that similarity chains.

In a [category](../../categories/domains/ordinary-categories/terms/category.md), symmetry corresponds to the existence of inverses for every morphism. A category where every morphism is invertible is a groupoid. In a [partial order](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/partial-order.md) viewed as a category, symmetry would force every morphism to be an isomorphism, collapsing the ordering to equality — which is why partial orders require antisymmetry rather than symmetry.
