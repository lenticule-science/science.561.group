---
type: definition
class: substrate-entity
realizes: [trace, instrument-as-substrate]
depends-on: [trace, witness, time-and-event-ordinals, hash-discipline]
see-also: [metric-series, witness]
---

# Trace record

A **trace record** is the substrate-entity formal definition of one [trace](teaching/explanations/trace.md): the predication-graph entity recording one logical unit of work as a causal chain of substrate operations.

## Structural fields

- **`id`** — kebab-case identifier; canonical-form hash of `(originating-operation-id, root-witness-id)`.
- **`description`** — one-line summary (typically the work-unit's purpose: `session-start`, `dispatch-cascade`, `federation-roundtrip`).
- **`originating-operation`** — reference to the operation that started the trace (a session open, a federated message receive, an autonomous heartbeat).
- **`root-witness`** — reference to the first witness in the trace's causal chain.
- **`witness-chain`** — references to all witnesses in the trace, in causal order. Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), causal order is the substrate's ordinal-respecting partial order on operations.
- **`participating-substrates`** — for traces spanning federation boundaries, references to the substrate-instances that contributed witnesses.
- **`started-at`** — substrate ordinal of the first witness.
- **`ended-at`** — substrate ordinal of the last witness (or the substrate's current ordinal for active traces).
- **`outcome`** — declared trace outcome: `success`, `partial`, `failure`, with optional diagnostic.
- **`annotations`** — additional contextual predications: tags, custom attributes, baggage propagated across the trace.
- **`closure-kind`** — `trace`.

## Invariants

- **Causal-coherent.** The witness-chain's causal order respects the substrate's [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md). A trace whose witnesses are in inconsistent order is malformed.
- **Cross-substrate-coherent.** For traces spanning federation boundaries, the participating substrates' contributions are integrated coherently. Per [federation-convergence](../theorems/federation-convergence.md), the substrate's eventual federation-state is what determines the trace's cross-substrate completeness.
- **Replay-stable.** A trace replayed from a snapshot reproduces the same trace structure (modulo wall-clock timestamps, which are informational). Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the substrate's trace content is replay-fidelitous.
- **Annotation-ordered.** Per-witness annotations are recorded with their associated witness; the annotation-witness pairing is deterministic on the operation's content.

## Operations

- *Open.* A trace is opened by emitting a root witness with a fresh trace-id (typically derived from the originating operation's id). Subsequent witnesses produced by the trace's downstream operations cite the trace-id to associate themselves.
- *Annotate.* During the trace's potential period, operations may add annotations to the trace's existing witnesses or emit new annotation-witnesses. Annotations are typically lightweight, marked no-op-on-replay per the substrate's policy.
- *Close.* A trace is closed by setting `ended-at` and `outcome`. Closed traces admit no further witnesses citing the trace-id; new operations get their own trace.
- *Export.* The trace's content is read (per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md)) and serialized for an external observability platform. Per [interfacer](teaching/explanations/interfacer.md), the export interfacer must be doctrine-fidel on the trace predications.
- *Audit.* Querying a trace's full witness chain, cross-substrate participation, and outcome are substrate traversals.

## Position in the substrate

Trace records are the substrate's *operation-level observability registry*. Per [instrument-as-substrate](teaching/explanations/instrument-as-substrate.md), the trace records are substrate content; an external observability platform reading from the substrate is reading substrate state, not querying a separate instrumentation system.

The pattern composes with [trace](teaching/explanations/trace.md), [witness](witness.md) (the trace's constituent units), [metric-series](metric-series.md) (the aggregate observability counterpart), and the [audit stack](teaching/explanations/substrate-as-stack-composition.md).
