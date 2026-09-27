---
title: "Execution and Monitoring: How Work Gets Done and What Can Go Wrong"
date-created: 2026-04-03
description: "How work transitions through states during execution — from Harel's statecharts through BPMN workflows to Reason's error models, saga patterns for recovery, and real-time monitoring."
part-of: ops-research-foundations
references:
  harel1987:
    authors: ["David Harel"]
    title: "Statecharts: A Visual Formalism for Complex Systems"
    publication: "Science of Computer Programming, 8(3)"
    year: 1987
  reason1990:
    authors: ["James Reason"]
    title: "Human Error"
    publication: "Cambridge University Press"
    year: 1990
  miller-galanter-pribram1960:
    authors: ["George A. Miller", "Eugene Galanter", "Karl H. Pribram"]
    title: "Plans and the Structure of Behavior"
    publication: "Holt, Rinehart and Winston"
    year: 1960
  garcia-molina-salem1987:
    authors: ["Hector Garcia-Molina", "Kenneth Salem"]
    title: "Sagas"
    publication: "ACM SIGMOD Record, 16(3)"
    year: 1987
  omg-bpmn2011:
    authors: ["Object Management Group"]
    title: "Business Process Model and Notation (BPMN) Version 2.0"
    year: 2011
  little1961:
    authors: ["John D. C. Little"]
    title: "A Proof for the Queuing Formula: L = λW"
    publication: "Operations Research, 9(3)"
    year: 1961
---

Execution is the sequence of [acts](../../../../philosophy/terms/act.md) that advances a work entity from "assigned" toward "completed." It is where plans meet reality — where assumptions are tested, errors occur, and the system's resilience is measured.

## State machines and statecharts

Execution is state transition. A task starts in one [state](../../../../philosophy/terms/state.md) and, through a series of acts, reaches another. The execution semantics of the operations loop are defined by which transitions are legal from each state.

David Harel's statecharts (1987) provide the formal model. A flat state machine has states and transitions — "open" → "in progress" → "completed." Harel adds three features that flat machines lack:

**Hierarchy** — states nest. "In progress" has substates: "active," "blocked," "waiting for review." You can describe the coarse state ("in progress") without committing to the fine state, and you can describe the fine state without repeating that it's within "in progress."

**Orthogonality** — independent aspects of state evolve independently. A task's execution state (active/blocked/done) is orthogonal to its review state (unreviewed/approved/rejected). These can be modeled as parallel regions that don't interfere.

**History** — when a task re-enters a composite state, it can return to the substate it was in when it left. A task that was "in progress → active" before being blocked returns to "potential" when unblocked, not to the generic "in progress" start.

For a flatfile work management system, task status is often flat — "open," "completed," "deferred." The state machine is implicit. Making it explicit means defining: which transitions are legal from each status, what conditions must hold for each transition, and what events each transition produces. A validation layer can enforce some constraints, but the state machine would make all constraints derivable from a single specification.

## BPMN execution semantics

The Business Process Model and Notation (OMG 2011) standardizes workflow execution with five core element types: events (things that happen), activities (work performed), gateways (decision/merge points), sequence flows (execution order), and message flows (inter-process communication).

BPMN's execution semantics are token-based. A token represents a thread of execution. It flows along sequence flows, enters activities (consuming the token until the activity completes), and passes through gateways (which may split one token into many or merge many into one).

In practice, most operations loops have implicit token flow. A task is created (token enters the system), assigned (token moves to dispatch), started (token moves to execution), completed (token moves to tracking), reviewed (token moves to review). But this flow is typically modeled as status changes on individual records, not as explicit tokens. Making the flow explicit would enable: detecting stalled tokens (tasks stuck in a state), computing flow time (how long between states), and identifying bottleneck states (where tokens accumulate).

## The TOTE unit

Miller, Galanter, and Pribram's *Plans and the Structure of Behavior* (1960) propose the TOTE unit as the basic element of purposeful behavior: Test-Operate-Test-Exit.

**Test** — compare current state to goal state. Are they the same?
**Operate** — if not, perform an action to change the current state.
**Test** — compare again. Same now?
**Exit** — if yes, the unit is complete.

