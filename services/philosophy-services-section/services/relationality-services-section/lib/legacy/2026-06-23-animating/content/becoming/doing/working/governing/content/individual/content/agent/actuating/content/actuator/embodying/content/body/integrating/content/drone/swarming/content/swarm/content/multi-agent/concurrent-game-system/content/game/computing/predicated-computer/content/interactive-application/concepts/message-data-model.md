---
type: concept
class: data-model
depends-on: [user, account, federation-envelope, hash-discipline, canonical-form, doctrine-fidelity, time-and-event-ordinals]
see-also: [notification, form, message-as-federation-envelope-payload]
---

# Message data model

The substrate's *canonical predication shape for user-to-user messages* — emails, chats, structured requests, notifications, comments. In the substrate's hyperdoctrine setting, a message is not a special opaque blob — it is *a substrate entity with a fixed predication structure that the substrate's vocabulary admits and the substrate's renderers project*.

Per [message-as-federation-envelope-payload](../theorems/message-as-federation-envelope-payload.md), every cross-substrate user-message is the payload of a [federation-envelope](../../teaching/explanations/federation-envelope.md) — the substrate's federation discipline carries messages between users in different substrates with the same envelope-and-verification machinery as any other federation operation.

## Why this concept exists

Without a canonical message shape, every interfacer (email, chat, notification, structured request) would invent its own predication structure. Federation across substrates would require per-message-kind translation; renderers would need per-kind logic. The substrate's user-experience would fragment.

This concept fixes the canonical message structure so that every message — regardless of origin (typed by the user, parsed from SMTP, structured by a form submission) — has the same predicate shape. Application-specific extensions are additive predications on the same base entity.

## Canonical message structure

A message is a substrate entity with the following predications:

### Required core

- `kind: message` — declares the entity is a message.
- `message-id` — the canonical-form hash of the message's content; per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), this is the message's substrate identity.
- `from` — sender's account-record-hash (or external-identity-hash if the sender is outside the substrate's federation).
- `to` — recipient's account-record-hash, or a list for multi-recipient messages.
- `created-at-ordinal` — sender's substrate ordinal at composition.
- `created-at-declared-time` — sender's wall-clock at composition (per [time-and-event-ordinals](../../teaching/explanations/time-and-event-ordinals.md)).
- `subject` — short text describing the message (may be empty for chat/short-form messages).
- `body` — the message's primary content (see "body shape" below).

### Optional extensions

- `cc`, `bcc` — additional recipients (semantics per the application).
- `in-reply-to` — message-id of the message this responds to (threading).
- `attachments` — list of attached entity-hashes (files, images, documents).
- `priority` — `low` / `normal` / `high` / `urgent`.
- `expires-at-ordinal` — ordinal after which the message is auto-archived.
- `tags` — application-specific labels.
- `signature` — per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the sender's signature binding the message to their identity.

## Body shape

The message body has a *content-type* predication declaring its shape:

- `content-type: text/plain` — UTF-8 plain text. The body is a string.
- `content-type: text/markdown` — UTF-8 markdown. The substrate's renderer parses to HTML for display.
- `content-type: text/html` — pre-rendered HTML. The substrate's renderer applies content-security-policy sanitization before display.
- `content-type: application/predicated.structured` — the body is a predication-graph fragment (a sub-region of substrate content). This is the typed-message case — e.g., a `print-widget-request`.
- `content-type: multipart/alternative` — multiple content-type alternatives (plain text + HTML, etc.); renderer picks the best supported.

For structured messages (`application/predicated.structured`), the body is canonical-JSON of substrate predications. The substrate's renderer dispatches on the structured body's `kind` field to render appropriately. Per [doctrine-fidelity](../../teaching/explanations/doctrine-fidelity.md), the structured body's predications are first-class — queryable, federate-able, audit-able.

## Why structured messages are the substrate's win

