---
title: "Session as process"
description: "Sessions are the OS's processes. Each session is a substrate-resident execution context with capability fiber, memory tiers, lifecycle, and attribution."
kind: spec
status: normative
version: "0.2"
---


The OS's analogue of a Unix process is the **session**.
A session is a substrate-resident execution context with a stable id, a capability fiber, three tiers of memory, a lifecycle, and attribution to personnel/office/persona.

This spec absorbs the captain's older "session" notion (per agential-orchestration-platform's `session-record`) and formalizes it as the OS's process abstraction.

## 1. Session record

```json
{
  "kind": "session",
  "id": "<sha256>",
  "slug": "session:<short-id>",
  "boundary": "boundary:emsenn",
  "acting-as": "office:planner",
  "started-at-ord": 12345,
  "state": "open",
  "parent-session": "session:<id>",
  "capability-fiber-hash": "<sha256>",
  "memory-volatile-cells": ["cell:<id>", ...],
  "memory-implicit-cells": ["cell:<id>", ...],
  "memory-consolidatable-cells": ["cell:<id>", ...],
  "expected-fuel-budget": 16,
  "expected-respond-budget": 100
}
```

Fields:

| Field | Meaning |
|---|---|
| `slug` | Session-id; lowercase-kebab. |
| `boundary` | The opening boundary (always populated; even system sessions have a boundary for audit). Per [security/user-as-boundary.md](../security/user-as-boundary.md). |
| `acting-as` | The projection surface: `personnel`, `office:R`, or `persona:P`. Empty acting-as ≡ personnel projection of the boundary. |
| `state` | `opening`, `open`, `draining`, `closed`, `archived`. |
| `parent-session` | If forked from another session. |
| `capability-fiber-hash` | Cached hash of the session's projected authz fiber after composition (per [security/user-as-boundary.md](../security/user-as-boundary.md) §4). |
| `memory-*` | Cell-id lists per memory tier. |
| `expected-*-budget` | Resource budget; per [security/sandbox-and-fuel.md](../security/sandbox-and-fuel.md). |

## 2. Three memory tiers

Per `flatfile-agentic-resource-system/concepts/three-tier-memory`:

### Volatile

- Lifetime: session-only.
  Cells lost when session closes.
- Use: scratch state during dispatch, evaluation, working memory.
- Examples: a cell's intermediate fiber state; a closure-rule's bind variables.

### Implicit

- Lifetime: persists across sessions opened by the same personnel/office/persona, but not federated.
- Use: per-personnel preferences, recent histories, autocomplete cache.
- Examples: shell command history, recent cell-id MRU.

### Consolidatable

- Lifetime: persists across sessions and federates.
- Use: substrate-canonical state.
  Most cells live here.
- Examples: task records, knowledge cells, ledger entries.

## 3. Session lifecycle

```
opening → open → draining → closed → archived
                ↓
             failed
```

### `opening`

Session-record created; capability fiber composed; memory tiers initialized; subscriptions registered.
Brief; transitions to `open` once setup completes.

### `open`

Session is operating. respond invocations attributed to this session land in its memory tiers per their lifetime semantics.

### `draining`

Session is winding down.
New respond invocations against this session are rejected.
In-flight calls complete.

### `closed`

Session is no longer operating.
Its volatile memory is dropped; its consolidatable memory is settled into substrate state.

### `archived`

Closed for over `archive-after-ord` event ordinals.
Some session metadata is retained for audit; volatile and implicit memory is discarded entirely.

### `failed`

Session crashed or exceeded budget.
Volatile memory is preserved for inspection; supervisor handles per restart-policy.

## 4. Session-open

```
respond(target=session:new, payload={
  boundary: "boundary:emsenn",
  acting-as: "office:planner",
  resource-budget: {...}
}, sender=...)
```

Creates a new session.
Sender's authority must include `session-open` for the requested boundary + acting-as projection.
The boundary MUST carry the projection-cell required by `acting-as` (e.g., `holds-office`, `operates-persona`); otherwise the open returns `PCB_PROJECTION_NOT_AUTHORISED`.

The session's id is computed as SHA-256 of (boundary + acting-as + started-at-ord + nonce); content-addressed.

## 5. Session-resume

```
respond(target=session:<id>, payload={action: "resume"}, sender=...)
```

Re-opens a closed session.
The session's consolidatable memory is loaded; volatile memory is empty (not preserved across close).

Capability fiber is recomputed from current substrate state (not cached); changes since close are reflected.

## 6. Session-close

```
respond(target=session:<id>, payload={action: "close"}, sender=...)
```

