---
type: concept
class: discipline
depends-on: [witness, event-log, self-representation]
see-also: [hash-discipline, two-store-coherence]
---

# Provenance

The discipline that *every state change in a predicated computer is traceable to its justification* — the substrate-level predications, operator invocations, or external inputs that caused it. A predicated computer that maintains provenance can answer, for any predication or any state, "why is this here?" by following a chain of substrate events back to the originating cause; a predicated computer that doesn't has regions where state changes are unexplained from the substrate's perspective.

The chain is a substrate-level artifact:

- Every operator invocation produces a [witness](witness.md) entry recording its inputs, its body, and its outputs.
- Every [event log](../objects/event-log.md) entry cites the operator's identity and the operator's specification at the time of invocation.
- Every operator specification is itself a substrate entity (per [self-representation](self-representation.md)), reachable by traversal.
- The terminal nodes of the chain are *external inputs* — predications that arrived from outside the substrate via inbound message, manual edit, or other declared boundary — or *originating predications* declared in the substrate's seed content.

The chain is finite: every internal predication has a finite chain back to external inputs or originating predications, and the substrate can produce that chain on demand. Cycles in the chain are bugs (a predication "caused by itself" via a closure rule that cited it as input is a closure-loop violation, detectable by the substrate's locality discipline).

Three engineering uses:

- **Audit.** Given a predication, the substrate's traversal of its provenance chain produces the sequence of events that caused it. The chain is verifiable against the [event log](../objects/event-log.md) by canonical-hash comparison, per [hash discipline](hash-discipline.md).
- **Justification.** Every action is traceable to the closure rules, operator specifications, or external commitments that admit it. An action with no provenance chain back to substrate-internal causes is an unjustified action — the substrate flags it, and the gap is engineering content (a missing rule, an unspecced predicate, an external boundary that was not declared).
- **Diff and impact analysis.** When a substrate entity is proposed for change (a closure rule edited, a shape modified, an external input retracted), the provenance chains that depend on the entity surface what would change. The substrate can compute the affected predications by traversing forward from the proposed change.

Provenance is what makes a predicated computer auditable in a non-trivial sense. A computer that records *what happened* is logging; a computer that records *why each thing happened, in a chain that bottoms out at declared substrate causes* is provenance-disciplined. The difference shows up at audit time: the logging-only computer can replay events but cannot answer why-questions about specific predications; the provenance-disciplined computer can answer any why-question by traversal.
