---
title: "The Ontology of Work Operations"
date-created: 2026-04-03
description: "Work operations are the foundational ontology applied to work â€” tasks are things, plans are containers, status is state, assignments are acts. The same modeling problem that MUDs solve for fantasy worlds, operational systems solve for organizational work."
part-of: ops-research-foundations
produces: vocabulary grounding for the six-stage operations loop
references:
  harel1987:
    authors: ["David Harel"]
    title: "Statecharts: A Visual Formalism for Complex Systems"
    publication: "Science of Computer Programming, 8(3)"
    year: 1987
  evans2003:
    authors: ["Eric Evans"]
    title: "Domain-Driven Design: Tackling Complexity in the Heart of Software"
    publication: "Addison-Wesley"
    year: 2003
  bartle2003:
    authors: ["Richard Bartle"]
    title: "Designing Virtual Worlds"
    publication: "New Riders"
    year: 2003
  nystrom2014:
    authors: ["Robert Nystrom"]
    title: "Game Programming Patterns"
    publication: "Genever Benning"
    year: 2014
  goldman1970:
    authors: ["Alvin Goldman"]
    title: "A Theory of Human Action"
    publication: "Princeton University Press"
    year: 1970
  whitehead1929:
    authors: ["Alfred North Whitehead"]
    title: "Process and Reality"
    publication: "Macmillan"
    year: 1929
  mintzberg1979:
    authors: ["Henry Mintzberg"]
    title: "The Structuring of Organizations"
    publication: "Prentice-Hall"
    year: 1979
---

Work operations are the foundational ontology applied to work. This is not a metaphor. The base concepts â€” [thing](../../../../philosophy/terms/thing.md), [quality](../../../../philosophy/terms/quality.md), [state](../../../../philosophy/terms/state.md), [act](../../../../philosophy/terms/act.md), [container](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/container.md), [vessel](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md) â€” map directly onto work entities. A [task](../terms/task.md) is a thing. A [plan](../terms/plan.md) is a container. Status is state. An assignment is an act. The six-stage operations loop (planning, dispatch, execution, tracking, review, feedback) is what happens when you take these primitives seriously as the architecture for organizational coordination.

## The mapping

### Things that work operates on

A [task](../terms/task.md) is a [thing](../../../../philosophy/terms/thing.md) â€” it can be distinguished from everything else, it has qualities, it changes state. A task has a goal (quality), a status (state), a work type (quality), a priority (quality), an assignee (relation). You can point at a task, name it, track it, complete it. It is not a process or a plan â€” it is a concrete unit of work with a lifecycle.

A [work unit](../../glossary/terms/work-unit.md) is the more general concept. Tasks, operations, requests, incidents, tickets â€” all work units. What makes something a work unit is that it enters the operations loop at one stage and flows through subsequent stages until resolved. A work unit is a thing that the operational system acts on.

An agent is a thing that acts. In a modern operational system, agents are both human and computational. A [principal](../../../../services/governance-services-section/content/text/glossary/terms/principal.md) authorizes work. An [officer](../terms/office.md) is bound to a deontic profile â€” powers, duties, privileges, immunities â€” that determines what work they may accept and what they must do. An agent is not just "someone who does tasks." An agent is a thing with capabilities (qualities), authority bounds (conditions), current capacity (state), and a history of acts.

### Containers that hold work

A [plan](../terms/plan.md) is a [container](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/container.md). It holds tasks. Tasks come and go â€” they get added, completed, deferred, removed â€” but the plan persists as the boundary that groups them. The plan has its own state (draft, active, completed), its own goal, and its own lifecycle independent of any individual task. This is the container pattern: the plan is not its tasks. Empty the plan and it is still a plan. Fill it with different tasks and it is the same plan.

A [project](../terms/project.md) is a [vessel](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md). It holds plans and persists through changes in contents. The project provides the durable identity that plans attach to. Plans within a project may succeed, fail, be superseded â€” the project persists until its goal is met or abandoned. The vessel metaphor is precise: a project, like a ship, is defined by its shape and purpose, not by its current cargo.

A queue is a container that orders its contents. A backlog is a container of candidate work items not yet scheduled. A sprint or iteration is a time-bounded container. A session is a temporal vessel â€” it holds the acts performed during a period and persists as a record. Each of these is the container concept applied with different boundary conditions: ordering, candidacy, time limits, temporal scope.

### States that work passes through

