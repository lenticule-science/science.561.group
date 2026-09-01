---
title: "Availability"
description: "When an agent can work — the temporal constraint that rosters and schedules must respect, not the same as capacity or commitment."
date-created: 2026-04-04
instance-of: constraint
applies-to: [agent, roster, schedule, dispatch]
constrains: [assignment, dispatch, roster]
part-of-stage: dispatch
references:
  - id: goldratt1997
    type: document
    title: Critical Chain
    author:
      - literal: Eliyahu M. Goldratt
    container-title: North River Press
    issued:
      - year: 1997
  - id: harris-harris1957
    type: document
    title: Communication Theory and Its Applications
    author:
      - literal: Theodore Edward Harris
      - literal: Herman Rubin
    container-title: Annals of the Institute of Statistical Mathematics
    issued:
      - year: 1957
---

Availability is the set of [intervals](./interval.md) during which an agent is able and willing to work. It is a constraint, not a commitment — being available does not mean you are assigned; it means you *can be* assigned. Availability is the temporal precondition for [dispatch](../texts/dispatch-and-delegation-survey.md): no work can be assigned to an agent outside their available hours, regardless of [capacity](./capacity.md) or organizational need.

Availability has multiple dimensions. **Temporal availability** specifies which hours and days the agent can work: Monday through Friday, 9am to 5pm; or overnight shifts; or on-call windows. **Capability availability** specifies which roles the agent is qualified to fill during those hours — a junior agent may be available full-time but only qualified for certain task classes. **Energy availability** acknowledges that not all available hours are equal: the same agent has higher cognitive availability in the morning than at 11pm, but may still be technically available. Goldratt (1997) treats availability as the binding constraint in multi-resource systems — if two tasks need the same agent, neither can be scheduled when the other is running, regardless of dependency structure.

Availability differs from [capacity](./capacity.md) in a crucial way. Capacity is the amount of work an agent can handle in a given period — say, 40 hours per week. Availability is *when* that capacity falls on the calendar. Two agents with 40 hours/week capacity may have completely different availability patterns: one works mornings and has nights free; one works staggered shifts. The capacity pool is the same; the availability constraint is different.

Constraints on availability come from three sources. **Personal constraints** include family obligations, health needs, sleep requirements, and preferences (some agents work best early, others late). **Legal constraints** include maximum consecutive work hours without mandatory rest, protected leave (vacation, medical), and union agreements that may limit scheduling discretion. **Organizational constraints** include core hours when everyone must be present, recurring meetings, and ceremonies (standups, reviews) that occupy specific calendar slots.

In scheduling theory, availability gates the feasible region — it is the resource constraint that Critical Chain scheduling must respect. Harris and Rubin's communication model (1957) shows that any system coordinating multiple agents must have an availability protocol: a way for agents to signal when they are available. Without it, [dispatch](../texts/dispatch-and-delegation-survey.md) becomes guesswork.

Availability degrades under load. An agent nominally available but already assigned to six concurrent tasks has lower effective availability for a seventh: they may be technically available on the calendar, but practically overcommitted. This is why WIP limits protect availability — they prevent the assignment stage from overcommitting what the execution stage cannot actually do. The [roster](./roster.md) specifies potential availability; the [schedule](./schedule.md) operationalizes it by assigning specific work to specific intervals.

See [Schedule](./schedule.md), [Roster](./roster.md), and [Dispatch and Delegation Survey](../texts/dispatch-and-delegation-survey.md) for how availability constrains planning and execution.
