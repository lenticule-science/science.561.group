---
title: "Assignment"
description: "The act of creating a relation between a work unit and an agent — routing specific work to a specific doer with defined authority and capacity constraints."
date-created: 2026-04-03
instance-of: act
produces: [relation]
requires: [capability, authority, capacity]
part-of-stage: dispatch
references:
  - id: mintzberg1979
    type: document
    title: The Structuring of Organizations
    author:
      - literal: Henry Mintzberg
    issued:
      - year: 1979
  - id: gerkey-mataric2004
    type: document
    title: A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems
    author:
      - literal: Brian P. Gerkey
      - literal: Maja J. Matarić
    container-title: International Journal of Robotics Research, 23(9)
    issued:
      - year: 2004
---

An assignment is the [act](../../../../philosophy/terms/act.md) of creating a relation between a [work unit](./work-unit.md) and an agent. When a [task](./task.md) is assigned, it gains an assignee — an agent who is now responsible for advancing it. The assignment is the central act of the dispatch stage.

An assignment is not just "telling someone to do something." It is a structured act that checks three conditions before it can succeed:

**Capability** — the agent can do this type of work. A code review task requires an agent with code review skills. A term-writing task requires an agent with the writing-terms skill. Capability is a [quality](../../../../philosophy/terms/quality.md) of the agent, matched against a requirement of the task.

**Authority** — the agent is permitted to do this work within this scope. In Hohfeldian terms: the agent has the privilege to perform the work, and the assigner has the power to create the assignment. An agent cannot accept work outside its authority scope. A dispatcher cannot assign work beyond its delegation power.

**Capacity** — the agent has bandwidth. An agent with 15 tasks in progress should not receive a 16th. Little's Law governs this: more work in progress means longer cycle time per task. Capacity checking prevents overload.

An assignment creates an [event](../../../../philosophy/terms/event.md) — a timestamped record of who assigned what to whom, under what authority, at what time. The event is part of the audit trail. It cannot be silently undone; reassignment creates a new event.

In multi-agent systems (Gerkey and Matarić 2004), assignments can be instantaneous (decided once) or time-extended (adjusted as conditions change). A settlement-carrier system typically uses time-extended assignment: tasks can be reassigned if agents fail, become unavailable, or if the work changes.

See [Dispatch and Delegation Survey](../texts/dispatch-and-delegation-survey.md) for the full theoretical grounding.
