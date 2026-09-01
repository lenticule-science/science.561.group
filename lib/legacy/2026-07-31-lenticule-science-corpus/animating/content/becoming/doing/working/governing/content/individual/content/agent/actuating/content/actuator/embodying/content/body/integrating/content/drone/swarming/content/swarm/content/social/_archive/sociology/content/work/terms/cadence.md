---
name: "Cadence"
description: "The rhythm of recurring operational events — standups, reviews, retrospectives, planning cycles — that creates predictability and natural checkpoints across time scales."
date-created: 2026-04-03
instance-of: quality
applies-to: [operations-loop]
part-of-stage: cross-cutting
references:
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    issued:
      - year: 2009
---

Cadence is the rhythm of recurring operational [events](../../../../philosophy/terms/event.md) — the regular beats at which the operations loop runs its stages.
A daily standup.
A weekly review.
A monthly retrospective.
A quarterly planning cycle.
Cadence creates predictability: everyone knows when things happen, which reduces coordination overhead.

Cadence operates at multiple time scales simultaneously:

| Scale | Cadence | Loop stages emphasized |
|-------|---------|----------------------|
| Turn | Per agent message | Tracking (environment composition) |
| Session | Per work session | all declared required stages within session scope |
| Daily | Once per day | Dispatch, tracking |
| Weekly | Once per week | Review, planning |
| Monthly | Once per month | Feedback, project review |
| Quarterly | Once per quarter | Goal review, strategy adjustment |

Each level feeds the one above it.
Daily tracking surfaces weekly themes.
Weekly reviews feed monthly assessments.
The information flows upward; the direction flows downward.

Reinertsen (2009) distinguishes cadence from synchronization.
Cadence is the regular rhythm.
Synchronization is the alignment of multiple rhythms.
A sprint is cadence — it happens every two weeks.
A release is synchronization — it aligns the output of multiple teams at a single point.
The operations loop needs both: cadence for predictability within stages, synchronization for handoffs between stages.

Cadence should be encoded as scheduled events, not just habits.
A weekly review that depends on someone remembering to do it will be forgotten.
A weekly review triggered by a scheduled hook will happen.
This is the settlement path applied to cadence: move from inquiry (we should probably review sometimes) through procedure (we review when we remember) to process (the system triggers a review every Friday at 3pm).
