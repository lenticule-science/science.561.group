---
type: theorem
class: engineering-claim
status: proved
depends-on: [trace, witness, lorentzian-causal-settling, settling-cohomology, settling-associated-sheaf, crdt-convergence-via-mayer-vietoris, event-causality-via-lorentzian-settling]
see-also: [wavefront-locality-via-cohomology-vanishing, replication-consistency-via-network-sheaf]
---

# Trace assembly is Mayer-Vietoris gluing on the apex cone of the originating event

**Claim.** For any substrate [trace](teaching/explanations/trace.md) initiated at a seed event $e_0$, the trace's structure is *exactly the apex cone of $e_0$* in the substrate's [Lorentzian causal settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md), and the trace's assembly from witnesses is *exactly the [settling-associated sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) section over that cone*. Two traces with overlapping apex cones (sharing a common sub-event) glue via Mayer-Vietoris (per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md)) without conflict — the connecting homomorphism $\delta^0$ vanishes on the trace's witness sheaf.

## Why this holds

Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), the substrate's events $E$ form a Lorentzian causal set: each event has an apex cone (events causally reachable from it) and a void cone (spacelike-separated events). A trace initiated at $e_0$ records substrate operations that causally depend on $e_0$ — i.e., events in $\mathrm{ApexCone}(e_0) = \{e \in E : e_0 \preceq e\}$.

Per [witness](teaching/explanations/witness.md), each event in the apex cone produces a witness; the trace assembles these witnesses into a structural section over the cone. In sheaf-theoretic terms:

- The apex cone $\mathrm{ApexCone}(e_0) \subseteq E$ is an open in the Lorentzian causal-settling site.
- The witnesses produced by events in the cone form a section $\mathrm{trace}(e_0) \in \mathcal{F}_W(\mathrm{ApexCone}(e_0))$ of the witness-associated sheaf.
- The trace's per-witness annotations (durations, inputs, outputs) are sub-fields of this section.

Per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), for any cover $U = U_1 \cup U_2$ of the apex cone, the connecting homomorphism

$$\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_W) \to H^1(U, \mathcal{F}_W)$$

is identically zero. Engineering translation: traces overlapping at a shared sub-event glue cleanly into a combined trace; there's no obstruction class. Two traces from different originating events that traverse the same intermediate event agree on that event's witness — by the substrate's content-determinism, the witness is unique.

## Engineering consequence

- **Trace causality is structural, not protocol.** A trace doesn't need a centralized coordinator to assemble its causal chain — per the apex-cone framing, the chain is determined by the substrate's causal-precedence predications. Each witness records its causal predecessors; the trace is reconstructed by transitive closure.
- **Parallel events within trace are first-class.** Per the Lorentzian apex/void duality, multiple events in $\mathrm{ApexCone}(e_0)$ may be spacelike-separated to each other (parallel branches within the trace). The trace records them as concurrent; per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated events admit any relative order, so the parallel branches have no canonical sequencing.
- **Cross-trace overlap is auditable.** Two traces sharing a common sub-event (a federation request that spawns work in two sessions) glue via Mayer-Vietoris. Per the theorem, the gluing is conflict-free — both traces record the same witness for the shared event.
- **Federation-traces compose cleanly.** A trace that crosses a federation boundary continues into the peer substrate's apex cone of the federation-message-receipt event. Per [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md), the federation's network-sheaf consensus glues the per-substrate trace fragments without conflict.
- **Trace export is sheaf restriction.** Exporting a trace to an external observability platform is restricting the section to a particular sub-cover (what the platform's interfacer can admit). Per [doctrine-fidelity-via-faithful-interfacer-functor](doctrine-fidelity-via-faithful-interfacer-functor.md), the export is faithful iff the interfacer is faithful — preserving the trace's structural content.

## What the theorem rules out

- **Trace causality without explicit causal predications.** A trace whose structure is implicit in runtime ordering (rather than substrate-recorded causal links) cannot be reassembled from the substrate's content. The substrate's discipline is to record causal predecessors as substrate predications; per [witness](teaching/explanations/witness.md), each operator's witness cites its causal predecessors.
- **Trace conflicts on shared events.** Two traces that disagree on the witness of a shared event indicate a substrate-inconsistency (the witness is unique per substrate-determinism). Per [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md), the disagreement surfaces as a $\top$-cell needing reconciliation.
- **Spacelike-separated events as causal.** A trace that records spacelike-separated events as causally ordered (when one is not in the other's apex cone) misrepresents the substrate's causal structure. The substrate refuses such traces; per the apex-cone framing, the trace's causal order is determined by substrate causality, not annotation policy.

## What the theorem requires

- The substrate's events form a Lorentzian causal settling (per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md)).
- Each event produces a witness recorded as substrate content (per [witness](teaching/explanations/witness.md)).
- The witness-associated sheaf is a settling-associated sheaf in the substrate's bilattice value-domain (so [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md) applies).
- Cross-trace overlaps respect substrate-determinism (same event yields same witness across all traces).

## Position

This theorem grounds the substrate's trace discipline in the predication-categories' Lorentzian + cohomological framework. Together with [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md) and [backup-as-cohomology-preservation](backup-as-cohomology-preservation.md), it places the substrate's observability layer in the same structural foundation as the substrate's distributed-coordination layer. Traces, wavefronts, backups, and replicas are all sheaf sections over particular sites; their correctness is sheaf-condition correctness; their composition is Mayer-Vietoris gluing.
