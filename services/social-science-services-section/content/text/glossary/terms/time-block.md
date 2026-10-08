---
name: "Time-Block"
description: "A reserved interval on a calendar for specific work — the unit of intentional time allocation that converts priority into scheduled action."
date-created: 2026-04-04
instance-of: interval
aliases:
  - "time blocking"
  - "block"
enables: [focus, deep-work, priority-execution]
requires: [interval, calendar, priority]
applies-to: [schedule, task, agent]
part-of-stage: planning
contrasts-with: [shift, meeting, context-switching]
references:
  newport2016:
    authors:
      - Cal Newport
    title: "Deep Work: Rules for Focused Success in a Distracted World"
    year: 2016
    publication: Grand Central Publishing
  covey1989:
    authors:
      - Stephen R. Covey
    title: The 7 Habits of Highly Effective People
    year: 1989
    publication: Free Press
---

A time-block is an [interval](interval.md) on a [calendar](calendar.md) reserved for specific work.
"9:00 to 11:00: draft the plan."
"Monday afternoon: code review."
The time-block turns intention into commitment by occupying calendar space — that interval is now spoken for.
It is the unit of intentional time allocation: the smallest structural element that converts a [priority](priority.md) into an executable schedule.

A time-block differs from a [shift](shift.md) in purpose and scope.
A shift assigns a person to a role for a time interval — the organization needs coverage.
A time-block assigns a specific piece of work to an interval on a person's calendar — the person needs focus.
Shifts are about coverage; time-blocks are about work.
A factory shift (8am–4pm) can contain multiple time-blocks (setup, production run, cleanup, handoff).
A time-block is more granular and more specific than a shift.

Cal Newport (2016) argues that time-blocking is the single most effective practice for knowledge work.
The argument: without explicitly reserving time for important work, reactive tasks (email, Slack messages, interruptions, meetings) consume all available time.
Reactive work expands to fill the available space — this is Parkinson's law applied to attention.
Time-blocking is the mechanism that protects important work from reactive displacement.
When a high-priority task is time-blocked, the agent's responsibility is not to answer email during that interval; it is to do the blocked work.
The block makes the commitment visible and defensible.
Without it, important work gets postponed indefinitely while urgent-but-trivial tasks accumulate.

Time-blocks respect [capacity](capacity.md).
An agent has a fixed amount of time per day.
If you block 9–11am, 1–3pm, and 4–5pm for focused work, you have three hours blocked and roughly five hours remaining for meetings, interruptions, and other work.
You cannot block more than exists.
Overblocking — scheduling more focused time than is actually available — creates conflict and forces renegotiation.
Underblocking — leaving most of the day unstructured — allows drift.
Real time-blocking systems compute available capacity (total hours minus meetings minus breaks) and then allocate that capacity to the highest-priority work items.

Time-blocks connect to [focus](../texts/focus-and-attention-survey.md) concepts: the block creates a bounded temporal interval within which attention should be directed at one thing.
The block is temporal structure; the focus is attentional structure.
A time-block from 9:00 to 11:00 is meaningless if the person is context-switching between five projects during that interval.
The block only functions if it aligns with focus discipline — the agent must protect the interval not just from external interruption but from internal distraction.

In practice, time-blocks are populated into a personal or team schedule from a [queue](queue.md) of prioritized work.
The dispatch system assigns work to the [schedule](schedule.md); time-blocking takes the schedule and makes it concrete — it assigns the scheduled work to specific calendar intervals, visible on the calendar.
A task with `scheduled-start: 2026-04-07` and `scheduled-end: 2026-04-09` is a schedule.
Marking those specific hours on the calendar as "working on task X" is a time-block.

See also: [Schedule](schedule.md) · [Interval](interval.md) · [Calendar](calendar.md) · [Priority](priority.md) · [Capacity](capacity.md) · [Shift](shift.md) · [Focus](../texts/focus-and-attention-survey.md)
