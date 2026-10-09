---
type: concept
class: operator
depends-on: [predication-substrate]
see-also: [insertion, retraction, traversal, merge, operation]
---

# Operator

A transformation whose source and target are predication graphs — or regions thereof — rather than stored values. An operator on the predication substrate inherits the constraints any computing operator carries (effective computability, representability, typing) and adds a fourth: *substrate restriction*. The operator's source and target must be expressible as predication graphs; its action must decompose into a finite sequence of the three primitive forms.

In the [predication-fiber](predication-fiber.md) sense, a predicated-computing operator is a *predicate specialization* of the more general computing operator: the sub-support is exactly the cases where the operator's source and target are predication graphs (or regions thereof), and the values are the computing operator's values restricted to that sub-support. A computing operator that returns a stored value at a memory address has no image in the predicated-computing operator family — there are no stored values at addresses to return. A computing operator that transforms one predication graph into another inhabits both families, and its predicated-computing specialization is its action on predication-graph inputs.

The three primitive forms:

- **[Insertion](../morphisms/insertion.md)** — assert the predication $(s, p, o)$ to the graph at a value $v$ in the substrate's value-domain.
- **[Retraction](../morphisms/retraction.md)** — withdraw a predication, declared and witnessed; only admissible as part of a declared [repair](repair.md) or scope-bounded nucleus change.
- **[Traversal](../morphisms/traversal.md)** — enumerate the predications incident to a given entity under a given predicate.

Higher-level operators are compositions of these. A query is a structured traversal; a graph rewrite is a sequence of retractions and insertions; a [closure-rule application](../morphisms/closure-rule-application.md) is a localized read-and-assert under a single rule; a [merge](../morphisms/merge.md) is the cellwise join of two stores' values followed by re-settling.

Operators on a value-domain that admits monotone advance (where each predication's value can be raised toward a fixed-point) inherit the substrate's monotonicity discipline: insertion at an existing predication produces the join of the old and new values; retraction is the only operator that lowers a value, and retraction's discipline (declared, witnessed, scope-bounded) is what protects the monotonicity guarantee the substrate rests on for replayability and federation.

The distinction between *operator* (this concept) and [operation](operation.md) (a substrate entity recording a generative endofunction) is structural: operators are the primitive moves the substrate offers; operations are the entities that *describe* applications of operators or compositions thereof. The substrate's primitive operators are the irreducible vocabulary; operations declared in the substrate compose those primitives into named procedures the substrate can cite, audit, and modify through its own operators.
