---
type: concept
class: discipline
depends-on: [self-representation, witness, continuous-valued-settling, predication-fibration, quantale-enriched-sheaf]
see-also: [event-log, provenance, telemetry-as-continuous-valued-settling-projection, metric]
---

# Telemetry

The discipline that *runtime observation of the predicated computer is itself substrate content*. In the substrate's hyperdoctrine setting, telemetry is not "metrics emitted to an external system" — it is *a [continuous-valued settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md) on the substrate's runtime fiber*, with telemetry values living in a continuous value-domain $\mathcal{V}$ (typically the Lawvere quantale $[0, \infty]$ for latencies, or $[0, 1]$ for fuzzy intensities). Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), the substrate's telemetry is the projection of a continuous-valued settling onto an observation cover — observations propagate via the substrate's closure machinery exactly as bilattice predications do, just in $\mathcal{V}$ instead of $\mathbf{FOUR}$.

Latency, throughput, queue depths, replica lag, error counts, resource consumption — every measurement the substrate's runtime produces is recorded as predications on substrate entities, queryable through the substrate's operators alongside the content the runtime is acting on.

## Hyperdoctrinal grounding

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's framework extends to value categories beyond the bilattice — Lawvere quantales, real-valued lattices, fuzzy logics. The substrate's telemetry is exactly such an extension: where ordinary substrate predications take values in $\mathbf{FOUR}^\bowtie$ (told, told-not, uninformed, told-both), telemetry predications take values in continuous-valued $\mathcal{V}$:

- **Latency** lives in the Lawvere quantale $\mathcal{V} = ([0, \infty], +, \min)$ — composition is addition (latencies add along causal chains), join is minimum (the fastest path is the cheapest).
- **Reliability / availability** lives in $\mathcal{V} = ([0, 1], \cdot, \max)$ — composition is product (independent failures multiply), join is maximum (the most reliable component dominates).
- **Throughput** lives in $\mathcal{V} = \mathbb{R}_{\geq 0}$ with $\min$-composition — bottleneck capacity.
- **Belief intensity** (for fuzzy substrates) lives in $\mathcal{V} = [0, 1]$ with product or min.

Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), the substrate's telemetry-recording is a continuous-valued closure-rule application: each operator emits a value in $\mathcal{V}$ for each tracked dimension; the closure operator combines values along the operator's causal chain via the appropriate quantale composition.

## Why this is structurally different from external monitoring

An external monitoring system collects metrics from the runtime via side channels (Prometheus scrapers, log aggregators, OpenTelemetry collectors) and stores them in a separate system the substrate cannot read. The metrics are bytes in a foreign system; the substrate's reasoning has no access to them.

A predicated computer maintaining the telemetry discipline emits the same observations as substrate predications: the latency of an operator invocation is a $\mathcal{V}$-valued predication on the operator-invocation entity; the throughput of a closure-rule application is a $\mathcal{V}$-valued predication on the closure-rule entity; the queue depth at an inbox is a $\mathcal{V}$-valued predication on the inbox entity. Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), the substrate's runtime is itself a continuous-valued settling — telemetry is not a side observation but a projection of that settling.

## Three engineering uses

- **Self-observation.** A substrate operator can query the runtime's behavior by [traversal](../morphisms/traversal.md). An operator that asks "is this closure rule slow?" is a substrate query against the continuous-valued telemetry settling, not an external API call. The substrate sees its own performance as data.
- **Provenance for performance.** Per [provenance](provenance.md), every state change is traceable to its cause; with telemetry as substrate content, the *cost* of every state change is also traceable. The substrate can answer "this query was slow because closure rule $r$ matched at high cardinality" by chaining provenance + telemetry predications. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the costs compose multiplicatively in the quantale.
- **Tunable from inside.** Decisions that affect runtime behavior — which closure rules to apply first, which agents to dispatch to, which replicas to read from — can be made by substrate operators consulting the substrate's own telemetry. A predicated computer can tune itself by reading its own predications; an externally-monitored system requires out-of-band feedback.

## Continuous-valued telemetry composes with bilattice substrate

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the four-regime classification generalizes to continuous $\mathcal{V}$: telemetry settlings have their own regime classification (typically Scott-continuous for incrementally-arriving telemetry, possibly aperiodic for long-running monitoring of unbounded streams). Per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md), telemetry-settlings on a federation graph compose as Q-enriched sheaves — exactly as federation trust does (per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md)).

The substrate's bilattice settling and its continuous-valued telemetry settling live on the same predication graph; they're separate fibrations that reference the same entities. An operator can read both — what does this entity hold (bilattice value), and what is its measured performance ($\mathcal{V}$-value).

## Position in the substrate

The discipline does not require all telemetry to be persisted forever. Coarse, time-windowed, or summary telemetry is admissible; the requirement is that the telemetry that is recorded is *substrate content* under the same conventions (canonical form, hash discipline, provenance) as ordinary predications. Externalized telemetry — metrics in a separate observability system the substrate cannot see — is admissible as a secondary view but does not satisfy the discipline.

The discipline's load-bearing consequence: a predicated computer that knows about its own behavior in the same way it knows about its content can *act on its own behavior* — adjusting closure rules, rebalancing replicas, reroaming agents — through the same operators it uses to act on its content. Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), this self-acting capability is structural: the substrate's runtime telemetry-settling is *queryable substrate content*, not auxiliary metadata.
