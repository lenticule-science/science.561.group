---
source: [event]
target: [witness]
name: emit-event
description: "The substrate-edit primitive that appends one Event to the event log."
type: morphism
class: operator
depends-on: [event, channel, witness, event-sourcing]
see-also: [apply-edit, settle, respond]
title: emit-event
---


The substrate-edit primitive that appends one [`Event`](../objects/event.md) to the event log.
`emit-event` is the operator every other substrate-mutating operator ([`apply-edit`](apply-edit.md), [`settle`](settle.md), [`respond`](respond.md), the planned dispatch- and edit-operators) calls when its work needs to surface as a record in the substrate's history.
Per [event-sourcing](teaching/explanations/event-sourcing.md), no substrate edit is complete until its event is in the log.

## Signature

```
emit-event(event) → witness
```

Inputs:

- **`event`** — a candidate [`Event`](../objects/event.md) record.
  The caller has already populated `timestamp`, `action`, `subject`, `actor`, `channel`, `origin`, and `payload`; `emit-event` produces and attaches the `witness`.

Outputs:

- **`witness`** — the [`Witness`](../objects/witness.md) attached to the emitted event.
  The witness's `output_hash` is the event's canonical hash; the caller can use this hash to cite the event in subsequent payloads (e.g., a `retraction` event citing the event it retracts).

## Operational semantics

`emit-event` SHALL proceed:

1. **Channel validation.** Look up the [`Channel`](../objects/channel.md) entity named by `event.channel`.
  Settle `event.payload` against the channel's `shape` per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md).
  If settling produces $\top$- or $f$-cells, abort with a `guard`-channel diagnostic event citing the shape violations; do not append.
2. **Emit-policy check.** Settle `event.actor`'s fiber against the channel's `emit-policy`.
  If the result has $\top$- or $f$-cells on policy-required predicates, abort with a `guard`-channel diagnostic; do not append.
3. **Origin trace.** Verify `event.origin` references a substrate entity (closure rule, operator, hook, or actor) the substrate currently holds.
  An event with an unresolvable origin is a substrate-invisible edit and SHALL be rejected.
4. **Hash and witness.** Compute the event's canonical hash.
  Construct the `Witness` with `operator: "emit-event"`, the substrate state's hash as `input_hashes.substrate`, the event's canonical hash as `output_hash`, the active `rule_system_version`, zero `fuel_consumed`, empty `layer_hashes`, no repairs, and the current timestamp.
5. **Append.** Append the (event, witness) pair to the event log, atomically.
  Atomicity SHALL be at the per-event granularity: a partially-written event is invalid and SHALL be detected on next read by re-hashing.
6. **Return witness.** The caller receives the witness for citation in subsequent payloads.

## Normative invariants

- **Atomic append.** An `Event` SHALL be appended to the log atomically.
  A realization that allows a half-written event has lost the substrate's append-only discipline.
- **Hash-stable.** Two `emit-event` calls with byte-identical events under canonical-form serialization SHALL produce identical hashes.
  This is the precondition for federated convergence (per [federation](../../teaching/explanations/federation.md)): the same event emitted by two peer substrates de-duplicates by hash on merge.
- **Fail-closed.** When channel-shape validation, emit-policy check, or origin trace fails, `emit-event` SHALL NOT append the event.
  The failed attempt MAY produce a separate diagnostic event on the `guard` channel (the rejection itself is substrate-visible).
- **Witness-emitting.** Every `emit-event` SHALL produce a `Witness`.
  The witness records the operator's run; the witness's `output_hash` is the cited event's hash so callers can refer to the just-emitted event.
- **No content rewriting.** `emit-event` SHALL NOT alter `event.timestamp`, `event.action`, `event.subject`, `event.actor`, `event.channel`, `event.origin`, or `event.payload`.
  The caller's record is recorded as-is.
  (Realizations MAY normalize whitespace or canonical-form to ensure hash stability; they MAY NOT alter semantic content.)

## Failure modes

- **Channel not found.** `event.channel` names no `Channel` entity in the substrate.
  Reject; emit a `guard` diagnostic naming the missing channel.
- **Shape violation.** The event's payload settles to $\top$ or $f$ against the channel's shape.
  Reject; emit a `guard` diagnostic naming the violated predicates.
- **Policy violation.** The actor does not satisfy the channel's emit-policy.
  Reject; emit a `guard` diagnostic naming the unmet policy predicates.
- **Origin unresolvable.** The cited origin is not a substrate entity.
  Reject; emit a `guard` diagnostic naming the unresolvable origin.
- **Append failure.** The underlying event-log carrier fails to append (disk full, permissions error, network timeout for federated logs).
  Surface as an I/O error to the caller; the substrate's coherence is unaffected (the event was not appended).

## Position

`emit-event` is the substrate's *edit primitive*.
It is what makes [event-sourcing](teaching/explanations/event-sourcing.md) operational: every operator that wants to be in the substrate's history calls `emit-event` exactly once per substrate-affecting action.
Operators that perform multi-step substrate work (a `settle` cycle that fires multiple closure rules; a `respond` invocation that admits a message and saturates) emit one event per substrate-affecting step, with the witness chain establishing the causal sequence.

The morphism's failure modes are also substrate-visible: a rejected `emit-event` produces its own diagnostic event on the `guard` channel, so even rejection is in the log.
This is the engineering content of "every substrate concern is a substrate event": validation, authorization, and rejection are not external layers but substrate entries.
