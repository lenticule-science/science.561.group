---
title: "respond"
description: "The substrate's primitive: handle a message against a target, run closure rules to fixed point, return the settled fiber."
kind: spec
status: normative
version: "0.1"
---


`respond` is the substrate's single primary operation.
Every interaction with the substrate — a UI affordance, an MCP tool call, a peer's federated message, an internal closure-rule firing — flows through `respond`.

This spec absorbs the captain's older `cce_apply` and `cce_merge` (see [the source spec for closure semantics](../references/source-spec-corpus.md)), translated to PredCat vocabulary.

## 1. Signature

```text
respond(target, payload, sender?) → Result
```

Inputs:

- `target` — entity slug.
  The substrate-side recipient.
- `payload` — JSON object with arbitrary predicate-keyed fields.
  The message content.
  Translates internally to a fiber over the target's index.
- `sender` — optional entity slug.
  Defaults to the system (no sender constraint).
  When present, the sender's fiber composes with `payload` before composition with `target`.

Output `Result`:

- On success: `{ status: "ok", target_fiber: Fiber, settled_at_ord: integer, repair_log: RepairEntry[], evidence?: string[] }`
- On error: `{ status: "error", code: string, repair_log: RepairEntry[], evidence?: string[] }`

`status: "error"` always still produces a (possibly empty) `repair_log` — partial settlement steps are preserved for audit.

## 2. Phases

`respond` runs three phases in order:

### Phase 1: structural validation

- Validate `target` is a known entity slug (not just a string — must match the substrate identifier alphabet).
- Validate `payload` is a JSON object with no unknown reserved keys.
- Validate `sender` if present.
- On any failure: return `error` with the relevant `PCC_*` or `PCA_*` code and an empty `repair_log`.

### Phase 2: payload composition

The payload is converted to a fiber over the target's index:

1. For each (predicate, value) pair in `payload`, construct a candidate cell `(target, predicate, ?)
  ` whose value derives from the payload value.
2. If a `sender` is present, the sender's fiber restricts this fiber: each cell's value composes via $\Rightarrow$ with the sender's authority for that predicate.
  Cells the sender's fiber says nothing about become $\bot$ (and produce no effect downstream).
3. The result is the **incoming fiber**.

The v0.2 payload translation is unary-diagonal: payload-derived cells are emitted with `s = o = target`.
Future payload forms MUST be specified through [predicate-shape discipline](predicate-shape-discipline.md) before they add relational, event-record, or n-ary emission.

### Phase 3: closure to fixed point

Apply the [closure-rule system](closure-rule-record.md) to the substrate's existing fiber on the target merged ($\odot$) with the incoming fiber:

1. **Initialization.** Build worklist of rules whose premise patterns reference cells touched by the merged fiber.
2. **Layered expansion.** Iterate rules in priority order.
  Within a layer, bind-variable assignments are ordered lexicographically.
  Each unique firing is applied at most once per layer.
3. **Fuel bounds.** Default 16 layers; configurable via `respond` options.
  Per-rule fuel from the rule record applies.
  Exceeding fuel surfaces `PCR_FUEL_EXCEEDED` with partial state preserved.
4. **σ/Δ stabilization.** After each layer, fibers settle locally via $\odot$/$\Rightarrow$.
  The bilattice's bounded-settlement property guarantees this completes in at most 2 substeps per cell.
5. **Repair logging.** Every state change appends a [repair entry](repair-log.md) to the running log.
  Logs are append-only within a single `respond` invocation; reordering or coalescing is forbidden.
6. **Termination.** Layer with zero new firings → fixed point reached.
  Return.

### Phase 4: persistence

- Append a `settle` event to the log with the repair_log and (optionally) evidence vector.
- Each cell whose value moved during the round is appended as a `cell` event.
- Cell-record files and fiber-cache files are updated.
- The settled `target_fiber` is returned to the caller.

## 3. Determinism

Two `respond` invocations with byte-identical inputs (target, canonical payload, sender) against byte-identical substrate state **and the same fuel ceiling** MUST produce byte-identical outputs:

- Same `target_fiber`.
- Same `repair_log` (entries, order, hashes).
- Same evidence vector if requested.
- Same set of appended events.

Determinism guarantees flow from canonicalization, lexicographic ordering of bind variables, priority-ordered rule firing, and **persisting the fuel ceiling alongside the settle event** so that replay reproduces fuel-exhaustion outcomes byte-identically.

### 3.1. Fuel and determinism

Earlier drafts of this spec described `respond` as both deterministic (§3) and fuel-bounded with `PCR_FUEL_EXCEEDED` as a permitted outcome (§6).
The reconciliation:

- The fuel ceiling `F` (closure-fuel layers, default 16; see [fuel-composition.md](fuel-composition.md)) is **part of the input** to `respond`, on equal footing with `target`, `payload`, and `sender`.
- The settle event (Phase 4 §4) records the fuel ceiling as one of its fields.
  Replay sets `F` from the recorded ceiling, not from the runtime default.
