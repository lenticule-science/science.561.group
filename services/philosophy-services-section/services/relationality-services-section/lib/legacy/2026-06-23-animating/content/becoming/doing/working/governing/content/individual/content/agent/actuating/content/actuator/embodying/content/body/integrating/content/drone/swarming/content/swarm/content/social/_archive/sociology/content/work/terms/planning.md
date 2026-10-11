---
name: "Planning"
description: "The stage of the operations loop where goals decompose into structured commitments — creating plans, ordering tasks, identifying dependencies. Planning produces the open terms that dispatch, execution, and the rest of the loop progressively close."
date-created: 2026-04-07
instance-of: [stage, act]
part-of-cycle: operations-loop
position-in-cycle: 1
follows: feedback
precedes: dispatch
input-from: [goal, objective, adjustment]
output-to: [plan, task, dependency-graph, ordering]
contrasts-with: [execution, feedback]
grounded-in:
  - planning-and-scheduling-survey
  - formal-planning-theory
  - ontology-of-work-operations
traditions: [bratman-intentions, strips-pddl, sacerdoti-noah, goldratt-toc, mintzberg-strategy]
settlement-role: "Planning creates open terms — structured work descriptions with free variables (who does it, exactly how, exactly what output). The settlement path begins here."
---

Planning is the stage of the [operations loop](./operations-loop-stage.md) where goals become structured commitments.
A [goal](../../../../philosophy/terms/quality.md) says what direction to move.
Planning says what steps to take, in what order, with what dependencies.
The output is a [plan](./plan.md) — a container of [tasks](./task.md) connected by a dependency graph.

## What planning produces

Plans.
Not documents ABOUT plans — the plan entity IS the plan.
Its frontmatter carries the goal, the task list, the ordering, the definition-of-done.
The plan's structure is the plan's content.

In the [algebraic structure of work](../texts/algebraic-structure-of-work.md), planning creates open terms.
An open term has free variables — who will execute, exactly what input, exactly what output.
These variables get bound by [dispatch](./dispatch.md) (who) and [execution](./execution.md) (what, how).
Planning's job is to create well-structured open terms whose variables CAN be bound, in an order that respects dependencies.

## Planning and the settlement path

Planning operates primarily at the [inquiry](./inquiry.md) and [derivation](./derivation.md) levels.
Novel planning is inquiry — we don't know what steps are needed or in what order.
Routine planning is procedure — we know the structure, just need to fill in the specifics.

The plan's own position on the [settlement path](./settlement-path.md) changes over time.
A new plan is inquiry (what should we do?).
As research and analysis inform it, it becomes derivation (we know the approach but not the steps).
As tasks are created and ordered, it becomes procedure (we know the steps but execution varies).
A plan whose every task is a process is itself a process — fully settled, could be a template.

## Planning receives feedback

The loop's closure means planning doesn't start from scratch.
[Feedback](./feedback.md) from the previous cycle carries: what worked, what didn't, which assumptions were wrong, which vocabulary was missing.
Planning that ignores feedback repeats the same errors.
Planning that incorporates feedback starts from a more settled position each cycle.

## Partiality

Plans are typically partial — they specify some aspects and leave others open.
This is correct, not a failure.
Bratman (*Intention, Plans, and Practical Reason*, 1987): plans constrain future deliberation without dictating every detail.
A plan that specifies every detail before any execution is brittle — it breaks on the first surprise.
A plan that specifies the right amount leaves room for execution-time judgment while providing enough structure for coordination.

Charter Guideline 7 (Plans Match Decisions): the plan's level of detail should match the level of the decision it encodes.
If the next question is "what approach?", plan at the approach level.
If "how?", plan at the implementation level.
