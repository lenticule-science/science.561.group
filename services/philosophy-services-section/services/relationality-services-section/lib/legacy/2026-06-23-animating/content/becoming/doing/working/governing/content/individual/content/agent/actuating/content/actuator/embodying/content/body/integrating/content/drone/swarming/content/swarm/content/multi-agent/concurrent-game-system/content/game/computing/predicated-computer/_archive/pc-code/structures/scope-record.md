---
type: definition
class: substrate-entity
realizes: [scope]
depends-on: [scope, closure-conditions]
see-also: [application-sublocale, locale]
---

# Scope record

A **scope record** is the substrate-entity formal definition of a [scope](teaching/explanations/scope.md): the predication-graph entity declaring a bounded sub-region of a [predicated computer](predicated-computer.md), its predicate vocabulary, its admissible closure rules, its parent and child scope relationships, and its development stage.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`vocabulary`** — references to predicate entities admissible within the scope. Predications carrying out-of-vocabulary predicates are not visible at this scope.
- **`closure-rule-subset`** — references to [closure-rule records](closure-rule-record.md) admissible within the scope. The substrate's [settle](../morphisms/settle.md) on this scope applies only the cited rules; out-of-subset rules from the wider substrate do not fire here.
- **`shape-catalog`** — references to [shape records](theories/agential-orchestration-platform/objects/shape-record.md) classifying entities visible at this scope.
- **`repair-catalog`** — reference to the [repair-catalog](repair-catalog.md) applicable within the scope.
- **`parent-scope`** — optional reference to the containing scope, if any. The root scope of a substrate has no parent.
- **`child-scopes`** — references to scopes nested within this one.
- **`completion-stage`** — declaration of which [closure conditions](teaching/explanations/closure-conditions.md) the scope has satisfied: `bare`, `composable-structure`, `constraint-equipped`, `self-generating`, or `closed`. Per [closure-conditions](teaching/explanations/closure-conditions.md) stages.
- **`topology`** — declarations of placement and coverage constraints (per [topology](teaching/explanations/topology.md)) — which substrate instances host the scope, what coverage requirements its content has across regions.
- **`closure-kind`** — `scope`.

## Invariants

- **Vocabulary-complete.** Every cited predicate is itself a substrate entity (per [vocabulary completeness](teaching/explanations/vocabulary-completeness.md)). A scope citing undefined predicates is incomplete.
- **Closure-rule-subset coherent.** Every cited closure rule is admissible: its premise predicates are in the scope's vocabulary; its conclusion predicates are too.
- **Parent-child consistency.** A child scope's vocabulary is typically a subset (or a vocabulary intersection) of its parent's, with declared additions; circular parent-child relationships are violations.
- **Completion-stage matches structure.** A scope claiming `closed` must satisfy all seven closure conditions; a scope claiming `self-generating` must satisfy conditions 1-6. The substrate's validation can check the claim against the scope's structural content.

## Operations

- *Create.* Inserting a new scope record establishes the scope. Creation typically follows a [governance-decision](theories/agential-orchestration-platform/morphisms/governance-decision.md) when the scope hosts agential operations.
- *Equip.* As the scope advances through completion stages, additional structure is added (vocabulary, closure rules, shapes) by editing the scope record. Each edit produces a witness; the substrate can show the scope's growth history.
- *Open.* Equipping a scope to the [locale](locale.md) stage activates it for live operations (sessions can be opened, [inboxes](theories/agential-orchestration-platform/objects/inbox-record.md) can receive, settling can run).
- *Federate.* Cross-scope or cross-substrate operations cite the scope-record's federation-graph predications; per [federation](theories/agential-orchestration-platform/concepts/federation.md), the scope is the federation's discriminator.
- *Retire.* A scope can be [retired](../morphisms/retire.md) when its purpose ends; the retirement preserves the scope's content for audit while preventing new operations.

## Position in the substrate

Scope records are the substrate's *bounded-region declarations*: where the substrate's content is partitioned into named, vocabulary-typed, governance-recognized regions. Without scope records, scope is implicit (encoded in directory structures, in code-level parameters, in conventions); with them, scope is substrate content, queryable and modifiable through the substrate's operators.

A substrate may have a single root scope or many. The development arc of a scope (bare → composable → constraint-equipped → self-generating → closed) is a substrate-recorded progression: each stage transition is an event in the [event log](event-log.md), each edit to the scope record is witnessed.
