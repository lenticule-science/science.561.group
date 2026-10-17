---
type: morphism
class: notification-operation
realizes: [notification]
depends-on: [notification-record, user-record, send-message, witness]
see-also: [notification]
---

# Send notification

The substrate operation that creates a [notification-record](../objects/notification-record.md) and initiates delivery via the cited channels.

## Signature

`send-notification(recipient, source-event, content, severity, delivery-channels) → (notification-record, witness)`

Inputs:

- **`recipient`** — reference to the user/account/agent to notify.
- **`source-event`** — reference to the substrate event that triggered the notification.
- **`content`** — title, body, action-required-or-not.
- **`severity`** — `info`, `warning`, `error`, `urgent`.
- **`delivery-channels`** — declared channels: `in-app`, `email`, `sms`, `push`, `webhook`.

Outputs:

- **`notification-record`** — the created notification.
- **`witness`** — records the creation and per-channel delivery initiation.

## Operational semantics

1. *Create notification-record.* Per [insertion](../../../morphisms/insertion.md), admit the notification with `state: created`.
2. *Resolve recipient preferences.* Read the recipient's notification-preferences; respect their channel choices and do-not-disturb policy.
3. *Initiate per-channel delivery.* For each declared-and-permitted channel, call the channel's delivery operator (typically [send-message](../../../morphisms/send-message.md) for transport-based channels, or substrate-internal for in-app).
4. *Update state.* When deliveries succeed, the notification's state advances to `delivered`. Per-channel delivery-witnesses are attached.
5. *Witness emit.* The notification's lifecycle from `created` is recorded.

## Engineering invariants

- **Recipient-validated.** The cited recipient must exist; missing recipient produces a refusal.
- **Preference-respecting.** Per the recipient's notification-preferences, channels they've disabled are skipped.
- **Delivery-witnessed per channel.** Each channel's success/failure is recorded; an auditor can determine which channels reached the recipient.
- **Federation-portable.** Notifications can cross federation boundaries per [federation-convergence](../../../theorems/federation-convergence.md); the recipient's federated peer substrate receives and surfaces them.
