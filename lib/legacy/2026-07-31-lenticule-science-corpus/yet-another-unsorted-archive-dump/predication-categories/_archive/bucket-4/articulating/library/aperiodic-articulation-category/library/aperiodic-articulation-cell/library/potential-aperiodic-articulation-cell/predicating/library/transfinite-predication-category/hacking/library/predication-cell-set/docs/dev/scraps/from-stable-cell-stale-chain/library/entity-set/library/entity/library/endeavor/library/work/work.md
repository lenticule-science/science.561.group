---
name: work
description: An episode of doing with a defined output. An entity-form whose characteristic predication-shape distinguishes purposive action from mere activity by naming what is produced.
---

## Pure form

Work is any act that produces a nameable output. The defining predication: `(work, has-output, output-description)`. An act without a nameable output is not work in this sense — it lacks the predication that individuates it as a work entity.

## Four work-type specializations

The `work-type` predication distinguishes four forms by whether meaning (what the output is for) and execution (how to produce it) are settled at the time the work begins:

| work-type | meaning settled | execution settled |
|---|---|---|
| `process` | yes | yes |
| `procedure` | yes | no |
| `derivation` | no | yes |
| `inquiry` | no | no |

Characteristic predication: `(work, work-type, {process|procedure|derivation|inquiry})`.

## Characteristic predication-shape

- `has-output(work, output-description)` — what the work produces; the individuating predication.
- `work-type(work, type)` — which specialization.
- `performed-by(work, agent)` — the agent performing it.
- `organized-by(work, task)` — the task that contains this work.

## Relation to other forms

Work is the abstract form; a [`workitem-record`](workitem-record.md) is the in-flight cell-shape work takes as it flows through the [`dispatching`](../transformers/dispatching.md) chain. The workitem's `kind` cell ranges over the four work-type specializations above; its `skill` cell names the capability the receiver must advertise.