- Two `respond` invocations with byte-identical state and **the same** `F` either both succeed with the same `target_fiber` and `repair_log`, or both fail with `PCR_FUEL_EXCEEDED` at the same `outer_iterations` and `repair_log` prefix.
- Two `respond` invocations with byte-identical state but **different** `F` may produce different outcomes: the larger-`F` invocation may settle where the smaller fails.
  This is not a determinism violation; the invocations have different inputs.

The settle event's recorded fuel ceiling is the load-bearing field that makes replay deterministic across hosts that may have different default ceilings configured.

See [fuel-composition.md](fuel-composition.md) for the five fuel surfaces and their composition under [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md).

## 4. Sender as authority constraint

When a sender is supplied, the sender's fiber bounds the message's effect.
Specifically, the message's incoming fiber, before merging with the target, is restricted via $\Rightarrow$ by the sender's authority fiber:

```text
incoming_constrained = sender_authority ⇒ payload_as_fiber
```

A sender whose authority fiber is $\bot$ at a predicate produces a $t$ implication (vacuous), so an unauthorized sender's contribution to that predicate becomes vacuously trivial.
A sender with affirmative authority passes the payload through.
A sender with denying authority converts the payload to $f$ at that predicate, surfacing the denial.

This is how authorization, scope, and capability collapse into the algebra.
There is no separate auth check.

When `sender` is omitted, the system itself is the sender: no scope restriction, the payload reaches the target unmodified.

## 5. Convenience signatures

Higher-level surfaces (MCP, HTTP, FFI) wrap `respond` with semantically richer interfaces, all reducing to a single `respond` invocation:

| Surface call | Reduces to |
|---|---|
| MCP `query(filter)` | `respond(filter.target, {action: "query", ...filter})` returning the queried subset of `target_fiber`. |
| MCP `set(target, predicate, value)` | `respond(target, {[predicate]: value}, sender)`. |
| MCP `dispatch(task_id)` | `respond(office, {match_against: task_id}, system)` for each candidate office; rank by composed value. |
| HTTP `POST /respond` | direct passthrough. |
| Federation receive | `respond(target, peer_event_payload, peer:<peer-id>)` with peer authority. |

The substrate exposes one primitive; everything is a thin wrapper.

## 6. Error semantics

| Code | Meaning |
|---|---|
| `PCC_UNKNOWN_FIELD` | payload contains a reserved key the substrate doesn't recognize. |
| `PCA_SCOPE_INSUFFICIENT` | sender's authority fiber denies the message at every requested predicate. |
| `PCR_FUEL_EXCEEDED` | closure didn't reach fixed point within fuel. |
| `PCH_NOT_READY` | runtime is `initializing`, `degraded` without respond capability, or `draining`. |
| `PCC_MONOTONICITY_FAIL` | a rule firing tried to write a value that violates settling-monotonicity at a cell. Hard error; the substrate state is rolled back. |

All errors carry the partial repair log so callers can audit how far settlement got before the failure.

## 7. Operational obligations

A conforming `respond` implementation:

1. Acquires no locks beyond the event-log append lock; concurrent `respond` invocations against disjoint targets MAY run in parallel.
2. Holds open file descriptors for `events.jsonl` and the in-memory fiber map; does not re-read disk per call.
3. Caches compiled rule patterns; recompiles only on `rule-add` / `rule-retire` events.
4. Runs the property-test suite from [conformance-vectors.md](conformance-vectors.md) at least at every release.

## 8. Binary cells (s ≠ o)

`respond`'s Phase 2 `_emit_asserted_cells` constructs every payload-derived cell as **unary** ($s = o = \mathrm{target}$).
For binary cells (where the predicate's object slot is a different entity from the subject — e.g., `(session-message:abc, to-session, session:bob)`), the substrate offers a sibling primitive that shares storage and audit discipline with `respond` but bypasses the unary-payload Phase 2 translation.

This sibling primitive is a bounded v0.2 bridge, not a mathematical exception.
Binary cells SHOULD NOT be assumed to skip closure forever; closure rules with relational outputs require explicit shape signatures, witness rules, and derived-cell emission semantics before implementation.

See [binary-cell-emission.md](binary-cell-emission.md) for the current discipline, [predicate-shape-discipline.md](predicate-shape-discipline.md) for the broader predicate-shape requirements, and [questions/typed-predication-term-payload.md](../../questions/typed-predication-term-payload.md) for the v0.3+ decision fork.
The older [questions/respond-binary-cell-mode.md](../../questions/respond-binary-cell-mode.md) is subordinate to that shape-discipline question.

## 9. Relationship to PredCat

`respond` is the engineering realization of PredCat's [predication settling](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) over a [closure-rule system](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md).
The math says settlement converges in at most 2 steps for the four-valued case and is decidable; this spec says how the substrate exposes that fact at runtime.
