---
title: "Sandbox and fuel"
description: "Resource limits per session. Closure-fuel, memory ceiling, concurrency cap, network rate limits. Per-session accounting; per-driver bounds."
kind: spec
status: normative
version: "0.2"
---


Every session in the OS operates under a configured **resource budget**.
The substrate enforces budgets at the algebra level (closure-fuel) and at the runtime level (memory, concurrency, network rate).
Exceeding any budget terminates the session with a clean error.

## Grounded in

- [`predicated-computing/theorems/cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — per-session and per-personnel budgets (§2, §9) are quantale ceilings on the $\otimes$-composition of admissions, settlements, driver calls, and (eventually) federation hops.
  Per-driver fuel (§8) and network rate (§6) are quantale terms.
  The substrate's chosen quantale is $([0, \infty], +, \min)$ for the v0.2 default.
- [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — read-side budgets are the quantale unit; reads (cell lookups, witness inspections, `/metrics` queries) do not consume the closure-fuel envelope.
  This is what makes the monitoring surface (§11) horizontally scalable.
- [`predicated-computing/theorems/regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) and the four per-regime engineering envelopes ([strict](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [scott-continuous](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md)) — the closure-fuel envelope (§3, default 16 layers) is the strict-regime per-respond bound; transfinite-regime substrates require the transfinite-bounded envelope. v0.2 is strict by default per [decisions/regime-classification-is-load-bearing.md](../../decisions/regime-classification-is-load-bearing.md).
- Per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md) and [decisions/regime-classification-is-load-bearing.md](../../decisions/regime-classification-is-load-bearing.md).
  See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Resource categories

| Resource | Unit | Default | Configurable |
|---|---|---|---|
| Closure fuel | rule firings per respond | 16 layers × per-rule cap | yes |
| Memory | bytes resident | 256 MB | yes |
| Concurrent respond | active invocations | CPU count | yes |
| Network rate | requests/second | 100 | yes |
| Storage rate | events/second | 1000 | yes |
| Driver fuel | per-driver call budget | per-driver default | yes |

## 2. Per-session budgets

A session has a `budget` predicate group:

```json
{
  "subject": "session:<id>",
  "predicate": "budget:closure-fuel",
  "object": "16-layers",
  "value": "True"
}
```

Plus:

- `(session:<id>, budget:memory-mb, "256")`
- `(session:<id>, budget:concurrent-respond, "8")`
- `(session:<id>, budget:network-rps, "100")`
- `(session:<id>, budget:storage-eps, "1000")`

These are substrate cells; the runtime queries them on session-open and applies the limits.

## 3. Closure-fuel exhaustion

When a respond's closure-rule firing exceeds the session's `budget:closure-fuel`:

1. The respond returns with `PCR_FUEL_EXCEEDED`.
2. Partial state is preserved (cells already advanced are kept); the partial repair log is returned.
3. The session is not terminated — fuel exhaustion is a per-respond concern, not a session-level offense.
4. The runtime metrics record the fuel exhaustion for monitoring.

## 4. Memory ceiling

When the substrate's resident memory exceeds the configured ceiling:

1. The runtime transitions to `degraded` state for new respond invocations.
2. In-flight respond invocations complete; new ones are rejected with `PCH_NOT_READY`.
3. Memory pressure relief: LRU eviction of fiber caches; lazy materialization re-enabled.
4. Once memory drops below 80% of ceiling, the runtime returns to `ready`.

## 5. Concurrency cap

The substrate limits concurrent respond invocations per session and across all sessions:

- Per-session cap: `budget:concurrent-respond`.
- Global cap: `runtime:max-concurrent-respond` (typically CPU count).

Exceeding either: new respond invocations queue; if the queue exceeds `runtime:max-respond-queue-depth`, oldest are rejected with `PCH_BUSY`.

## 6. Network rate limiting

Per-session network rate budget bounds outbound HTTP requests, federation pushes, driver-initiated network calls.
Exceeding rate:

1. The next request is delayed (token-bucket).
2. Continued violation terminates the session with `PCA_NETWORK_BUDGET_EXCEEDED`.

