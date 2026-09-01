---
type: concept
class: observability-aggregate
depends-on: [witness, time-and-event-ordinals, cost-discipline, continuous-valued-settling, quantale-enriched-sheaf, q-enriched-cohomology]
see-also: [trace, instrument-as-substrate, telemetry, telemetry-as-continuous-valued-settling-projection]
---

# Metric

An *aggregate observability quantity* derived from substrate operations: counts, rates, distributions, gauges. In the substrate's hyperdoctrine setting, a metric is not just a numeric summary — it is *a [Q-enriched cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-enriched-cohomology.md) class of the underlying continuous-valued telemetry settling*. Where a [trace](trace.md) records *one logical unit of work* in causal detail (a section over an apex cone), a metric records *summary statistics over many operations* — structurally a cohomology class collapsing the per-event detail into an aggregate.

## Hyperdoctrinal grounding

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's [telemetry](telemetry.md) is a continuous-valued settling in some quantale $\mathcal{V}$. Per [q-enriched-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-enriched-cohomology.md), the cohomology of a Q-enriched sheaf in $\mathcal{V}$ is itself $\mathcal{V}$-valued — not abelian-group-valued.

A metric is then structurally:

- **A choice of dimension** — which $\mathcal{V}$ the metric lives in (latency in $[0, \infty]$, rate in $\mathbb{R}_{\geq 0}$, etc.).
- **A choice of cover** — which substrate region the metric aggregates over (one operator's history, one session's history, the whole substrate).
- **A cohomology class** — the metric's value, computed as the appropriate $\mathcal{V}$-valued cohomology of the telemetry-settling restricted to the cover.

Specifically:

- **Counter.** A monotonically-increasing count of something — the $H^0$ of a $\mathbb{Z}$-valued telemetry sheaf on the operator's history. Counters reset only on substrate-instance bootstrap, not during normal operation; the reset is a new $H^0$ computation against the post-bootstrap settling.
- **Gauge.** A point-in-time scalar — the $H^0$ at a particular ordinal $\sigma$ of the gauge's value-domain $\mathcal{V}$. Gauges go up and down because the underlying value-domain admits both directions.
- **Histogram / distribution.** A distribution of observed values — the $H^0$ of a $\mathcal{V}$-valued telemetry sheaf where $\mathcal{V}$ is itself a distribution-space (e.g., the $\mathcal{V}$ of probability distributions on $[0, \infty]$).
- **Rate.** A counter's derivative — the $H^1$ obstruction class measuring "rate of change" via the discrete derivative on the counter sheaf.

Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), each of these aggregations is a structural cohomology computation on the substrate's telemetry-settling — not an ad-hoc summarization performed by an external observability system.

## Cost class

Metrics are the substrate's observability primitive at the aggregate granularity. Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), reading a metric is a free substrate operation — metrics are derivable from existing witnesses via aggregation (cohomology of the telemetry sheaf). *Recording* a metric during operation execution emits an additional observability witness; per the substrate's policy, metric witnesses are typically lightweight annotations marked no-op-on-replay.

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), metric values compose via the underlying quantale's operation: latencies add, reliabilities multiply, throughputs take the minimum (bottleneck). The substrate's cost-aggregation across an operation chain follows the quantale's structure exactly.

## Engineering surface

The substrate does not commit to a specific metric format. Common choices:

- **Prometheus exposition format** — pull-based scrape model with labeled time-series. Maps well to gauge metrics; counters need careful handling to preserve $H^0$ semantics across reset events.
- **OpenTelemetry metrics** — industry-standard with multiple export backends. Supports counter/gauge/histogram natively; the substrate's $\mathcal{V}$-grounding is invisible to the export layer.
- **StatsD / DogStatsD** — push-based UDP protocol; widely-supported.
- **Substrate-native** — metrics derivable from witness traversal without an external format. Per the cohomology framing, the substrate can compute the metric on-demand from the telemetry sheaf.

A metric's *export* — sending metric data to an external time-series database (Prometheus, InfluxDB, Datadog, CloudWatch) — is a federated operation per [send-message](../morphisms/send-message.md). Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), the metric export's round-trip is fidelity-preserving on the metric predications. Per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the export interfacer must be faithful for the external system to faithfully represent the substrate's metrics.

## Position

Metrics compose with [trace](trace.md) (which is per-operation, sheaf-section over apex cone), with [witness](../objects/witness.md) (which is the aggregation source), and with the substrate's audit chain (which makes metric historical-recomputation possible from the witness log).

Per the cohomology framing, the substrate's metric retention policy — how long detailed metrics are kept, when they're aggregated to coarser granularity, when they're retired — corresponds to which sub-cover of the telemetry-settling is preserved. A coarser cover yields lower-resolution metrics but smaller storage; per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the choice is a sheaf-restriction along the cover refinement.

The metric retention policy is itself substrate content per [self-representation](self-representation.md). An auditor can query the metric retention policy and verify that metric-history aligns with policy.
