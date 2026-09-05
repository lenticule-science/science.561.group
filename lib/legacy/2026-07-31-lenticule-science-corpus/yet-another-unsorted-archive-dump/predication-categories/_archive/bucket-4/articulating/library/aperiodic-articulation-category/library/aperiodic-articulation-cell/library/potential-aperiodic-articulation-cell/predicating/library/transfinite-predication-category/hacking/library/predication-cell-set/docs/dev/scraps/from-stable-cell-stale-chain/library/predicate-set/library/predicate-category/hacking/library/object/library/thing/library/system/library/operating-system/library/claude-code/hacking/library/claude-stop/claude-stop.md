---
name: claude stop
description: The Claude Code Stop event — the lifecycle moment at which a claude-session has finished its current turn and is about to release control back to the user.
---

A claude-stop is the event Claude Code fires when its assistant turn ends. It is the closing bracket of a single user-prompt / assistant-response cycle inside a [`claude-session`](claude-session.md); the session itself may persist through many stops before it closes.

The Stop event delivers JSON on stdin to its hook scripts: `session_id`, `transcript_path` (path to the session's JSONL transcript), and `stop_hook_active` (true iff Claude is already continuing in response to an earlier Stop-hook block, used to break loops). A Stop hook MAY return `{"decision":"block","reason":"..."}` to instruct Claude to continue its turn rather than stop; the `reason` is delivered to Claude as a follow-on instruction.

## Characteristic predication-shape

- `closes-turn-of(claude-stop, claude-session)` — the session whose turn this stop closes.
- `carries(claude-stop, {session_id, transcript_path, stop_hook_active})` — the payload the hook receives.
- `decides(claude-stop, {permit, block-with-reason})` — the two possible outcomes a Stop hook routes a stop to.
- `breaks-loop-on(claude-stop, stop_hook_active)` — a Stop hook MUST NOT block when `stop_hook_active` is true.
