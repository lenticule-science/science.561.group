---
type: definition
class: substrate-entity
realizes: [document]
depends-on: [document, text-span, user-record, shape-record]
see-also: [text-span]
---

# Document record

A **document record** is the substrate-entity formal definition of a [document](teaching/explanations/document.md): the predication-graph entity representing a structured text-bearing piece of content.

## Structural fields

- **`id`** — kebab-case identifier (typically the document's slug or substrate-assigned id).
- **`description`** — one-line summary.
- **`title`** — the document's display title.
- **`format-shape`** — reference to the [shape-record](../../../objects/shape-record.md) declaring the document's format (markdown, plain text, rich text, code-with-language-tagging, JSON-LD, etc.).
- **`spans`** — references to the [text-span](teaching/explanations/text-span.md) records composing the document's content, in order.
- **`authors`** — references to user-records or agent-records that have edited this document. Multiple authors for collaboratively-edited documents.
- **`created-at`**, **`last-edited-at`** — substrate ordinals.
- **`version-history`** — derived view: every prior version of the document, reconstructable per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md).
- **`active-cursors`** — references to active [cursor](teaching/explanations/cursor.md) records on this document (for collaboratively-viewed documents).
- **`scope`** — reference to the [scope](../../teaching/explanations/scope.md) the document lives in.
- **`closure-kind`** — `document`.

## Invariants

- **Format-conforming.** Per [validate-against-shape](../../../morphisms/validate-against-shape.md), the document's spans conform to the cited format-shape.
- **Span-ordered.** The spans' positions form a coherent ordering (no gaps for ordered formats; valid concurrent positions for CRDT-friendly formats).
- **Authorship recorded.** Every span has author attribution per the document's editing history.
- **Replayable.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), the document's state at any past version is reconstructible from the event log.

## Position in the platform

Document records are the substrate's *text-content registry*. Per [collaborative-editing](teaching/explanations/collaborative-editing.md), documents support multi-user editing per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).
