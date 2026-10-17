---
name: logging-a-turn
description: "The logging transformer with the v-payload bound to a turn. logging-a-turn takes a turn-record plus a target jsonl path and appends an EAVT row whose v is the turn-record. Validates the turn against the turn JSON schema before appending."
specializing: logging
logging: turn
agent-noun: logger-of-a-turn
gerund: logging-a-turn
imperative: log-a-turn
originating: turn
terminating: appended-row
---

A **logging-a-turn** transformer appends a [turn](../../../library/turn/turn.md) record as the v-payload of an EAVT row.
The input is a turn-record plus a target jsonl path; the output is the appended row plus a success indicator.
Before appending, the turn-record is validated against [the turn JSON schema](../../../library/turn/turn.schema.json); validation failures abort the append and surface as `{appended: false, error: <diagnostic>}`.

The next specialization step binds the originating session — see [logging-a-turn-in-a-session](logging-a-turn-in-a-session/logging-a-turn-in-a-session.md).
