---
type: concept
class: multi-user-discipline
depends-on: [document, text-span, cursor, user, multi-observer-system]
see-also: [edit-document]
---

# Collaborative editing

The discipline by which *multiple [users](user.md) edit the same [document](document.md) concurrently*, with their edits merging into a coherent final document. Collaborative editing is a substrate-level instance of the [bilattice network-sheaf consensus on agent graphs](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) theorem applied to documents: each user's view of the document is one observer, the document is the multi-observer system, the consensus is the merged document state.

Per [federation-convergence](../../../theorems/federation-convergence.md), concurrent edits from multiple users converge to the same document state regardless of arrival order — the substrate's closure-merge commutation lemma is what makes this work without a central coordinator.

The collaborative-editing discipline:

- **Per-user [cursor](cursor.md) state.** Each user has a cursor record showing their current edit-focus. Other users see the cursors as visual indicators in the collaborative view.
- **Span-level edits.** Per [text-span](text-span.md), edits operate at span granularity. Concurrent edits to different spans don't conflict; concurrent edits to the same span produce a contested cell.
- **CRDT-shaped merge.** The substrate's bilattice $\vee_k$ join applied cellwise to the document's predications produces the merged state. Per [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md) (which applies to user communities as well as agent communities, structurally), the consensus is computable as $H^0$ of the user-graph network sheaf.
- **Conflict resolution as repair.** When two users edit the same span concurrently and produce $(\mathbf{t}, \mathbf{f})$-disagreement, the substrate's repair-catalog has a document-conflict entry that surfaces the conflict to the users (typically displaying both edits and asking for resolution). Per [retraction](../../../morphisms/retraction.md)'s repair-discipline, the conflict resolution may retract one of the conflicting spans.
- **Cursor-aware UI.** The collaborative view shows where each user is currently editing, which prevents many conflicts before they happen (users see each other's cursors and naturally avoid stepping on each other's edits).

Per [observability-as-reads](../../../theorems/observability-as-reads.md), the document's read surface (other users seeing the current state, cursor positions, edit history) is a free read of substrate state. The cost is in the *production* of edits — each user's edit is an admit-and-settle operation.
