---
title: "Event log"
description: "JSONL append-only event format. The substrate's source of truth."
kind: spec
status: normative
version: "0.1"
---


`$ROOT/events.jsonl` is the substrate's source of truth.
One JSON object per line, separated by `\n` (LF, never CRLF).
Append-only.

## 1. Event envelope

Every event is a canonical JSON object with at minimum:

| Key | Type | Required | Meaning |
|---|---|---|---|
| `ord` | integer | yes | Monotone event ordinal. Strictly increasing across the log. |
| `kind` | string | yes | Event-kind discriminator. See §2. |
| `id` | string | yes | SHA-256 of canonical bytes of this event without `id`, then re-included. |
| `prev` | string | yes | `id` of the immediately preceding event (the previous line's `id`). Genesis event has `"prev": "0".repeat(64)`. |
| `wall_clock_at` | string | no | RFC 3339 timestamp; instrumentation only. |
| `peer` | string | no | Originating node-id; absent or `"self"` means local origin. |
| `signature` | string | no | Base64 signature over the canonical bytes; see [federation-protocol.md](federation-protocol.md). |

The `prev` chain forms a hash linkage: any tampering with the log is detectable by re-walking.
This is the same shape as Git's commit chain.

## 2. Event kinds

| `kind` | Carries | Effect on substrate |
|---|---|---|
| `"genesis"` | `node_id`, `created_at` | Marks the start of the log. Exactly one per `events.jsonl`, at `ord = 0`. |
| `"cell"` | the cell record (see [cell-record.md](cell-record.md)) | Records a cell value at the cell's `(s, p, o, stratum)`. Subject to settling-monotonicity (per stratum) and stratum-monotonicity (per [../kernel/stratified-facts.md](../kernel/stratified-facts.md)). |
| `"rule-add"` | the closure-rule record (see [closure-rule-record.md](closure-rule-record.md)) | Adds a closure rule to the active rule set. |
| `"rule-retire"` | `rule_id` | Removes a rule from the active set. The rule record itself remains addressable. |
| `"settle"` | `target_id`, `repair_log` (array of repair entries), `evidence` (optional vector) | Records the result of a `respond`/`settle` invocation. See [repair-log.md](repair-log.md). |
| `"merge"` | `peer`, `peer_event_window`, `merge_repair_log` | Records absorption of a federation peer's events into local state. |
| `"alias"` | `name`, `cell_id` | Sets or re-points an alias. See [alias-mapping.md](alias-mapping.md). |
| `"snapshot"` | `at_ord`, `cells_root_hash`, `rules_root_hash` | Records a verifiable snapshot of materialized state at an ordinal. Optional optimization for fast catch-up. |

Implementations MUST reject unknown `kind` values with `PCE_UNKNOWN_KIND`.

## 3. Append semantics

Appending an event:

1. Build the new event object without `id`.
2. Set `prev` to the current tail event's `id` (or all-zeros for genesis).
3. Set `ord` to current tail's `ord + 1` (or `0` for genesis).
4. Compute canonical bytes and SHA-256; assign to `id`.
5. Re-canonicalize with `id` included.
6. Acquire append lock on `events.jsonl`; verify tail still matches `prev`; append the canonical bytes plus `\n`; fsync; release lock.
7. If verification at step 6 fails, the appender saw stale state — recompute from current tail and retry, or return `PCE_LOG_RACE`.

The log is the **only** mutation point.
Cell records, rule records, fiber caches, and evidence files are written *after* the event is appended; they are projections, not the source.

## 4. Replay

Given an event log, reconstruct the substrate:

1. Verify the genesis event hashes to its declared `id` and that `prev` is all zeros.
2. For each subsequent event in order: verify `prev` matches the prior event's `id`; verify `ord` increments by exactly 1; verify `id == SHA-256(canonical_without_id)`.
3. Apply each event:
   - `cell` → write the cell record on disk (immutable; no replacement) and update the per-stratum fiber projections via $\odot$ at the cell's index.
     The presheaf-indexed projections are written per [presheaf-storage.md](presheaf-storage.md); the default `settled` projection is the canonical fiber cache.
   - `rule-add` / `rule-retire` → update the active rule set; recompile rule firers if cached.
   - `settle` → write evidence file (if profile enabled); fibers already advanced by the closure rules whose firings the settle records.
   - `merge` → re-run replay on the peer's event window with the local-merged-with-peer fiber.
   - `alias` → write/replace alias file.
   - `snapshot` → optional verification waypoint.
4. After replay, the in-memory fiber map and on-disk projections are the substrate's current state.

Replay is **deterministic**: byte-identical event logs yield byte-identical substrates.
This is the spine of the [determinism.md](determinism.md) guarantee.

## 5. Compaction (deferred)

The slice does not compact.
The log grows.
Compaction (replacing a window of events with an equivalent shorter window) is a separate, deliberate operation that produces a new log with a different genesis snapshot; conformance is the same.
Compaction is downstream of the foundational specs.

## 6. Wire example

```jsonl
{"created_at":"2026-05-01T00:00:00Z","id":"abc123…","kind":"genesis","node_id":"rsc-quiescent.local","ord":0,"prev":"0000000000000000000000000000000000000000000000000000000000000000"}
{"id":"f44702…","kind":"cell","o":"task:write-spec","ord":1,"p":"depends-on","prev":"abc123…","s":"task:implement-respond","sender":"agent:planner","stratum":"asserted","v":"True"}
{"id":"a1b2c3…","kind":"rule-add","ord":2,"prev":"f44702…","rule":{"id":"…","kind":"rule","premise":[…],"conclusion":[…]}}
{"derived_from":["f44702…"],"derived_via":"blocking-tasks-attract-planner","id":"9c1ab3…","kind":"cell","o":"agent:planner","ord":3,"p":"needs-attention","prev":"a1b2c3…","s":"task:implement-respond","stratum":"saturated","v":"True"}
{"evidence":["…"],"id":"d4e5f6…","kind":"settle","ord":4,"prev":"9c1ab3…","repair_log":[…],"target_id":"9c1ab3…"}
```

(JSONL is one canonical-JSON object per line; the example here is line-broken for reading.
The actual file has no inter-line spaces beyond `\n`.)

## 7. Read concurrency

Multiple readers can stream the log concurrently with appenders.
A reader observing line N is guaranteed to see all complete events with `ord ≤ N`; partial appends are invisible because of the temp-and-rename / write-then-fsync pattern.
Long-running consumers (the heartbeat, MCP subscribers) maintain their own ord-cursor.
