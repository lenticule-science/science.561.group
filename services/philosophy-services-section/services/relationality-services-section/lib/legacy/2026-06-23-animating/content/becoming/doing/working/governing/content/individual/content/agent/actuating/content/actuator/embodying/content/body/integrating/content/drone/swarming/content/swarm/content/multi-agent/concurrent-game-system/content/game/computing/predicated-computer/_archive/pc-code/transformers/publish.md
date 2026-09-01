---
type: morphism
class: channel-operator
realizes: [channel]
depends-on: [channel, event-log]
see-also: [subscribe, emit-witness]
---

# Publish

The operator that emits an event into a [channel](teaching/explanations/channel.md). Publish is a producer's primary action: the event is written to the channel, recorded in the [event log](../objects/event-log.md), and made available to whatever subscribers the channel has. The producer does not name a recipient; the channel mediates.

## Signature

`publish(channel, event-content, origin) → (event-id, witness)`

Inputs:

- **`channel`** — reference to the [channel](teaching/explanations/channel.md) entity to publish into.
- **`event-content`** — the canonical-form bytes of the event being emitted. The content is application-defined but must satisfy the channel's admissibility shape.
- **`origin`** — per [origin](teaching/explanations/origin.md), the originating cause of the event: which entity, agent, or operator emitted it.

Outputs:

- **`event-id`** — the canonical-hash content-id of the published event in the [content-addressed store](../objects/content-addressed-store.md).
- **`witness`** — records the publish: the channel, the event-id, the origin, the substrate state at the moment of publication.

## Operational semantics

Publish proceeds in five steps:

1. *Validate against admissibility shape.* The channel record carries a shape predication declaring what events are admissible. The event content is checked; failures abort with a rejection witness.
2. *Validate origin.* The cited origin is verified against the channel's accepted-origins predications. An origin not on the accepted list aborts.
3. *Canonicalize and hash.* The event content is canonicalized (per [canonical-form](teaching/explanations/canonical-form.md)) and hashed; the event-id is the hash.
4. *Persist.* The event is written via [PutCell](put-cell.md) to the content-addressed store; the event entity is inserted into the channel's queue (if the channel maintains one) and into the [event log](../objects/event-log.md).
5. *Witness emit.* The publish witness is appended to the event log; subscribers' notification mechanisms are triggered (typically through a closure rule that fires on new channel events).

## Engineering invariants

- **Event-id deterministic.** Two publish operations with identical event-content produce identical event-ids, regardless of where or when they happen. Federation across substrates relies on this.
- **Append-only.** A published event is not edited; corrections are new publishes. The channel's history is the sequence of published event-ids in canonical order.
- **Origin-recorded.** Every published event carries an origin predication; per the [origin](teaching/explanations/origin.md) discipline, events without origin are violations.
- **Witnessed.** Every publish produces a witness; silent publishes are not admissible.

## Failure modes

- **Admissibility shape rejection.** The event content fails the channel's shape; the publish does not occur, the rejection is witnessed.
- **Origin rejection.** The publishing entity is not on the channel's accepted-origins list; rejection witnessed.
- **Channel retired.** The channel has been retired (no longer accepts new events); the publish fails, the rejection is witnessed.

## Position in the substrate

Publish is the channel's send-side primitive. Together with [subscribe](subscribe.md) (the receive-side primitive), it constitutes the substrate's pub-sub messaging surface. The substrate's other messaging structures — [inbox-record](theories/agential-orchestration-platform/objects/inbox-record.md), [outpost-record](theories/agential-orchestration-platform/objects/outpost-record.md) — are particular use-cases of publish/subscribe with additional discipline (signed witnesses, federation handshake, etc.).
