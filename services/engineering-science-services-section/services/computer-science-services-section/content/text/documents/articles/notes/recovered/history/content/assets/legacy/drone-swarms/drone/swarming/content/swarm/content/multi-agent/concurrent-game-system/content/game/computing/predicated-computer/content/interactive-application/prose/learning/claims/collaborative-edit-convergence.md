---
type: theorem
class: engineering-claim
status: proved
depends-on: [collaborative-editing, document-record, text-span, federation-convergence, bilattice-network-sheaf-consensus, agent-community-consensus]
see-also: [edit-document, list-append-convergence-via-fractional-index-bilattice, cursor-as-cosettling-fiber-with-staleness-as-pre-image-collapse]
---

# Concurrent edits to a document converge across collaborating users

**Claim.** Let $D$ be a [document-record](../objects/document-record.md) edited concurrently by users $\{u_1, \ldots, u_n\}$. The substrate's [edit-document](../morphisms/edit-document.md) operations from each user contribute increments per [closure-drivenness](../../teaching/explanations/closure-drivenness.md). After all edits have been exchanged across the federation graph, all replicas of $D$ converge to the same document state cellwise in the [text-span](teaching/explanations/text-span.md) predications.

The convergence is the substrate-level instance of [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md) applied to user communities editing documents. Where AgOrchPlat establishes consensus for agents acting on a shared substrate, this theorem establishes the same for users editing a shared document.

## Why this holds

The argument is by direct application of [federation-convergence](../../../theorems/federation-convergence.md) and [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md) to the document-editing case.

**Setup.** Each user's view of the document is one observer in a [multi-observer system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) on the user-graph $G_D$ (vertices: users editing $D$; edges: substrate-mediated channels between user clients). The settling-associated sheaf $\mathcal{F}_{V_{G_D}}$ assigns each user the document state visible at their replica.

**Convergence on non-conflicting edits.** Per [federation-convergence](../../../theorems/federation-convergence.md), edits to *different* spans (per [text-span](teaching/explanations/text-span.md)) commute via the bilattice $\vee_k$ join. Concurrent edits to different spans converge on the union of all edits.

**Disagreement at conflicting edits.** When two users edit the *same* span concurrently with different content, the substrate's bilattice $\vee_k$ produces $\top$ at the contested cell (per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)). The substrate records the disagreement; per the document's repair-policy, the substrate surfaces the conflict to the users (typically displaying both edits and asking for resolution).

**Convergence guarantee.** The converged document state is $\mathrm{cl}^{\mathcal{S}_{\text{document}}}_p(\bigvee_k U)$ where $U$ is the union of all admitted edit-witnesses and $\mathcal{S}_{\text{document}}$ is the document-edit closure-rule system. All replicas converge to this state; the convergence is byte-identical at the substrate level.

## Engineering consequence

Several engineering consequences:

- **Real-time collaborative editing without coordination.** Users can edit concurrently without acquiring locks or asking permission; the substrate's algebra handles convergence.
- **Conflicts are surface-able, not erroneous.** When two users disagree on a span, the substrate records the disagreement rather than silently choosing one. The user-experience layer can present the conflict for human resolution.
- **Federation across networks.** Users on different network paths, with different latencies, with intermittent connectivity, all converge per [federation-convergence](../../../theorems/federation-convergence.md). No central authority is needed.
- **Audit-traceable.** Per [witness](../../../objects/witness.md), every edit is attributed; an auditor can reconstruct who edited what and when.

## What the theorem rules out

- A document-editing implementation that uses centralized locking (one user holds the lock, others wait) is not exploiting the substrate's CRDT-shape. Such implementations work but lose the substrate's coordination-free property.
- A document-editing implementation that silently picks a winner on conflict (e.g., last-write-wins by timestamp) loses the substrate's bilattice-disagreement-as-content guarantee. Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), conflict is a value the substrate represents; suppressing it loses information.

## What the theorem requires

- Document edits are substrate operations (per [edit-document](../morphisms/edit-document.md)).
- The document's closure-rule system satisfies the four [closure-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms.
- Per [text-span](teaching/explanations/text-span.md), span-level granularity is appropriate (concurrent edits to the same span produce contested cells).
- Per the substrate's regime, federation discipline is appropriate (Scott-continuous regime: ship state; non-Scott-continuous: ship trajectory per [scott-continuity-as-checkpointability](../../../theorems/scott-continuity-as-checkpointability.md)).
