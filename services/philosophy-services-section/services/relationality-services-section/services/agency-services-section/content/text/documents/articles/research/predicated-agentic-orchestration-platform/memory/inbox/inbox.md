---
type: concept
class: structure
depends-on: [agent, dispatch]
see-also: [outpost, federation, session]
title: Inbox
description: The substrate-level structure that records incoming messages awaiting dispatch.
---

# Inbox

The substrate-level structure that records incoming messages awaiting [dispatch](dispatch.md).
An inbox is a [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) sub-region whose entities are messages — predications carrying the message body, the sender's identity, the intended recipient (or scope), and the arrival time.
Dispatch reads the inbox; messages dispatched out of the inbox become work the heartbeat schedules.

Three properties:

- **Append-only.** Messages arrive; they are not edited or deleted.
  Once a message is dispatched, the dispatch witness records the disposition; the message itself stays in the inbox as part of the platform's history.
  This is the engineering content of "the message stream is the audit log of incoming work."
- **Scope-bounded.** Each inbox is associated with a [scope](../../scope/scope.md).
  A scope's inbox accepts messages addressed to entities visible at that scope; messages addressed elsewhere are routed to the appropriate scope's inbox by the platform's [federation](federation.md) layer.
  Two scopes have two distinct inboxes; the inboxes do not share state.
- **Substrate-recorded.** An inbox is itself a predication-graph entity, per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md).
  Editing the inbox's policy (rate-limiting rules, message-shape constraints, dispatch precedence) is editing predications.

identified the inbox-as-event-stream pattern: the inbox is what records arrivals, and its records are events in the [event log](../../../objects/event-log.md).
The Kafka-style "event log IS the database" thesis, when applied to incoming work, gives the inbox-as-event-stream realization.

The inbox is the *receive-side* counterpart of the [outpost](outpost.md).
An outpost emits messages; an inbox receives them.
The two structures together — outpost on the sender side, inbox on the recipient side — constitute the platform's messaging surface.
[Federation](federation.md) is the protocol by which an outpost on one [predicated computer](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md) delivers messages to an inbox on another.
