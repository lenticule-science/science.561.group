---
type: definition
class: substrate-entity
realizes: [duty]
depends-on: [duty, power-record]
see-also: [privilege-record, immunity-record, governing-soul]
title: Duty record
description: "A duty record is the substrate-entity formal definition of a duty: the predication-graph entity declaring an obligation that attaches to a power's exercise (or to a substrate-state condition)."
---

# Duty record

A **duty record** is the substrate-entity formal definition of a [duty](teaching/explanations/duty.md): the predication-graph entity declaring an obligation that attaches to a [power](teaching/explanations/power.md)'s exercise (or to a substrate-state condition).
The duty's predications are what closure rules consult when checking whether an agent's exercise of a power is admissible.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the obligation (e.g., "attribute sources when publishing").
- **`triggering-condition`** — predications declaring when the duty applies.
  Typically a power-exercise predication ("when the agent exercises power X") or a substrate-state predication ("when entity Y of kind Z is created in scope $\sigma$").
- **`required-action`** — references to the substrate operation(s) the duty obligates: a particular skill invocation, a predication that must be inserted, a notification that must be emitted.
  The required action is itself substrate content.
- **`enforcement-condition`** — declarations of when the required action must occur relative to the triggering condition: before, concurrent with, following within a declared event-log window.
  The substrate's closure rules consult the timing predication.
- **`severity`** — declares the consequence of unfulfilled duty: `recoverable` (recorded warning, action proceeds), `elevated` (action paused pending fulfillment), `hard` (action aborted, rolled back).
- **`scope`** — references to the scopes within which the duty applies.
- **`grantable-by` / `revokable-by`** — like powers, duties are subject to governance discipline about who may impose or relax them.
- **`exemption-cited`** — optional references to [privilege-records](../../../governance/privilege/privilege-record/privilege-record.md) that exempt this duty's applicability for declared agents.
- **`closure-kind`** — `duty`.

## Invariants

- **Triggering condition substrate-checkable.** A duty whose triggering condition cannot be evaluated by substrate operators is unenforced; the discipline requires triggering conditions are operationalizable.
- **Required action resolves.** The cited required action resolves to a substrate-resident operation.
- **Severity declared.** Every duty record explicitly declares severity; ambiguous severity defaults to `elevated` per substrate policy.

## Operations

- *Apply.* When the triggering condition fires (the power is exercised, the substrate state matches), the substrate's duty-checking closure rule evaluates the required-action predications.
  Fulfillment is recorded; non-fulfillment per the severity is handled.
- *Edit.* Editing a duty record produces a new version.
  The new version applies to operations after the edit; replays of past operations cite the version in effect at the time.
- *Audit.* Querying the duties applicable to a particular agent in a particular scope is a substrate traversal.
  Audit can show every duty the agent has performed, every duty unfulfilled, every duty exempted.

## Common duty patterns

- **Attribute-sources.** When the agent publishes content, predications must cite the substrate entities the content is derived from.
- **Notify-affected.** When the agent's mutation affects entities in another scope, that scope's [inbox](../../../memory/inbox/inbox-record/inbox-record.md) must receive a notification.
- **Record-rationale.** When the agent makes a decision in a substrate-recorded operation, predications must record the decision's rationale (the substrate state inputs the decision considered).
- **Maintain-coherence.** When an agent modifies a predication that another entity's coherence depends on, the agent's operation must include re-coherence steps.

## Position in the platform

Duty records are the substrate-recorded *vocabulary of obligation*: every required action accompanying a power's exercise corresponds to a duty record.
Without them, obligations are implicit (encoded in code, in process documents, in convention); with them, obligations are substrate-recorded, queryable, auditable, governanceable.

The combination of [power-records](../../../governance/power/power-record/power-record.md) and duty-records is the substrate's complete answer to "what does this agent's exercise of this authority require?": the powers say what the agent can do; the duties say what must accompany it.
The substrate's closure rules check both at every relevant operation.
