---
name: "Assignment"
description: "The act of creating a relation between a work unit and an agent — routing specific work to a specific doer with defined authority and capacity constraints."
date-created: 2026-04-03
instance-of: act
produces: [relation]
requires: [capability, authority, capacity]
part-of-stage: dispatch
references:
  mintzberg1979:
    authors:
      - Henry Mintzberg
    title: The Structuring of Organizations
    year: 1979
  gerkey-mataric2004:
    authors:
      - Brian P. Gerkey
      - Maja J. Matarić
    title: A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems
    year: 2004
    publication: International Journal of Robotics Research, 23(9)
---

An assignment is the [act](../../../../philosophy/terms/act.md) of creating a relation between a [work unit](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-unit.md) and an agent.
When a [task](task.md) is assigned, it gains an assignee — an agent who is now responsible for advancing it.
The assignment is the central act of the dispatch stage.

An assignment is not just "telling someone to do something."
It is a structured act that checks three conditions before it can succeed:

**Capability** — the agent can do this type of work.
A code review task requires an agent with code review skills.
A term-writing task requires an agent with the writing-terms skill.
Capability is a [quality](../../../../philosophy/terms/quality.md) of the agent, matched against a requirement of the task.

**Authority** — the agent is permitted to do this work within this scope.
In Hohfeldian terms: the agent has the privilege to perform the work, and the assigner has the power to create the assignment.
An agent cannot accept work outside its authority scope.
A dispatcher cannot assign work beyond its delegation power.

**Capacity** — the agent has bandwidth.
An agent with 15 tasks in progress should not receive a 16th.
Little's Law governs this: more work in progress means longer cycle time per task.
Capacity checking prevents overload.

An assignment creates an [event](../../../../philosophy/terms/event.md) — a timestamped record of who assigned what to whom, under what authority, at what time.
The event is part of the audit trail.
It cannot be silently undone; reassignment creates a new event.

In multi-agent systems (Gerkey and Matarić 2004), assignments can be instantaneous (decided once) or time-extended (adjusted as conditions change).
A settlement-carrier system typically uses time-extended assignment: tasks can be reassigned if agents fail, become unavailable, or if the work changes.

See [Dispatch and Delegation Survey](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md) for the full theoretical grounding.
