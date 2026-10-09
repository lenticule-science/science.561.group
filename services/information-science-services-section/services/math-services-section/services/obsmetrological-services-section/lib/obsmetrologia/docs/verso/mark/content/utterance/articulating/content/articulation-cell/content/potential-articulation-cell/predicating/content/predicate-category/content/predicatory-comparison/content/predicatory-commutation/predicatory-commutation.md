---
type: concept
class: equation
depends-on: [predicatory-comparison, predication-valuation]
see-also: [commutation-defect, positing-morphism, closure-operator, positing-naturality, projection-merge-naturality]
---

# Predicatory commutation

**Predicatory commutation** is the assertion that two predication-categorical operations produce the same valuation or settling when composed in either order:

$$F \circ G = G \circ F.$$

This is the ordinary categorical notion of a commuting diagram, following the formal baseline of [@maclane1971]: composites with common source and target are equal.
What makes the notion predicatory is the kind of equality being checked.
For strict operational commutation, equality is equality of resulting valuations.
For relaxed comparison, one may instead compute the [commutation defect](../morphisms/commutation-defect.md), a bilattice-valued profile of where the two composites disagree.

Several existing PredCat theorems are commutation claims:

- [positing naturality](../theorems/positing-naturality.md) says positing commutes with predicate-category reindexing in the typed way;
- [projection-merge naturality](../theorems/projection-merge-naturality.md) says projection commutes with knowledge-join merge under per-atom admission predicates;
- closure generally does **not** commute with positing, because positing before closure may derive downstream consequences that closure-before-positing cannot see.

Commutation is therefore a calculator primitive: given two operations, compute whether the square commutes strictly; if not, compute the defect.
