---
type: example
class: document-walkthrough
depends-on: [collaborative-edit-convergence, edit-document, federation-convergence]
instantiates: [collaborative-editing, document]
---

# Collaborative document edit walkthrough

A concrete walkthrough of three users collaboratively editing a document, with concurrent edits to different spans converging cleanly and a same-span conflict producing $\top$-witness disagreement that the document's repair-policy surfaces.

## Setup

- Document `meeting-notes-2026-05-01` with format-shape `markdown`.
- Three users editing concurrently: `morgan`, `cassia`, `josh`.
- Each user's client connects to a different substrate replica (`s1`, `s2`, `s3`) federated via WebSocket transport.
- Initial document content: a single span `[s0]` containing "Meeting notes — May 1\n\n## Agenda\n\n"

## Trace

**Concurrent edits to different spans.**

Morgan, at substrate ordinal 200 on `s1`, appends span `[s1]` after `[s0]`: "1. Project status\n".

Cassia, at substrate ordinal 145 on `s2`, appends span `[s2]` after `[s0]`: "2. Sprint planning\n".

Josh, at substrate ordinal 387 on `s3`, appends span `[s3]` after `[s0]`: "3. Open questions\n".

Per [edit-document](../morphisms/edit-document.md), each edit is a substrate operation contributing an increment to that substrate's increment sequence. Each produces a witness signed by the editor.

**Federation exchange.** The three substrates exchange witnesses bidirectionally via WebSocket. Per [federation-convergence](../../../theorems/federation-convergence.md), all three substrates converge on the same merged document state.

**Collaborative-edit-convergence.** Per [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md), the three new spans don't conflict (they're at different positions, different content). The merged document has spans `[s0, s1, s2, s3]` in fractional-index order. All three users' clients display the same content.

The order of `[s1]`, `[s2]`, `[s3]` is determined by their fractional-index positions, which were computed from each editor's local view of the document at edit time. If two users computed the same target position concurrently (rare), the substrate uses canonical-hash tiebreaking.

**Same-span conflict.**

Now both Morgan and Cassia decide to edit span `[s1]` ("1. Project status").

Morgan, at `s1` ordinal 215, replaces `[s1]` with "1. Project status (good progress)".

Cassia, at `s2` ordinal 160, replaces `[s1]` with "1. Project status (blocked on dependency)".

Per [edit-document](../morphisms/edit-document.md), each edit is a retract-old + insert-new operation. Each emits a witness.

**Federation exchange of conflicting edits.** When `s1` receives Cassia's edit and `s2` receives Morgan's, the bilattice $\vee_k$ at the position originally occupied by `[s1]` has two competing values. Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), this produces a $\top$-cell at the position.

**Document-conflict repair surfaces.** Per [repair-catalog](../../../objects/repair-catalog.md), the document's `same-span-conflict` repair entry triggers. The repair-policy's recipe: surface both candidate spans to all editors with a "two users edited this — please reconcile" notification.

**Resolution.** Morgan's client shows: "1. Project status (good progress)" vs. "1. Project status (blocked on dependency)" with an "edit to merge" button. Morgan decides to combine: "1. Project status (good progress, blocked on dependency)". This combined edit replaces both candidates per the repair's recipe, and the substrate continues from a consistent state.

## What's notable

- **Concurrent non-conflicting edits converged automatically.** Per [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md), no coordination was needed for the three appends.
- **Conflict was surfaced, not suppressed.** Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the $\top$-witness for the same-span disagreement is a value the substrate recorded; the user-experience layer responded with the conflict-resolution prompt.
- **All three substrates ended in the same state.** Per [federation-convergence](../../../theorems/federation-convergence.md), the converged document is the same across `s1`, `s2`, `s3` — modulo wall-clock time, which is informational.
- **The audit chain preserves who edited what.** Per [edit-document](../morphisms/edit-document.md), every span has author attribution. An auditor can replay the document's history at any version per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md).
