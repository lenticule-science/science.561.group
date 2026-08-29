---
name: work
description: An episode of doing with a defined output. An entity-form whose characteristic predication-shape distinguishes purposive action from mere activity by naming what is produced. Codomain of the dispatching morphism.
specializing: computer-operating-system
codomain-of: dispatching
work-type-enum:
  - process
  - procedure
  - derivation
  - inquiry
---

A **work** is any act that produces a nameable output.
The defining predication is `(work, has-output, output-description)`; an act without a nameable output is not work in this sense — it lacks the predication that individuates it as a work entity.

## Four work-type specializations

The `work-type` predication distinguishes four forms by whether *meaning* (what the output is for) and *execution* (how to produce it) are settled at the time the work begins:

| work-type | meaning settled | execution settled |
|---|---|---|
| `process` | yes | yes |
| `procedure` | yes | no |
| `derivation` | no | yes |
| `inquiry` | no | no |

These four corners are the same enumeration the [closure-position structure](../closure-position/closure-position.md) names from the closure-grade side.
A work's work-type and the closure-position of the skill performing it must agree at dispatch.

## Characteristic predication-shape

- `has-output(work, output-description)` — what the work produces; the individuating predication.
- `work-type(work, type)` — which of the four specializations applies.
- `performed-by(work, agent)` — the agent performing it (filled in by dispatch).
- `organized-by(work, task)` — the task containing this work.
- `required-skill(work, skill)` — the skill the receiver must advertise to be a dispatch candidate.

## Dispatch as a positive-Π₁ closure rule

Per [agent.md:60–64](../../../../../../../../../../code/structures/agent.md), dispatch matches work to agents via the closure rule

$$\mathrm{match}(w, a) \;=\; \mathrm{required}(w) \;\odot\; (\Box_R u_a)_w$$

where $\mathrm{required}(w)$ is the work's required-skill predication and $\Box_R u_a$ is the governance-restricted authorization.
Work is therefore the *domain object* of the match relation; every dispatching morphism takes a work as its target and returns the chosen agent.

## Relation to other forms

Work is the abstract form.
A workitem-record is the in-flight cell-shape work takes as it flows through the dispatching chain; the workitem's `kind` cell ranges over the four work-types.
