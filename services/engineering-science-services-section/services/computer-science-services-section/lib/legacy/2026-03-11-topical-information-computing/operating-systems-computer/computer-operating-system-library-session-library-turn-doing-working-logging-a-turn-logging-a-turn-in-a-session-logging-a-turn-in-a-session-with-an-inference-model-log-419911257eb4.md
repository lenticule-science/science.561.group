---
name: logging-a-turn-in-a-session-with-an-inference-model
description: "The leaf of the logging specialization chain. Takes a session-id, an inference-model identifier, and a turn-record; validates the turn against the turn JSON schema; resolves the target jsonl to realizing-a-turn-in-a-session-with-an-inference-model/library/<session-id>/<session-id>.jsonl; appends the EAVT row whose e is the session-id, whose a is realizing-a-turn-in-a-session-with-an-inference-model, whose v is the turn-record, whose t is the ISO-8601 append timestamp."
specializing: logging-a-turn-in-a-session
logging: turn
in: session
with: inference-model
agent-noun: logger-of-a-turn-in-a-session-with-an-inference-model
gerund: logging-a-turn-in-a-session-with-an-inference-model
imperative: log-a-turn-in-a-session-with-an-inference-model
originating: session-id-and-inference-model-and-turn
terminating: appended-row
---

A **logging-a-turn-in-a-session-with-an-inference-model** transformer is the leaf of the logging specialization chain.
The input requires three fields: the session-id (a [name](../../../../library/name/name.schema.json) identifying the [session](../../../../library/session/session.md)), the inference-model identifier (the model that produced the turn), and a [turn](../../../../library/turn/turn.md) record.

The transformer's behavior:

1. **Validate.** The turn-record is validated against [the turn JSON schema](../../../../library/turn/turn.schema.json).
  Validation failure aborts the operation; nothing is written; the output is `{appended: false, error: <diagnostic>}`.
2. **Resolve target.** The target jsonl path is `doing/working/hacking/doing/working/realizing/realizing-a-turn/realizing-a-turn-in-a-session/realizing-a-turn-in-a-session-with-an-inference-model/library/<session-id>/<session-id>.jsonl` relative to the repository root.
3. **Create session directory if needed.** If `library/<session-id>/` does not exist, the transformer creates it and writes the recursive-template identity files: `_index.md`, `<session-id>.md`, `<session-id>.schema.json` (referencing [the session JSON schema](../../../../library/session/session.schema.json)), and an empty `<session-id>.jsonl`.
4. **Append.** One EAVT row is appended to `<session-id>.jsonl`:
   - `e` = the session-id
   - `a` = `realizing-a-turn-in-a-session-with-an-inference-model` (the closure-rule whose firing produced the turn)
   - `v` = the turn-record
   - `t` = ISO-8601 timestamp at append time
5. **Return.** `{appended: true, row: <the row>}`.

The transformer is the only path through which turn-records are appended to a session's jsonl.
The MCP server calls it from `setRequestHandler(CallToolRequestSchema)` at the end of each tool call to append the turn the tool call was part of.
The Claude Code Pre/PostToolUse hooks call it directly when a tool call happens outside the MCP server.
The realizing-a-turn-in-a-session-with-an-inference-model transformer also calls it from its end-of-turn closure firing.

The session-id source depends on the caller — the MCP server mints one at process startup; the Claude Code hooks read it from the hook input's `session_id` field.
Both shapes conform to the [name JSON schema](../../../../library/name/name.schema.json) so long as the caller normalizes the timestamp colons to hyphens.
