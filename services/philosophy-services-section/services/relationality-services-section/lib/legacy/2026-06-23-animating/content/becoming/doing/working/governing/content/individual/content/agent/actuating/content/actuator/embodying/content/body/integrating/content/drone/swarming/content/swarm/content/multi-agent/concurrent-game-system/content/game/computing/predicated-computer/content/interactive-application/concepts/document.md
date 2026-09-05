---
type: concept
class: text-bearing-content
depends-on: [predication-cell, text-span, cursor, settling-monotonicity]
see-also: [collaborative-editing]
---

# Document

A *substrate-recorded text-bearing entity*: a document is an entity whose predications include a structured sequence of [text spans](text-span.md), an optional schema (markdown, rich-text, code-with-language), authorship and version metadata, and (for collaborative documents) per-user [cursor](cursor.md) positions.

The substrate represents document content as predications, not as opaque blobs. A document with body "Hello, world" is the substrate content:

- A document-entity predication declaring the document exists.
- A sequence of text-span predications, each carrying a chunk of text plus its position-in-document.
- A schema predication declaring the document's format (e.g., `markdown`).
- Author, created-at, version-history predications.

Per [predication-cell](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md), the document's substrate footprint is structured cells. Per [hash-discipline](../../teaching/explanations/hash-discipline.md), each text-span has its own canonical-form hash; the document's hash is derivable from the spans' hashes plus the metadata.

Three properties:

- **Editable monotonically.** Per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), document edits are admit operations that contribute increments. An edit doesn't destroy prior content — the prior text-span is retracted via the substrate's [retraction](../../../morphisms/retraction.md) discipline (typically as part of a versioning repair), and the new span is inserted. The version history is preserved in the event log.
- **Federatable per CRDT.** Per [collaborative-editing](collaborative-editing.md), documents in collaborative editing scenarios use the substrate's bilattice $\vee_k$ join to merge concurrent edits. Per [federation-convergence](../../../theorems/federation-convergence.md), the resulting state is convergent across replicas.
- **Replayable.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a document's state at any past version is reconstructible from the event log.

Document formats the substrate may admit: plain text, markdown, structured documents (XML/JSON-LD), code with language tagging, rich-text with format-spans. Per [shape-record](../../../objects/shape-record.md), the document's format is declared via shape; per [validate-against-shape](../../../morphisms/validate-against-shape.md), edits are validated against the format shape.
