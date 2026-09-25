---
type: concept
class: structure
depends-on: [agent]
see-also: [memory, dispatch]
title: Session
description: A bounded interaction between an agent and the platform — a sub-region of the predication-graph store recording the agent's identity, the work it is doing, the messages exchanged in the course of the work, and the witness chain produced.
---

# Session

A bounded interaction between an [agent](agent.md) and the platform — a sub-region of the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) recording the agent's identity, the work it is doing, the messages exchanged in the course of the work, and the [witness](../../teaching/explanations/witness.md) chain produced.
A session is the engineering pattern for "what is this agent doing right now, and what has it done in this interaction."

Three properties:

- **Time-bounded.** A session has a start (an agent registers, an inbox message arrives, a runbook begins) and an end (the work completes, the runbook concludes, the agent disconnects).
  Within the bounds, predications accumulate; outside the bounds, the session is closed and no further predications are admitted to it.
- **Agent-bounded.** A session has exactly one primary agent.
  Multi-agent work is multiple sessions, possibly in [federation](federation.md).
  The session-as-context discipline is what lets a single agent's actions be reasoned about and audited as a unit.
- **Memory-coupled.** A session's predications include or reference the agent's working [memory](memory.md) for the session — the bound state, the recently-traversed entities, the messages exchanged.
  The memory is what lets the session resume after interruption and what lets the platform compute settlement of the session's work (per [settlement](settlement.md)).

A session is *not* the same as a [scope](../scope/scope.md).
A scope is a region of the predication graph; a session is a temporal slice of an agent's activity within a scope.
An agent operating in a scope may have many sessions over time; each session is a bounded record of one such operating period.

The structural commitment is that a session is itself a substrate entity: the session's start, its activity, its memory accumulation, its end are recorded as predications, queryable through the substrate's operators.
There is no separate session-management service that the substrate is unaware of; the substrate sees its own sessions as data, and operators act on sessions through the same primitives they use for other content.
