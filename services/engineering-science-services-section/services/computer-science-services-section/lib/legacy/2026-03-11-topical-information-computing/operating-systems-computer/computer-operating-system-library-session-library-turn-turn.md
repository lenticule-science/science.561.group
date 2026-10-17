---
name: turn
description: "One round of inference in a session: one user message, one assistant response, the tool calls between, plus the timings and token counts the inference-model emits. Turn is the structure produced by the realizing-a-turn-in-a-session-with-an-inference-model transformer and packaged as the v-payload of an EAVT row in the entity-session's jsonl."
specializing: thing
occurring-in: session
produced-by: inference-model
---

A **turn** is one round of inference: one user message into the inference-model, one assistant response out, and the tool calls the assistant made in between.
At the math layer the turn is an [object](../object/object.md) whose identity is its turn-id.
The turn is the unit the realizing transformer produces; the turn-record is what the logging transformer appends to a session's jsonl as the value-payload of an EAVT row.

## Turn is distinct from session

A [session](../session/session.md) is the ordered set of turns sharing a character and an inference-model run.
A turn is one element of that set.
The session is the entity-slug of EAVT rows; the turn is the value-payload.
The two structures are kept categorically separate: a session has many turns; a turn belongs to one session.

## Turn captures the inference-model's full output

The turn record captures everything the inference-model emits and consumes in one round — the user message text, the assistant message text, the model identifier and version, the tool-call sequence with each call's input and output, the started-at and ended-at timestamps, the input and output token counts, and the stop reason.
The realizing transformer assembles this record at end-of-turn and hands it to the logging transformer to append.

A turn's user-message and assistant-message fields are full text by default; large-payload sessions may substitute content-address references.
Tool-calls is an ordered list — each entry names the tool, its input, its output, its duration, and whether the call succeeded.
