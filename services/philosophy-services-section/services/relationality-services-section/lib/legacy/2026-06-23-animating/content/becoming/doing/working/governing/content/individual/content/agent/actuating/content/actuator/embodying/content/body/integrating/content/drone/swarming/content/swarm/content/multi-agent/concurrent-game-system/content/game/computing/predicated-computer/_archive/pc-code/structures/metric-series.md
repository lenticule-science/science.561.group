---
type: definition
class: substrate-entity
realizes: [metric, instrument-as-substrate]
depends-on: [metric, witness, time-and-event-ordinals, hash-discipline]
see-also: [trace-record, witness]
---

# Metric series

A **metric series** is the substrate-entity formal definition of one [metric](teaching/explanations/metric.md): a time-indexed sequence of observed values for a particular metric-identity, derivable from substrate witnesses and queryable as substrate content.

## Structural fields

- **`id`** — kebab-case identifier; canonical-form hash of `(metric-name, label-set)`.
- **`description`** — one-line summary (typically the metric's role: `dispatch-rate`, `event-log-size`, `federation-latency`).
- **`metric-kind`** — declaration: `counter`, `gauge`, `histogram`, `rate`. Determines aggregation rules.
- **`labels`** — key-value pairs disambiguating this series from others with the same metric-name (e.g., `{operation: "dispatch", agent: "calder-underhill"}`).
- **`unit`** — declared unit (`bytes`, `seconds`, `count`, `bytes-per-second`). Required for cross-series comparison.
- **`samples`** — references to the time-indexed sample values, each carrying a substrate-ordinal and a value.
- **`retention-policy`** — references to the retention rules: how long detailed samples are retained, when aggregation occurs, when samples are retired.
- **`source-witnesses`** — for derived metrics (e.g., a counter incremented per dispatch operation), references to the witnesses the metric is computed from.
- **`closure-kind`** — `metric`.

## Invariants

- **Counter-monotonic.** A counter metric's samples are monotonically non-decreasing (modulo substrate-instance restarts, which produce a counter-reset event). Non-monotone counter samples are a malformation.
- **Sample-ordinal-coherent.** Sample ordinals are within the substrate's [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md) range. Samples claiming ordinals outside the substrate's history are malformed.
- **Label-set-stable.** A metric-series's labels do not change after creation; new label-sets produce new metric-series. Two series with the same name but different labels are distinct series.
- **Replay-derivable.** For derived metrics, the metric-series can be re-derived from the source witnesses by replay. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), this is what makes metric history reconstructable from the substrate's audit chain.

## Operations

- *Emit-sample.* Add a new sample to the series. For counters, the new sample is the previous + delta. For gauges, the new sample replaces the gauge's current value. For histograms, the new sample is added to the appropriate bucket. Emit-sample is a substrate operation producing a witness.
- *Read.* Query samples in a substrate-ordinal range. Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), reads are free.
- *Aggregate.* Per the retention-policy, fold detailed samples into coarser-granularity aggregates (e.g., per-minute samples → per-hour averages). Aggregation is itself a substrate operation producing aggregation witnesses.
- *Export.* Read the metric series and serialize for an external time-series platform (Prometheus, InfluxDB, Datadog).
- *Retire.* Per the retention-policy, retire old samples. Retirement is a substrate operation.

## Position in the substrate

Metric series are the substrate's *aggregate-observability registry*. Per [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md), metrics are substrate content. The substrate's audit chain includes metric history; per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), historical metrics are reconstructable from the witness log.

The pattern composes with [metric](teaching/explanations/metric.md), [witness](witness.md) (the source for derived metrics), [trace-record](trace-record.md) (the per-operation observability counterpart), and the substrate's retention-policy machinery.
