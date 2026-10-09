---
type: concept
class: editing-state
depends-on: [document, text-span, user]
see-also: [collaborative-editing]
---

# Cursor

The substrate-recorded *position of a [user](user.md)'s edit-focus within a [document](document.md)*. Cursor state is what the substrate uses to know where in a document a user's next edit will land, and (for collaborative editing) what other users see as "where this user is currently working."

A cursor has the structure:

- **User reference** — the user the cursor belongs to.
- **Document reference** — the document the cursor is positioned in.
- **Position** — the cursor's location: typically a (span-id, character-offset-within-span) pair, or a fractional-index that survives concurrent edits to the document.
- **Selection** — optional: when the cursor is selecting a range, the selection's anchor and extent.
- **Last-updated ordinal** — substrate ordinal of the cursor's most recent update. Stale cursors (whose user hasn't updated them in a while) may be hidden from collaborative views.

Per [self-representation](../../teaching/explanations/self-representation.md), cursors are substrate content. Multiple users in the same document have multiple cursor records; the document's collaborative view shows all active cursors (typically with user-color-coding).

Cursor state is *high-frequency* update: every keystroke may update the cursor's position. Per the substrate's [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), reading other users' cursors is free; *updating* a cursor is a substrate write that costs settlement-fuel. The substrate's discipline for high-frequency cursors is typically:

- **Throttled writes.** The user's client batches cursor updates and writes only every N milliseconds, reducing settlement-fuel cost.
- **Optional persistence.** Cursor state may be marked ephemeral (no event-log entry, only in the live substrate state) — admissible because cursors don't need to be replayable; they're a live-state concern.
- **Federation-aware.** Cursor state federates between replicas of a collaborative document, with the same throttling and ephemeral-vs-persistent options.
