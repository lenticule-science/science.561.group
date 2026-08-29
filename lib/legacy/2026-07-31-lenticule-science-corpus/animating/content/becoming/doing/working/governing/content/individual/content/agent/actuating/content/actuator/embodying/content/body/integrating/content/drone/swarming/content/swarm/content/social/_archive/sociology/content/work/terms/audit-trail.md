---
title: "Audit Trail"
description: "An immutable sequence of events recording who did what, when, and why — the accountability backbone that makes the operations loop observable and reviewable."
defines: audit-trail
date-created: 2026-04-03
instance-of: container
contains: [event]
part-of-stage: tracking
references:
  - id: young2010
    type: document
    title: CQRS and Event Sourcing
    note: Community paper establishing event sourcing patterns
    author:
      - literal: Greg Young
    issued:
      - year: 2010
  - id: iso15489
    type: document
    title: ISO 15489-1:2016 Information and documentation — Records management
    author:
      - literal: ISO
    issued:
      - year: 2016
  - id: lamport1978
    type: document
    title: Time, Clocks, and the Ordering of Events in a Distributed System
    author:
      - literal: Leslie Lamport
    container-title: Communications of the ACM, 21(7)
    issued:
      - year: 1978
---

An audit trail is an immutable sequence of [events](../../../../philosophy/terms/event.md) recording who did what, when, and why.
Each event captures: the actor (agent or user), the action (what was done), the subject (what was acted upon), the previous state, the new state, and optionally the justification (why this act was performed).

The audit trail is the ground truth of the operations loop.
Current state is a derived view — a fold over the event log (Young 2010).
You can reconstruct any entity's state at any point in time by replaying events up to that moment.
You cannot reconstruct the history from current state alone, because current state discards the path that produced it.

ISO 15489 (2016) specifies four properties that records in an audit trail must have: **authenticity** (the record is what it claims to be), **reliability** (it accurately represents what happened), **integrity** (it is complete and unaltered), and **usability** (it can be found and interpreted).
In a version-controlled system, commit history provides authenticity and integrity.
An entity-attribute-value-time (EAVT) datastore provides usability — every fact is queryable by entity, attribute, or time.
Reliability depends on the events being captured at the point of action, not reconstructed after the fact.

In a distributed system, events from different agents may be concurrent — they have no causal ordering (Lamport 1978).
The audit trail must handle this: within a session, events are totally ordered by timestamp.
Across sessions, events are ordered by commit.
Across agents working in parallel (e.g. worktree isolation), events are reconciled at merge time.
Transaction IDs provide ordering within one build; version control provides ordering across builds.

A full audit trail covers all state transitions: task created, task assigned, task started, task completed, plan revised, review held.
Every stage of the operations loop both produces events (acts) and consumes them (the tracking stage reads events to compute [metrics](./metric.md); the review stage reads events to evaluate outcomes).

See [Tracking and Measurement Survey](../texts/tracking-and-measurement-survey.md) and [Cross-Cutting Concepts Survey](../texts/operations-cross-cutting-concepts-survey.md) for the full theoretical grounding.
