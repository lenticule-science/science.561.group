---
name: together-either
type: concept
status: sketch
---

The binary operations on the field of recognition. **Together** is joint recognition of both operands (conjunction, meet, $\land$ or $\otimes$). **Either** is recognition of at least one operand (disjunction, join, $\lor$).

## Properties

- $\text{Together}(a, b)$ Includes $a$.
- $\text{Includes}(a, \text{Either}(a, b))$.
- $\text{Excludes}(a, b)$ iff $\text{Together}(a, b) = \bot$.
- **Together**: commutative, associative, monotone in both arguments.
- **Either**: commutative, associative.
- Together with $\top$ and $\bot$, they form a bounded distributive lattice — the Heyting pre-algebra of the recognition field. Categorically, the meet is a pullback and the join is the least upper bound in the subobject lattice.

This lattice is the ground for [Induces](induces.md) (implication via residuation).
