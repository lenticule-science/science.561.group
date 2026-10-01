---
name: "Bottleneck"
description: "The constraint that limits the throughput of the entire system — the single resource whose capacity determines how fast work flows."
date-created: 2026-04-03
instance-of: constraint
constrains: [system, flow]
part-of-stage: tracking
references:
  goldratt1984:
    authors:
      - Eliyahu M. Goldratt
      - Jeff Cox
    title: "The Goal: A Process of Ongoing Improvement"
    year: 1984
    publication: North River Press
  reinertsen2009:
    authors:
      - Donald G. Reinertsen
    title: The Principles of Product Development Flow
    year: 2009
    publication: Celeritas Publishing
  little1961:
    authors:
      - John D. C. Little
    title: "A Proof for the Queuing Formula: L = λW"
    year: 1961
    publication: Operations Research, 9(3)
---

A bottleneck is the [constraint](../../../../terms/constraint.md) that limits the throughput of the entire system.
It is not the slowest task or the busiest agent — it is the specific resource whose [capacity](capacity.md) determines how fast work flows from entry to completion.
Everything upstream of the bottleneck produces faster than it can consume; everything downstream starves.

Goldratt's Theory of Constraints (1984) provides the operational framework.
The five focusing steps: (1) **identify** the constraint — find where work accumulates (the longest [queue](queue.md)), (2) **exploit** it — ensure the constraint is never idle, never works on low-priority items, never wastes capacity on rework, (3) **subordinate** everything else to it — non-constraints serve the constraint's needs, not their own optimization, (4) **elevate** it — invest in increasing the constraint's capacity, (5) **repeat** — once this constraint is resolved, a new one emerges.

The identification is diagnostic: a bottleneck reveals itself through queue growth.
If tasks accumulate before the review stage but flow freely through dispatch and execution, review is the bottleneck.
If the dispatch queue is empty but the planning backlog grows, planning is the bottleneck.
Little's Law (1961) quantifies the relationship: longer queues at a stage mean that stage's throughput is lower than its input rate.

Reinertsen (2009) adds a nuance: the bottleneck is not always a processing stage.
It can be a decision point (waiting for approval), a shared resource (one specialist needed by multiple tasks), or a coordination mechanism (all teams must synchronize before release).
Decision bottlenecks are especially insidious because they look like idleness — nothing is being processed, but no one notices because the queue is invisible (it exists as pending decisions in someone's head, not as visible work items).

The tracking stage should identify bottlenecks by measuring queue length and cycle time at each stage of the operations loop.
The review stage should evaluate whether the current constraint-management strategy is working.
Common bottlenecks include decision latency, shared specialist availability, and session or context limits in automated systems.

See [Planning and Scheduling Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-planning-and-scheduling-survey.md) for constraint theory and [Tracking and Measurement Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-tracking-and-measurement-survey.md) for measurement.
