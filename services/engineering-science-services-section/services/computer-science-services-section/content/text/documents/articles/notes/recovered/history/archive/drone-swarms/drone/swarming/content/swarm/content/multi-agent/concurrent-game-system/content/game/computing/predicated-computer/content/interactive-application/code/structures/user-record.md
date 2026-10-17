---
type: definition
class: substrate-entity
realizes: [user]
depends-on: [user, identity-by-relations, agent-record]
see-also: [account-record]
---

# User record

A **user record** is the substrate-entity formal definition of a [user](teaching/explanations/user.md): the predication-graph entity representing a human individual on the platform.

## Structural fields

- **`id`** — kebab-case identifier, typically derived from a stable user-handle (username, email, or substrate-assigned id).
- **`description`** — one-line summary (the user's display name).
- **`acts-through-agent`** — reference to the [agent-record](../../agential-orchestration-platform/objects/agent-record.md) the user operates through. The same human may have multiple agent-records (different roles, different access levels); the user-record may reference all of them.
- **`accounts`** — references to the [account-records](account-record.md) bound to this user (typically one, may be more for multi-tenant scenarios).
- **`profile-predications`** — substrate predications declaring user-experience properties: display name, avatar (content-hash), bio, timezone, locale, notification preferences, accessibility preferences.
- **`created-at`** — substrate ordinal of user-record creation.
- **`closure-kind`** — `user`.

## Invariants

- **Agent-link required.** Every user-record must reference at least one `acts-through-agent`. A user without an agent has no operational presence on the platform.
- **Substrate-resident profile.** Per [self-representation](../../teaching/explanations/self-representation.md), profile predications are substrate content.
- **Identity-by-relations.** Per [identity-by-relations](../../teaching/explanations/identity-by-relations.md), the user is constituted by their predications; two user-records with the same predications are the same user.

## Position in the platform

User records are the substrate's *human-experience layer above the agent layer*. Per [agent-record](../../agential-orchestration-platform/objects/agent-record.md), agents are the substrate's operational actors; user-records add the user-experience metadata that makes a human user's interactions feel coherent (their preferences, their accumulated profile, their accounts).
