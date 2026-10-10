---
type: morphism
class: observability-operation
realizes: [trace, instrument-as-substrate]
depends-on: [trace-record, witness, emit-witness]
see-also: [emit-metric, observability-as-reads]
---

# Emit trace

The substrate operation that records a trace annotation or starts a new trace span. Emit-trace is the substrate's primary trace-emission operator at the operation boundary.

## Signature

`emit-trace(trace-id, annotation, parent-witness?) → trace-witness`

Inputs:

- **`trace-id`** — the [trace record](../objects/trace-record.md) the annotation belongs to. May be a fresh trace-id (starting a new trace) or an existing one (annotating).
- **`annotation`** — the annotation payload: a key-value map, a structured event, an outcome marker.
- **`parent-witness`** — optional reference to a parent witness in the trace's causal chain. If absent, the new annotation starts at the trace's current chain head.

Outputs:

- **`trace-witness`** — a [witness](../objects/witness.md) recording the annotation, marked as a trace-witness in the substrate's audit chain.

## Operational semantics

Emit-trace proceeds in three steps:

1. Resolve the trace-id (or create a fresh trace record if starting a new trace).
2. Compose the annotation with the parent-witness reference (or default to the trace's current chain head).
3. Per [emit-witness](emit-witness.md), produce a witness recording the annotation. The witness is added to the trace record's witness-chain.

Per the substrate's policy on observability-witness verbosity, trace-witnesses may be marked no-op-on-replay (informational, not consulted for substrate behavior on replay). The substrate's audit chain still includes them; they are queryable via traversal.

## Engineering invariants

- **Causal-chain-coherent.** Per [trace-record](../objects/trace-record.md), the trace's witness chain must respect causal order. Emit-trace's annotation is added in the chain at the right ordinal position.
- **Lightweight.** Trace annotations are typically lightweight predications. Per [cost-discipline](teaching/explanations/cost-discipline.md), the substrate's trace policy controls the verbosity to avoid overwhelming the audit chain.
- **Witness-emitted.** Per [emit-witness](emit-witness.md), every emit-trace produces a witness. The witness is what makes the trace replayable and federation-portable.

## Failure modes

- **Trace-id resolution failure.** A trace-id that doesn't resolve to an existing trace record (e.g., stale propagated id) produces a trace-id-unknown event. The substrate's response: optionally start a fresh trace at this annotation.
- **Substrate-side throttle.** If the substrate's observability policy throttles emissions (e.g., a per-second cap on trace-emissions), excess emit-trace calls are silently sampled or dropped per the policy.

## Position in the substrate

Emit-trace is the operator that *records* substrate-internal observability events. Per [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md), the substrate's observability is its own content; emit-trace is the writer-side of trace data. Per [observability-as-reads](../theorems/observability-as-reads.md), reading the resulting trace is a free substrate operation.

The pattern composes with [trace-record](../objects/trace-record.md), [witness](../objects/witness.md), [emit-witness](emit-witness.md), and [emit-metric](emit-metric.md) (the metric-emission counterpart).
