---
title: "Cycle"
description: "One complete iteration of a recurrence pattern — from start through all phases back to the starting condition, carrying novelty from each pass."
date-created: 2026-04-04
aliases:
  - "cycle"
  - "cycles"
instance-of: thing
component-of: [recurrence, cadence]
enables: [phase-sequencing, temporal-closure, feedback-incorporation]
contrasts-with: [repetition, recurrence, phase]
requires: [recurrence, time]
applies-to: [review, sprint, fiscal-year, cadence, governance]
references:
  - id: deming1986
    type: document
    title: Out of the Crisis
    author:
      - literal: W. Edwards Deming
    container-title: MIT Press
    issued:
      - year: 1986
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    container-title: Celeritas Publishing
    issued:
      - year: 2009
  - id: prigogine1997
    type: document
    title: The End of Certainty: Time, Chaos, and the New Laws of Nature
    author:
      - literal: Ilya Prigogine
    container-title: Free Press
    issued:
      - year: 1997
---

A cycle is one complete iteration of a [recurrence](./recurrence.md) pattern — a single turn from start through all phases back to the starting structural condition. The distinction matters precisely: [recurrence](./recurrence.md) names the pattern itself (the fact that reviews happen); a cycle is one instance of that pattern (this week's review). A fiscal year that runs January through December is a recurrence. The fiscal year that just closed is one cycle of that recurrence.

Cycles have [phases](../../../../philosophy/terms/state.md). The Deming cycle (PDCA) has four: Plan, Do, Check, Act. A sprint cycle has: planning, execution, review, retrospective. A governance cycle has: proposal, enactment, execution, assessment. The phases need not be equal in length; what matters is that together they complete the pattern. When the last phase ends and the pattern restarts, one cycle has finished and the next begins.

What separates a cycle from mere [repetition](../../../../philosophy/terms/event.md) is that each cycle carries novelty into the next. Ilya Prigogine (1997) shows that time has an irreversible arrow — forward means genuinely new states become possible. The second sprint is not the same as the first. The work has changed. The team has learned. The market has shifted. The [cycle](./cycle.md) that spirals around contains the same pattern, but in changed circumstances. The spiral metaphor from the library's [time](../../../../philosophy/terms/time.md) term captures this: the pattern returns (true); the world moves forward (also true). Each cycle is structurally identical to the one before it and substantively distinct because time flows only forward.

Cycles compose across temporal scales. Daily cycles nest within weekly cycles, weekly within monthly, monthly within quarterly, quarterly within annual. Each scale is a cycle in its own right. A standup is a one-day cycle — preparation, sync, dispersal. A sprint is a two-week cycle — planning, execution, review, retro. A fiscal year is a twelve-month cycle — quarters, reviews, audits, planning for the next year. This nesting is how the system's multi-scale objectives work: each temporal scale runs its cycle, and information flows both upward (lessons from daily cycles inform weekly cycles) and downward (weekly plans constrain daily cycles).

Reinertsen (2009) grounds cycle time in product flow. A shorter cycle means faster feedback. Feedback is how the system learns — what worked, what failed, what changed, what needs adjusting. A team that cycles every two weeks gets feedback twice as often as a team that cycles every month. This accelerates learning. In manufacturing, shorter batch cycles reduce inventory and improve responsiveness. In knowledge work, shorter review cycles reduce the lag between deciding something is wrong and fixing it. This is why agile prefers two-week sprints over six-month release cycles.

The phase-based structure of cycles is what enables governance. An organization that never cycles through review never learns. An organization that reviews once a year can only adjust once a year. An organization that reviews monthly can adjust twelve times a year. The cycle is the atomic unit of organizational learning — complete the cycle (execute through review), extract the lesson, feed it back into the next cycle, continue. Deming's PDCA cycle (1986) encoded this: every useful cycle includes both doing and checking, so that doing produces results and checking produces learning.

Cycles and [deadlines](./deadline.md) are related but distinct. A deadline marks a fixed point in time where something must be complete. A cycle is the repeated pattern of execution that produces that completion. A fiscal year has a deadline (December 31); the cycle is the pattern of quarterly reviews, adjustments, and planning that the deadline shapes. A sprint has a deadline (end of two weeks); the cycle is the pattern of planning, execution, and review. The deadline gives the cycle its temporal boundary; the cycle gives the deadline its meaning as a checkpoint within a recurrence.

See also: [Recurrence](./recurrence.md) · [Cadence](./cadence.md) · [Phase](../../../../philosophy/terms/state.md) · [Time](../../../../philosophy/terms/time.md) · [Deadline](./deadline.md) · [Review](./review.md)