[State](../../../../philosophy/terms/state.md) in the work domain has both the snapshot reading and the state-machine reading.

The snapshot reading: a task's state is the composite of all its current conditions. Status is open. Priority is high. Assignee is Agent-7. Blocked by Task-12. Each of these is a [condition](../../../../philosophy/terms/condition.md) â€” a quality holding at a moment. The composite is the state.

The state-machine reading (Harel 1987): a task's state is defined by which transitions are possible from it. An "open" task can be started, deferred, or cancelled. A "running" task can be completed, blocked, or failed. A "completed" task has no outgoing transitions â€” it is terminal. The state IS the set of possible next moves.

Both readings are necessary. The snapshot tells you what is. The state machine tells you what can happen. The operations loop needs both: tracking uses snapshots (what is the current status?), dispatch uses the state machine (which tasks can be assigned?), review compares snapshots across time (what changed?).

Harel's statecharts add nested and orthogonal states. A task can be simultaneously "in progress" and "awaiting review" â€” these are orthogonal regions that evolve independently. A plan can be "active" with substates "on track" or "at risk" depending on whether its critical path has slack. State nesting is how you represent the fact that work has both coarse status (the headline) and fine-grained progress (the details).

### Acts that move work through states

An [act](../../../../philosophy/terms/act.md) is what changes a work entity's state. Assignment is an act â€” it transitions a task from "unassigned" to "assigned" and creates a relation between the task and an agent. Starting is an act. Completing is an act. Reviewing, approving, rejecting, deferring, escalating â€” all acts.

Goldman's act trees (1970) apply directly. Assigning a task is the way you dispatch work. Dispatching work is the way you execute a plan. Executing a plan is the way you advance a project. The act tree shows which acts are basic (what you do without doing anything else first) and which are derived (realized through performing other acts). In the operations loop: "complete a plan" is derived from "complete all its tasks." "Complete a task" is derived from "perform the work and mark it done." The basic acts are the primitive state transitions; everything else composes from them.

Acts compose across the six stages. A planning act creates work items. A dispatch act assigns them. An execution act advances them. A tracking act records their state. A review act evaluates outcomes. A feedback act modifies future plans. Each stage's acts feed the next stage's inputs. The loop IS the composition of acts across stages.

An [event](../../../../philosophy/terms/event.md) is an act recorded at a specific [time](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/time.md). Every act in the operations loop should be an event â€” timestamped, attributed to an actor, recording the state transition. The sequence of events IS the audit trail. It is not a separate logging system bolted on â€” it is the natural consequence of taking acts seriously as first-class entities with temporal coordinates.

### Relations that connect work entities

[Relations](../../../../philosophy/terms/relation.md) in the work domain include: part-of (task belongs to plan), depends-on (task B requires task A), assigned-to (task is assigned to agent), serves (objective serves goal), blocks (task A blocks task B), produces (task produces artifact), requires (task requires capability).

When these relations are expressed as metadata keys (e.g. `part-of: agentic-orchestration`), the key IS the predicate: (this-task, part-of, agentic-orchestration) is a subject-predicate-object triple. A fact store records these triples. The operations loop operates on them.

Relations have directionality. `part-of` runs from task to plan. `depends-on` runs from dependent to dependency. `assigned-to` runs from task to agent. The direction matters because operations flow along relations: completing a task cascades to its plan (along part-of), unblocks dependents (along depends-on), frees agent capacity (along assigned-to).

## The MUD parallel

Richard Bartle's *Designing Virtual Worlds* (2003) describes the architecture of Multi-User Dungeons: a world of entities with properties, states, actions, and containers. Players (agents) navigate rooms (containers), interact with objects (things), perform actions (acts), and the world state updates accordingly.

The work operations loop is the same architecture. The "world" is the organizational state â€” all projects, plans, tasks, agents, and their relations. An agent "enters" the world by starting a session. They "look around" by querying the datastore for their current context. They "act" by performing work that changes entity states. The world updates: task statuses change, plan progress advances, cascading effects fire.

The key difference from a fantasy MUD is not architectural â€” it is what the entities represent. Instead of swords and dragons, the entities are tasks and budgets. Instead of hit points, the qualities are priority and deadline. Instead of "go north," the acts are "assign task" and "complete review." But the modeling problem â€” entities with properties flowing through states in a world of containers â€” is identical.

