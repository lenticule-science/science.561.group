---
type: definition
class: substrate-entity
realizes: [settlement-path]
depends-on: [office-record, runbook-record]
see-also: [idea-record, runbook-record]
title: Plan record
description: "A plan record is the substrate-entity formal definition of an item of committed-but-unexecuted work: a piece of work the platform has decided to perform but has not yet performed."
---

# Plan record

A **plan record** is the substrate-entity formal definition of an item of *committed-but-unexecuted work*: a piece of work the platform has decided to perform but has not yet performed.
Plans sit between [idea-records](../../memory/idea-record/idea-record.md) (uncommitted possibilities) and [runbook-records](runbook-record.md) (executable procedures): a plan declares what will be done; a runbook declares how to do it; an execution-record records that it was done.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of what the plan accomplishes.
- **`goal`** — predications declaring the plan's intended outcome: which substrate state the plan aims to reach, what predications will be inserted or modified.
- **`definition-of-done`** — predications declaring how to recognize the plan's completion: the substrate state, validation, or witness chain that constitutes "this plan is done."
- **`scope`** — reference to the [scope](../../scope/scope.md) the plan operates within.
- **`assigned-to`** — references to the [office-record](office-record.md) (or specific [agent-record](agent-record.md)) responsible for executing the plan.
- **`depends-on`** — references to other plan records that must be completed before this plan can begin.
  The substrate's scheduling consults these.
- **`runbook`** — optional reference to the [runbook-record](runbook-record.md) that executes the plan.
  A plan without a runbook is not yet executable; producing the runbook is part of the plan's elaboration.
- **`status`** — declarations of where the plan stands: `proposed`, `committed`, `in-progress`, `completed`, `abandoned`.
  Status transitions are substrate events.
- **`promoted-from`** — optional reference to the [idea-record](../../memory/idea-record/idea-record.md) the plan was promoted from.
  Per [promote](../../office/promote/promote.md), the citation preserves the provenance.
- **`closure-kind`** — `plan`.

## Invariants

- **Goal substrate-statable.** The goal predications must be substrate-resident; a goal that cannot be expressed as substrate content is unenforceable.
- **Definition-of-done checkable.** The definition-of-done is a predicate the substrate can evaluate; without it, completion is undetermined.
- **Status-transitions ordered.** Status moves forward through the sequence (proposed → committed → in-progress → completed); back-transitions or skips require governance discipline.
- **Substrate-resident.** Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the plan is queryable through substrate operators.

## Operations

- *Propose.* A new plan-record is created with status `proposed`.
  Typically promoted from an idea or originating directly from governance.
- *Commit.* A plan moves from `proposed` to `committed` when governance (or the assigned office) accepts responsibility for executing it.
  The transition produces a witness.
- *Begin.* The plan moves from `committed` to `in-progress` when execution starts.
  Per [runbook-execution](../runbook-execution/runbook-execution.md), the cited runbook begins.
- *Complete.* The plan moves to `completed` when its definition-of-done is satisfied.
  Substrate validation can verify this; the verification is a substrate operation.
- *Abandon.* A plan can be abandoned (status → `abandoned`) when governance decides the plan is no longer viable.
  Abandonment cites a reason; the witness records it.

## Position in the platform

Plan records are the platform's *committed-work-item* substrate.
A platform that orchestrates work needs to track which work has been decided on but not yet done; plan records are the substrate-recorded answer.
Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), plans are themselves entities the substrate carries — adding, modifying, or abandoning a plan is editing predications.

The plan/runbook split is parallel to the goal/method split: a plan declares what to do; a runbook declares the steps.
The same goal can be served by different runbooks; the substrate's discipline is to maintain both as substrate content so the engineering question "which runbook serves which plan?" is answerable by traversal.
