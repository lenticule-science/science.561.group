---
title: "Federation"
aliases:
  - "Federation"
  - "federation"
date-created: 2025-12-31
type: term
date-updated: 2026-03-03
keywords:
  - Activitypub
  - Fediverse
defines:
  - "Federation"
---

Federation is the network architecture in which autonomous servers exchange [activities](./activity.md) via a shared protocol — in this case, [ActivityPub](../index.md). Each server (instance) operates independently: it runs its own moderation policies, stores its own data, and decides which other instances to communicate with. Federation means these independent servers can interoperate, allowing users on one instance to follow, message, and interact with users on another.

The key [property](../../../../../../sociology/terms/property.md) of federation is that no single server controls the network. An instance can join or leave the federation, block specific other instances, or modify how it processes incoming activities. This is what gave the early [fediverse](../../../fediverse/index.md) its character as an [insurgent infrastructure](../concepts/insurgent-infrastructure.md): anyone could spin up a server and participate on equal technical footing.

In practice, federation is uneven. Large instances attract more users and carry more weight in the network's social dynamics. The rise of Mastodon as a de facto reference implementation meant that "federation" increasingly meant "Mastodon-compatible federation" — a narrowing that the essay on [institutional capture](../activitypub-insurrection-deadzone.md) analyzes as part of the [domestication](../concepts/domestication-paradox.md) process.

## Related terms

- [Activity](./activity.md) — what flows across the federation
- [Actor](./actor.md) — who sends and receives within the federation
- [Fediverse](../../../fediverse/index.md) — the broader network of federated services built on ActivityPub and related protocols