Drains in-flight respond invocations; flushes consolidatable memory to substrate cells; transitions to `closed`.

## 7. Session-fork

```
respond(target=session:<id>, payload={action: "fork"}, sender=...)
```

Creates a new session whose `parent-session` points at the source.
Capability fiber inherited (composition with sender's authority, never amplifying).
Memory tiers initialized empty (new session starts fresh; consolidatable memory remains in the parent).

The fork's id is content-addressed by parent + nonce.

## 8. Cross-session capability flow

A session's authz fiber is composed per [security/user-as-boundary.md](../security/user-as-boundary.md) §4:

- Project the boundary at the `acting-as` surface (personnel, office, or persona).
- Compose via $\odot$ across the boundary's authz sub-fiber and the projection-surface authz sub-fiber.
- Bound via $\Rightarrow$ against the sender's authority at session-open.

The composed fiber is the session's effective authority.
Per [security/capability-model.md](../security/capability-model.md) and [security/user-as-boundary.md](../security/user-as-boundary.md) §4, $\Rightarrow$ ensures non-amplification, and cross-boundary dispatch from session A to session B is bounded by A's authz fiber before reaching B.

## 9. Session attribution on every event

Every cell appended during a session has `(cell, authored-by-session, session:<id>)` and `(cell, authored-by-boundary, boundary:<slug>)`; the projection surface (`acting-as`) is recorded as `(cell, authored-via-projection, <surface>)` if non-trivial.

The persona projection is a quotient (per [security/user-as-boundary.md](../security/user-as-boundary.md) §5 and [security/persona-and-personnel.md](../security/persona-and-personnel.md) §6): when `acting-as` resolves to a `persona:P` surface, the cell's authored-by attribution is `(cell, authored-by, persona:P)`; the operating boundary is in the boundary's sub-fiber, reachable only via the `privileged-cross-projection` capability.

Audit queries traverse: cell → session → boundary → projection surface.
Per the witness chain.

## 10. Restart policies

Per `agential-orchestration-platform/objects/session-record`:

- `auto-restart-on-failure` — supervisor restarts a failed session up to N times.
- `manual-restart-only` — failed session stays failed.
- `bounded-restart-with-backoff` — restart with exponential backoff.

Per-session policy in the session record; supervisor enforces.

## 11. Errors

| Code | Meaning |
|---|---|
| `PCS_SESSION_NOT_FOUND` | Referenced session-id doesn't exist. |
| `PCS_SESSION_CLOSED` | Operation attempted on a closed session. |
| `PCS_SESSION_DRAINING` | New respond rejected; session is winding down. |
| `PCS_SESSION_BUDGET_EXCEEDED` | Session's budget exhausted (per sandbox-and-fuel). |
| `PCA_SESSION_OPEN_DENIED` | Sender lacks authority to open a session with the requested boundary + acting-as. |
| `PCB_PROJECTION_NOT_AUTHORISED` | Boundary doesn't carry the projection-cell required by `acting-as` (e.g., requested `acting-as: persona:cassia-lorne` but `operates-persona` is false). |

## 12. Implementation

### Python (v0.2+)

- Sessions as pydantic `Session` models.
- Memory tiers stored as separate dicts; volatile in-memory only; implicit/consolidatable in cell store.
- Lifecycle transitions emit substrate events.
- Supervisor as an asyncio task watching session-state changes.

### Rust (v0.2+)

- Sessions as serde structs.
- Same lifecycle and supervisor pattern via tokio.

## 13. Conformance

Sessions pass:

1. **Open/close round-trip.** Open a session, perform respond, close.
  Memory tiers behave per spec.
2. **Resume.** Closed session resumes; consolidatable memory is intact; volatile memory is empty.
3. **Fork.** Forked session has parent-session pointer; capability fiber inherited per non-amplification.
4. **Attribution.** Every cell from the session has `authored-by-session` and `authored-by-boundary`; persona-projected sessions surface `authored-by, persona:P` only and do not leak the operating boundary.
5. **Failure recovery.** Failed session restarts under `auto-restart-on-failure` policy.

## 14. Plan 9 / Unix analogue

| Unix concept | Session analogue |
|---|---|
| Process | Session |
| PID | session-id |
| `fork()` | session-fork |
| `exec()` | invoke-skill / execute-runbook within a session |
| `wait()` | await on session state |
| `getpid()` | session-id available in respond |
| Process tree | Parent-child via parent-session |
| Daemon | Long-lived session marked `kind=daemon` |
| init (PID 1) | Boot session running boot-sequence |
| Memory tiers | volatile / implicit / consolidatable per FARS theory |
