---
name: objective
description: A specific, measurable, time-bounded target serving a goal. An entity-form whose characteristic predication-shape names a decidable target, a metric, and a deadline.
---

## Pure form

An objective is a decidable target. The defining predication: `(objective, has-target, target-description)`. The defining property is decidability: at the deadline, the target is either met or not — there is no ambiguous middle. This distinguishes objective from [goal](goal.md) (directional, never strictly settled) and from [task](task.md) (goal-directed, but without a required metric or deadline).

## Characteristic predication-shape

- `has-target(objective, target-description)` — what counts as achieved; the individuating predication.
- `serves(objective, goal)` — the goal whose direction this target advances.
- `has-metric(objective, metric)` — the measurement by which progress is evaluated.
- `has-deadline(objective, date)` — the moment at which achievement is assessed.
- `has-status(objective, {open | on-track | achieved | missed | abandoned})` — current lifecycle state.

## SMART invariants

Conformance to the SMART criteria is the structural condition for an objective to function as an actionable target rather than a vague aspiration: specific (target is determinate), measurable (metric exists), achievable (structurally possible), relevant (advances the served goal), time-bounded (deadline is specific).

## Decidability and friction

An objective met at one point may become unmet if conditions change. Achievement is assessed *at the deadline*, not earlier — earlier readings are progress signals, not closure events.