Nystrom's *Game Programming Patterns* (2014) describes the Entity-Component-System (ECS) architecture that modern games use: entities are bare identifiers, components are data attached to entities, systems operate on entities that have specific component combinations. This is structurally identical to an entity-attribute-value store: entities are identified by ID, attributes are components, values are data, and operational processes are systems that operate on entities matching specific attribute patterns.

## What this means for the six stages

### Planning

Planning is the act of creating containers (plans) and populating them with things (tasks) arranged by relations (dependencies, ordering). The planner's job is to take a goal (a quality of a project) and decompose it into a container of tasks whose collective completion satisfies the goal. The plan's frontmatter â€” goal, tasks, ordering, dependencies â€” IS the plan. The plan is not a document about what to do. It is a structured container of work entities.

### Dispatch

Dispatch is the act of creating assigned-to relations between tasks and agents, respecting capability (the agent can do this type of work), authority (the agent is permitted to do this work), and capacity (the agent has bandwidth). Dispatch is constrained by deontic profiles: powers, duties, privileges, immunities. An agent's dispatch profile says what work they may accept (privilege), what work they must accept (duty), what work they can assign to others (power), and what work they cannot be forced to do (immunity).

### Execution

Execution is the sequence of acts that advances task state from "assigned" toward "completed." Execution produces artifacts, records events, and may create new work (discovered subtasks, bugs, dependencies). Execution is where the work type matters most: a process-type task executes deterministically, a procedure-type task executes with conditional routing, a derivation-type task produces a value through inference, an inquiry-type task discovers its own structure during execution.

### Tracking

Tracking is the continuous observation of work entity states. The tracking system reads the datastore, computes derived metrics (plan completion percentage, velocity, cycle time), and surfaces anomalies (blocked tasks, overdue items, capacity overruns). Tracking does not act â€” it observes and reports. Status dashboards, briefing reports, and progress summaries are tracking tools â€” they query the work records and compose views from entity metadata.

### Review

Review is the act of comparing actual outcomes against planned outcomes. A review takes a plan (the intended state) and the current state (the actual state) and produces a judgment: what went as planned, what didn't, why. Review produces records â€” decision records, lessons learned, adjustment recommendations. Review is where Argyris's double-loop learning applies: single-loop review asks "did we execute the plan?" Double-loop review asks "was the plan the right plan?"

### Feedback

Feedback is the act of modifying future work based on review findings. A feedback act changes a plan, adjusts a process, updates a policy, or redefines a term. Feedback closes the loop: the output of review becomes the input to planning. Without feedback, the system runs open-loop â€” it plans and executes but never learns. With feedback, each iteration of the loop produces a better-calibrated system.

## The settlement path

The four [work types](../terms/work.md) â€” process, procedure, derivation, inquiry â€” describe where work sits on the settlement path from open to determined:

| Work type | Meaning settled? | Execution settled? | Example in ops |
|-----------|-----------------|-------------------|----------------|
| Process | Yes | Yes | "Run the daily standup at 9am" |
| Procedure | Yes | No | "Review the PR using the checklist, branching on findings" |
| Derivation | No | Yes | "Compute plan progress from task statuses" |
| Inquiry | No | No | "Figure out how to model agent capacity" |

The operations loop itself settles over time. When you first build a planning system, planning is inquiry â€” you don't know what terms to use or what structure plans should have. As vocabulary solidifies, planning becomes procedure â€” you know the steps but adapt to each case. Eventually, for routine work, planning becomes process â€” a deterministic template applied without judgment.

This is what makes such a system an ERP: the machinery for handling work at every level of settlement. An ERP doesn't just handle the settled cases (process). It handles the full spectrum â€” from inquiry ("what should we build?") through derivation ("compute the cost") through procedure ("follow the approval workflow") to process ("generate the invoice"). The six-stage loop operating across all four work types IS enterprise resource planning, grounded in ontology rather than in accounting software conventions.

## See also

- [thing](../../../../philosophy/terms/thing.md), [act](../../../../philosophy/terms/act.md), [state](../../../../philosophy/terms/state.md), [container](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/container.md), [vessel](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md) â€” the foundational ontology
- [task](../terms/task.md), [plan](../terms/plan.md), [project](../terms/project.md), [work](../terms/work.md) â€” work domain terms
- [office](../terms/office.md), [delegation](../terms/delegation.md) â€” governance terms relevant to dispatch
- [process](../terms/process.md), [procedure](../../glossary/terms/procedure.md), [derivation](../terms/derivation.md), [inquiry](../terms/inquiry.md) â€” the four work types
