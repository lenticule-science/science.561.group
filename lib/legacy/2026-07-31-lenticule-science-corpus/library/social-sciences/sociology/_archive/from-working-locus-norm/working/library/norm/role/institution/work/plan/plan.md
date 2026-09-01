---

title: "Plan"
extends: [record, partial-order, intention]
restricts: [act, work]
description: "A structured commitment to a set of intended actions, ordered by dependencies, that transforms a current situation toward a goal. Plans are partial, hierarchical, and defeasible — they constrain future deliberation without dictating every detail."
contains: task
can-be-part-of: [project, campaign]
has: [status, goal, definition-of-done, milestones, ordering, requires-concepts]
serves-takes: [goal, objective]
owner-is: office
requires-concepts-takes: term
coordinated-by-takes: campaign
date-created: 2026-03-20
date-modified: 2026-04-06
---

A plan is a structured commitment to a finite set of intended actions, connected by dependencies, aimed at transforming a current situation toward a goal. A plan says what must happen and what must happen before what — but it does not dictate every detail of execution.

## What makes something a plan

Four properties distinguish a plan from a wish, a list, or a policy:

1. **Finite commitment.** A plan commits to a bounded set of steps. An infinite or open-ended intention is a strategy or policy, not a plan. Finiteness makes a plan communicable: you can state it, hand it off, and verify its completion.

2. **Dependency structure.** Steps are connected by ordering constraints: step A must complete before step B can begin, because A produces something B needs. Steps without ordering constraints can proceed in any order or concurrently. The dependency structure is a directed acyclic graph — cycles would make the plan unexecutable.

3. **Goal orientation.** Every step contributes to the plan's goal through a chain of means-end relations. A step that could be removed without affecting the goal is not part of the plan — it is padding. Plans are lean: they include what is necessary and nothing else.

4. **Defeasible stability.** Plans resist casual revision. Once adopted, a plan constrains future deliberation — you do not re-deliberate from scratch at each moment. But plans can be abandoned or revised when circumstances change. The key distinction: reconsideration requires reasons, not just preference (Bratman 1987).

## Partiality

Plans are typically partial. They specify some aspects of future action and leave others open for later specification. A plan to "hold a conference" may specify the venue and date but not the seating arrangement. Partial plans are the norm; fully specified total-order plans are the exception.

This partiality connects to the work type classification. A plan where both the meaning and execution are settled is a [process](./process.md). Where execution is open but meaning is settled, it is a [procedure](./procedure.md). Plans typically operate in the procedure or [derivation](./derivation.md) space — the structure is committed but some steps require judgment in execution.

## Hierarchy

Plans nest. A high-level plan decomposes into sub-plans, which decompose into [tasks](./task.md). The high-level intention ("attend the conference") constrains the sub-intentions ("book the flight," "prepare the talk"), which constrain specific actions ("call the airline"). This hierarchy connects immediate actions to long-term commitments.

The hierarchy runs: goal → [project](./project.md) → plan → task. A project may contain multiple plans. A plan contains tasks connected by dependencies. The dependency graph among tasks determines the critical path and minimum duration.

## Coordination

Plans serve two coordination functions (Bratman 1987):

- **Coordination over time.** A plan settled upon now guides future sessions. Without a plan, each session would deliberate from scratch about what to do — a waste of the system's most constrained resource (context).
- **Coordination with others.** Shared plans allow agents (human and artificial) to work in parallel without continuous negotiation. Two agents with access to the same plan can each take different tasks, confident their work will compose.

## Reconsideration

When should a plan be revised rather than continued? The [review](./review.md) stage of the operations loop evaluates plan-vs-actual variance. If the variance is within tolerance, continue. If circumstances have materially changed — a dependency is permanently blocked, the goal is no longer relevant, a better approach has been discovered — revise the plan. The threshold for revision is deliberate: plans that change on every session provide no stability; plans that never change despite evidence provide no adaptation.

## Formal connections

The dependency structure of a plan is a partial order on operations — the same structure formalized in AI planning as partial-order plans (McAllester and Rosenblitt 1991, building on Sacerdoti's NOAH 1975). STRIPS (Fikes and Nilsson 1971) and PDDL (Ghallab et al. 1998) provide formal languages for specifying plans as sequences of state-transforming operators with preconditions and effects. These formalisms ground the concept computationally: a dependency graph among tasks in a plan file is a lightweight partial-order plan.

Bratman's philosophical account (*Intention, Plans, and Practical Reason*, 1987) provides the normative grounding: plans are not just data structures but commitments that constrain practical reasoning.
