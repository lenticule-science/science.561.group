---
type: concept
class: observability-record
depends-on: [witness, time-and-event-ordinals, cost-discipline, settling-cohomology, lorentzian-causal-settling, predication-fibration]
see-also: [metric, instrument-as-substrate, trace-causality-via-mayer-vietoris-spans]
---

# Trace

A *causally-ordered record of substrate operations* spanning a logical unit of work — typically a session, a message-handling cascade, a federation roundtrip. In the substrate's hyperdoctrine setting, a trace is not a flat span list — it is *a path in the substrate's [Lorentzian causal settling](../../knowledge-least-valuation/settling/content/lorentzian-causal-settling/lorentzian-causal-settling.md), lifted to a [section of the settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) over the timelike-related events*. Per [trace-causality-via-mayer-vietoris-spans](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/trace-causality-via-mayer-vietoris-spans.md), the trace's structure is exactly determined by the apex-cone (timelike-related events the trace traverses) of the originating operation, and its assembly from witnesses is structurally a Mayer-Vietoris gluing across the federation cover.

A trace is the substrate's observability primitive at the operation-granularity: per [witness](../objects/witness.md), every operator emits a witness, and a trace is the structural assembly of related witnesses into a causally-ordered chain that an external observer can follow.

## Hyperdoctrinal structure

Per [event-causality-via-lorentzian-settling](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/event-causality-via-lorentzian-settling.md), substrate events form a Lorentzian causal set. A trace is structurally:

- **A seed event** $e_0$ — the originating operation (session-start, message-receipt, federation-handshake-init).
- **The apex cone of $e_0$** — all events causally reachable from $e_0$, i.e., $\{e : e_0 \preceq e\}$. These are the timelike-related events the trace will traverse.
- **A sheaf section over the apex cone** — at each event in the trace, the section assigns the witness emitted by that event.

Per [trace-causality-via-mayer-vietoris-spans](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/trace-causality-via-mayer-vietoris-spans.md), traces from different originating operations may overlap on shared events (a federation-roundtrip and a session-trace both touching the same agent-call); the sheaf condition on the overlap is exactly Mayer-Vietoris gluing — the two traces agree on the witnesses they share.

A trace has the structure:

- **A trace identifier** — typically inherited from the originating operation (the session-id, the federation-message-id) and propagated through subsequent witnesses that the operation triggered. In the apex-cone framing, the trace ID is the canonical hash of $e_0$.
- **A causal chain** — references to the witnesses, in causal order, that constitute the trace. Per [time-and-event-ordinals](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/time-and-event-ordinals.md), causal order is the substrate's ordinal-respecting partial order on operations (the Lorentzian $\preceq$).
- **Per-witness annotations** — duration, inputs, outputs, error / success status, additional contextual predications.

Traces are observability content, not substrate-state-changing content. Per [cost-discipline-reads-free](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md), reading a trace is a free substrate operation — the trace is assembled from existing witnesses without consuming settlement fuel.

## Why Lorentzian causality is the right grounding

A naive view: a trace is a list of operations a session performed. But that view doesn't accommodate (a) parallel operations within the trace (multiple agents acting concurrently on a shared work-item), (b) operations that join the trace from outside (a federation peer's response that gets merged in), or (c) operations spacelike-separated to other traces. The Lorentzian causal-settling framing handles all three:

- **Parallel within trace.** Per the Lorentzian apex/void duality, multiple events may be in the seed's apex cone without being timelike-related to each other — they're spacelike-separated *within* the trace. The trace records them as concurrent within the apex cone.
- **Joining from outside.** A federation peer's response causally depends on the federation request — it lies in the apex cone of the federation-request event, hence in the apex cone of the originating session. The trace naturally includes it via apex-cone closure.
- **Inter-trace independence.** Two traces with spacelike-separated seeds traverse disjoint apex cones (modulo any explicit cross-references). They don't interfere; per [event-causality-via-lorentzian-settling](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/event-causality-via-lorentzian-settling.md), spacelike-separation is exactly the substrate's structural notion of "these are independent observations."

## Engineering surface

The substrate does not commit to a specific trace format. Common choices:

- **OpenTelemetry traces** — industry-standard distributed-trace format with spans, span-contexts, baggage. Spans correspond to events in the apex cone; span-context propagation is causal-link recording. Suitable for substrates federating with non-substrate systems that already use OpenTelemetry.
- **W3C Trace Context** — propagation format for cross-substrate trace IDs.
- **Substrate-native traces** — the trace is just the witness chain queryable via [traversal](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/traversal.md). No external format is required when the trace consumer is a substrate-aware tool.

A trace's *export* — sending trace data to an external observability platform (Jaeger, Honeycomb, Datadog) — is a federated operation per [send-message](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/send-message.md), with the external platform as a federation peer (or via an interfacer that translates substrate witnesses into the platform's expected format). Per [interfacer-counit-law](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/interfacer-counit-law.md), the trace export's round-trip is fidelity-preserving on the predications it carries.

## Position in the substrate

Traces compose with [metric](../../../../../../../../../../../../../../../../../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/metric.md) (observability at aggregate granularity), with [witness](../objects/witness.md) (per-operation), with the substrate's audit chain (operation-replay primitive that traces are derived from), and with the [event-log](../objects/event-log.md) (which is the substrate's complete record of all events; a trace is a particular sub-graph of the log).

Per [trace-causality-via-mayer-vietoris-spans](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/trace-causality-via-mayer-vietoris-spans.md), the trace's correctness — that the assembled witness chain accurately records the originating operation's effects — follows from the sheaf condition on the apex cone, exactly as the substrate's other distributed-coordination disciplines (replication, federation) follow from their corresponding sheaf conditions.
