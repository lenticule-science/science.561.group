---
type: definition
class: substrate-entity
realizes: [channel]
depends-on: [channel, event-log]
see-also: [publish, subscribe]
---

# Channel record

A **channel record** is the substrate-entity formal definition of a [channel](teaching/explanations/channel.md): the predication-graph entity declaring the channel's name, admissibility shape, accepted origins, retention policy, and access policy. Per [self-representation](teaching/explanations/self-representation.md), every channel the substrate carries must exist as such a record; pub-sub topics that live only in runtime configuration are out-of-band.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of what the channel carries.
- **`name`** — human-readable channel name (typically derived from id but allowing free-form aliases).
- **`scope`** — reference to the [scope](teaching/explanations/scope.md) the channel operates within.
- **`admissibility-shape`** — reference to a [shape record](theories/agential-orchestration-platform/objects/shape-record.md) declaring what events the channel admits. Events failing the shape are rejected at [publish](../morphisms/publish.md).
- **`accepted-origins`** — references to identity entities the channel accepts publishes from. Per [origin](teaching/explanations/origin.md), every event carries origin; the channel's accepted-origins predication determines admissibility.
- **`read-policy`** — declarations of which entities are admissible as subscribers: typically references to [office](theories/agential-orchestration-platform/objects/office-record.md) records or authorization predications.
- **`write-policy`** — declarations of which entities are admissible as publishers; analogous to read-policy but for the produce side.
- **`retention-policy`** — declaration of how long published events persist on the channel: until-consumed-by-all-subscribers, time-windowed, indefinite, or a specific number-of-recent-events.
- **`event-log-region`** — reference to the [event log](event-log.md) region(s) the channel writes into. Channels may share a region (with discrimination by channel-id predications) or have dedicated regions.
- **`closure-kind`** — `channel`.

## Invariants

- **Substrate-resident.** The channel record is a substrate entity, queryable. A channel without a record is out-of-band and not admissible.
- **Shapes and policies are substrate entities.** Every cited shape, every cited authorization, every retention rule is a substrate entity per [vocabulary completeness](teaching/explanations/vocabulary-completeness.md). A channel citing out-of-band predicates is incomplete.
- **Append-only event sequence.** Per [event log](event-log.md), the channel's events are appended; no edits, no in-place removals. Retirements (per retention policy) are themselves events.
- **Policy-coherent.** The accepted-origins and write-policy are checked at publish time; the read-policy is checked at subscribe time. Mismatched policies (an entity admitted to publish but not allowed to subscribe to its own channel, or vice versa) are admissible as engineering choices but typically flagged by validation.

## Operations

- *Create.* Inserting a channel-record is the substrate operation that establishes the channel. The creation produces a witness; subsequent publish/subscribe operations cite the channel-id.
- *Publish-into.* See [publish](../morphisms/publish.md).
- *Subscribe-to.* See [subscribe](../morphisms/subscribe.md).
- *Retire.* A channel can be retired; retired channels admit no new publishes; existing subscriptions receive a final retirement notification.

## Position in the substrate

Channels are the substrate's *named, multi-party messaging primitive*. Where [insertion](../morphisms/insertion.md) and [traversal](../morphisms/traversal.md) are the substrate's storage primitives, [publish](../morphisms/publish.md) and [subscribe](../morphisms/subscribe.md) are its messaging primitives — and the channel-record is what the messaging primitives operate on. Particular use-cases (an [inbox](theories/agential-orchestration-platform/objects/inbox-record.md), an [outpost](theories/agential-orchestration-platform/objects/outpost-record.md), a learning channel, a dispatch channel) are channels with particular shape, origin, and policy declarations.
