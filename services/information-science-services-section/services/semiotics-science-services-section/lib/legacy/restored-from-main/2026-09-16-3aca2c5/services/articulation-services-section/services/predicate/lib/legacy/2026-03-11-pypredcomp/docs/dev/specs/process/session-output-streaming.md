---
title: "Session output streaming"
description: "Per-session stdout/stderr capture and real-time streaming to subscribers. Output is appended as substrate cells in chunks; subscribers see chunks via WebSocket as they are emitted, not after the producing call completes."
kind: spec
status: normative
version: "0.2"
---


Every session captures the stdout and stderr of the processes it spawns.
Output is appended to the substrate as **stream-chunk cells** at write time; subscribers (TUI shell, web GUI shell, federated observer) see chunks via WebSocket as they are emitted, not after the producing call completes.
This is the OS-level surface ECC2 (the captain's predecessor everything-claude-code TUI) shipped against PTY readers and that this OS expresses as substrate cells over the standard WebSocket transport.

Per [decisions/session-output-streams-over-websocket.md](../../decisions/session-output-streams-over-websocket.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §3.

## 1. Capture model

When a session spawns a subprocess (driver-mediated tool call, runbook step, REPL command), the substrate's runtime wraps the subprocess's stdout and stderr.
Each non-empty read from the wrapped streams produces a `stream-chunk` event:

```json
{
  "kind": "stream-chunk",
  "id": "<sha256>",
  "session-id": "session:<id>",
  "process-handle": "<short-id>",
  "stream": "stdout",
  "chunk-ord": 12345,
  "chunk-seq": 17,
  "bytes": "<base64>",
  "encoding": "utf-8",
  "fired-at-ord": 12345
}
```

Fields:

| Field | Meaning |
|---|---|
| `session-id` | The session that owns the producing process. |
| `process-handle` | Stable identifier for the subprocess across multiple chunks (so a subscriber can re-assemble a stream). |
| `stream` | Either `stdout` or `stderr`. |
| `chunk-ord` | Event ordinal; ties chunks into the global event order. |
| `chunk-seq` | Per-(session, process-handle, stream) monotone integer. Lets a subscriber detect missed chunks. |
| `bytes` | Base64-encoded chunk payload. The substrate does not parse subprocess output. |
| `encoding` | Declared stream encoding (`utf-8` is canonical; `binary` for arbitrary bytes). |

Chunks are content-addressed by SHA-256 of the canonical event bytes.
Replay reproduces every chunk byte-identically.

## 2. Chunking discipline

The substrate emits one chunk per non-empty PTY read or per non-empty `read(2)` from a piped subprocess fd.
The runtime MAY coalesce consecutive sub-millisecond reads from the same fd into a single chunk to bound the event-log overhead, subject to a configurable upper bound (`stream-chunk-max-bytes`, default 64 KiB) and a configurable lower bound (`stream-chunk-flush-after-ord-delta`, default 4 ords) to bound latency.

The runtime MUST NOT split a UTF-8 codepoint across chunks.
When a read ends mid-codepoint, the runtime buffers the trailing partial bytes and prepends them to the next chunk.
(For `binary` streams, codepoint discipline does not apply; chunks may end at any byte boundary.)

## 3. Stream end

When a subprocess closes its stdout or stderr, the runtime emits a sentinel:

```json
{
  "kind": "stream-end",
  "session-id": "session:<id>",
  "process-handle": "<short-id>",
  "stream": "stdout",
  "exit-reason": "process-exited|fd-closed|session-draining",
  "fired-at-ord": 12345
}
```

A `stream-end` event with the same `(session-id, process-handle, stream)` is the subscriber's signal to stop re-assembling chunks.
Chunks arriving after `stream-end` for that triple are rejected with `PCS_STREAM_AFTER_END`.

## 4. Wire format on WebSocket

Streaming subscribers use the `substrate-events.v1` subprotocol per [network/websocket.md](../network/websocket.md) §3.
To subscribe to one or more streams:

```json
{
  "action": "subscribe",
  "topic": "stream-chunk",
  "filter": {
    "session-id": "session:<id>",
    "stream": "stdout"
  }
}
```

The server pushes each matching `stream-chunk` event as one WebSocket frame.
Frame contents are the canonical JSON event bytes from §1; subscribers re-assemble the stream by ordering frames by `chunk-seq` per `(session-id, process-handle, stream)` and decoding `bytes` from base64.

The wire ordering of chunks for a single `(session-id, process-handle, stream)` is monotone in `chunk-seq` (the substrate's serialization point on event-log append guarantees this).
Across distinct streams, ordering is monotone in `chunk-ord` (the global event ordinal).

For HTTP-only clients that cannot use WebSocket, an HTTP/1.1 chunked-transfer endpoint at `GET /sessions/<id>/processes/<handle>/<stream>` returns one chunk per HTTP transfer-encoded chunk; the protocol semantics are identical.

## 5. TUI shell binding

The TUI shell ([shell/tui-shell.md](../shell/tui-shell.md)) gains a streaming-output panel.
The panel:

1. On focus of a session, opens a WebSocket subscription per §4 for the session's `stdout` and `stderr`.
2. Renders chunks in arrival order, attributing each line to `process-handle`.
3. Surfaces `stream-end` as a visible delimiter (per Unix convention: a horizontal rule with the exit reason).
4. Allows scrollback through chunks already received plus chunks queryable from the event log via `entity_history`.
5. Honours capability discipline: a TUI session can only subscribe to streams its boundary's authz fiber permits via $\Rightarrow$.

## 6. Web GUI shell binding

The web GUI shell ([shell/web-gui-shell.md](../shell/web-gui-shell.md)) gains a streaming-output renderer.
Routes `/sessions/<id>/output` and `/sessions/<id>/processes/<handle>` render the live stream; the page opens a WebSocket subscription on first render and updates incrementally per §4.

When a subprocess emits ANSI escape codes, the renderer interprets the canonical subset (per [shell/tui-shell.md](../shell/tui-shell.md) and the standard ANSI escape catalogue) and renders coloured output in HTML.
The raw bytes remain in the substrate; rendering is a view, not a write-back.

## 7. Capability discipline

Subscribing to a session's output requires the subscriber's capability fiber to admit `read:stream-chunk` against the producing session.
The default discipline:

- The producing session's own boundary may always read its own streams.
- The captain's boundary may read any session's streams.
- Office-projected sessions inherit subscription rights from the office's `read:stream-chunk` grants.
- Federated peers MAY subscribe only when the producing session's `(session:<id>, federate-stream-to, peer:<id>) = True` cell is asserted.

Capability rejections produce `PCA_SCOPE_INSUFFICIENT`; the WebSocket close code is 1008 per [network/websocket.md](../network/websocket.md) §5.

## 8. Persistence and retention

`stream-chunk` events live in the standard event log per [decisions/event-log-is-jsonl.md](../../decisions/event-log-is-jsonl.md).
They participate in retention policy per [observability/log-aggregation.md](../observability/log-aggregation.md) §3:

- **Keep all** (default for active sessions).
- **Compact at session-archive** (default for archived sessions): when a session transitions to `archived` per [process/lifecycle.md](lifecycle.md) §6, its `stream-chunk` events are compacted into per-process per-stream content-addressed cells; the per-chunk events are retired in favour of the compacted cells while preserving full byte-identity at replay.

Compaction is opt-in per session via `(session:<id>, compact-streams-on-archive, True)`.
Without the cell, the per-chunk events remain in the log indefinitely.

## 9. Streaming bridge to substrate operations

`stream-chunk` events are first-class substrate cells; closure rules MAY subscribe to them:

```json
{
  "kind": "rule",
  "name": "anomaly-on-stderr-error-pattern",
  "premise": [
    {"s": "$chunk", "p": "kind", "o": "stream-chunk", "v": "True"},
    {"s": "$chunk", "p": "stream", "o": "stderr", "v": "True"},
    {"s": "$chunk", "p": "matches-pattern", "o": "regex:fatal|panic|abort", "v": "True"}
  ],
  "conclusion": [
    {"s": "$chunk", "p": "anomaly", "o": "subprocess-failure-pattern", "v": "True"}
  ]
}
```

Pattern-matching predicates (e.g., `matches-pattern`) are computed by the runtime at chunk-emit time when the matching rules are active; they are byte-identity-stable so replay reproduces the same matches.

This lets the captain wire ad-hoc surveillance of subprocess output (driver failures, agent panics, build errors) without a separate log-aggregation pipeline.
The substrate IS the log aggregator.

## 10. Streaming for federation

Federated peers MAY stream output between nodes using the `/federation/stream` endpoint per [network/websocket.md](../network/websocket.md) §3.
The federation envelope wraps each `stream-chunk` event with the standard signed header per [security/signing-and-witnessing.md](../security/signing-and-witnessing.md) §5; the receiving peer verifies signature, applies federation-trust, and admits the chunk into its local event log under `peer = "<remote-peer-id>"`.

Cross-peer streaming respects the producing session's `federate-stream-to` capability (§7); a peer not in the cell does not receive chunks.

## 11. Errors

| Code | Meaning |
|---|---|
| `PCS_STREAM_AFTER_END` | A `stream-chunk` event arrived for a `(session, handle, stream)` whose `stream-end` is already in the log. |
| `PCS_STREAM_HANDLE_INVALID` | `process-handle` does not resolve to a tracked subprocess in the named session. |
| `PCS_STREAM_ENCODING_INVALID` | `encoding` field is neither `utf-8` nor `binary`. |
| `PCS_STREAM_CHUNK_TOO_LARGE` | A chunk exceeds `stream-chunk-max-bytes` (the runtime should split before emit; this error indicates a runtime bug or hostile producer). |
| `PCA_SCOPE_INSUFFICIENT` | Subscriber lacks `read:stream-chunk` against the producing session. |

## 12. Implementation

### Python (v0.2+)

- Subprocess wrapping via `asyncio.create_subprocess_exec` with PIPE stdout/stderr; the runtime reads in a chunk-emit loop.
- PTY wrapping via `pty` for processes that need a tty; chunk emission is identical.
- The chunk-emit loop lives in `runtime/streaming.py`; it is the only writer of `stream-chunk` events.
- The WebSocket subscription handler lives in `runtime/ws_streaming.py`; it filters by topic and capability fiber per §7.

### Rust (v0.2+)

- Subprocess wrapping via `tokio::process::Command` with piped stdio; chunk-emit loop is a tokio task per stream.
- PTY wrapping via the `portable-pty` crate for processes that need a tty.
- WebSocket subscription handler integrated into the `tokio-tungstenite`-based federation/web server.

## 13. Conformance

Session output streaming passes:

1. **Chunk emission.** A subprocess writing N bytes to stdout produces M chunks whose concatenated `bytes` (after base64 decode) equal the N bytes byte-identically; M is bounded by ⌈N / stream-chunk-max-bytes⌉.
2. **UTF-8 codepoint integrity.** A subprocess writing a multi-byte UTF-8 codepoint that straddles a read boundary still produces well-formed chunks (no codepoint split across `chunk-seq` values).
3. **Stream-end ordering.** Within a `(session, handle, stream)` triple, every `stream-chunk` precedes the matching `stream-end`; a chunk arriving after `stream-end` is rejected with `PCS_STREAM_AFTER_END`.
4. **WebSocket delivery.** A subscriber connected before subprocess spawn receives every chunk in `chunk-seq` order; a subscriber connecting mid-stream may opt to backfill via `entity_history` for the missed chunks plus subscribe live for new chunks; combined ordering is preserved.
5. **Capability rejection.** A subscriber lacking `read:stream-chunk` on the producing session is rejected with `PCA_SCOPE_INSUFFICIENT` (WebSocket close 1008).
6. **Closure-rule subscription.** A rule pattern-matching `stream-chunk` cells fires deterministically; replay produces the same matches.
7. **Federation.** A federated peer with `federate-stream-to` cell receives signed chunks; verification rejects forged chunks with `PCF_SIGNATURE_INVALID`.
8. **Compaction round-trip.** A session whose archive triggers compaction has its compacted per-stream cells producing byte-identical per-chunk events on replay-from-event-log.
9. **Cross-language equivalence.** Python and Rust produce byte-identical `stream-chunk` events for byte-identical subprocess output and chunking parameters.

## 14. Plan 9 / Unix analogue

| Unix concept | Streaming analogue |
|---|---|
| `tail -f /var/log/...` | WebSocket subscription to `stream-chunk` events |
| `screen` / `tmux` attached to a session | TUI shell streaming-output panel |
| Plan 9 `/proc/<pid>/stdout` namespace | `(session:<id>, has-process, process-handle:<id>)` cells |
| `script(1)` recording terminal session | The event log itself; replay reconstructs |
| `journalctl -f` | Closure-rule subscription to `stream-chunk` cells |
| Pipe (`|`) to another process | Closure-rule chain consuming `stream-chunk` cells |
| `tee` | Multiple subscribers receiving the same stream |
