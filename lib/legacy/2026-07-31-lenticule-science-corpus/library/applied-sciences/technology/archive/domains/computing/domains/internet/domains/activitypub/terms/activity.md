---
title: "Activity"
aliases:
  - "Activity"
  - "activity"
date-created: 2025-12-31
type: term
date-updated: 2026-03-03
keywords:
  - Activitypub
defines:
  - "Activity"
---

An Activity is the basic unit of interaction in [ActivityPub](../index.md). It's a verb-object pair — an action performed by an [Actor](./actor.md) on some target — expressed in the [ActivityStreams 2.0](./activitystreams-2-0.md) vocabulary and distributed across the [federation](./federation.md) via server-to-server delivery.

Standard activity types include `Create` (publishing a post), `Follow` (subscribing to an actor's output), `Like` (signaling approval), `Announce` (resharing), and `Delete` (removing content). The vocabulary is extensible: implementations can define custom activity types, though interoperability depends on receivers understanding them.

Activities are addressed to specific audiences (followers, mentioned users, public) and delivered to the inboxes of remote servers. The receiving server decides how to present or act on the activity — a design choice that preserves instance autonomy but means the same activity can be rendered differently depending on where it's received.

## Related terms

- [Actor](./actor.md) — the entity that performs activities
- [Federation](./federation.md) — the network across which activities are exchanged
