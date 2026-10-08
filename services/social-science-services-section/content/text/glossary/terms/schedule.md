---
name: "Schedule"
description: "A time-bound mapping of work units to calendar intervals — the commitment that turns a plan's structure into a sequence of deadlines."
date-created: 2026-04-03
instance-of: relation
relates: [plan, task, deadline, cadence]
part-of-stage: planning
references:
  kelley-walker1959:
    authors:
      - James E. Kelley Jr.
      - Morgan R. Walker
    title: Critical-Path Planning and Scheduling
    year: 1959
    publication: Proceedings of the Eastern Joint Computer Conference
  goldratt1997:
    authors:
      - Eliyahu M. Goldratt
    title: Critical Chain
    year: 1997
    publication: North River Press
  bratman1987:
    authors:
      - Michael E. Bratman
    title: Intention, Plans, and Practical Reason
    year: 1987
    publication: Harvard University Press
---

A schedule is a mapping from [work units](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-unit.md) to time intervals.
Where a [plan](plan.md) specifies what must be done and in what order, a schedule specifies when.
The plan says "task B depends on task A."
The schedule says "task A starts Monday, task B starts Wednesday."

A schedule commits resources to time.
Once a task is scheduled, the agent's time in that interval is spoken for.
This is why Bratman (1987) treats plans as commitments that constrain future deliberation: a schedule forecloses alternatives.
If you've scheduled the code review for Thursday, you stop considering whether to do the code review — the question is settled, and your attention goes to what else needs to happen by Thursday.

Scheduling requires two inputs: the dependency structure of the plan (which tasks can start only after others complete) and the availability of agents (who can do what, and when).
The Critical Path Method (Kelley and Walker 1959) computes the earliest possible schedule from dependencies alone.
Critical Chain scheduling (Goldratt 1997) adds resource constraints — if two tasks need the same agent, they cannot be scheduled in parallel regardless of what the dependency graph allows.

A schedule is not a prediction.
It is a norm against which actual progress is measured.
The tracking stage compares actual completion times against the schedule to compute schedule variance.
Positive variance means ahead of schedule; negative means behind.
The schedule is the baseline that makes tracking meaningful — without it, you can observe but not evaluate.

Scheduling means assigning time-related attributes to tasks — start dates, end dates, and deadlines.
A well-structured datastore makes the schedule queryable: "what is due this week?" becomes a query, not a search.
The [cadence](cadence.md) defines the rhythm; the schedule populates it with specific work.

See [Planning and Scheduling Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-planning-and-scheduling-survey.md) for the full theoretical grounding.
