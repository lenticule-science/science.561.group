---
name: realizing-a-turn-in-a-session
description: "The realizing-a-turn transformer with the originating session bound. Input requires a session-id; output is a turn-record bearing that session-id in its session field."
specializing: realizing-a-turn
realizing: turn
in: session
agent-noun: realizer-of-a-turn-in-a-session
gerund: realizing-a-turn-in-a-session
imperative: realize-a-turn-in-a-session
originating: session-id-and-prior-turn
terminating: turn
---

A **realizing-a-turn-in-a-session** transformer fires the closure-rule that produces one [turn](../../../../library/turn/turn.md) belonging to a specified [session](../../../../library/session/session.md).
The input requires a session-id; the output is a turn-record whose `session` field is that session-id.

The next specialization step binds the inference-model — see [realizing-a-turn-in-a-session-with-an-inference-model](realizing-a-turn-in-a-session-with-an-inference-model/realizing-a-turn-in-a-session-with-an-inference-model.md).
