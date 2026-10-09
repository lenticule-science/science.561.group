---
type: reference
authors: [Abiteboul, Serge, Hull, Richard, Vianu, Victor]
year: 1995
title: "Foundations of Databases"
venue: "Addison-Wesley"
description: S.
---

## Full citation

S. Abiteboul, R. Hull, V. Vianu. *Foundations of Databases.* Addison-Wesley, Reading, MA, 1995.

## Status

Pending direct re-read; covered via standard secondary literature and the [knowledge-representation-survey](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-representation-survey.md).

## Annotation

The standard textbook on database theory. Comprehensive treatment of the relational model, relational calculus and algebra, dependency theory, query languages (SQL, conjunctive queries, Datalog), expressiveness hierarchies (FO, FO + transitive closure, Datalog, Datalog with negation, fixpoint logics), and the connection to descriptive complexity. The Datalog chapters are the canonical reference for the *fixpoint semantics of recursive rules over a relational extensional database*, including stratified and well-founded semantics for negation.

The predicated framing reads Datalog directly into the substrate: Datalog facts are predication-cells with value $\mathbf{t}$, Datalog rules are *closure rules* in the [closure-rule-language](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md), and the Datalog fixpoint is *predication-settling under a strict regime* (no negation) or *under a Scott-continuous regime* (stratified negation). The [closure-as-fitting-fixpoint](../../../glossary/concepts/closure-as-fitting-fixpoint.md) theorem subsumes Datalog as the special case where the value-domain is $\mathbf{2}$ (truth-only) rather than $\mathbf{2} \otimes \mathbf{2}$ (truth × evidence) and the closure operator is the *immediate-consequence operator* $T_P$.

The framing extends Datalog by separating the truth and evidence channels: a Datalog fact is *true* with no record of *who said so* or *how strongly*, whereas the bilattice-valued substrate carries both channels. This is the key step that makes [federate](../../../glossary/terms/federate.md) algebraically definable across discourse communities — Datalog's flat extensional database has no notion of source-specific evidence, so federation across databases can produce only union, not bilattice-valued aggregation.

## Where used

- [knowledge-representation-survey](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-representation-survey.md)
- [closure-as-fitting-fixpoint](../../../glossary/concepts/closure-as-fitting-fixpoint.md)
- [predication-logic-through-knowledge-systems](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/predication-logic-through-knowledge-systems.md)
