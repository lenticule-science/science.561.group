---
type: morphism
class: document-operation
realizes: [document, text-span]
depends-on: [document-record, text-span, insertion, retraction, settling-monotonicity, federation-convergence]
see-also: [collaborative-editing]
---

# Edit document

The substrate operation that modifies a [document](teaching/explanations/document.md) by inserting, deleting, or formatting [text spans](teaching/explanations/text-span.md). Edit-document is the writer-side primitive for document-bearing applications.

## Signature

`edit-document(document-record-id, edit-spec, author) → (post-edit-document, witness)`

Inputs:

- **`document-record-id`** — reference to the document being edited.
- **`edit-spec`** — the edit operation: `insert-span(at-position, content)`, `delete-span(span-id)`, `format-span(span-id, format)`, `replace-span(span-id, new-content)`.
- **`author`** — the [user-record](../objects/user-record.md) (or [agent-record](../../agential-orchestration-platform/objects/agent-record.md)) performing the edit.

Outputs:

- **`post-edit-document`** — the document's state after the edit.
- **`witness`** — records the edit: input-document hash, edit-spec, author, output-document hash.

## Operational semantics

1. *Validate edit.* Verify the cited spans (for delete/format/replace) exist in the document. Verify the author is authorized to edit the document per its scope.
2. *Apply edit.* For insert-span: per [insertion](../../../morphisms/insertion.md), admit the new span with author attribution and position. For delete-span: per [retraction](../../../morphisms/retraction.md)'s repair-discipline, retract the span via a document-edit repair entry. For format-span/replace-span: combination of retract-old and insert-new.
3. *Re-validate document.* Per [validate-against-shape](../../../morphisms/validate-against-shape.md), check the post-edit document conforms to its format-shape.
4. *Witness emit.* Per [settlement-determinism](../../../theorems/settlement-determinism.md), the edit is replayable.

## Engineering invariants

- **Author-attributed.** Every edit produces a witness with author reference.
- **Format-conforming.** Per [validate-against-shape](../../../morphisms/validate-against-shape.md), edits that produce non-conforming documents are refused or repaired.
- **Federation-convergent.** Per [federation-convergence](../../../theorems/federation-convergence.md), concurrent edits from multiple users (per [collaborative-editing](teaching/explanations/collaborative-editing.md)) converge on the same document state regardless of arrival order.
- **Monotone in $\leq_k$.** Per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the document's substrate predications grow knowledge-monotonically; deletes are repair-authorized retractions with new-settling-after-the-edit semantics.
