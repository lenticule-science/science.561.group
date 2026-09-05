---
type: concept
class: principle
depends-on: [predication-substrate, closure-conditions, identity-by-relations]
see-also: [vocabulary-completeness, operation]
---

# Self-representation

The principle that every operative element of the predicated computer is itself an entity in the same substrate the operative elements act on. There is no privileged engine, registry, or runtime that lives outside the substrate; the machinery is *in* the substrate. The principle is the substrate-level statement of the [closure-conditions](closure-conditions.md)' procedure-closure (condition 6) and reference-closure (condition 4) commitments: operations that act on the substrate are entities in it, and other entities can refer to them.

Three concrete consequences:

- **Closure rules are entities.** A closure rule's premise pattern, conclusion pattern, and declared invariants are predications on a closure-rule entity. A query for "what closure rules apply at this predicate" is a substrate traversal, not a call into a privileged registry. Editing a closure rule is editing predications; the edit produces an event in the [event log](../objects/event-log.md) like any other mutation.
- **Shapes are entities.** A constraint shape's targeted predicate, admissible values, and severity are predications on a shape entity. Validating an entity against the shapes that apply to it is a substrate traversal: the shapes are reached by following the targeting predicate. Adding a shape is a substrate-level edit, not a deployment.
- **Operations are entities.** The specification of every [operation](operation.md) — its inputs, its outputs, its body, its witness format — is a substrate entity. Two implementations of the substrate that disagree on what an operation does disagree about the content of a specific substrate entity; the disagreement is checkable through the substrate's own operators.

The principle is what makes the substrate *its own metalanguage*. There is no compilation step that turns specifications into a different format the engine consumes; the engine reads the specifications by substrate traversal, the same way it reads any other content. The principle is also what makes [vocabulary completeness](vocabulary-completeness.md) operationally meaningful: every predicate in use refers to a substrate entity that defines it.

Self-representation is the substrate-level discipline. The [agential-orchestration-platform](theories/agential-orchestration-platform/) subtheory commits to a strictly stronger discipline — *agential* self-generation — in which the agents themselves and the skills they invoke are also substrate entities, beyond just the substrate-level closure rules. The substrate-level discipline says "the engine is in the substrate"; the agential-level discipline says "the agents are too."
