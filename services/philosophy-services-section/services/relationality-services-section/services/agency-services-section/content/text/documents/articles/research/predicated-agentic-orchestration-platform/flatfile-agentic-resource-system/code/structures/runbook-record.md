---
name: runbook-record
description: Runbook record
type: definition
class: record
instantiates: [runbook, runbook-record]
depends-on: [agential-self-generation, fiber, witness, skill-record]
see-also: [agent-record, office-record, execute-runbook, invoke-skill]
title: runbook-record
---

# Runbook record

The substrate-record holding one *runbook* — a composed-procedure entity declaring an ordered sequence of skill invocations (with branching and bound state) that constitutes a higher-level operation an agent can perform.
Where a [`SkillRecord`](skill-record.md) is the unit (one bounded skill), a `RunbookRecord` is the structured combination of skills addressing a recurring multi-step task: deploying a service, opening a pull request, triaging a directory, executing a release.

A `RunbookRecord` is FARS's realization of AgOP's [runbook-record](../../../objects/runbook-record.md) at the bilattice value-domain.
Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the runbook IS the record: editing a runbook is editing predications; running a runbook is invoking [`execute-runbook`](../transformers/execute-runbook.md) on the record.

Runbooks are *recursively composable*: a runbook's step MAY invoke another runbook (which is itself the body of a higher-level skill, per [`SkillRecord`](skill-record.md)'s composed-skill reading).
FARS admits arbitrary composition without coupling the runbook engine to a workflow framework — composition is realized through skill-and-runbook references, not through framework primitives.

## Required fields

Every conforming realization SHALL hold, for each `RunbookRecord`:

### Identity

- **`name`** — canonical identifier within the substrate.
- **`description`** — human-readable account of what the runbook accomplishes.
- **`kind`** — `operational-runbook` (incident-response or routine-task procedure) or `skill-composing-runbook` (a runbook serving as a higher-level skill's body).
  Per AgOP's [runbook concept](../../teaching/explanations/runbook.md), the two uses are distinguished but use the same record shape.

### Steps

- **`steps`** — ordered list of step records.
  Each step carries:
  - **`step-name`** — identifier within the runbook.
  - **`skill`** — reference to the [`SkillRecord`](skill-record.md) (or sub-runbook) the step invokes.
  - **`scope`** — the scope at which the step's invocation runs.
    May be inherited from the runbook's scope or overridden per-step.
  - **`input-binding`** — declaration of which prior steps' outputs feed this step's inputs, expressed as predicate references.
    Substrate-level dataflow specification.
  - **`branch-condition`** — optional.
    A predication pattern the substrate evaluates against the runbook's accumulated state; the step runs only when the pattern matches.
    Branch conditions are realized as closure-rule premises, not as procedural `if` statements.
  - **`failure-policy`** — declares what happens if the step's invocation fails (`abort`, `retry`, `skip`, `escalate`, `compensate`).
    The policy is read by [`execute-runbook`](../transformers/execute-runbook.md) when a step's witness reports failure.

### State

- **`state-shape`** — predication-pattern declaring the runbook's *local bindings* — predicates produced by intermediate steps that flow into later steps.
  State is recorded in the event log as the runbook executes; an interrupted runbook can be resumed by reading the most-recent state event from the log.
- **`initial-state`** — the bindings present when the runbook starts.
  May be empty, may be parameterized by the runbook's invocation arguments.

### Witness format

- **`witness-format`** — the runbook's composed witness shape: the canonical hash of the runbook record, the witnesses of each step's skill invocation in order, the canonical hash of the final outcome.
  Per [`execute-runbook`](../transformers/execute-runbook.md), the witness chain establishes the runbook's replayable history.

### Invocation policy

- **`required-capabilities`** — capability predicates an invoking agent SHALL have.
  Different from the per-step capabilities (some steps may have stricter requirements; the runbook's overall requirement is the union).
- **`scope-bound`** — the substrate region the runbook operates within.
- **`work-type`** — informs dispatch (a `procedure` runbook is dispatched differently from an `inquiry` runbook).

## Invariants

- **Substrate entity.** A `RunbookRecord` SHALL be a substrate entity.
  Editing the runbook is editing predications.
- **Steps-resolvable.** Each step's `skill` reference SHALL resolve to a substrate-resident `SkillRecord` (or `RunbookRecord` for composed runbooks).
  Dangling step references make the runbook unrunnable.
- **State-flow-declared.** Each step that consumes prior-step outputs SHALL declare the binding via `input-binding`.
  Implicit dataflow through realization-side variables is non-conformant; the substrate's witnesses can audit the dataflow only when it's substrate-declared.
- **Witness-emitting.** Every invocation of the runbook SHALL produce a composed witness chaining the step witnesses, per [`execute-runbook`](../transformers/execute-runbook.md).
- **Resumable.** When a runbook is interrupted (the realization halts mid-execution, the agent's session ends, the substrate is paused), the runbook's state IS in the event log.
  A subsequent `execute-runbook` invocation reading the event log can pick up at the interrupted step.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), the substrate carries enough information to resume without out-of-band state.
- **Composable.** A runbook MAY invoke another runbook as a step.
  Cycles in the runbook composition graph are detected per closure rules over the substrate's `RunbookRecord` entities; a cyclic runbook is a non-conformance the substrate's `analysis` channel surfaces.

## What a `RunbookRecord` is not

- **Not a workflow definition.** A workflow definition in a workflow engine carries states, transitions, guards, retries — and the workflow engine interprets these via its own dispatch logic.
  A `RunbookRecord` carries the same information AS substrate predications; the substrate's algebra (per [`settle`](../transformers/settle.md)) is what interprets them.
  There is no separate workflow engine.
- **Not a script.** A script runs operations sequentially in a process.
  A runbook runs them via [`execute-runbook`](../transformers/execute-runbook.md), which witnesses each step and records state in the event log.
  A script's failure leaves no audit trail; a runbook's failure leaves a witnessed step-by-step record.
- **Not a pipeline definition.** A pipeline definition (CI, data ingestion) typically declares stages with implicit dataflow.
  A runbook declares dataflow via `input-binding` per-step and witnesses each step's outputs by hash.
  The substrate-level audit and replay properties are stronger.

## Position

`RunbookRecord` is what makes higher-level operations substrate-content.
The substrate's catalog of *what an agent can do at scale* is the union of `SkillRecord` (for atomic operations) and `RunbookRecord` (for composed operations).
Editing the catalog is substrate editing; replaying the catalog's invocations is substrate replay.

The record composes with [`SkillRecord`](skill-record.md) (the per-step bodies), [`AgentRecord`](agent-record.md) (the actor invoking the runbook), and [`OfficeRecord`](office-record.md) (the action domain providing the runbook to its agents).
