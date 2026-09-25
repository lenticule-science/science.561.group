---
title: "Cross-Cutting Concepts: Events, State Machines, Flow, Cadence, Records"
date-created: 2026-04-03
description: "Concepts that bind all declared required stages of the operations loop â€” events as ground truth, state machines for transitions, flow for throughput, cadence for rhythm, and records for accountability."
part-of: ops-research-foundations
references:
  young2010:
    authors: ["Greg Young"]
    title: "CQRS and Event Sourcing"
    note: "Community paper establishing event sourcing patterns"
    year: 2010
  harel1987:
    authors: ["David Harel"]
    title: "Statecharts: A Visual Formalism for Complex Systems"
    publication: "Science of Computer Programming, 8(3)"
    year: 1987
  reinertsen2009:
    authors: ["Donald G. Reinertsen"]
    title: "The Principles of Product Development Flow"
    publication: "Celeritas Publishing"
    year: 2009
  iso15489:
    authors: ["ISO"]
    title: "ISO 15489-1:2016 Information and documentation â€” Records management"
    year: 2016
  lamport1978:
    authors: ["Leslie Lamport"]
    title: "Time, Clocks, and the Ordering of Events in a Distributed System"
    publication: "Communications of the ACM, 21(7)"
    year: 1978
---

Some concepts don't belong to one stage of the operations loop â€” they span all declared required.
Events, state machines, flow, cadence, and records are the connective tissue that makes the loop one integrated system rather than six disconnected tools.

## Events as ground truth

Event sourcing (Young 2010) inverts the traditional data model.
Instead of storing the current state and modifying it in place, you store the sequence of events that produced the current state.
The current state is a derived view â€” a fold over the event log.

An event is an immutable fact: "Task-42 was assigned to Agent-7 at 2026-04-03T14:22:00Z."
You cannot change an event â€” you can only append new events that supersede previous ones.
The event log is the authoritative record.
Every other view (task status, plan progress, agent workload) is a projection computed from events.

For the operations loop: every act across all declared required stages should produce an event.
Planning creates "task-created" events.
Dispatch creates "task-assigned" events.
Execution creates "task-started" and "task-completed" events.
Tracking creates "metric-computed" events.
Review creates "review-held" events.
Feedback creates "plan-revised" events.

The event log is the audit trail.
It is also the data source for all tracking metrics (compute cycle time from events), all reviews (compare planned events to actual events), and all feedback (analyze event patterns to identify improvements).

An EAVT (Entity-Attribute-Value-Transaction) datastore is naturally event-structured.
Each fact has a transaction ID (the T in EAVT) â€” a monotonically increasing identifier that orders facts by when they were asserted.
The transaction IS the event.
Adding `status: completed` to a task is a transaction that records: entity, attribute, value, and the time it happened.

## State machines as behavior specification

Harel's statecharts (1987) provide a complete specification of what can happen.
A state machine defines: every state the system can be in, every transition between states, and the conditions under which each transition fires.

State machines span all declared required stages because work entities flow through states across stages.
A task in "planned" state (planning stage) transitions to "assigned" (dispatch stage) to "in progress" (execution stage) to "completed" (execution exit).
The state machine doesn't belong to one stage â€” it describes the entity's lifecycle across all stages.

The state machine also enables enforcement.
If the machine says "a task cannot transition from 'completed' back to 'in progress'," a hook can enforce this: block any edit that changes `status: completed` to `status: in progress`.
The enforcement is derived from the specification, not hardcoded as a special case.

In practice, the work entity state machine should be specified as a data structure â€” states, transitions, conditions â€” stored alongside the work records.
Enforcement layers read the specification and enforce it.
The specification is a record, not a hardcoded rule.
If the state machine changes (new states added, transitions modified), the enforcement automatically adapts because it reads the specification at runtime.

## Flow as value delivery

Reinertsen's flow model (2009) treats the operations loop as a value stream.
Work enters as demand (requests, goals, ideas) and exits as delivered value (completed tasks, shipped features, resolved incidents).
The time from entry to exit is lead time.
The rate of exit is throughput.
The amount in the system at any moment is WIP.

Flow spans all stages because work flows through all of them.
A bottleneck at any stage â€” slow planning, overloaded dispatch, stalled execution, delayed review â€” reduces the flow of the entire system.
Reinertsen's principle: optimize the system for flow, not for utilization of individual stages.

