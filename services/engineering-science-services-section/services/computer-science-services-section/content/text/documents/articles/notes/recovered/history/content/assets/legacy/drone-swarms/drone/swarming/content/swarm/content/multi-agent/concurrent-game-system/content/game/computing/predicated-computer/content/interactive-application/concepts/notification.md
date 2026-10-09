---
type: concept
class: user-bound-message
depends-on: [user, predication-cell]
see-also: [account]
---

# Notification

A *substrate-recorded user-bound message* — a notification is a predication directed at a particular user, recording that the substrate has something for them to know about (a new message, a task assignment, an action required, a status change, an alert).

A notification has the structure:

- **Recipient** — the [user](user.md) (or account, or agent) the notification is for.
- **Source** — the substrate event that triggered the notification.
- **Content** — the notification's payload: title, body, action-required-or-not, severity.
- **Lifecycle state** — `unread`, `read`, `dismissed`, `acted-upon`. Each transition is a substrate event.
- **Delivery channels** — how the notification reaches the user: in-app, email, SMS, push, webhook. Each channel has its own delivery-witness.
- **Created-at, read-at, dismissed-at** — substrate ordinals of state transitions.

Per [self-representation](../../teaching/explanations/self-representation.md), notifications are substrate content: queryable, replayable, federation-portable. Per [witness](../../../objects/witness.md), each notification's lifecycle is fully witnessed.

Per [observability-as-reads](../../../theorems/observability-as-reads.md), reading notifications is a free substrate operation. Per the substrate's [cost-discipline](../../teaching/explanations/cost-discipline.md), creating a notification is a substrate write (it admits the notification predication and triggers any delivery-channel work).

Delivery semantics:

- **Best-effort.** The substrate attempts delivery via the cited channels; per [federation-convergence](../../../theorems/federation-convergence.md), delivery may take time and may require retry.
- **At-least-once.** The substrate retries delivery until acknowledged; per [reception-witness](../../../objects/witness.md), the user's read action is the acknowledgment.
- **Exactly-once-perceived.** Per [federation-convergence](../../../theorems/federation-convergence.md)'s deduplication-by-canonical-hash, a notification delivered multiple times appears to the user only once (the duplicate deliveries are deduplicated at the user-experience layer).

Notification preferences (which channels per notification kind, when to deliver, do-not-disturb periods) are themselves substrate content per [account](account.md), queryable and adjustable.
