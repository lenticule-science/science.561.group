---
name: realizing-a-turn
description: "The realizing transformer with the produced cell-record bound to a turn. Input is the prior turn (or null for the first turn of a session); output is the next turn-record."
specializing: realizing
realizing: turn
agent-noun: realizer-of-a-turn
gerund: realizing-a-turn
imperative: realize-a-turn
originating: prior-turn
terminating: turn
---

A **realizing-a-turn** transformer fires the closure-rule that produces one [turn](../../../library/turn/turn.md).
The input is the prior turn (or null for the first turn of a session); the output is the new turn-record.

The next specialization step binds the originating session — see [realizing-a-turn-in-a-session](realizing-a-turn-in-a-session/realizing-a-turn-in-a-session.md).