Per-driver rate budgets are nested inside session budgets; an SMTP driver inheriting from a session cannot exceed the session's network rate.

## 7. Storage rate limiting

Storage rate bounds events appended per second.
ICS sensor floods are protected by storage rate; the bilattice handles staleness honestly so dropping events is a real loss but not silent corruption.

For ICS specifically: the outpost-tier OS image (v0.5+) has higher storage rate budgets and lower closure-fuel budgets; the ship-tier has the inverse.

## 8. Driver fuel

Each driver declares its expected operation cost per call.
Sessions budget driver-call counts; exceeding triggers `PCA_DRIVER_BUDGET_EXCEEDED`.

This is the substrate's analogue of Linux's cgroups for I/O.
Per-driver discipline prevents runaway calls (e.g., a chat driver retrying 10000 times on Matrix federation failure).

## 9. Per-personnel global budgets

Above the session level, personnel have aggregate budgets:

- `(personnel:emsenn, daily-budget:respond-count, "10000")`
- `(personnel:emsenn, daily-budget:network-mb, "1000")`
- `(personnel:emsenn, daily-budget:storage-eps, "100000")`

Sessions opened by personnel deduct from the global budget.
Exceeding the daily budget refuses new sessions until the budget resets.

For agential work (Claude API spend, etc.), per-personnel budgets are critical: the system observes spend, the captain sees daily totals, runaway agents stop themselves.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCR_FUEL_EXCEEDED` | Closure-rule fuel exhausted within respond. Partial state preserved. |
| `PCH_NOT_READY` | Runtime in `degraded` state due to memory pressure. |
| `PCH_BUSY` | Concurrency queue exceeded. |
| `PCA_NETWORK_BUDGET_EXCEEDED` | Session's network rate budget exceeded. |
| `PCA_STORAGE_BUDGET_EXCEEDED` | Session's storage rate budget exceeded. |
| `PCA_DRIVER_BUDGET_EXCEEDED` | Session's per-driver call budget exceeded. |
| `PCA_DAILY_BUDGET_EXCEEDED` | Personnel's daily budget exhausted. |

## 11. Monitoring

Per-session and per-personnel resource usage is exposed at:

- `/metrics` (Prometheus format) — current resource usage.
- `respond` MCP tool with `target = budget:<session-id>` — query budget remaining.
- Web GUI shell — live dashboard of resource usage.

## 12. Implementation

### Python (v0.2+)

- Budget records as pydantic models.
- Closure fuel decrement in `substrate/closure_engine.py`.
- Memory ceiling check in heartbeat loop (`runtime.py`).
- Concurrency cap via `asyncio.
  Semaphore`.
- Network rate via per-session `aiolimiter.
  AsyncLimiter`.

### Rust (v0.2+)

- Budget records as serde structs.
- Closure fuel decrement in algebra layer.
- Memory ceiling via `sysinfo` crate.
- Concurrency cap via `tokio::sync::Semaphore`.
- Network rate via custom token-bucket implementation.

## 13. Conformance

Sandbox/fuel passes:

1. **Closure-fuel exhaustion.** A respond with rules guaranteed to exceed fuel returns `PCR_FUEL_EXCEEDED` with partial state preserved.
2. **Memory pressure.** Simulated memory pressure transitions runtime to `degraded`; recovery on relief.
3. **Concurrency cap.** Spawning N+1 concurrent respond invocations queues the N+1th; exceeding queue depth rejects.
4. **Network rate.** N+1th request within rate window is delayed; persistent violation terminates session.
5. **Personnel daily budget.** Exhausting daily budget refuses new sessions; budget resets at configured ord (typically a periodic rule).

## 14. Plan 9 / Unix analogue

| Unix concept | Sandbox analogue |
|---|---|
| `ulimit` | Per-session budget cells |
| cgroups | Per-session resource accounting |
| `setrlimit` | Budget enforcement at session-open |
| OOM killer | Memory ceiling → `degraded` (not killed) |
| `nice` / `ionice` | Per-session priority + storage-rate budget |
| Network QoS | Per-session network-rate budget |
