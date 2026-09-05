---
type: concept
class: rule
depends-on: [operator, predication-substrate]
see-also: [closure-conditions, settling-as-computation]
---

# Closure rule

A unit of inference applied to the predication substrate: a stated condition under which one or more existing predications entail the existence (or value-upgrade) of another. A closure rule has a *premise* — a pattern of predications — and a *conclusion* — a predication that follows from the premise being matched. Whenever the premise pattern is found in the substrate, the rule's [application](../morphisms/closure-rule-application.md) inserts (or raises, in the substrate's value-domain) the conclusion.

In the math reformulation, this is the [closure rule](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) of [predication categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md): a syntactic generator of a [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) on a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). The rule schema is a positive $\Pi_1$ antecedent over the predication state implying a [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) lower-bound on a target [predication cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md). The substrate's running [closure-rule system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) is the family of admissible such generators, and the operator they collectively generate is what the substrate's settlement applies.

Three engineering disciplines characterize an admissible closure rule:

- **First-class.** The rule is itself a substrate entity, per [self-representation](self-representation.md). Its premise pattern, conclusion pattern, and any declared invariants are predications on the closure-rule entity. A query for "what closure rules apply at this predicate" is a substrate traversal, not a call into a privileged registry.
- **Deterministic match-and-conclude.** Given the same substrate state, the rule's premise either matches (with the same matched predications in the same order) or does not match. A rule whose match depends on host-side iteration order, hash-table traversal order, or other ambient state is not admissible — it makes closure runs non-replayable.
- **Bounded match radius.** The rule's premise is checked against predications at a finite, declared distance from any starting entity. A rule whose match radius cannot be bounded violates the substrate's locality property: its application reads the global graph rather than a bounded region. The substrate rejects unbounded-radius rules.

A closure rule is a unit at the *single-inference* scale — one premise pattern, one conclusion. The set of closure rules a substrate carries together with its declared repair catalog and its witness format determines what the substrate's closure machinery actually does. Different choices of rule set produce different substrates with different convergence behaviors; the [closure-conditions](closure-conditions.md) characterize what *kind* of closure machinery a complete sub-region must have, but the specific rule set is a design choice for a particular substrate.

A closure rule's match is *local*; the cumulative effect of iterated rule application is *global*. This is the engineering content of [the wavefront](wavefront.md) — the pattern by which closure-rule application at one entity propagates to neighbors.