The economic framework makes trade-offs explicit.
Every decision has a cost of delay â€” the value lost per unit time while the decision is pending.
Prioritize by cost of delay: the work whose delay costs the most gets done first.
This applies to planning (which plans to create), dispatch (which tasks to assign), and feedback (which improvements to implement).

## Cadence as temporal structure

Cadence is the rhythm of recurring events.
A daily standup.
A weekly review.
A monthly retrospective.
A quarterly planning cycle.
Cadence provides predictability â€” everyone knows when things happen â€” and creates natural checkpoints for the operations loop.

Cadence operates at multiple time scales simultaneously: - **Session cadence** â€” each agent session is a micro-cycle: orient, execute, review - **Daily cadence** â€” standup, task progress, blocker identification - **Weekly cadence** â€” plan review, WIP adjustment, priority reassessment - **Monthly cadence** â€” project health review, resource reallocation - **Quarterly cadence** â€” goal review, strategy adjustment - **Annual cadence** â€” charter review, organizational assessment

Each cadence level feeds the one above it.
Daily standups surface weekly themes.
Weekly reviews feed monthly assessments.
The information flows upward; the direction flows downward.

In practice, cadence should be encoded as scheduled events.
A session-start procedure IS the start of session cadence.
A session-end evaluation IS the end of session cadence.
Weekly and monthly reviews require their own scheduled triggers â€” building them is a natural extension of any operations loop.

## Records as accountability

ISO 15489 (2016) defines a record as "information created, received, and maintained as evidence and as an asset by an organization or person, in pursuit of legal obligations or in the transaction of business."
Records have four properties:

**Authenticity** â€” the record is what it claims to be.
In a version-controlled system, commit history proves a file existed at a specific time with specific content.

**Reliability** â€” the record accurately represents the transaction it documents.
A well-designed event log captures what actually happened, not what was supposed to happen.

**Integrity** â€” the record is complete and unaltered.
Version control prevents silent alteration.
Transaction IDs in a datastore ensure ordering is preserved.

**Usability** â€” the record can be located, retrieved, and interpreted.
A queryable datastore makes all records accessible by any attribute.

Records span all stages because every stage produces records: plans, assignments, execution logs, metrics, reviews, feedback actions.
The records ARE the system's memory.
Without them, each cycle of the operations loop starts from scratch.

## Time in distributed systems

Leslie Lamport's *Time, Clocks, and the Ordering of Events in a Distributed System* (1978) establishes that in a distributed system, there is no global clock â€” only the partial ordering of events by causality.
Event A happened before event B if and only if A could have causally influenced B.

This matters for the operations loop because the system is distributed across sessions, agents, and time.
Two agents working in parallel may produce events that have no causal ordering â€” they are concurrent.
The system must handle concurrent events correctly: merging partial results, detecting conflicts, and resolving them.

An EAVT datastore's transaction IDs provide a total ordering within one session.
Across sessions, the ordering can be established by version control commits.
Across agents working in parallel (via isolated workspaces), the ordering is established at merge time.
The event model must accommodate all three cases.

## See also

- [The Ontology of Work Operations](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-ontology-of-work-operations.md) â€” the base mapping
- All five stage-specific surveys â€” planning, dispatch, execution, tracking, review, feedback

## Earlier material

Some concepts don't belong to one stage of the operations loop — they span all six. Events, state machines, flow, cadence, and records are the connective tissue that makes the loop one integrated system rather than six disconnected tools.

Cadence is the rhythm of recurring events. A daily standup. A weekly review. A monthly retrospective. A quarterly planning cycle. Cadence provides predictability — everyone knows when things happen — and creates natural checkpoints for the operations loop.

Cadence operates at multiple time scales simultaneously:
- **Session cadence** — each agent session is a micro-cycle: orient, execute, review
- **Daily cadence** — standup, task progress, blocker identification
- **Weekly cadence** — plan review, WIP adjustment, priority reassessment
- **Monthly cadence** — project health review, resource reallocation
- **Quarterly cadence** — goal review, strategy adjustment
- **Annual cadence** — charter review, organizational assessment

- [The Ontology of Work Operations](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/ontology-of-work-operations.md) — the base mapping
- All five stage-specific surveys — planning, dispatch, execution, tracking, review, feedback
