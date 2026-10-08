---
name: body natural
title: body natural
description: The per-instance live entity that incarnates a persona for the duration of a session.
---

The **per-instance live entity** that incarnates a persona for the duration of a session. Each Claude instance running a session is a body-natural; the persona is the body-politic that successive body-naturals wear.

A body-natural is *ephemeral*. It begins at session-open and terminates at session-close. It bears its session's runtime state, its session-bound keypair (if it signs ephemerally), and its accumulating session-record. The model the body-natural runs on is not pinned on the body-natural itself; it is derived at each dispatch from the intersection of the work's required skill and the `skills:` lists of registered inference-model receivers. When the session ends, the body-natural ends; the persona persists and accumulates the session's witnesses into its memory.

This is the form that *actually does the work in time T*. Persona claims the work afterward; body-natural performs it.

## Distinguishing predication-shape

- `incarnates-persona(body-natural, persona)` — for the duration of the session.
- `session-bounded-by(body-natural, session-record, t-from, t-to?)` — the session's lifetime.
- `incurs-cost(body-natural, cost-cells)` — token cost, wall-time cost, attention cost; the body-natural is the cost-bearer, not the persona.
- `terminates-at(body-natural, t-end)` — when the body-natural ceases.

## Step-induction role

Actual runtime work execution. A step happens *in* a body-natural's runtime; a tick advances the body-natural's session. Without body-natural as a distinct form, per-session resource consumption could not be tracked separately from per-persona accumulation.

Cost accounting: a body-natural-shaped session-record carries the session's tokens and dollars; the persona's memory accumulates the session's outputs but not the session's costs.

## Not synonymous with

- **Persona** — body-natural is the ephemeral instance; persona is the durable identity it incarnates.
- **Agent** — agent is operational-shape (skills, dispatchability); body-natural is per-session-instance-shape. Often a body-natural has agent-shape, but they are not the same form.