Every TOTE unit is a feedback loop. The agent tests, acts, tests again, and keeps going until the goal state is reached or the unit fails. TOTE units nest: the "Operate" phase of a high-level unit may itself be a TOTE unit with its own test and operate.

In practice, every task execution is a TOTE unit. The test is: "does the current state satisfy the task's goal?" The operate is: "do something to advance toward the goal." The exit is: "mark the task complete." The nesting is the work hierarchy: completing a task is one operate step in the TOTE unit of completing a plan.

## Error models: Reason

James Reason's *Human Error* (1990) classifies errors into three types:

**Slips** — the right intention, wrong execution. You meant to type "git push" but typed "git pull." The plan was correct; the action deviated. Slips are detected by monitoring: the system observes the action and catches the discrepancy.

**Lapses** — the right intention, forgotten execution. You meant to update the plan after completing the task but forgot. The plan was correct; the action was omitted. Lapses are detected by tracking: the system notices that an expected state transition didn't occur.

**Mistakes** — the wrong intention. You planned to refactor the database schema when you should have been adding an index. The action was executed correctly, but the plan was wrong. Mistakes are detected by review: comparing outcomes against goals reveals that the right work wasn't done.

Reason's Swiss cheese model: errors pass through multiple defensive layers. Each layer has holes (vulnerabilities). An error causes harm only when the holes in all layers align. Defensive layers in a work management system include: validation checks (catch structural errors), access control enforcement (prevents bypassing the API), referential integrity checks (catch broken references), and the review stage (catches strategic errors).

In practice, a layered validation architecture IS the Swiss cheese defense. Each layer is a defensive barrier. The goal is not to make any single layer perfect, but to ensure the holes don't align — that different layers catch different classes of error. Slips are caught by pre-action checks (you're about to do the wrong thing). Lapses are caught by post-action checks (you did something but didn't do the follow-up). Mistakes are caught by the review stage (you did the wrong work).

## Saga pattern: recovery from failure

Garcia-Molina and Salem's saga pattern (1987) addresses the problem of long-running operations that can fail partway through. In a database, a short transaction is atomic — it either fully completes or fully rolls back. But a saga is a sequence of transactions, each of which can succeed or fail independently.

A saga has two strategies for failure:

**Backward recovery** — when step N fails, run compensating transactions for steps N-1, N-2, ... 1, undoing the work. This requires that every step has a defined compensating action.

**Forward recovery** — when step N fails, retry it or skip it and continue from step N+1. This requires that the saga can tolerate partial completion.

In practice, plan execution is a saga. Each task is a transaction. If task 3 of 7 fails, you don't automatically undo tasks 1 and 2 — their work has value. But you do need to decide: retry task 3? Skip it? Replan? The saga pattern says: define for each task what happens on failure. Some tasks have compensating actions (undo). Some tasks are retryable. Some tasks, on failure, require replanning the remainder of the saga.

A task definition could encode this as a failure policy (retry, skip, replan, or compensate). The execution stage checks this policy when a task fails and routes accordingly.

## Flow dynamics: Little's Law

Little's Law (1961) is the fundamental theorem of queuing theory:

$$L = \lambda W$$

Average items in system = arrival rate × average time in system. Equivalently: $W = L / \lambda$ — average time in system = items in system / throughput.

The implication is stark: if you want work to flow faster through the system (reduce W), you must either reduce the number of items in the system (reduce L, i.e., lower WIP) or increase throughput (increase λ). There is no other lever.

This governs execution directly. An agent with 15 tasks in progress will take longer per task than an agent with 3, even if the agent works the same number of hours. Context switching is the mechanism: every task switch costs cognitive overhead (for humans) or context window space (for AI agents). The cost is not just time — it is quality. Partially-attended work produces more errors.

In practice, the WIP limit per agent should be explicit and enforced. The dispatch stage should check WIP before assigning new work. The tracking stage should flag WIP violations. Any environment briefing that shows task counts could add a WIP limit check to surface overload before it causes quality degradation.

## See also

- [The Ontology of Work Operations](./2026-04-03-note-on-ontology-of-work-operations.md) — the base mapping
- [Dispatch and Delegation Survey](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md) — what precedes execution
- [Tracking and Measurement Survey](./2026-04-03-note-on-tracking-and-measurement-survey.md) — how execution is observed
