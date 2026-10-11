---
type: theorem
class: engineering-claim
status: proved
depends-on: [trace, metric, instrument-as-substrate, cost-discipline-reads-free, witness]
see-also: [emit-trace, emit-metric]
---

# Observability queries are reads and free per cost-discipline

**Claim.** Every external observability operation against the substrate — querying [trace records](../objects/trace-record.md), reading [metric series](../objects/metric-series.md), scraping endpoint metrics, exporting traces to an external platform — is a substrate read and produces no advance of the substrate's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). Per [cost-discipline-reads-free](cost-discipline-reads-free.md), observability queries do not consume settlement fuel, do not advance history, do not change substrate state.

The substrate's observability surface is therefore *infinitely scalable* with respect to substrate state — additional consumers reading the substrate's traces and metrics do not affect the substrate's own behavior.

The claim does *not* extend to observability *emissions* (per [emit-trace](../morphisms/emit-trace.md), [emit-metric](../morphisms/emit-metric.md)) — those are state-changing operations that produce witnesses and consume fuel like any other write. Cost is in the *production* of observability data, not in its consumption.

## Why this holds

The argument follows from [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md)'s commitment that observability data is substrate content, plus [cost-discipline-reads-free](cost-discipline-reads-free.md)'s blanket guarantee that reads are free.

**Part 1: Trace and metric data is substrate content.** Per [trace](teaching/explanations/trace.md), [metric](teaching/explanations/metric.md), and [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md), the substrate's traces and metrics live in the predication-graph store as ordinary substrate content. Querying them is a [traversal](../morphisms/traversal.md) over the predication graph.

**Part 2: Substrate traversals are reads.** Per [cost-discipline-reads-free](cost-discipline-reads-free.md), traversals do not advance the substrate's settling — they retrieve content from the current valuation $v_\tau$ without producing a successor valuation $v_{\tau+1}$.

**Part 3: External observability platforms reading via interfacers are also reads.** Per [interfacer](teaching/explanations/interfacer.md), an external platform's read interface (Prometheus scrape, OpenTelemetry collector pull, custom export endpoint) is structurally a read operation. The interfacer translates substrate predications into the external format, but the underlying substrate operation is a read.

**Part 4: Read concurrency is unbounded.** Per [cost-discipline-reads-free](cost-discipline-reads-free.md)'s engineering consequence, multiple consumers reading the substrate simultaneously do not contend. So an arbitrary number of observability platforms can be reading the substrate's traces and metrics in parallel without affecting either each other or the substrate.

## Engineering consequence

The substrate's observability surface is *operationally decoupled* from the substrate's main work. Several engineering consequences follow:

- **Unlimited monitoring scaling.** Adding more dashboards, alerting rules, debug consumers does not affect substrate behavior. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), there is no upper bound on read concurrency.
- **Observability-driven debugging is non-disruptive.** A debugger attaching to the substrate's trace stream to investigate an issue is a read, not a state change. The debugger's queries do not affect the substrate's behavior; the issue under investigation reproduces faithfully.
- **Federation-portable observability.** Observability data crosses federation boundaries the same way other substrate content does, per [federation-convergence](federation-convergence.md). A central observability substrate aggregating traces from many federated peers is a normal federated read operation.
- **Replay-equivalent observability.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), replaying a substrate from a snapshot reproduces the trace and metric history. Historical debugging is therefore lossless — the auditor reads the replay's trace data the same way they'd read live data.

## Where cost shows up

The free-read claim is about *consumption* of observability data, not *production*. Production has cost:

- **Per emission.** Each [emit-trace](../morphisms/emit-trace.md) and [emit-metric](../morphisms/emit-metric.md) produces a witness, contributing to the [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md). The cost is the witness's storage and any closure-rule applications it triggers.
- **Per retention period.** Long-retained traces and metrics consume storage. The substrate's retention policy controls cost vs. observability-history tradeoffs.
- **Per export.** Sending observability data to external platforms involves [send-message](../morphisms/send-message.md) operations across transport — the standard federation cost.

The substrate's observability *policy* (verbosity, retention, sampling rate) controls production cost; it does not affect consumption cost (which is structurally zero per the theorem).

## What the theorem rules out

- A substrate where reading observability data triggers state changes (e.g., "incrementing a read-counter on each query") has lost the free-reads guarantee for observability. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), the read-counter pattern would itself be a settle-on-read operation, billed accordingly.
- An external observability platform that *modifies* substrate state during querying (e.g., a "snapshot-on-query" pattern) is not a pure read — it is an admit-and-settle operation. The platform's discipline is to keep its querying read-only.
- A substrate whose observability data is *not* substrate content (external instrumentation system, separate logging library) doesn't have the read-discipline guarantees from the substrate side. Such a system has its own cost model that the substrate cannot reason about.

## What the theorem requires

- The substrate's observability data is substrate content per [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md).
- The substrate's read operators (traversals) satisfy [cost-discipline-reads-free](cost-discipline-reads-free.md).
- External observability platforms read via [interfacers](teaching/explanations/interfacer.md) that are themselves reads (no side effects on substrate state).
- The substrate's observability-witness emissions during operation execution may be cost-bearing, but their consumption is not.
