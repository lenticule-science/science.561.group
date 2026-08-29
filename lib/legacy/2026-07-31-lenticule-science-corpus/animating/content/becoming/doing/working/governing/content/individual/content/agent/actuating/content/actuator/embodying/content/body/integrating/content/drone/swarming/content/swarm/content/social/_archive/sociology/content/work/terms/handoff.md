---
title: "Handoff"
description: "The act of transferring responsibility for a work unit from one agent to another — a transition that requires context transfer and authority reassignment."
defines: handoff
date-created: 2026-04-03
instance-of: act
produces: [event, assignment]
requires: [context, authority]
part-of-stage: execution
references:
  - id: mintzberg1979
    type: document
    title: The Structuring of Organizations
    author:
      - literal: Henry Mintzberg
    container-title: Prentice-Hall
    issued:
      - year: 1979
  - id: reason1990
    type: document
    title: Human Error
    author:
      - literal: James Reason
    container-title: Cambridge University Press
    issued:
      - year: 1990
  - id: garcia-molina-salem1987
    type: document
    title: Sagas
    author:
      - literal: Hector Garcia-Molina
      - literal: Kenneth Salem
    container-title: ACM SIGMOD Record, 16(3)
    issued:
      - year: 1987
---

A handoff is the [act](../../../../philosophy/terms/act.md) of transferring responsibility for a [work unit](./work-unit.md) from one agent to another.
It is not merely reassignment — it requires transferring enough context that the receiving agent can continue the work without starting over.

A handoff has three components:

**Context transfer** — the receiving agent must know what has been done, what remains, what was tried and failed, and what assumptions are in play.
In multi-agent AI systems, context loss at handoff is the primary failure mode.
An agent that picks up a task mid-stream without context will repeat work, miss nuance, or contradict earlier decisions.
Cold-start executable plans (where each step carries enough context to be picked up independently) are a structural mitigation.

**Authority transfer** — the receiving agent must have the same authority scope as the sending agent, or a deliberate change of scope must be recorded.
In Mintzberg's (1979) terms, the coordination mechanism may shift at the handoff: direct supervision within a session becomes standardization of outputs between sessions, because the supervisor (user) may not be present for the second agent's work.

**State preservation** — the work unit's state must be recorded before the handoff.
If the sending agent was mid-task with partial progress, that progress must be captured in the record (commit, frontmatter update, session log) so it is not lost.
The saga pattern (Garcia-Molina and Salem 1987) is relevant: a handoff mid-saga means the receiving agent must know which steps have completed and which compensating actions are available.

Handoffs are error-prone.
Reason (1990) identifies transitions — shift changes, role transfers, stage boundaries — as high-risk moments in any system.
Information is lost, assumptions diverge, and the defensive layers that caught errors for one agent may not be calibrated for another.
The operations loop should minimize unnecessary handoffs (keep work with one agent when possible) and make necessary handoffs explicit (recorded events with context, not silent reassignments).

A well-structured handoff produces a timestamped record of who transferred what to whom, with a reference to the context (session log, commit, or notes) that the receiving agent needs.
Automated environment composition can partially address context transfer, but cross-session handoffs typically require richer context than any single mechanism can provide.
Session logs, plan frontmatter, and structured notes serve as common handoff artifacts.

See [Execution and Monitoring Survey](../texts/execution-and-monitoring-survey.md) for error models at transitions.
