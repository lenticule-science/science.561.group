---
type: theorem
class: engineering-claim
status: proved
depends-on: [document, document-record, collaborative-editing, edit-document, canonical-form-via-settling-quiescence, settling-quiescence, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form, collaborative-edit-convergence]
see-also: [form-submission-doctrine-fidelity, account-uniqueness-and-attribution]
---

# A collaborative document admits a canonical form iff its CRDT settling has reached quiescence

**Claim.** A [document](teaching/explanations/document.md) under [collaborative editing](teaching/explanations/collaborative-editing.md) admits a [canonical form](../../teaching/explanations/canonical-form.md) — for content-addressed storage, hash-based deduplication, conflict-free comparison, snapshot identity — **if and only if** the document's CRDT settling has reached [settling quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md). Per the parent's [canonical-form-via-settling-quiescence](../../../theorems/canonical-form-via-settling-quiescence.md), only at the closure-fixed-point does the value have a Priestley-dual presentation that the substrate can deterministically encode. Documents undergoing concurrent edits are, by construction, *not* at quiescence; their canonical form is therefore undefined until the in-flight edits have been merged through [collaborative-edit-convergence](collaborative-edit-convergence.md).

## Why this holds

A document is a substrate predication value $v \in A_p$ at the document-content predicate $p$. Per [collaborative-editing](teaching/explanations/collaborative-editing.md) and [collaborative-edit-convergence](collaborative-edit-convergence.md), concurrent editors apply edits as substrate operations; the substrate's federation discipline (per [federation-convergence](../../../theorems/federation-convergence.md)) produces a unique merged value per the bilattice's $\vee_k$ join.

Per [settlement-via-closure-2-monad](../../../theorems/settlement-via-closure-2-monad.md), the merged value evolves under the substrate's closure operator until reaching a closure-fixed-point — exactly the [settling-quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) condition. Per [canonical-form-via-settling-quiescence](../../../theorems/canonical-form-via-settling-quiescence.md), the canonical form is the byte-encoding of the Priestley-dual presentation of the closure-fixed-point — well-defined exactly when the value is quiescent.

The biconditional has two directions:

- **Quiescent ⇒ canonical form defined.** Per the parent theorem, every closure-fixed-point in the predication fiber algebra has a deterministic dual presentation; the substrate's encoding rule produces canonical bytes.
- **Canonical form defined ⇒ quiescent.** A "canonical form" computed at a non-quiescent value would change under the next closure step (the underlying value would change, hence its dual, hence its byte-encoding) — violating the canonical-form-as-identity discipline. Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), canonical form is required to be *stable* under the substrate's evolution; only quiescent values satisfy stability.

## Engineering consequence

- **Document hashes are quiescence witnesses.** Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the canonical hash of a document is unique to its value; the existence of a hash for the document is a witness that the document has reached quiescence at the time the hash was computed. The substrate exposes this as the document's content-identity.
- **Save / publish / archive operations require quiescence.** Operations that depend on a stable document identity — save-to-disk, publish-to-feed, archive-to-cold-storage, send-to-recipient — are conditioned on the document being at quiescence. The substrate's `commit-document` operation pairs an explicit quiescence check with the canonicalization step.
- **Mid-edit comparisons use editor-local provisional canonical form.** Two editors comparing their in-progress edits cannot use the substrate's canonical form (neither side is at quiescence). The platform supports *editor-local provisional* canonical forms (computed per the editor's local closure-fixed-point, distinguished from the cluster-wide one). Per [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md), provisional forms differ across editors until federation convergence.
- **Concurrent edits force re-canonicalization.** When a new edit arrives at a previously-quiescent document, the document leaves quiescence; its canonical form becomes undefined; the substrate re-runs settlement and re-computes the form. Per [collaborative-edit-convergence](collaborative-edit-convergence.md), this re-settlement converges under the bilattice's network-sheaf consensus.
- **Diff is a function on quiescent values.** A diff between two document versions $v_1, v_2$ requires both to be at quiescence (otherwise the diff would change as either side evolves). The substrate's diff machinery operates on canonical-form pairs; non-quiescent inputs are rejected with an explicit "unsettled" error.
- **Snapshot fidelity inherits from canonical form.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a document snapshot records the canonical form at a quiescent point; replay reproduces byte-identical content. The snapshot's identity is the snapshot's hash — which exists only because the snapshotted value was quiescent.

## What the theorem rules out

- **"Save anytime" semantics with stable identity.** A platform that gives every in-progress document a stable hash, regardless of editing state, cannot ground that hash in canonical form (the value isn't stable). Such hashes are session-local UUIDs, not content identities; the substrate distinguishes them at the type level.
- **Canonical-form computation during active editing.** A request to compute canonical form on an actively-edited document is a request to canonicalize a non-quiescent value. The substrate refuses (per [canonical-form-via-settling-quiescence](../../../theorems/canonical-form-via-settling-quiescence.md)); the platform may offer a provisional-form approximation marked as such.
- **Hash-based deduplication of in-progress drafts.** Two editors with identical in-progress edits cannot deduplicate by content hash because neither has a defined canonical form. Deduplication requires settling both to quiescence first; until then, the platform treats them as distinct (witness-distinguishable per [witness](../../teaching/explanations/witness.md)).

## What the theorem requires

- The document's value-domain is a distributive bilattice (per the substrate's [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)).
- The collaborative-editing closure operator is monotone, inflationary, idempotent (the standard CRDT discipline).
- The platform's "save / publish / archive" operations gate on the explicit quiescence check.

## Position

This theorem specializes the parent's [canonical-form-via-settling-quiescence](../../../theorems/canonical-form-via-settling-quiescence.md) for the interactive-application-platform's specific concern with collaborative documents. Together with [collaborative-edit-convergence](collaborative-edit-convergence.md) (CRDT merge converges) and [form-submission-doctrine-fidelity](form-submission-doctrine-fidelity.md) (form submission is faithful), it grounds the platform's content-identity discipline in the math parent's Priestley-duality / closure-fixed-point structure.
