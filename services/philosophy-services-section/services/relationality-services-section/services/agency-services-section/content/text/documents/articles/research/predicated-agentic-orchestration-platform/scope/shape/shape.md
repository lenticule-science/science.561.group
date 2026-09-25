---
type: concept
class: constraint
depends-on: [self-representation]
see-also: [skill, runbook, agent]
title: Shape
description: A predicate constraint represented as a predication-graph store entity.
---

# Shape

A predicate constraint represented as a [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) entity.
A shape entity carries predications declaring which predicate it targets, which entities it applies to, and what conditions an entity carrying that predicate must satisfy.
Shapes are the platform's mechanism for the substrate's *subobject-classifier* commitment — the the substrate's closure machinery condition that "the system contains an entity that classifies which sub-cells of the predication graph are admissible."

Three properties:

- **One shape per predicate.** Each predicate $p$ in the application's vocabulary has exactly one shape entity targeting it.
  The shape's predications describe what an entity carrying $p$ must (and may) carry alongside $p$.
  Multiple predicates on a single entity engage multiple shapes independently — there is no global "valid entity" status; only "valid for predicate $p_1$, valid for predicate $p_2$, ..." statuses.
- **Targeting is by predicate, not by class.** Shapes target the predicates an entity carries, not a declared class membership.
  Two entities carrying the same predicate are subject to the same shape regardless of what other predicates they carry; an entity carrying no predicates is subject to no shapes.
  This is the engineering content of the predication-substrate principle that *what an entity is* is determined by the predicates it participates in.
- **Shapes are entities.** Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), shapes are predication-graph entities.
  Editing a shape is editing predications.
  The system can validate shapes using shapes — the meta-shape that classifies "valid shape entity" is itself a shape, recursively.

A skill's preconditions and postconditions are typically expressed as shape predications: the skill is admissible only when the input entities satisfy the preconditions' shapes, and after invocation the output entities must satisfy the postconditions' shapes.
This is the engineering content of skills carrying *typed* signatures.

shapes were called *RelationalSystemShape* and were declared as the engineering presentation of `U_G` condition 5 (subobject classification).
The modern formulation makes the closure-rule-system connection explicit: shapes are the entities a particular family of closure rules consults to decide whether an insertion is admissible.
The corpus's [signature](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/signature.md) concept is the math-side counterpart.
