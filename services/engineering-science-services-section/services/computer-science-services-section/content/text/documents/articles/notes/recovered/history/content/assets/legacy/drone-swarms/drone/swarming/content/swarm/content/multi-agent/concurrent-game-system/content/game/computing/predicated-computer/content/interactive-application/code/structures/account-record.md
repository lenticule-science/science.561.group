---
type: definition
class: substrate-entity
realizes: [account]
depends-on: [account, user-record, authentication-method-record, identity-record]
see-also: [user-record]
---

# Account record

A **account record** is the substrate-entity formal definition of an [account](teaching/explanations/account.md): the predication-graph entity binding a user to their authentication methods and substrate-side authorizations.

## Structural fields

- **`id`** — kebab-case identifier; typically the canonical account handle (username or email).
- **`description`** — one-line summary.
- **`bound-user`** — reference to the [user-record](user-record.md) this account belongs to.
- **`bound-identity-key`** — reference to the [identity-record](../../../objects/identity-record.md) for the account's substrate operations.
- **`authentication-methods`** — references to the [authentication-method-records](authentication-method-record.md) the account admits.
- **`authorization-grants`** — references to office memberships (per [enroll](../../agential-orchestration-platform/morphisms/enroll.md)) and individual powers/duties/privileges/immunities.
- **`state`** — `active`, `suspended`, `closed`, with substrate-recorded transitions.
- **`created-at`** — substrate ordinal of account creation.
- **`last-authenticated-at`** — substrate ordinal of most recent successful authentication. Informational; not consulted for correctness.
- **`closure-kind`** — `account`.

## Invariants

- **Single-user-bound.** Each account binds to exactly one user-record. Multi-user shared accounts are inadmissible — they break per-account audit attribution.
- **At-least-one-method.** Every active account must have at least one authentication method. Method-less accounts cannot be authenticated and are admissible only as transient or deactivated.
- **Identity-key-paired.** Every account references an identity-record; the identity-record's holder field references the account or its bound user.

## Position in the platform

Account records are the substrate's *authentication-and-authorization registry at the user layer*. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), account-attributable witnesses are non-repudiable.
