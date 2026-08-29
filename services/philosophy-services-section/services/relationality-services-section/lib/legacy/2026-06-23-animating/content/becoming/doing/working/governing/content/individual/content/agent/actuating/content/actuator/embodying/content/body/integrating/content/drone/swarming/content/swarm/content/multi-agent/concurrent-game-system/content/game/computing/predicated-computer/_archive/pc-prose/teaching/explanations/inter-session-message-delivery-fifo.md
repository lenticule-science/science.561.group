---
type: narrative
depends-on: [inter-session-message-delivery-is-per-sender-fifo-via-event-log-ord, monotonic-clock-discipline, closure-rule-system-realizes-closure-2-monad]
see-also: [per-stream-chunk-delivery-is-fifo-projection-of-event-log, per-tick-firing-order-is-deterministic-lex-extension]
---

# Per-sender FIFO for inter-session messaging

The dev specs `ipc/message-passing.md` §6 and `process/inter-session-messaging.md` §4 commit a two-part ordering discipline for typed messages between sessions: per-(sender, receiver) FIFO holds, but cross-sender ordering is whatever the substrate's event-log interleaving produces. The theorem [inter-session-message-delivery-is-per-sender-fifo-via-event-log-ord](../theorems/inter-session-message-delivery-is-per-sender-fifo-via-event-log-ord.md) grounds both halves of that commitment in the substrate's serialized respond cycle and monotonic event-ord.

## What the theorem rules out

**Cross-sender FIFO masquerading as a substrate guarantee.** A multi-author coordination protocol that assumes "if sender $S_1$'s respond completes wall-clock-before sender $S_2$'s respond, then $R$ sees $S_1$'s message first" is reading a guarantee the substrate does not give. The relative event-ord of an $S_1$-message and an $S_2$-message at $R$ is determined by the substrate's serialized event-log append, which depends on each sender's respond scheduling, fuel budget, and tick alignment. A protocol that needs cross-sender causal order must use explicit causal-id chains (`responds-to`, `task-id`, `conflict-on`), not implicit event-ord.

**Single global high-water mark for exactly-once delivery.** A receiver tracking "I have processed all messages with `authored-at-ord` ≤ N" as a single scalar across all senders will, on the next surfacing pass, silently skip any message authored at ord ≤ N by a sender whose respond invocation appended *after* the high-water mark was set. The structural per-sender FIFO claim is per-channel; the high-water mark must be partitioned by `from-session` to be correct.

**Inferring sender wall-clock from event-ord.** Two independent senders' relative wall-clock times are not derivable from their messages' relative `authored-at-ord` values. The substrate's monotonic-clock-discipline pins event-ord as a per-substrate counter, not a wall-clock; sender wall-clock latency, GC pauses, and respond budget exhaustion all decouple wall-clock from event-ord across distinct sessions.

**Per-msg-type global FIFO.** A receiver scanning all `query` messages globally and assuming author-ord matches conversation order will silently mis-order parallel queries from distinct senders to the same receiver. The per-channel grain of FIFO is the ordered pair $(S, R)$, not the message-type; conversation reconstruction across senders must use the response chain's `responds-to` predicate.

**Cross-substrate FIFO under federation.** This theorem proves per-sender ordering only within a single substrate. Whether a federated sender's messages arrive at a remote receiver in the source's per-sender author-ord depends on the federation transport's order discipline — specifically whether the transport delivers a single source-substrate's appends in their source-event-ord. That property is not established here. A protocol that needs cross-substrate per-sender ordering must cite the federation discipline that gives it, or reduce to a single-substrate channel where this theorem applies directly.

## What grounds the per-sender claim

The structural backbone is two composable disciplines: (i) [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md) gives serialized respond per session — at most one respond invocation in flight per session at any wall-clock instant; (ii) [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md) gives strictly increasing event-ord per substrate. The composition: a sender's two messages to the same receiver are authored in two totally-ordered respond invocations, so they receive strictly increasing `authored-at-ord`; this strict per-sender total order is then immutable in the event log. The receiver recovers per-sender FIFO at consumption time by partitioning surfaced messages by `from-session` and processing each partition in `authored-at-ord` order — a consumer-side discipline, not a substrate-scheduling guarantee. No transport-layer FIFO is invoked because the channel is substrate-internal: the messages are cells in the event log, not bytes on a wire, and what the substrate guarantees is a structural order on the cell data, not a wall-clock order on the surfacing rule's bind iterations.

## Engineering surface

The §2 typed-message vocabulary is engineered to live within these constraints:

- The `query` and `response` types use `responds-to` to chain a reply to its prompting query independent of event-ord. A receiver of a `response` does not need to scan globally to find the matching `query`; the cell carries the witness chain explicitly.
- The `task-handoff` and `completed` types use `task-id` as the join key. A `completed` from any sender to any receiver references the original handoff by id; the substrate does not infer the linkage from temporal proximity.
- The `conflict` type uses `conflict-on` to identify the disagreed cell. Two conflict messages from two senders observing the same disagreement converge structurally on the same cell-id, regardless of which sender's report reaches a third party first.

This is the same architectural shape as the substrate's other per-channel FIFO surfaces — stdout/stderr chunks per [per-stream-chunk-delivery-is-fifo-projection-of-event-log](../theorems/per-stream-chunk-delivery-is-fifo-projection-of-event-log.md) — but the proof mechanism and the form of the guarantee differ. Chunk delivery's FIFO is a wall-clock subscriber-side delivery sequence pinned by RFC 6455 transport ordering. Inter-session messaging's FIFO is the weaker but cleaner structural total order on `authored-at-ord` per channel; the wall-clock surfacing sequence is not pinned, and consumers recover ordered-per-sender consumption by reading and sorting the structural ord. Both forbid cross-channel global ordering for the same reason: the substrate's event-log interleaving across distinct authors is not a causal relation, and a receiver that wants causality must encode it explicitly in the message body.
