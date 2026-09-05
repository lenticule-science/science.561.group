---

introduces: property
description: "The property that grouping does not matter: (a · b) · c = a · (b · c). The first axiom of semigroups, monoids, groups, and categories."
aliases: [associativity, associative, associative law]
applies-to: binary-operation
required-by: [semigroup, monoid, group, category, residuated-lattice]
date-created: 2026-03-30
---

A [binary operation](../objects/binary-operation.md) $\ast$ is associative if grouping does not matter:

$$(a \ast b) \ast c = a \ast (b \ast c)$$

for all $a$, $b$, $c$. When an operation is associative, you can write $a \ast b \ast c$ without parentheses — the result is the same either way.

Addition is associative: $(2 + 3) + 4 = 2 + (3 + 4) = 9$. Function composition is associative: $(h \circ g) \circ f = h \circ (g \circ f)$. Subtraction is not: $(7 - 3) - 1 = 3$ but $7 - (3 - 1) = 5$.

Associativity is the first axiom of nearly every algebraic structure: [semigroups](../objects/semigroup.md), [monoids](../objects/monoid.md), [groups](../objects/group.md), [rings](../objects/ring.md), [categories](../../categories/theories/ordinary-categories/objects/category.md), [residuated lattices](../objects/residuated-lattice.md). It is what makes sequential combination well-defined — you can chain operations without ambiguity.
