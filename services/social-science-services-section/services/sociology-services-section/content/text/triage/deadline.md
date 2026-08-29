---
title: "Deadline"
description: "A fixed point in time by which a work unit must be completed — the temporal constraint that converts priority into urgency."
defines: deadline
date-created: 2026-04-03
instance-of: constraint
constrains: [task, plan, milestone]
part-of-stage: planning
references:
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    container-title: Celeritas Publishing
    issued:
      - year: 2009
  - id: goldratt1997
    type: document
    title: Critical Chain
    author:
      - literal: Eliyahu M. Goldratt
    container-title: North River Press
    issued:
      - year: 1997
---

A deadline is a fixed point in time by which a [work unit](./work-unit.md) must be completed. It converts priority (which work matters more) into urgency (which work matters now). A high-priority task with a distant deadline can wait. A low-priority task due tomorrow cannot.

Deadlines are constraints, not goals. A goal says what must be accomplished. A deadline says when. The distinction matters because a task can meet its deadline while failing its goal (rushed, low-quality completion) or miss its deadline while exceeding its goal (thorough, late completion). The tracking stage must evaluate both.

Reinertsen (2009) introduces cost of delay as the economic framework for deadlines. Every unit of time that a task remains incomplete has an economic cost — lost revenue, delayed capability, accumulated risk. The cost of delay makes deadlines commensurable: a task with $1000/day cost of delay and a deadline in 3 days is more urgent than a task with $100/day cost of delay due tomorrow. Cost of delay is the derivative of value with respect to time.

Goldratt (1997) warns against deadline proliferation. When every task has its own padded deadline, the padding is wasted (Parkinson's Law: work expands to fill the time available). Critical Chain scheduling aggregates deadline padding into shared buffers, making the uncertainty visible and manageable rather than hidden inside individual estimates.

A deadline is typically recorded as an attribute on a task or [milestone](./milestone.md). The tracking stage computes days-until-deadline and flags approaching or overdue items. The dispatch stage uses deadlines to break priority ties — among equally important tasks, the one with the nearest deadline goes first.

See [Planning and Scheduling Survey](../texts/planning-and-scheduling-survey.md) for the full theoretical grounding.
