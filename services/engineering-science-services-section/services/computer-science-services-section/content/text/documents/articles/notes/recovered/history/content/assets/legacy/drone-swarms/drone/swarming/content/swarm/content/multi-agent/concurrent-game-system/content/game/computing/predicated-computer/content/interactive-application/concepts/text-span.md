---
type: concept
class: text-content-unit
depends-on: [predication-cell, document]
see-also: [cursor, edit-document]
---

# Text span

A *substrate-content unit of text within a [document](document.md)*: an ordered sequence of characters plus metadata (start position, length, format markers if any). Text spans are the substrate's atomic text-content unit — the granularity at which document edits operate.

A text-span has the structure:

- **Span content** — the text bytes (typically UTF-8).
- **Position-in-document** — the span's location within its parent document. Typically a (start, end) ordinal pair, or a fractional-index for collaborative ordering.
- **Format markers** — optional formatting (bold, italic, link, code, header) for rich-text documents.
- **Authorship** — who created this span. For collaborative documents, the span's author is recorded for version-history and attribution.
- **Span hash** — per [hash-discipline](../../teaching/explanations/hash-discipline.md), the canonical-form hash of the span's content.

Spans are substrate predications: a document with body "Hello, world" might be one span (the whole text) or many spans (per-word, per-line, per-paragraph) depending on the document's editing granularity. Smaller spans enable finer-grained collaborative editing (two users editing different words don't conflict); larger spans reduce overhead for documents that change atomically.

Per [collaborative-editing](collaborative-editing.md), span-level granularity is what makes the bilattice $\vee_k$ merge tractable: concurrent edits to different spans converge per [federation-convergence](../../../theorems/federation-convergence.md); concurrent edits to the *same* span produce a contested cell (per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)) that the document's repair-policy resolves (typically by surfacing the conflict to the user).
