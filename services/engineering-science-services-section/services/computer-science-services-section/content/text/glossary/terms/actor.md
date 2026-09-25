---

name: "Actor"
description: "An Actor is an addressable entity in [ActivityPub](../_index.md) — a user account, a bot, a service, or any other thing that can send and receive [activities](activity.md). Each actor has an inbox (where it receives activities from the [federation](federation.md)) and an outbox (where it publishes activities)."
aliases:
  - "Actor"
  - "actor"
date-created: 2025-12-31
date-modified: 2026-03-03
keywords:
  - activitypub
---

An Actor is an addressable entity in [ActivityPub](../_index.md) — a user account, a bot, a service, or any other thing that can send and receive [activities](activity.md). Each actor has an inbox (where it receives activities from the [federation](federation.md)) and an outbox (where it publishes activities).

Actors are identified by URLs and discoverable via WebFinger. The protocol makes no distinction between an actor on a single-person instance and an actor on a server with millions of users — a design choice that preserves formal equality but doesn't address the power asymmetries between volunteer-run instances and corporate-scale deployments. This is one of the points where the [standardization process](../../../../../technology-science-services-section/services/standardization-services-section/content/text/glossary/concepts/standardization-as-counterinsurgency.md) bracketed political questions as "out of scope": the specification treats all actors as equivalent nodes, regardless of the resources and governance behind them.

---

## Supplementary formulation

```yaml
---
name: "Actor"
aliases:
  - "Actor"
  - "actor"
date-created: 2025-12-31
date-updated: 2026-03-03
keywords:
  - Activitypub
---
```

An Actor is an addressable entity in [ActivityPub](../index.md) — a user account, a bot, a service, or any other thing that can send and receive [activities](activity.md). Each actor has an inbox (where it receives activities from the [federation](federation.md)) and an outbox (where it publishes activities).

Actors are identified by URLs and discoverable via WebFinger. The protocol makes no distinction between an actor on a single-person instance and an actor on a server with millions of users — a design choice that preserves formal equality but doesn't address the power asymmetries between volunteer-run instances and corporate-scale deployments. This is one of the points where the [standardization process](../../../../../technology-science-services-section/services/standardization-services-section/content/text/glossary/concepts/standardization-as-counterinsurgency.md) bracketed political questions as "out of scope": the specification treats all actors as equivalent nodes, regardless of the resources and governance behind them.

## Related terms

- [Activity](activity.md) — the actions that actors perform
- [Federation](federation.md) — the network of servers hosting actors
