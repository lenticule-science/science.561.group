---
name: realizing-a-turn-in-a-session-with-an-inference-model
description: "The leaf of the realizing specialization chain. Takes a session-id, an inference-model identifier, and a turn-record being produced; runs schema validation, dispatches the logging leaf to append the turn-record to the session's jsonl, and returns the appended row. Owns per-session-instance directories at library/<session-id>/."
specializing: realizing-a-turn-in-a-session
realizing: turn
in: session
with: inference-model
agent-noun: realizer-of-a-turn-in-a-session-with-an-inference-model
gerund: realizing-a-turn-in-a-session-with-an-inference-model
imperative: realize-a-turn-in-a-session-with-an-inference-model
originating: session-id-and-inference-model-and-turn
terminating: appended-row
---

A **realizing-a-turn-in-a-session-with-an-inference-model** transformer is the leaf of the realizing specialization chain.
The input requires a session-id, an inference-model identifier, and a turn-record.
The transformer dispatches [the logging leaf](../../../../logging/logging-a-turn/logging-a-turn-in-a-session/logging-a-turn-in-a-session-with-an-inference-model/logging-a-turn-in-a-session-with-an-inference-model.md) to append the turn-record to the session's jsonl.

## Per-session-instance directories

Each session-instance is realized as a directory at `library/<session-id>/`.
The recursive-template files are minted at session open by the logging leaf's `ensureSessionDirectory` — the realizing leaf does not need to mint them itself, since the first turn appended creates the directory as a side effect.

The session-instance directory accumulates one EAVT row per turn for the life of the session.
Closing the session is a separate operation — the session record's `ended-at` cell-record is appended as an EAVT row whose `a` is `closing-a-session`.

## Relationship to the logging leaf

Realizing is the action; logging is the witness.
The realizing leaf decides that a turn happened — runs schema validation, computes any derived cells, dispatches the closure-rule firing.
The logging leaf appends the EAVT row recording that decision.
The two are paired but distinct: the realizing leaf's `a` (attribute) in the EAVT row is its own slug; the logging leaf's job is the byte-level append-and-validate.

The MCP server and the Claude Code hooks typically call the logging leaf directly without going through the realizing leaf, because they are themselves the closure firing — they decide a turn happened by virtue of receiving a tool call.
The realizing leaf is the path used when a turn must be reconstructed or replayed from prior cells, where the closure-rule's firing is the explicit operation.
