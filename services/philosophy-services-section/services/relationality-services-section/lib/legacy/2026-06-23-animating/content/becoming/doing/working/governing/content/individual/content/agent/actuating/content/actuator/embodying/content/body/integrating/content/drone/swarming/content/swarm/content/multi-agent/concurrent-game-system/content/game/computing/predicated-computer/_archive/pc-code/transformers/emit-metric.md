---
type: morphism
class: observability-operation
realizes: [metric, instrument-as-substrate]
depends-on: [metric-series, witness, emit-witness]
see-also: [emit-trace, observability-as-reads]
---

# Emit metric

The substrate operation that records a metric sample or updates a metric-series. Emit-metric is the substrate's primary metric-emission operator.

## Signature

`emit-metric(metric-series-id, sample-value) → metric-witness`

Inputs:

- **`metric-series-id`** — reference to the [metric series](../objects/metric-series.md) being updated.
- **`sample-value`** — the value to record. Interpretation depends on the metric kind: counter delta, gauge replacement, histogram observation.

Outputs:

- **`metric-witness`** — a [witness](../objects/witness.md) recording the sample emission, marked as a metric-witness in the substrate's audit chain.

## Operational semantics

Emit-metric proceeds in three steps:

1. Resolve the metric-series-id. If the series doesn't exist, optionally create it per the substrate's auto-create policy (or refuse).
2. Per the metric's kind, compute the new sample. For counters, add the delta to the previous value. For gauges, replace. For histograms, increment the appropriate bucket. For rates, derive from the underlying counter.
3. Per [emit-witness](emit-witness.md), produce a witness recording the sample emission. The witness is added to the metric-series's `samples` list.

Per the substrate's policy on observability-witness verbosity, metric-witnesses may be marked no-op-on-replay. The substrate's audit chain still includes them; per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), metric history is reconstructable from the witness log.

## Engineering invariants

- **Counter-monotonic.** Per [metric-series](../objects/metric-series.md), counter samples are monotone. Emit-metric on a counter with a negative delta is rejected as malformed (counter-decrements require an explicit reset event).
- **Label-coherent.** The metric-series-id's labels are immutable post-creation. Emit-metric does not modify labels.
- **Sample-ordinal-deterministic.** Each emit-metric records the substrate's current ordinal as the sample's timestamp. Per [settlement-determinism](../theorems/settlement-determinism.md), two replayed emit-metric calls produce samples at the same ordinal.

## Failure modes

- **Metric-series unknown.** A metric-series-id that doesn't resolve produces a series-unknown event. The substrate's response: optionally auto-create per policy, or refuse.
- **Counter underflow.** A counter delta that would produce a negative value is rejected; the substrate's response is either to clamp at zero or to record an invalid-counter-delta witness.
- **Substrate-side throttle.** If the substrate's metric policy throttles emissions, excess emit-metric calls are sampled or dropped per the policy.

## Position in the substrate

Emit-metric is the operator that *records* substrate-internal aggregate observability. Per [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md), metrics are substrate content; emit-metric is the writer-side. Per [observability-as-reads](../theorems/observability-as-reads.md), reading the resulting metric series is a free substrate operation.

The pattern composes with [metric-series](../objects/metric-series.md), [witness](../objects/witness.md), [emit-witness](emit-witness.md), and [emit-trace](emit-trace.md) (the trace-emission counterpart).
