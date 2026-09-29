---
type: example
status: documented
instantiates: [document, document-record, text-span, collaborative-editing, edit-document, collaborative-edit-convergence]
---

# Notion-style block-document collaborative editor

Notion (and the family of block-document tools that follow its model — Coda, Craft, Outline, AnyType, Affine) realizes the subtheory's [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md) theorem on a tree-structured document with text-span CRDT semantics. It is the realization that maps most cleanly to the subtheory's [document](teaching/explanations/document.md), [document-record](../objects/document-record.md), and [text-span](teaching/explanations/text-span.md) commitments.

## The block-document model

A Notion-style document is a tree of *blocks* rather than a flat character sequence. Each block has a type (paragraph, heading, list-item, code, table, embed, sub-page, etc.) and content (typically a sequence of formatted text spans, or block-specific structured content). Blocks can contain child blocks, producing a nested tree.

The block tree is the substrate-content shape. The tree's structure (which blocks are children of which) is one set of predications; each block's content is another set. The CRDT discipline applies to both: tree-structure changes (block insertion, deletion, move) use a tree-CRDT (Logoot, RGA-tree, or similar); text content within a block uses a sequence-CRDT (RGA, WOOT, Treedoc) on character positions.

## Mapping to subtheory structure

| Subtheory structure | Notion-style realization |
|---|---|
| [document](teaching/explanations/document.md) | A page; the root of a block tree |
| [document-record](../objects/document-record.md) | The page's substrate cells: a `page` cell with metadata, a tree of `block` cells |
| [text-span](teaching/explanations/text-span.md) | A formatted-text run within a block; a CRDT-positioned character sequence with formatting marks |
| [collaborative-editing](teaching/explanations/collaborative-editing.md) | Multi-user concurrent block-tree and text-span edits via WebSocket-mediated substrate sync |
| [edit-document](../morphisms/edit-document.md) | Each keystroke / formatting / block-op is a substrate operation: insert-character, delete-character, set-formatting, insert-block, move-block, delete-block |
| [cursor](teaching/explanations/cursor.md) | Per-user CRDT-positioned cursor; rendered as a colored caret with the user's name |
| [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md) | Verified empirically: two users editing the same block converge on the union of their edits via the sequence-CRDT; conflict at the same character position resolves to a deterministic ordering |
| [list](teaching/explanations/list.md) | A bulleted or numbered list block; each list-item is a child block |
| [list-record](../objects/list-record.md) | The list block's cell plus its child block cells |

## The collaborative-edit-convergence theorem realized

When two users edit the same paragraph block concurrently — Alice typing at position 10, Bob typing at position 30 — the sequence-CRDT positions ensure their edits commute: Alice's insert and Bob's insert at distinct positions can be applied in any order at any replica and produce the same result. Per [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md), the substrate's [federation-convergence](../../../theorems/federation-convergence.md) machinery handles this case directly.

When Alice and Bob both type at the same position concurrently, the sequence-CRDT's positioning discipline (e.g., RGA's "newer operation goes after" rule with origin-based fallback for tied timestamps) resolves the conflict to a deterministic ordering. Both replicas see the same final text; the substrate-level $\top$-disagreement (per the [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) parent result) is resolved by the CRDT's tie-breaking rather than surfaced to the users.

When Alice and Bob make tree-structure changes that conflict (Alice moves block X under block Y; Bob deletes block Y), the tree-CRDT must apply a consistency rule (typically: deletion wins, the move becomes a no-op, the moved block reappears at its origin or under a recovery parent). The exact rule varies across realizations; the substrate's discipline is to record the conflict and surface it via the document's repair-policy.

## Where the realization deviates from the subtheory

Notion's substrate is not a predication-graph store; it is a custom backend with block-tree storage. The mapping above is structural — Notion's behavior maps to the subtheory's claims — but a substrate-faithful realization would store blocks as predication cells (`block(id, parent, position, type)`, `text-span(block-id, position, character, formatting)`, etc.) and rely on the substrate's federation for sync rather than a custom WebSocket protocol.

Notion's per-user presence (cursor, selection, viewing-status) is realized as ephemeral state with TTL, not as substrate-content with witness chain. A substrate-faithful realization would record presence in cells with TTL-based closure rules; the convergence properties would follow from the same federation-convergence machinery, with the additional discipline that ephemeral cells expire deterministically across replicas.

Notion's offline editing (changes made while disconnected, synced on reconnect) is exactly what CRDT semantics buy; a substrate-faithful realization would inherit this discipline from the parent's federation-convergence directly, without Notion's custom offline-sync protocol.

The [multi-device-notification-convergence question](questions/multi-device-notification-convergence.md) applies directly to Notion's notification surface (a comment mention, a page assignment, a reminder); how Notion handles read-state across a user's phone and laptop is exactly the question's case-3 (per-device dismissal, with explicit "mark all read" as the dismiss-everywhere operation).

## Reference

The Notion product itself does not publish a substrate spec. Public references for the underlying CRDT discipline are the academic CRDT literature: Shapiro et al. 2011 (CRDT survey, see [shapiro-et-al2011](references/shapiro-et-al2011.md)), Yjs documentation (https://docs.yjs.dev/) for an open-source CRDT library that powers many block-document editors, and the Conclave / Logoot / RGA papers for sequence-CRDT specifics. The Notion engineering blog occasionally publishes architectural notes (https://www.notion.so/blog) but does not commit to a formal spec.
