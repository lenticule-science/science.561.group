---
type: definition
class: substrate-entity
realizes: [closure-rule]
depends-on: [closure-rule, predication-graph-store]
see-also: [shape, repair-catalog]
---

# Closure-rule record

A **closure-rule record** is the substrate-entity formal definition of a [closure rule](teaching/explanations/closure-rule.md): the predication-graph entity whose predications declare a single rule's premise pattern, conclusion pattern, and engineering invariants. Per [self-representation](teaching/explanations/self-representation.md), every closure rule the substrate applies must exist as such a record; rules without records are out-of-band machinery the substrate cannot audit.

## Structural fields

A closure-rule record carries the following predications:

- **`id`** — a stable kebab-case identifier. The record's substrate identity.
- **`description`** — a one-line summary of the rule's role.
- **`premise`** — a predicate pattern: an entity reference (or set of entity references) declaring the predication structure that, when matched in the substrate, fires the rule. The premise is itself an entity (per [vocabulary completeness](teaching/explanations/vocabulary-completeness.md)) — typically a [shape](theories/agential-orchestration-platform/concepts/shape.md) entity describing the match.
- **`conclusion`** — a predication or predication-pattern declaring what the rule produces when fired. The conclusion may be a single new predication, an updated value at an existing predication, or a sequence of substrate operations.
- **`match-radius`** — an integer or symbolic bound declaring the maximum traversal depth from the matched entity that the premise inspects. Required for the [locality](teaching/explanations/wavefront.md) discipline; a rule with no declared match-radius is not admissible.
- **`fuel-cost`** — the rule's contribution to fuel consumption per application, declared in [fuel-bound](teaching/explanations/fuel-bound.md) units. Defaults to one per application but may be larger for rules whose body is non-trivial.
- **`witness-format`** — a reference to the [witness](teaching/explanations/witness.md) shape this rule's application produces. Required for replayability.
- **`repairs-cited`** — references to entries in the [repair-catalog](repair-catalog.md) the rule may invoke during application. A rule whose body invokes an undeclared repair is not admissible.
- **`version`** — the substrate-canonical hash of the record at its current state. The version uniquely identifies this version of the rule; rule edits produce new versions, with the old version remaining accessible in the [event log](event-log.md).

## Invariants

A closure-rule record MUST satisfy:

- **Vocabulary completeness.** Every predicate in the premise and conclusion has its own substrate entity (per [vocabulary completeness](teaching/explanations/vocabulary-completeness.md)).
- **Bounded match-radius.** The match-radius predication is finite. A rule with unbounded radius violates [locality](teaching/explanations/wavefront.md) and is rejected.
- **Cited-repairs declared.** Every repair the rule invokes has a corresponding entry in the repair-catalog at the substrate's current version.
- **Witness format derivable.** The witness format predication can be statically checked against the rule's conclusion to verify that a successful application's witness will conform.

## Operations

The substrate's operators on closure-rule records:

- *Edit.* Modifying a closure-rule record's predications produces a new version. The [event log](event-log.md) records the edit; the new version is what the substrate's [settle](../morphisms/settle.md)-style closure machinery applies on the next cycle.
- *Retire.* A rule is retired by inserting a `retired` predication; retired rules do not fire on subsequent cycles, but their record remains for audit.
- *Validate.* The substrate's validation machinery checks every closure-rule record against the invariants on insertion or edit; invariant violations are recorded as substrate-level coherence errors.

## Position in the substrate

The closure-rule record is the substrate's *self-defining unit*: every transformation the substrate performs is recorded as a closure-rule record, every record is itself substrate content, and editing the records is editing the substrate's own behavior. A predicated computer that admits closure rules as out-of-band code (rather than as records) loses the substrate's [self-representation](teaching/explanations/self-representation.md) discipline at exactly that boundary.
