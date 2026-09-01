---
type: reference
authors: [Brachman, Ronald J., Levesque, Hector J.]
year: 2004
title: "Knowledge Representation and Reasoning"
venue: "Morgan Kaufmann"
---

## Full citation

R. J. Brachman and H. J. Levesque. *Knowledge Representation and Reasoning.* Morgan Kaufmann, San Francisco, 2004.

## Status

Pending direct re-read; covered via standard secondary literature and the [knowledge-representation-survey](../texts/knowledge-representation-survey.md).

## Annotation

The standard textbook on knowledge representation and reasoning. Organises the field around the *knowledge-level / symbol-level* distinction (Newell), the *epistemic adequacy* of a representation (does it support the inferences a competent agent should make?), and the trade-off between *expressivity* and *tractability* that defines the description-logic family. Chapters cover propositional and first-order logic, frames and inheritance, description logics, default reasoning, and the situation calculus.

The predicated framing reads Brachman and Levesque's expressivity–tractability trade-off as the *closure-regime choice*: a strict-regime closure-rule system is tractable (terminates in polynomial steps, like Datalog or $\mathcal{EL}$) but inexpressive; a Scott-continuous regime is more expressive (handles recursive rules, fixed-point semantics) but requires fixpoint computation; a transfinite-bounded regime is more expressive still but may not terminate; the aperiodic regime is the most expressive and the least decidable. The [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) theorem makes the trade-off structural: the choice of closure regime is the structural choice between epistemic adequacy and computational tractability.

The framing extends Brachman and Levesque by insisting that *knowledge representation is not the same as knowledge organisation*: KR provides the substrate (the predication-cell, the bilattice, the closure-rule language); KO provides the *content* (the predicate vocabulary, the discipline-specific facets, the discourse-community fibers). The split is what lets the substrate be re-used across radically different KO traditions.

## Where used

- [knowledge-representation-survey](../texts/knowledge-representation-survey.md)
- [four-group-register-as-regime](../theorems/four-group-register-as-regime.md)
- [closure-as-fitting-fixpoint](../theorems/closure-as-fitting-fixpoint.md)
