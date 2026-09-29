---
type: concept
class: observability-discipline
depends-on: [trace, metric, witness, self-representation]
see-also: [cost-discipline, audit]
---

# Instrument as substrate

The substrate's commitment that *observability data is substrate content*. Traces, metrics, logs, and other observability artifacts are not external instrumentation bolted on; they are predications in the substrate, queryable through the substrate's normal operators, replayable through the substrate's audit chain, federatable through the substrate's transport layer.

The discipline has three structural commitments:

- **Observability emissions are witnessed.** Per [trace](trace.md) and [metric](metric.md), emitting observability data is a substrate operation that produces a witness (typically a lightweight one, per the substrate's policy on observability-witness verbosity). The witness chain includes the observability emissions; an auditor can reconstruct what the substrate observed about itself.
- **Observability queries are reads.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), querying traces / metrics / logs from the substrate is a free read. External observability platforms reading from the substrate do not change substrate state; per [interfacer](interfacer.md), the read interface to observability data may be specialized (a Prometheus scrape endpoint, an OpenTelemetry collector pull) but it is structurally a substrate read.
- **Observability is replayable.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), replay of a substrate from a snapshot reproduces the substrate's behavior including its observability emissions. The substrate's policy may suppress duplicate-emission during replay (since the original emissions are already in the export pipeline), but the *capability* to re-emit is preserved.

The discipline contrasts with conventional observability where instrumentation is external code (separate logging libraries, separate metrics SDKs, separate trace propagation). Conventional instrumentation has structural problems the substrate-side discipline avoids:

- **External instrumentation is opaque to the substrate.** The substrate's audit chain doesn't include the instrumentation's emissions; an auditor cannot verify what the substrate observed.
- **External instrumentation can drift from substrate behavior.** A code path that doesn't emit instrumentation is invisible to monitoring; the gap is detectable only by comparing instrumentation against an independent ground truth (which conventional systems usually don't have).
- **External instrumentation is not federation-portable.** Two substrates may instrument the same operations differently (different log levels, different metric labels), making cross-substrate observability comparison error-prone.

By bringing observability into the substrate, the discipline makes monitoring as auditable, federation-compatible, and replayable as the substrate's other operations. An auditor reading the witness chain reads both *what happened* (the operation effects) and *what was observed* (the instrumentation emissions); the two are byte-comparable across substrates.

Per the substrate's [cost-discipline](cost-discipline.md), observability emissions have cost — they consume some settlement fuel, they enlarge the event log, they have storage and transport overhead. The substrate's policy on observability verbosity (which operations are traced, which metrics are emitted, at what sampling rate) is itself substrate content; an auditor can query the policy and verify that the emissions match.
