---
type: definition
class: substrate-entity
realizes: [skill]
depends-on: [skill, agential-self-generation]
see-also: [runbook-record, shape-record]
title: Skill record
description: "A skill record is the substrate-entity formal definition of a skill: the predication-graph entity whose predications declare a single skill's name, body, preconditions, postconditions, and witness format."
---

# Skill record

A **skill record** is the substrate-entity formal definition of a [skill](teaching/explanations/skill.md): the predication-graph entity whose predications declare a single skill's name, body, preconditions, postconditions, and witness format.
Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), every skill the platform invokes must exist as a record; a skill that lives only in code outside the substrate is a substrate gap.

## Structural fields

- **`id`** — kebab-case identifier; the skill's substrate identity.
- **`description`** — one-line summary.
- **`closure-kind`** — the [operation kind](../../operation-kinds/operation-kinds.md) the skill performs (observation, guard, accounting, query, mutation, analysis, learning).
  Per [identity by relations](../../teaching/explanations/identity-by-relations.md), this predication is what makes the entity a skill — the presence of `closure-kind` IS the skill.
- **`domain`** — the kinds of substrate entities the skill takes as input.
  Either a [shape](../../scope/shape/shape-record/shape-record.md) reference or an enumerated entity-set.
- **`codomain`** — the kinds of substrate entities the skill produces.
  Either a shape reference or an enumerated entity-set.
- **`preconditions`** — references to shape entities that the input must satisfy for invocation to be admissible.
- **`postconditions`** — references to shape entities that the output must satisfy after successful invocation.
- **`body`** — a reference to the skill's executable substrate (a [runbook](runbook-record.md), a script, a sequence of [closure-rule applications](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), or an inference-bearing operator declaration).
  The body is itself substrate content.
- **`witness-format`** — a reference to the [witness](../../teaching/explanations/witness.md) shape the skill produces.
- **`scope`** — references to the [scopes](../../scope/scope.md) within which the skill is admissible.
- **`required-powers`** — the [powers](teaching/explanations/power.md) an invoking [agent](teaching/explanations/agent.md) must hold to admissibly invoke the skill.

## Invariants

- **One nuclear-quartet position.** The skill occupies exactly one `closure-kind` value: observation, guard, accounting, query, mutation, analysis, or learning.
  A skill that crosses kinds is two skills.
- **Vocabulary-complete.** Every predicate appearing in domain, codomain, preconditions, or postconditions has its own substrate entity.
- **Body is substrate content.** The body reference resolves to a substrate entity, not to external code.
  Implementations that use external code wrap it in a body-entity stub recording its substrate-visible interface.
- **Required-powers existant.** Every cited power has a substrate entity in the [authorization](../../governance/authorization/authorization.md) catalog applicable to the skill's scopes.

## Operations

The substrate operations on skill records:

- *Invoke.* The [skill-invocation](../skill-invocation/skill-invocation.md) operator reads the record, checks the agent's powers against `required-powers`, validates inputs against `preconditions`, executes the body, validates outputs against `postconditions`, and emits a witness against `witness-format`.
- *Edit.* Modifying a skill record produces a new version; the [event log](../../../objects/event-log.md) records the edit.
  Future invocations use the new version; replays of past invocations use the version active at the time of invocation.
- *Audit.* A query for "what skills can be invoked at this scope?" or "which skills cite this shape?" is a substrate traversal of skill records.

## Position in the platform

A skill record is the substrate-recorded contract: an invocation is admissible iff the agent's authorization, the input, and the substrate state satisfy what the record declares.
There is no separate skill-runtime that consults configuration; the skill's contract IS the substrate content.
Editing the skill is editing predications; the platform's behavior changes on the next invocation, recorded in the event log, replayable like any other substrate edit.
