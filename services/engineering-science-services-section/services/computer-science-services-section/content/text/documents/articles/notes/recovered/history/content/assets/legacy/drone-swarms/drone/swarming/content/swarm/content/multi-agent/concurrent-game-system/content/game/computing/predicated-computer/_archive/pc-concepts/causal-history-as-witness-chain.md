---
type: concept
class: substrate
status: sketch
depends-on: [witness, event-log, provenance, fagin-halpern-moses-vardi1995, almeida-baquero-shapiro2018]
see-also: [provenance-semiring-witness, federation-as-substrate-join]
---

# Causal history as witness chain

The platform's reformulation of *causal history tracking* in distributed systems (vector clocks, version vectors, Lamport timestamps, dotted-version-vectors): the substrate's [witness](witness.md) chain *is* the substrate's causal-history record, with the partial order on substrate events readable directly from the witness DAG without separate clock metadata.

The classical view: distributed-systems implementations track causal order through external metadata attached to each event:

- *Lamport timestamps* — a per-process counter incremented at each local event and updated on message receipt to be larger than any received timestamp; gives a total order respecting causality but does not distinguish causally-independent events.
- *Vector clocks* — a per-process counter for *each process*, incremented at local events and merged element-wise on message receipt; distinguishes causally-independent events but grows linearly with system size.
- *Version vectors* — vector clocks specialized for replicated data: one entry per replica that has performed a write to the data item.
- *Dotted-version-vectors* — a refinement that handles client-side causal history more compactly.

The metadata is *external* to the data: a system that wants to reason about causal order maintains the metadata in parallel with the data, with the metadata's own consistency a separate concern from the data's.

The platform's reformulation: causal history is *substrate content* — every substrate event has a witness predication recording its inputs (the predications the event read or relied on) and its outputs (the predications the event admitted). The causal partial order is the witness DAG: event $e_1$ causally precedes event $e_2$ iff there is a directed path from $e_1$'s witness to $e_2$'s witness in the DAG. Three structural identifications:

- **Per-process clock counter** ↔ a substrate-stable identifier on the witness predication (the witness's canonical hash, per [hash discipline](hash-discipline.md), serves the role of a clock value).
- **Causal-precedes relation** ↔ the witness DAG's reachability. Event $e_1$ causally precedes event $e_2$ iff $e_2$'s witness has a directed path back to $e_1$'s witness through the DAG's input-and-derivation edges.
- **Concurrent events** ↔ witnesses without a directed path between them. Two events are causally independent iff neither's witness reaches the other in the DAG.
- **Vector-clock merge on message receipt** ↔ federation merge of the witness DAGs from two substrates. The merged DAG inherits both substrates' causal histories without conflict (both DAGs are sub-DAGs of the merged result).

Three engineering consequences:

- **Causal history is auditable through substrate traversal.** "What was the causal context of event $e$?" is the witness traversal from $e$'s witness backward through the DAG. There is no separate clock-history-store to consult.
- **Causal history federates without separate metadata.** Two substrates exchanging predications through federation also exchange the predications' witnesses (each predication carries its witness identifier). The merged substrate's causal history is the union of both substrates' witness DAGs; no separate vector-clock merge step is needed.
- **Causal history grows polynomially in events, not exponentially in process count.** The vector-clock pathology (one entry per process, growing with system size) does not appear in the substrate's witness DAG: each event has one witness regardless of how many substrates participate. The DAG's size grows linearly with the number of events; the per-event witness size is bounded.

The concept is *sketch* status: it names the relationship between substrate witness chains and classical distributed-systems causal-history tracking so the [upstream-substrate-coordination](teaching/explanations/upstream-substrate-coordination.md) narrative has an atomized referent. A theorem-level statement — that the substrate's witness DAG, restricted to a single replicated data item, is isomorphic to the data item's vector-clock history under the appropriate normal-form encoding — is left for follow-up work. The [provenance-semiring-witness](provenance-semiring-witness.md) concept covers the algebraic-derivation side of the same witness chain; this concept covers the partial-order / causal-history side.
