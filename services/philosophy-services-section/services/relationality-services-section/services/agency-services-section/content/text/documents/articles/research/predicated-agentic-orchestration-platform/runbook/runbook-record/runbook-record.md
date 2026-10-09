---
type: definition
class: substrate-entity
realizes: [runbook]
depends-on: [runbook, skill-record]
see-also: [skill-record, witness]
title: Runbook record
description: "A runbook record is the substrate-entity formal definition of a runbook: the predication-graph entity whose predications declare an ordered, branching sequence of skill invocations that together perform a higher-level operation."
---

# Runbook record

A **runbook record** is the substrate-entity formal definition of a [runbook](teaching/explanations/runbook.md): the predication-graph entity whose predications declare an ordered, branching sequence of [skill invocations](../../skill/skill-invocation/skill-invocation.md) that together perform a higher-level operation.
Runbooks are the platform's structured-procedure layer above individual skills.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the procedure.
- **`inputs`** — references to shape entities declaring the runbook's required inputs.
- **`outputs`** — references to shape entities declaring the runbook's produced outputs.
- **`steps`** — an ordered list of step records.
  Each step references a [skill](skill-record.md) (or another runbook) and declares its argument bindings.
- **`branches`** — declarations of conditional flow: predicates over the runbook's accumulated state determining which step fires next when multiple are admissible.
- **`witness-format`** — the runbook's composed witness shape; aggregates the witnesses of each step.
- **`scope`** — the scopes where the runbook is admissible.
- **`closure-kind`** — typically `procedure`, but an inquiry-style runbook may carry `inquiry`.
- **`required-powers`** — powers the invoking agent must hold to admissibly execute the runbook.

Each step record carries:

- **`skill`** — the skill (or sub-runbook) reference.
- **`input-bindings`** — predications declaring which prior step's outputs (or runbook inputs) supply this step's arguments.
- **`condition`** — optional predicate gating whether this step fires.
- **`output-binding`** — declaration of which name in the runbook's accumulated state the step's output is bound under.

## Invariants

- **Steps cite real skills.** Every step references a substrate-resident [skill record](skill-record.md) (or runbook record).
- **Bindings resolve.** Every step's input bindings refer to runbook inputs or earlier-step outputs; forward references are not admitted.
- **No skill-cycle.** A runbook may not invoke another runbook that would invoke this one (transitively); the substrate's validation checks for cycles.
- **Required-powers covers steps.** The runbook's `required-powers` includes the union of powers required by each step's skill.

## Operations

- *Execute.* The [runbook-execution](../runbook-execution/runbook-execution.md) operator reads the record, threads state through the steps, branches per declarations, and emits the composed witness.
- *Resume.* A runbook execution interrupted partway through can resume from the most-recent state recorded in the [event log](../../../objects/event-log.md).
  The resumability is what makes runbooks safe to interrupt.
- *Validate.* Substrate validation checks the runbook's structural invariants when the record is inserted or edited.

## Position in the platform

A runbook record is one of the platform's two structural-procedure entity kinds (the other being [skill records](skill-record.md), which are atomic).
The runbook is the place sequencing, branching, and state-threading live; the skill is the place atomic judgment lives.
The boundary between them is the boundary between procedure and judgment — a clean separation that lets a single skill be invoked from many runbooks and a single runbook to invoke many skills.
