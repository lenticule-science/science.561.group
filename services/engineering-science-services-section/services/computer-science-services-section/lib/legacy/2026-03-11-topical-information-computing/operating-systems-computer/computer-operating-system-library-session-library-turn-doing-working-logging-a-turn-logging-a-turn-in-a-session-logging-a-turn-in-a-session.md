---
name: logging-a-turn-in-a-session
description: "The logging-a-turn transformer with the target jsonl resolved to the named session's own jsonl. Input is a session-id plus a turn-record; the transformer resolves the target jsonl to the session's directory at the realizing leaf's library and appends the EAVT row there. The session-id becomes the e (entity-slug) of the row."
specializing: logging-a-turn
logging: turn
in: session
agent-noun: logger-of-a-turn-in-a-session
gerund: logging-a-turn-in-a-session
imperative: log-a-turn-in-a-session
originating: session-id-and-turn
terminating: appended-row
---

A **logging-a-turn-in-a-session** transformer resolves the target jsonl from a session-id and appends a turn-record as the v-payload.
The input is a session-id (the [session](../../../../library/session/session.md) name) plus a turn-record; the target jsonl is computed as the session's `<session-id>.jsonl` under the realizing leaf's `library/<session-id>/` directory.
If the session directory does not yet exist, the transformer creates it with the recursive-template files (`_index.md`, `<session-id>.md`, `<session-id>.schema.json`, `<session-id>.jsonl`) before appending.

The session-id becomes the e (entity-slug) of the appended row; the parent transformer's `a` (attribute) is the slug of whoever invoked logging-a-turn-in-a-session; the turn-record is the v (value); the t (transaction-id) is the ISO-8601 timestamp at append time.

The next specialization step binds the inference-model that produced the turn — see [logging-a-turn-in-a-session-with-an-inference-model](logging-a-turn-in-a-session-with-an-inference-model/logging-a-turn-in-a-session-with-an-inference-model.md).
