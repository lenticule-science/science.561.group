---
name: respond-loop
description: The inner inference-cycle of a claude-session — one or more turns of (user-message → inference-model invocation → tool-call sequence → assistant-response), repeating until the model signals stop or the user cancels.
specializing: session
nested-inside: claude-session
composed-of: turn
---

A **respond-loop** is the inner cycle of a [claude-session](../claude-session/claude-session.md): the loop the session runs to respond to user input.
One trip through the loop consists of:

1. **User message arrives** — a [message](../../../message/message.md) with `has-direction: inbound`.
2. **Inference-model invocation** — the session sends the accumulated message history (system prompt + context injection + user message) to a [logical-inference-model-on-the-web](../../../../../inference-model/library/logical-inference-model-on-the-web/logical-inference-model-on-the-web.md), receives a sampled response (a [logical-inference](../../../../../inference-model/library/logical-inference/logical-inference.md)).
3. **Tool-call sequence** — if the response contains tool-use blocks, the session executes each tool call (each producing a [tool-use](../../../tool-use/tool-use.md) witness and an internal [skill-use](../../../skill-use/skill-use.md) witness), and feeds the results back to the model as a fresh inference-model invocation.
4. **Assistant message emitted** — once the model stops requesting tools, the assistant message is sent to the user (a message with `has-direction: outbound`).

The loop terminates per [the turn-realizing convention](../turn/turn.md) when the model returns a stop reason.

## Why respond-loop is a session sub-structure

The respond-loop is the temporal sub-structure of a claude-session — finer-grained than the session (one session contains many respond-loops, one per user message) but coarser than the turn (one respond-loop may contain many turns when tool calls trigger reasoning loops).
Promoting it to its own sub-structure under session/library/ gives the running-the-respond-loop-of-a-character morphism a lawful codomain attachment.

## Characteristic predication-shape

- `nested-inside(respond-loop, claude-session)` — the containing session.
- `triggered-by(respond-loop, message)` — the inbound user message that opened the loop.
- `composed-of(respond-loop, [turn])` — the turns that fired inside this loop.
- `terminated-by(respond-loop, stop-reason)` — the reason the loop ended (end_turn, stop_sequence, max_tokens, tool_use_with_pause, etc.).
- `started-at(respond-loop, time)` and `ended-at(respond-loop, time)` — the loop's wall-clock bracket.

## Not synonymous with

- **Turn** — a turn is one inference-model invocation plus its tool calls.
  A respond-loop is the user-prompt-to-assistant-message cycle, potentially containing many turns when tool calls chain.
- **Session** — a session is the full Claude Code runtime instance.
  A respond-loop is one user-input cycle inside that session.
