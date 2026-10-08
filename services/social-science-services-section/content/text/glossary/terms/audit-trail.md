---
name: "Audit Trail"
description: "An immutable sequence of events recording who did what, when, and why — the accountability backbone that makes the operations loop observable and reviewable."
date-created: 2026-04-03
instance-of: container
contains: [event]
part-of-stage: tracking
references:
  young2010:
    authors:
      - Greg Young
    title: CQRS and Event Sourcing
    year: 2010
    note: Community paper establishing event sourcing patterns
  iso15489:
    authors:
      - ISO
    title: ISO 15489-1:2016 Information and documentation — Records management
    year: 2016
  lamport1978:
    authors:
      - Leslie Lamport
    title: Time, Clocks, and the Ordering of Events in a Distributed System
    year: 1978
    publication: Communications of the ACM, 21(7)
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
Every stage of the operations loop both produces events (acts) and consumes them (the tracking stage reads events to compute [metrics](metric.md); the review stage reads events to evaluate outcomes).

See [Tracking and Measurement Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-tracking-and-measurement-survey.md) and [Cross-Cutting Concepts Survey](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/survey.md) for the full theoretical grounding.
