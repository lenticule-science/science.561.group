---
name: "Capacity"
description: "The amount of work an agent or system can handle in a given time period — the resource constraint that limits throughput and governs dispatch."
date-created: 2026-04-03
instance-of: quality
quality-of: [agent, system]
constrains: [assignment, dispatch]
part-of-stage: dispatch
references:
  little1961:
    authors:
      - John D. C. Little
    title: "A Proof for the Queuing Formula: L = λW"
    year: 1961
    publication: Operations Research, 9(3)
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
---

Capacity is the amount of work an agent or system can handle in a given time period.
It is a [quality](../../../../philosophy/terms/quality.md) of the agent — not a property of the work.
The same task takes different amounts of capacity from different agents depending on their skills, tools, and context.

Capacity has two dimensions: **throughput capacity** (how many work units can be completed per period) and **concurrent capacity** (how many work units can be in progress simultaneously).
These are related by Little's Law (1961): average items in system equals throughput times average time in system.
An agent who can complete 3 tasks per day and handles them sequentially has a concurrent capacity of about 1.
An agent who runs 5 tasks in parallel with 2-day cycle times has the same throughput but concurrent capacity of ~3.

Goldratt (1984) distinguishes between capacity and the constraint.
In any system, one resource is the bottleneck — the constraint that limits the system's throughput.
Every other resource has excess capacity relative to the constraint.
Optimizing a non-constraint's capacity doesn't improve the system.
The operations loop must identify which agent, skill, or resource is the constraint and protect its capacity above all else.

Reinertsen (2009) argues that capacity should not be fully utilized.
High utilization increases queue length exponentially — at 90% utilization, queues are roughly 9 times longer than at 50% utilization.
Knowledge work systems need slack — uncommitted capacity that absorbs variability.
Without slack, any unexpected work (an urgent bug, a changed requirement) cascades into delays across the system.

Capacity is often operationalized as a WIP limit: the maximum number of tasks an agent should have in progress simultaneously.
The dispatch stage checks capacity before creating an [assignment](assignment.md) — if the agent's current WIP equals or exceeds the limit, no new work is assigned.
The tracking stage monitors utilization: WIP / WIP limit.
Sustained high utilization (>80%) signals that the constraint needs attention.

See [Dispatch and Delegation Survey](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md) for how capacity constrains assignment.
