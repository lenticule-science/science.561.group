---
type: concept
class: temporal-aggregation-discipline
depends-on: [stream, time-and-event-ordinals]
see-also: [aggregate-window]
---

# Window

A *substrate-recorded time- or count-bounded slice of a [stream](stream.md)*: a window is how aggregations and analytics over streaming data are scoped.

Common window kinds:

- **Tumbling window.** Fixed-size, non-overlapping intervals (every 1 minute, every 100 items).
- **Sliding window.** Fixed-size, overlapping intervals (last 5 minutes, recomputed every 30 seconds).
- **Session window.** Variable-size intervals defined by gaps in the stream (a window starts on first event, extends with each event, closes when no event has arrived for some idle threshold).
- **Hopping window.** Sliding window with a fixed hop interval.
- **Count window.** N-event-count-bounded rather than time-bounded.

A window has the structure:

- **Window-kind** — tumbling, sliding, session, hopping, count.
- **Bounding parameter** — the size (and hop, for sliding/hopping).
- **Source-stream** — the [stream](stream.md) being windowed.
- **Aggregation function** — what's computed over the items in each window (count, sum, avg, percentile, custom function).
- **Output-stream** — the substrate-recorded stream of per-window aggregate results.

Per [self-representation](teaching/explanations/self-representation.md), windows are substrate content. Per [witness](../objects/witness.md), each window's aggregate computation produces a witness; an auditor can verify which items were in which window.

Per [settlement-determinism](../theorems/settlement-determinism.md), window aggregations are deterministic on `(stream contents, window definition)`. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), historical window aggregates are reconstructible.

Windows interact with [transaction](transaction.md) for cross-window atomicity: a transaction may want to update multiple windows atomically (e.g., increment per-day and per-month counters together).
