---
type: concept
class: ux-discipline
depends-on: [user, session, session-establishment, time-and-event-ordinals, predication-fiber-algebra, four-bilattice]
see-also: [notification, collaborative-editing, cursor]
---

# User-state predications

The substrate's *first-class predications recording per-user UX state* — read/unread, presence, typing, currently-viewing, last-active-at, draft-in-progress, etc. In the substrate's hyperdoctrine setting, these are not auxiliary metadata — they are *substrate predications living in the user's [predication fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)*, queryable, federate-able, and audit-able like any other content.

Without first-class user-state predications, a substrate's UX would either: (a) maintain UX state outside the substrate (breaking [self-representation](../../teaching/explanations/self-representation.md)), (b) re-derive UX state from primary content on every read (slow), or (c) special-case UX state in the runtime (breaking [conformance](../../teaching/explanations/conformance.md)).

## Why this concept exists

UX state shows up everywhere — "is this email unread?" "who's currently viewing this document?" "what was I drafting before I closed the tab?" Each is a small fact that needs substrate representation but doesn't fit neatly into the application's primary content (the email itself, the document body, etc.). PredComp has [user](user.md), [session](../../agential-orchestration-platform/concepts/session.md), [account](account.md), and [notification](notification.md), but no concept naming the *category* of per-user UX-state predications and specifying their canonical predicates.

This concept fixes the canonical predicate set and the discipline for using them.

## Canonical user-state predicates

Each predicate has the user as subject (or the user's session, when session-bound). Each is a substrate-content predication; per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), they participate in canonical-form-hash discipline like any other cell.

### Reading state

- `last-read-ordinal-of:{entity}` — the substrate ordinal at which the user last read `{entity}`. Object value: a non-negative integer (the ordinal). Used for "unread" computation: any predication on `{entity}` after this ordinal is unread.
- `read:{entity}` — boolean (cell value $\mathbf{t}$ if read, $\bot$ if not yet read, $\top$ if read on multiple devices with conflicting timestamps).
- `archive-state-of:{entity}` — `inbox` / `archived` / `trashed` / `spam`.

### Presence

- `currently-viewing:{entity}` — the user is viewing `{entity}` in some user-agent right now. Cell value $\mathbf{t}$, with the cell's settling having a TTL — the substrate retracts the cell after a heartbeat timeout.
- `last-active-at` — the latest ordinal of any user activity. Used for offline/online indicators.
- `presence-status` — `available` / `away` / `do-not-disturb` / `offline`. User-set or substrate-derived.

### Composition state

- `draft-of:{entity}` — the user has an in-progress draft against `{entity}`. The draft's content is itself a predication.
- `editing-since:{entity}` — the ordinal at which the user began editing `{entity}`. Used for collision detection in [collaborative-editing](collaborative-editing.md).
- `cursor-position-in:{entity}` — per [cursor](cursor.md), the user's cursor location for collaborative-editing scenarios.

### Notification state

- `notified-of:{event}` — the user has been notified of `{event}`. Per [notification](notification.md), prevents duplicate notifications.
- `notification-preference:{event-class}` — `immediate` / `digest` / `silent`.

### Selection / focus state

- `selected:{entity}` — the entity is in the user's current selection (multi-select, batch operations).
- `focused-on:{scope}` — the user's current working scope (per [scope](../../teaching/explanations/scope.md)).

## Bilattice values for UX state

The bilattice's four values get used naturally for UX state:

- $\mathbf{t}$ — the state holds (e.g., `read:{email}` = $\mathbf{t}$ means the email is read).
- $\bot$ — the state is unrecorded (no UX system has yet observed; default for fresh entities).
- $\mathbf{f}$ — the state explicitly does not hold (e.g., the user has affirmatively marked an email as unread).
- $\top$ — conflicting state from different user-agents (the user marked read on phone, marked unread on laptop; per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the substrate records both, surfaces for user-resolution).

Per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md), $\top$ states have declared resolutions — for `read:{email}` typically "most-recent-ordinal wins" (via the `last-read-ordinal-of` predicate).

## Federation across devices

Per [replication-consistency-via-network-sheaf](../../../theorems/replication-consistency-via-network-sheaf.md), user-state predications federate across the user's devices like any other substrate content. A `currently-viewing:{document}` predication admitted on the laptop appears on the phone via federation; per [crdt-convergence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), concurrent updates from different devices converge under the bilattice $\vee_k$.

This is the substrate's structural answer to "this email is now read on all my devices" — no separate sync protocol, no eventual-consistency hack. The substrate's federation discipline is the sync protocol.

## TTL and presence-decay

Some user-state predications are *transient* — they should expire if not refreshed. Examples: `currently-viewing` (heartbeat-bound), `editing-since` (auto-archives after inactivity).

The substrate's discipline for transient predications:

- The predication carries an `expires-at-ordinal` field.
- A closure rule retracts the predication when current ordinal exceeds `expires-at-ordinal`.
- The user-agent refreshes the predication periodically (every N seconds) by re-admitting it.

Per [retraction](../../../morphisms/retraction.md), retraction is a substrate operation producing a witness — the user-state's life cycle is fully audit-able.

## Querying user-state

UX queries against user-state are typical substrate traversals:

- "Show unread emails" → query `inbox` for messages where `last-read-ordinal-of:{message}` < message's admission-ordinal.
- "Who's currently viewing this document?" → query `currently-viewing:{document}` predications, filter for $\mathbf{t}$ value, join with user records.
- "What was I last working on?" → look up `last-active-at` and the most-recent activity-witness.

Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), these queries are reads — free at the substrate-level.

## What the discipline rules out

- **Out-of-substrate UX state.** A "user state" stored in browser localStorage that the substrate doesn't see has lost the structural advantages — no federation across devices, no audit, no [hash-discipline](../../teaching/explanations/hash-discipline.md). Per [self-representation](../../teaching/explanations/self-representation.md), UX state is substrate content.
- **Special-cased UX state in the runtime.** A "read" flag implemented as a special database column with custom synchronization is a violation of [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md). UX state uses the same primitives as primary content.
- **Re-derivation on every read.** Re-computing "unread count" by scanning all messages on every page load is wasteful. The user-state predication is the precomputed value; per [cache-coherence-via-functorial-projection](../../../theorems/cache-coherence-via-functorial-projection.md), the substrate's cache discipline keeps it correct.

## Position

User-state predications are the substrate's *UX-state representation primitive*. Per [self-representation](../../teaching/explanations/self-representation.md), they're substrate content; per the bilattice value-domain, they admit four-valued state including conflicts; per the federation discipline, they sync across devices structurally.

The concept composes with [user](user.md) (the subject of most user-state predications), with [session-establishment](session-establishment.md) (the session that produces user-agent activity), with [notification](notification.md) (notification-state predications), with [collaborative-editing](collaborative-editing.md) (editing-state predications), and with [cursor](cursor.md) (cursor-position predications).