A traditional email is an opaque text blob — to "request a print job," the sender types instructions, the recipient parses (manually or with NLP). Errors cascade.

A structured message in the substrate is a typed predication. The sender uses a [form](form.md) (e.g., `print-widget-request-form`); on submit, the form produces a structured body (per [form-submission-envelope](form-submission-envelope.md)). The recipient's substrate admits the body as substrate content; the recipient's GUI renders the structured request with action buttons (Accept, Reject, Negotiate); the recipient's substrate vocabulary already understands `print-widget-request`, so closure rules can dispatch immediately.

This is the substrate's structural advantage over SaaS email — typed cross-user requests as a first-class operation, not an after-the-fact NLP exercise.

## Inbox and routing

Messages live in *inboxes* (per [AOP's inbox](../../agential-orchestration-platform/concepts/inbox.md), but here from the user perspective). A user's inbox is a substrate entity that:

- Lists incoming messages addressed to the user.
- Maintains user-state predications (per [user-state-predications](user-state-predications.md)) for each message: read/unread, archived, deleted, tagged.
- Per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md), the inbox is a sub-cover of the user's account scope.

Routing — "this message goes to this inbox" — is a closure-rule application. Default rule: any message with `to: {account-hash}` lands in `{account-hash}`'s default inbox. User-customized rules (filters, smart inboxes) are additional closure rules.

## Federation across substrates

When the sender and recipient are on different substrates, the message is wrapped in a [federation-envelope](../../teaching/explanations/federation-envelope.md):

1. Sender composes message in their substrate; substrate signs the message per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md).
2. Sender's substrate creates a federation-envelope with `payload.kind: "message-delivery"` and `payload.content` = the message.
3. Envelope is signed by sender's substrate identity-key (federation-level signature) in addition to sender's identity-key (message-level signature).
4. Envelope crosses via the federation transport (per [federation-envelope](../../teaching/explanations/federation-envelope.md)).
5. Recipient's substrate verifies federation-level signature, accessibility per [trust-boundary-modal-validity](../../../theorems/trust-boundary-modal-validity.md), then admits the message.
6. Per [message-as-federation-envelope-payload](../theorems/message-as-federation-envelope-payload.md), the message's structure is preserved across the envelope round-trip.

The substrate's discipline is that *cross-substrate messages have the same predication structure as same-substrate messages* — no special "external email" type. This makes federation natural: the recipient sees the message exactly as the sender composed it.

## Replies and threading

A reply is a message with `in-reply-to: {parent-message-id}`. The substrate's threading view groups messages by transitive `in-reply-to` chains.

For chat-style apps, threading may be implicit (per-channel sequence); the substrate's discipline is to record `in-reply-to` for any reply, even when the UI shows a flat sequence.

## Attachments

Attachments are entity-hashes referencing other substrate content (typically files via a separate file-storage interfacer). Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the attachment's hash uniquely identifies its content; the recipient's substrate fetches the attachment via federation if not already present.

Per [encryption-as-visibility-restriction-via-invisible-automorphism](../../../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), attachments may be encrypted under recipient identity-keys; non-recipient federation intermediaries can route the attachment-hash without decrypting.

## Position

The message data model is the substrate's *cross-user communication primitive*. Per [federation-envelope](../../teaching/explanations/federation-envelope.md), messages cross substrates as envelope payloads; per [doctrine-fidelity](../../teaching/explanations/doctrine-fidelity.md), the message structure is faithfully preserved; per [user-state-predications](user-state-predications.md), the user's per-message state (read/archived/etc.) is first-class substrate content.

The concept composes with [user](user.md), [account](account.md), [notification](notification.md), [form](form.md) (which produces structured-body messages), [collaborative-editing](collaborative-editing.md) (in-progress messages are drafts per [user-state-predications](user-state-predications.md)), and [federation-envelope](../../teaching/explanations/federation-envelope.md) (cross-substrate carriage).
