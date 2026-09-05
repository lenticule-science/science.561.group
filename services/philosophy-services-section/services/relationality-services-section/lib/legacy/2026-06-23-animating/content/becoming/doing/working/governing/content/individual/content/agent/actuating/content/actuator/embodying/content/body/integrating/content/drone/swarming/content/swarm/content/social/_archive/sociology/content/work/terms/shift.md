---
title: "Shift"
description: "A bounded work period assigned to a role-holder — the basic unit of organizational time allocation that turns scheduling into concrete human commitment."
defines: shift
date-created: 2026-04-04
instance-of: interval
aliases:
  - "shift"
  - "work shift"
applies-to: [roster, coverage, operations, dispatch]
part-of-stage: execution
enables: [roster, handoff, coverage]
contrasts-with: [task, project]
requires: [interval, role, agent]
references:
  - id: folkard-tucker2003
    type: document
    title: Shift Work, Safety, and Productivity
    author:
      - literal: Simon Folkard
      - literal: Philip Tucker
    container-title: Occupational Medicine
    issued:
      - year: 2003
  - id: mintzberg1979
    type: document
    title: The Structuring of Organizations
    author:
      - literal: Henry Mintzberg
    container-title: Prentice-Hall
    issued:
      - year: 1979
  - id: ida2020
    type: document
    title: Working Time Arrangements: Workplace Implications and Policy Considerations
    author:
      - literal: International Labour Organization
    container-title: ILO Publications
    issued:
      - year: 2020
---

A shift is an [interval](./interval.md) of time during which a specific person or role is assigned to cover a specific duty or function.
It is the basic building block of continuous or rotating work — the bridge between the abstract schedule and the concrete commitment of a human being to show up and work.

A shift has four essential components: a start time (when responsibility begins), an end time (when responsibility ends), a role or duty (what must be covered: cashier, nurse, operator, guard), and a person assigned (the agent who will perform it).
When a shift starts, that person becomes accountable.
When it ends, they transfer accountability to the next shift-holder in a [handoff](./handoff.md).
The shift makes abstract scheduling tangible: instead of "we need cashier coverage on Tuesday," it becomes "Jordan covers Tuesday 9am–5pm as the cashier."

Shifts compose into [coverage](./coverage.md) patterns — three 8-hour shifts cover 24 hours, two 12-hour shifts likewise, five 6-hour shifts spread it differently.
The choice of shift length is a tradeoff between fatigue and handoff cost.
Longer shifts (12–16 hours) reduce the number of handoffs, which means less context loss and fewer transition errors, but the worker's fatigue increases as the shift progresses, raising error rates in the final hours (Folkard and Tucker 2003).
Shorter shifts (4–6 hours) keep workers fresher but multiply the number of handoffs; each handoff is a moment where information can be lost and errors occur.
The roster — the pattern that assigns people to shifts — emerges from this tradeoff, the available workers, and the coverage requirement.

Shift work has documented physiological consequences.
Circadian rhythms are disrupted by night shifts and rotating schedules.
Sleep deprivation accumulates.
Social isolation intensifies for workers on off-hours.
The International Labour Organization (2020) establishes that shift length, rotation speed, and rotation direction (forward rotation — morning to evening to night — is less disruptive than backward rotation) all affect worker health, safety, and job performance.
This is why shift scheduling is a domain concern, not just an administrative convenience: poor shifts degrade both worker welfare and operational performance.

In incident management (Incident Command System), shifts are called "operational periods."
Each operational period is a fixed interval — typically 12 hours for long incidents — and each has an Incident Action Plan.
When the operational period ends, the incoming shift team receives a briefing on situation, objectives, and progress.
This is a formalized [handoff](./handoff.md) protocol: the exiting shift prepares intelligence for the incoming shift so the coverage does not break continuity.

See also: [Interval](./interval.md) · [Handoff](./handoff.md) · [Schedule](./schedule.md) · [Roster](./roster.md) · [Coverage](./coverage.md)
