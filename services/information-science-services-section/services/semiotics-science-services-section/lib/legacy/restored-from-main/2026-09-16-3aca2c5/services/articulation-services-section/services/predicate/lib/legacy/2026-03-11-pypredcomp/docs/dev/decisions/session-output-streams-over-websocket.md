---
title: "Session output streams over WebSocket as substrate cells"
description: "Per-session stdout/stderr capture is a substrate-resident discipline: subprocesses' output is appended as `stream-chunk` cells at write time and pushed to subscribers (TUI shell, web GUI, federated peer) over the standard WebSocket transport. There is no out-of-band log stream."
kind: decision
date: "2026-05-02"
status: committed
---


## What

When a session spawns a subprocess (driver-mediated tool call, runbook step, REPL command), the substrate's runtime wraps the subprocess's stdout and stderr.
Each non-empty read produces a `stream-chunk` substrate event; each stream-close produces a `stream-end` event.
These events are first-class substrate cells with full audit and federation participation.

Subscribers — the TUI shell, the web GUI shell, federated observer peers, closure rules — see chunks via the standard WebSocket transport ([`network/websocket.md`](../specs/network/websocket.md) §3) using the existing `substrate-events.v1` subprotocol.
The streaming bridge is one transport binding for one event topic; there is no separate "log streaming" service.

The chunking discipline keeps the event log bounded:

- One chunk per non-empty PTY/pipe read, optionally coalesced under sub-millisecond reads (configurable upper bound `stream-chunk-max-bytes`, default 64 KiB; configurable lower latency bound `stream-chunk-flush-after-ord-delta`, default 4 ords).
- UTF-8 codepoint integrity preserved across chunk boundaries for `utf-8` streams.
- Per-`(session, process-handle, stream)` `chunk-seq` is a monotone integer that lets subscribers detect missed chunks.

Capability discipline applies: subscribing to a session's output requires the subscriber's capability fiber to admit `read:stream-chunk` against the producing session.
Federation peers receive chunks only when the producing session has asserted `(session, federate-stream-to, peer:<id>) = True`.

The full normative content lives in [`specs/process/session-output-streaming.md`](../specs/process/session-output-streaming.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §3.

## Why

ECC2 captured subprocess output via PTY readers and surfaced it through an internal channel that fanned out to UI panes.
That works for a single-process TUI shell.
It does not survive the OS's commitments:

- **Audit and replay.** Subprocess output is often the most informative trace of what a tool actually did.
  Storing it as substrate events lets the captain replay sessions byte-identically and inspect historical output via standard `entity_history` queries.
- **Federation.** A federated observer (e.g., the captain's other-machine TUI) needs to watch a session's output as it happens.
  WebSocket subscriptions are already the substrate's federation transport; adding `stream-chunk` as a topic is one event subscription, not a new transport.
- **Closure-rule surveillance.** Closure rules can subscribe to `stream-chunk` cells and pattern-match for failure indicators (`fatal`, `panic`, traceback signatures).
  This makes log aggregation a substrate primitive rather than a separate pipeline.
- **Capability discipline.** A session's output is sensitive; cross-boundary observation needs to go through $\Rightarrow$.
  Treating output as substrate cells routes the check through the same algebra as every other read.
- **TUI/web GUI parity.** Both shells need streaming output surfaces.
  Sharing the WebSocket subprotocol means one transport implementation, not two.

The chunking discipline (UTF-8 boundary preservation, monotone `chunk-seq`, configurable size/latency bounds) comes from the operational realities the captain has already lived with: terminals emit half-codepoints across reads; subscribers connecting mid-stream need to detect missed chunks; the event log can't grow at PTY-read frequency unbounded.
The defaults match what ECC2 needed in practice, generalized to bound the substrate's per-tick volume.

WebSocket as the transport is committed because: (a) it is already the substrate's live-update transport per [`shell/web-gui-shell.md`](../specs/shell/web-gui-shell.md) §1 and [`network/websocket.md`](../specs/network/websocket.md); (b) it works for browsers, TUIs, and federation peers without separate bindings; (c) HTTP/1.1 chunked-transfer is provided as a fallback for HTTP-only clients with identical semantics.
There is no new transport to spec.

The compaction option (per [`specs/process/session-output-streaming.md`](../specs/process/session-output-streaming.md) §8) handles the long-tail concern: archived sessions can collapse per-chunk events into per-stream content-addressed cells while preserving byte-identity at replay.
This is the same retention discipline as the rest of the event log.

Source: this conversation (2026-05-02); the captain's [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) (2026-05-02); ECC2 source at `operations/engineering/fars/src/everything-claude-code/ecc2/` (referenced, not read).

## What it rules out

- A separate log-streaming service (e.g., a sidecar `journald` or `loki` instance) with its own protocol.
  Streaming is a substrate event topic.
- Out-of-band log files written to disk.
  The event log IS the log.
- Per-process polling of stdout/stderr by subscribers.
  The runtime is the only writer of `stream-chunk` events; subscribers consume passively.
- Rendering ANSI escape codes server-side and discarding the raw bytes.
  The substrate keeps raw bytes; rendering is a view performed by the shell.
- Capability-bypass for output observation.
  Cross-boundary subscription goes through $\Rightarrow$.
- Splitting UTF-8 codepoints across chunks (the runtime buffers and re-prepends partial bytes).
- Federated streaming without explicit `federate-stream-to` consent.

## What it does not constrain

- The specific PTY or pipe-wrapping mechanism.
  Implementations choose between `pty`-based and pipe-based wrapping per OS.
- The subprocess's encoding.
  The substrate records `utf-8` or `binary`; downstream renderers decide how to display non-text streams.
- Whether to compact archived per-chunk events into per-stream content-addressed cells.
  Per-session opt-in via `(session, compact-streams-on-archive, True)`.
- The subscriber's UI rendering of streams (line-by-line, terminal-style, real-time tail).
  The substrate provides events; rendering is the shell's choice.
- Specific pattern-matching predicates on `stream-chunk` cells beyond the runtime's canonical `matches-pattern`.
  Custom predicates are normal substrate state.
- The exact values of `stream-chunk-max-bytes` and `stream-chunk-flush-after-ord-delta`.
  Per-deployment configurable; the defaults (64 KiB, 4 ords) are sane starting points.
- Whether subprocess startup events themselves emit stream-chunk events.
  Process lifecycle events are separate per [`process/lifecycle.md`](../specs/process/lifecycle.md); streaming is the output channel only.
