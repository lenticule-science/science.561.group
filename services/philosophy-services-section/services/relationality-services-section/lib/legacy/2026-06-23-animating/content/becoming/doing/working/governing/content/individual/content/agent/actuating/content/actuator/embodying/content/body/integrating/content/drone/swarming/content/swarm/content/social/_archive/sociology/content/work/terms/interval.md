---
name: "Interval"
description: "A bounded stretch of time between two points — the fundamental temporal unit of scheduling, allocation, and measurement."
date-created: 2026-04-04
aliases:
  - "intervals"
  - "time interval"
instance-of: relation
applies-to: [schedule, deadline, duration, cadence, task, plan, work-unit]
part-of-stage: cross-cutting
enables: [schedule, deadline, duration]
contrasts-with: [instant, point-in-time]
requires: [time]
references:
  - id: allen1983
    type: document
    title: Maintaining Knowledge about Temporal Intervals
    author:
      - literal: James F. Allen
    container-title: Communications of the ACM, Vol. 26, No. 11
    issued:
      - year: 1983
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    container-title: Celeritas Publishing
    issued:
      - year: 2009
  - id: bratman1987
    type: document
    title: Intention, Plans, and Practical Reason
    author:
      - literal: Michael E. Bratman
    container-title: Harvard University Press
    issued:
      - year: 1987
---

An interval is a bounded stretch of time with a definite beginning and end.
It is the fundamental temporal unit: the minimal structure required to speak of when something happens, how long something lasts, or when something must be done.

Intervals require two points.
The start is the moment the interval opens.
The end is the moment it closes.
Between them, all events that occur do so "during" the interval.
This simple structure is the foundation of all temporal reasoning in scheduling.
Without intervals, you cannot specify a [schedule](./schedule.md) (which maps tasks to time intervals) or a [deadline](./deadline.md) (which marks the end point of an interval by which work must complete).

James F.
Allen (1983) formalized interval algebra as the formal foundation for temporal reasoning.
Allen defines 13 possible relations between two intervals: before (A ends before B starts), meets (A ends exactly when B starts), overlaps (A and B share time but neither is contained in the other), during (A is completely contained within B), and their inverses, plus equals (the intervals are identical).
These relations are exhaustive and mutually exclusive — any two intervals stand in exactly one of these relations.
This algebra is the formal language used by temporal reasoning systems, from scheduling software to narrative databases to workflow engines.

Intervals can be open, closed, or half-open.
A closed interval has both endpoints fixed: "9am to 5pm" is a closed interval — you know exactly when it begins and when it ends.
A half-open interval has one endpoint fixed and the other contingent: "from now until the task is done" opens at a definite moment but closes only when a condition is met.
An open interval has no fixed endpoints: "sometime in the spring" names a season but not exact days.
Scheduling uses closed intervals because it requires commitments — explicit endpoints that agents can rely on.
The [schedule](./schedule.md) commits resources to closed intervals.

Intervals typically appear as attribute pairs on work records — a start date and an end date.
A task has a scheduled start and end.
A plan has a creation date and a completion date.
A [review](./review.md) happens at a fixed [cadence](./cadence.md) — each instance is an interval bounded by the trigger point and the review's end.
Querying intervals is fundamental to operational awareness: "which tasks are due this week?" is a query over intervals (the current week is an interval; tasks whose end date falls within it are "due this week").
The [duration](./duration.md) of a task is computed as the length of its interval.
The [deadline](./deadline.md) is the endpoint of an interval.

Bratman (1987) treats plans as commitments that constrain future deliberation.
Once you schedule a task into an interval — once you assign it to a closed interval — that interval is spoken for.
Your time within that interval is committed.
The schedule is what makes this commitment visible and queryable.
Reinertsen (2009) measures flow by the ratio of active work time to total cycle time: the total cycle time is the interval from the task's start to its completion, and work time is the portion of that interval during which active effort occurs.
The ratio reveals waiting, dependency blocking, and context-switching overhead.

Intervals are the grammatical foundation of temporal talk in operations.
Saying "we should finish next week" is imprecise until you specify an interval — which day next week?
Until what time?
The interval makes the commitment legible.
The schedule is a set of intervals assigned to work.
The [cadence](./cadence.md) is a set of recurring intervals.
Temporal reasoning, whether formal or informal, always operates on intervals.

See also: [Schedule](./schedule.md) · [Deadline](./deadline.md) · [Duration](./duration.md) · [Cadence](./cadence.md) · [Time](../../../../philosophy/terms/time.md)
