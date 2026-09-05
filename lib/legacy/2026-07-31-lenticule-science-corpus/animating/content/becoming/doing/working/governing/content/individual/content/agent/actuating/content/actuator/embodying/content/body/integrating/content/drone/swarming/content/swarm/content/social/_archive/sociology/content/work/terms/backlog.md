---
title: "Backlog"
description: "A queue of candidate work units that have been captured but not yet committed to a plan — the holding area between idea and intention."
defines: backlog
date-created: 2026-04-03
instance-of: container
contains: [work-unit, task]
distinguished-from: [queue, plan]
part-of-stage: planning
references:
  - id: allen2001
    type: document
    title: Getting Things Done: The Art of Stress-Free Productivity
    author:
      - literal: David Allen
    container-title: Viking
    issued:
      - year: 2001
  - id: anderson2010
    type: document
    title: Kanban: Successful Evolutionary Change for Your Technology Business
    author:
      - literal: David J. Anderson
    container-title: Blue Hole Press
    issued:
      - year: 2010
---

A backlog is a [container](../../../../philosophy/terms/container.md) of candidate [work units](./work-unit.md) that have been captured but not yet committed to a [plan](./plan.md).
It is the holding area between "someone thought of this" and "we've decided to do this."

The backlog differs from a [queue](./queue.md) in commitment level.
Items in a queue are committed — they will be done, the question is when.
Items in a backlog are candidates — they might be done, promoted to a plan, deferred indefinitely, or discarded.
The backlog is where inputs accumulate before the planning stage evaluates and prioritizes them.

Allen (2001) calls this "capture": getting inputs out of your head and into a trusted system.
The backlog IS the trusted system for candidate work.
It replaces the cognitive burden of remembering what might need to be done with a queryable record of everything that has been proposed.

A backlog must be periodically groomed.
In kanban practice (Anderson 2010), backlog grooming means: reviewing each item, removing what is no longer relevant, refining what remains (adding detail, estimating effort, clarifying acceptance criteria), and reordering by priority.
An ungroomed backlog grows without bound and becomes noise — a list so long that nothing in it is findable.

In practice, the backlog is often the set of work records marked as candidates — captured but not yet promoted to a plan.
The planning stage's job is to evaluate the backlog and promote items into plans.
The review stage may demote plan items back to the backlog when priorities shift.
The backlog is the buffer that decouples idea capture from work commitment.

See [Planning and Scheduling Survey](../texts/planning-and-scheduling-survey.md) for the capture-clarify-organize pattern.
