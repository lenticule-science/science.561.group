---
type: narrative
depends-on: [per-stream-chunk-delivery-is-fifo-projection-of-event-log, monotonic-clock-discipline, streaming-replay-equivalence, modal-restriction-as-substrate-authorization-primitive]
see-also: [pipeline-stage-monotonicity, cache-coherence-via-functorial-projection]
---

# Per-stream chunk delivery FIFO

The session-output-streaming dev spec ([`process/session-output-streaming.md`](../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/process/session-output-streaming.md)) lets a TUI shell, a web GUI, or a federated observer subscribe to the stdout/stderr of a running subprocess and see chunks "as they are emitted, not after the producing call completes." The spec leans on two structural commitments to make that promise honest: chunks have a per-stream `chunk-seq`, and the WebSocket subscription delivers events in event-ord order. The [theorem](../theorems/per-stream-chunk-delivery-is-fifo-projection-of-event-log.md) names the resulting guarantee precisely: per-`(session-id, process-handle, stream)` chunk delivery is a FIFO projection of the event log.

The structural backbone is one substrate property the substrate already commits to ([monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md)) plus the elementary fact that an elementwise positive predicate selects an order-preserving subsequence plus one transport property the WebSocket spec already cites (RFC 6455 per-connection FIFO). The dev spec's "you can detect missed chunks via chunk-seq gaps" remark is then not a hopeful convention — it is the contrapositive of the theorem (modulo the terminal-suffix detectability caveat below).

## What the theorem rules out

**Chunk reordering at the subscriber.** The substrate is forbidden from delivering chunk-seq 17 before chunk-seq 16 to the same subscriber on the same connection. A subscriber that observed such a reordering would witness either (a) a substrate violation of monotonic-clock-discipline, (b) a non-positive subscription filter (which the §4 wire format does not admit), or (c) a transport violation of RFC 6455 per-connection FIFO. None is admissible for a conformant substrate on a conformant transport.

**Silent loss with no detection signal *within a healthy single-connection interval*, when bracketed by a later observed chunk.** A chunk that is dropped between substrate emit and subscriber delivery by capability rejection or encryption-region restriction leaves a chunk-seq gap *whenever a later chunk arrives* — the subscriber's invariant `observed[i+1].chunk-seq == observed[i].chunk-seq + 1` is then the gap detector, and the dev spec's "lets a subscriber detect missed chunks" line is the engineering surface of the structural fact. A terminal tail of omitted chunks with no successor in $V$ is *not* visible from chunk-seq alone; the subscriber distinguishes "stream ended cleanly" from "tail was withheld" via the §3 `stream-end` sentinel. Gaps caused by transport interruption, subscription error, or connection close are also visible as chunk-seq gaps, but the theorem does not localize their cause — the subscriber must consult the WebSocket close-code (§5) or the substrate's authorization-decision audit trail to disambiguate.

**Chunk-seq as a deduplication key across triples.** Different `(session-id, process-handle, stream)` triples have independent `chunk-seq` counters. A subscriber that uses `chunk-seq` alone as a deduplication key — without conditioning on the triple — will conflate distinct chunks from distinct streams. The theorem's claim is per-triple; conformant subscriber code must condition on `(session-id, process-handle, stream)`.

**Treating stdout and stderr as a co-ordered pair.** Within a single subprocess, the `stdout` and `stderr` triples each carry their own FIFO guarantee. The substrate makes no claim about the relative order of an `stderr` chunk and an `stdout` chunk emitted by the same subprocess at nearly the same wall-clock instant — the relative order in the event log is whatever the runtime's PTY-read scheduling produces, and the subscriber sees that order. A consumer that wants line-by-line stdout-and-stderr interleaving (the way a TTY would render it) must reconstruct it from chunk-ord, not assume it.

## What the dev spec is doing the theorem doesn't capture

**Codepoint-boundary discipline.** The dev spec's §1.2 rule that "the runtime MUST NOT split a UTF-8 codepoint across chunks" is a chunking-policy commitment, not an ordering claim. The theorem is silent on chunk *contents*; it only claims that whatever chunks the substrate emits arrive in order. A future revision that allowed mid-codepoint splits would not affect the FIFO guarantee but would break the renderer's contract.

**The coalescing budget.** §1.2's `stream-chunk-max-bytes` (default 64 KiB) and `stream-chunk-flush-after-ord-delta` (default 4 ords) are latency/throughput dials, not ordering dials. The theorem holds at any setting of these dials; tuning them tightens the latency between subprocess write and subscriber-visible chunk without touching the ordering guarantee.

**Backfill via replay.** A subscriber that reconnects after a chunk-seq gap caused by connection drop (rather than authorization restriction) can request the missing range via the substrate's event-log replay API. That is a separate guarantee per [streaming-replay-equivalence](../theorems/streaming-replay-equivalence.md) — replay reproduces the missing chunks byte-identically because they are content-addressed cell atoms in the event log. The two guarantees compose: live FIFO from the theorem here, gap-fill from the streaming-replay theorem.

## Where the spec is doing real work the theorem assumes

The substrate must serialize the chunk-seq increment with the event-ord stamping for a given triple. The dev spec assumes (and the implementation must provide) that two PTY reads on the same triple do not race their chunk-seq assignments. The substrate's σ/Δ pass discipline serializes operations on the same fiber, so the assumption is structurally honoured — but it is an honoured-by-construction property, not a free one. A future implementation that parallelized PTY reads across cores without serializing chunk-seq assignment would forfeit the theorem.

## Engineering consequence

- **Subscribers can be stateless across chunks.** A consumer needs only the prior `chunk-seq` to detect loss; it does not need to remember the full chunk history.
- **Capability-driven filtering is invisible to the chunk-stream invariant.** A subscriber that has fewer capabilities than another sees a strict subsequence of the same chunk-seq order; both subscribers see in-order chunks. The capability gate does not need a separate "ordering preservation" check — positive-filter composition gives it for free.
- **The §3 `stream-end` sentinel terminates the FIFO.** A subscriber that observes `stream-end` for a triple knows no further chunks for that triple will arrive in order on the live subscription (any later chunk would be a substrate violation that the substrate itself rejects with `PCS_STREAM_AFTER_END`). The terminator is part of the same FIFO, not a separate channel.
- **No application-layer reorder buffer is needed.** A consumer that wants in-order display can render each chunk as it arrives; the substrate has already done the ordering work upstream.
