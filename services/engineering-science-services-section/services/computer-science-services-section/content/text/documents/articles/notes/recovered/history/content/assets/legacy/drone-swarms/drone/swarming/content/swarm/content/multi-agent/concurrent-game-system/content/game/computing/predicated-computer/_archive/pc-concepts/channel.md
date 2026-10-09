---
type: concept
class: structure
depends-on: [event-log, self-representation]
see-also: [inbox, outpost, dispatch]
---

# Channel

A **channel** is a substrate-level structure that decouples event producers from event consumers: a named region of the [event log](../objects/event-log.md) (or a derived stream over it) through which events flow. An entity that produces events writes to a channel; an entity that consumes events reads from a channel. Producers do not know who reads their events; consumers do not know who produced theirs. The channel mediates.

The pattern is the substrate-level realization of *publish-subscribe* messaging — but with channels as substrate entities (per [self-representation](self-representation.md)) rather than out-of-band topic configurations. A channel's name, its access policy, its retention policy, its associated closure rules are all predications on the channel entity. Editing the channel — opening it to a new subscriber, adjusting its retention, changing its admissibility shape — is editing predications.

Three engineering properties:

- **Producer-consumer decoupling.** An event-producing entity declares its target channel as a predication; an event-consuming entity declares its source channel similarly. The producer's edit history records *which channel* it wrote to, not *which consumer* received it; the consumer's edit history records *which channel* it read from, not *which producer* emitted. The substrate's audit traces both sides through the channel.
- **Named, not point-to-point.** Events flow through channel names, not through direct entity references. Adding a new consumer to a channel is inserting a subscription predication; the producer is unaffected. Removing a consumer is retracting a subscription; the producer is unaffected. The channel is the load-bearing decoupling layer.
- **Channel is itself a substrate entity.** Per self-representation, a channel is queryable and modifiable through the substrate's operators. A channel's policy — admissibility shape for events, retention rule, access control — is predications on the channel entity, not external configuration.

The pattern composes with [origin](origin.md): every event flowing through a channel carries an origin predication recording its producer; consumers reading the channel see origin alongside event content and can filter or audit accordingly. A consumer that needs to know "which producer caused this event?" reads the origin predication; the channel does not strip or rewrite origin.

Several substrate structures realize specialized channels:

- The [inbox](theories/agential-orchestration-platform/concepts/inbox.md) is a channel for incoming work.
- The [outpost](theories/agential-orchestration-platform/concepts/outpost.md) is a channel for outgoing emissions.
- A platform's *learning channel* is a channel for self-observation events.
- A platform's *dispatch channel* is a channel for work-routing events.
- A platform's *bridge channel* is a channel for inter-substrate translation events.

Each is a particular use of the channel pattern with particular admissibility shapes and access policies, but all share the substrate-level structure.
