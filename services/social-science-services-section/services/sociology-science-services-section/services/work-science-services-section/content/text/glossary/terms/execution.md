---
name: "Execution"
description: "The sequence of acts that advances a work entity from assigned toward completed. Where plans meet reality — where assumptions are tested, errors occur, artifacts are produced, and the system's resilience is measured."
date-created: 2026-04-07
instance-of: [stage, act]
part-of-cycle: operations-loop
position-in-cycle: 3
follows: dispatch
precedes: tracking
input-from: [assignment, plan]
output-to: [event, artifact, state-change]
work-types-encountered: [process, procedure, derivation, inquiry]
settlement-role: "Execution produces ground terms — fully specified work units with bound variables"
contrasts-with: [planning, tracking]
grounded-in:
  - execution-and-monitoring-survey
  - ontology-of-work-operations
traditions: [harel-statecharts, reason-error-models, bpmn, sagas, tote-units]
---

Execution is the stage of the [operations loop](./operations-loop-stage.md) where work actually happens. A [task](./task.md) has been [assigned](./assignment.md) to an agent. Execution is the sequence of [acts](../../../../philosophy/terms/act.md) that advance the task's [state](../../../../philosophy/terms/state.md) from assigned toward completed.

## What execution produces

Execution produces three things:

1. **State changes** — the task moves through states (assigned → in-progress → completed, or → blocked, or → failed). Each transition is an [act](../../../../philosophy/terms/act.md) that changes the work entity's [state](../../../../philosophy/terms/state.md).

2. **Artifacts** — the outputs of the work. A research task produces a library text. An enrichment task produces modified frontmatter. A build task produces compiled code. The artifact is the ground term — the fully specified output of the fully specified [work unit](./work-unit.md).

3. **Events** — the timestamped record of what happened. Every act during execution should produce an [event](../../../../philosophy/terms/event.md). The event sequence IS the audit trail. It is not a separate logging system — it is the natural consequence of taking acts seriously as entities with temporal coordinates.

## The TOTE unit

Miller, Galanter, and Pribram (*Plans and the Structure of Behavior*, 1960) describe the basic unit of execution as a TOTE: Test-Operate-Test-Exit. The agent tests the current state against the goal. If the state doesn't match, the agent operates (performs an act). Then tests again. When the state matches the goal, the agent exits. This is the same structure as the settlement cycle: compose (⊙) the current state with the goal, check (⇒) whether they agree. If ⊥ or ⊤, operate. If t, done.

## Execution and work types

The [work type](./work.md) determines what execution looks like:

- **[Process](./process.md)** execution is deterministic — same input, same output, no branching. Run the script. Apply the template.
- **[Procedure](./procedure.md)** execution branches on conditions — evaluate the state, take the appropriate path. Follow the checklist, adapting to what you find.
- **[Derivation](./derivation.md)** execution produces a value through inference — the operation is known but the result is not predetermined. Compute the metric. Write the finding.
- **[Inquiry](./inquiry.md)** execution discovers its own structure — neither the operation nor the result is predetermined. Research the question. The path emerges during the walk.

## Execution and errors

Reason (*Human Error*, 1990) distinguishes slips (correct intention, wrong action), lapses (correct intention, forgotten action), and mistakes (wrong intention). Each type of error produces a different kind of event:

- A slip produces a state change that doesn't match the intended change — detected by tracking
- A lapse produces no state change where one was expected — detected by tracking as absence
- A mistake produces the intended state change but the intention was wrong — detected by review

The saga pattern (Garcia-Molina and Salem, 1987) handles execution failures in multi-step workflows: each step has a compensating action that undoes it. If step 3 fails, compensate steps 2 and 1. This is how the system recovers from errors without requiring the entire workflow to be atomic.

## The algebraic reading

In the [algebraic structure of work](../texts/algebraic-structure-of-work.md), execution is where open terms become ground terms. An assigned task is an open term — `operate(agent, ?, ?)` — with the operation bound (the agent knows what to do) but some arguments still free (the specific content, the specific context). Execution binds the remaining variables through the acts performed. The completed task is a ground term: `operate(agent, specific-input, specific-output)`.

The settlement path position during execution: the task moves from whatever work type it started as toward process. An inquiry-type task during execution may settle some of its meaning (discovering what it's about), moving toward derivation. A derivation-type task during execution may settle its execution path, moving toward procedure. Execution IS settlement happening in real time.

## See also

- [Dispatch](./dispatch.md) — the stage that precedes execution (assigns work to agents)
- [Tracking](./tracking.md) — the stage that follows execution (observes what happened)
- [Act](../../../../philosophy/terms/act.md) — the primitive that execution is composed of
- [Work unit](./work-unit.md) — the ground term that execution produces
- [Execution and Monitoring Survey](../texts/execution-and-monitoring-survey.md) — the full disciplinary grounding
