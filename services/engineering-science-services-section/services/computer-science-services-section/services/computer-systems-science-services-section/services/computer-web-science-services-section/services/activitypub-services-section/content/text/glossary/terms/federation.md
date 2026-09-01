---
name: "Federation"
aliases:
  - "Federation"
  - "federation"
date-created: 2025-12-31
date-updated: 2026-03-03
keywords:
  - Activitypub
  - Fediverse
---

Federation is the network architecture in which autonomous servers exchange [activities](./activity.md) via a shared protocol — in this case, [ActivityPub](../index.md). Each server (instance) operates independently: it runs its own moderation policies, stores its own data, and decides which other instances to communicate with. Federation means these independent servers can interoperate, allowing users on one instance to follow, message, and interact with users on another.

The key [property](../../../../../../sociology/terms/property.md) of federation is that no single server controls the network. An instance can join or leave the federation, block specific other instances, or modify how it processes incoming activities. This is what gave the early [fediverse](../../../fediverse/index.md) its character as an [insurgent infrastructure](../concepts/insurgent-infrastructure.md): anyone could spin up a server and participate on equal technical footing.

In practice, federation is uneven. Large instances attract more users and carry more weight in the network's social dynamics. The rise of Mastodon as a de facto reference implementation meant that "federation" increasingly meant "Mastodon-compatible federation" — a narrowing that the essay on [institutional capture](../activitypub-insurrection-deadzone.md) analyzes as part of the [domestication](../concepts/domestication-paradox.md) process.

## Related terms

- [Activity](./activity.md) — what flows across the federation
- [Actor](./actor.md) — who sends and receives within the federation
- [Fediverse](../../../fediverse/index.md) — the broader network of federated services built on ActivityPub and related protocols


---

<!-- source: archive/domains/computing/domains/internet/domains/fediverse/terms/federation.md -->

## Imported source: archive/domains/computing/domains/internet/domains/fediverse/terms/federation.md

---
title: "federation"
aliases:
  - "federation"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "federation"
---

**Federation** is a model of networked communication in which independent servers exchange data with one another according to shared protocols, without any single server having authority over the whole network. Each server (often called an *instance*) operates autonomously — it sets its own policies, manages its own users, and stores its own data — but participates in a larger network by sending and receiving standardized messages.

In the context of the [fediverse](./fediverse.md), federation is implemented primarily through the [ActivityPub](../../topics/activitypub/index.md) protocol. When a user on one instance follows a user on another, the two servers establish a relationship: the remote server sends new posts to the local server, which displays them to the follower. Replies, likes, and boosts flow back through the same channel.

Federation differs from centralized platforms (where one entity controls all data and rules) and from fully peer-to-peer networks (where there are no servers at all). It occupies a middle ground: servers are sovereign over their own domain but choose to interoperate. This means that an instance administrator can block another instance entirely, severing the federation link — a capability that has no equivalent in centralized systems.

The trade-offs of federation include: uneven content availability (a post exists only on servers that have fetched it), moderation complexity (each instance must make its own moderation decisions), and eventual-consistency rather than real-time synchronization.
