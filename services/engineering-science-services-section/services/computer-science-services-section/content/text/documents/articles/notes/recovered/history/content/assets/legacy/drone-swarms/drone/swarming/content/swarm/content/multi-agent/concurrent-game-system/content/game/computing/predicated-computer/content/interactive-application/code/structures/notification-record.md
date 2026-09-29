---
type: definition
class: substrate-entity
realizes: [notification]
depends-on: [notification, user-record, account-record]
see-also: [send-notification]
---

# Notification record

A **notification record** is the substrate-entity formal definition of a [notification](teaching/explanations/notification.md): a user-bound message recording substrate events the user should know about.

## Structural fields

- **`id`** — kebab-case identifier (typically derived from event-source + recipient + ordinal).
- **`description`** — one-line summary.
- **`recipient`** — reference to the [user-record](user-record.md), [account-record](account-record.md), or [agent-record](../../agential-orchestration-platform/objects/agent-record.md) the notification is for.
- **`source-event`** — reference to the substrate event that triggered the notification.
- **`title`**, **`body`** — the notification's payload content.
- **`severity`** — `info`, `warning`, `error`, `urgent`.
- **`action-required`** — boolean: whether the notification requires user action (with action-link if so).
- **`delivery-channels`** — declared channels for delivery: `in-app`, `email`, `sms`, `push`, `webhook`.
- **`state`** — `created`, `delivered`, `read`, `acted-upon`, `dismissed`.
- **`created-at`**, **`read-at`**, **`dismissed-at`** — substrate ordinals of state transitions.
- **`delivery-witnesses`** — per-channel delivery witnesses (when each channel succeeded or failed).
- **`closure-kind`** — `notification`.

## Invariants

- **Recipient-bound.** Every notification has exactly one recipient (multi-recipient broadcasts are multiple notification records).
- **Source-traceable.** The cited source-event must be in the event log; un-sourced notifications are inadmissible.
- **State-monotone.** State transitions are monotone (`created` → `delivered` → `read` → `dismissed`); regression is inadmissible (a read notification can't go back to unread except via explicit user action that creates a new notification).

## Position in the platform

Notification records are the substrate's *user-message registry*. Per [observability-as-reads](../../../theorems/observability-as-reads.md), the user's notification list is a free read; per [witness](../../../objects/witness.md), the notification's delivery and lifecycle are auditable.
