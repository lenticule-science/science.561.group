---
type: definition
class: substrate-entity
realizes: [outpost]
depends-on: [outpost, channel, federation-graph]
see-also: [inbox-record, federation-bridge]
title: Outpost record
description: "An outpost record is the substrate-entity formal definition of an outpost: the predication-graph entity recording the outpost's scope, its egress shape, its routing predications, its signing key, and the queue of outbound messages…"
---

# Outpost record

An **outpost record** is the substrate-entity formal definition of an [outpost](teaching/explanations/outpost.md): the predication-graph entity recording the outpost's scope, its egress shape, its routing predications, its signing key, and the queue of outbound messages awaiting transmission.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`scope`** — reference to the [scope](../../../scope/scope.md) the outpost serves (the scope from which messages are emitted).
- **`egress-shape`** — reference to a [shape record](../../../scope/shape/shape-record/shape-record.md) declaring what content is admissible to emit.
  Messages failing the egress shape are not transmitted; the substrate records the rejection.
- **`routes`** — declarations of which remote scopes or [federated computers](teaching/explanations/federation.md) the outpost transmits to, with predicates declaring which messages go to which destinations.
- **`identity-key`** — reference to the cryptographic identity used to sign emitted messages.
  Per [federation-handshake](../../../agent/federation/federation-handshake/federation-handshake.md), recipients verify the signature against this key's public component.
- **`canonical-translation`** — optional reference to a [federation bridge](../../../agent/federation/federation-bridge/federation-bridge.md) entity declaring how the outpost's content is translated for recipients running different operator-specification versions.
- **`rate-limit`** — optional substrate-recorded rate constraints on emissions to a given destination.
- **`queue`** — references to outbound message entities awaiting transmission.
  Messages remain in the queue when the network to a recipient is unavailable; on connection recovery they are transmitted in canonical-hash order.
- **`closure-kind`** — `outpost`.

## Invariants

- **Egress-shape enforced.** Every transmitted message satisfies the egress shape; failures are recorded as rejection witnesses but not transmitted.
- **Signed.** Every emitted message carries a signed [witness](../../teaching/explanations/witness.md).
  Per [federation](teaching/explanations/federation.md), unsigned messages are not admissible across federation boundaries.
- **Append-only queue.** Messages enter the queue and either transmit or retire; queue entries are not edited in place.
- **Routes verifiable.** Every cited route resolves to a substrate entity (a remote outpost, an [inbox-record](../../../memory/inbox/inbox-record/inbox-record.md) with a cross-substrate identity, a federation-graph node).

## Operations

- *Emit.* The platform's outbound operator validates a candidate message against the egress shape, signs it with the identity key, applies any cited canonical-translation bridge, places it in the queue, and (when the network is available) transmits it to the routed destination.
- *Retransmit.* Queued messages whose initial transmission failed (connection unavailable, recipient rejected) are retransmitted on connection recovery.
  The retransmit produces a new transmission witness; the original transmission's witness records the failure cause.
- *Audit.* Querying the queue, the transmission witnesses, the egress shape's rejection log are substrate traversals.

## Position in the platform

The outpost record is the platform's *send-side substrate boundary*.
It is structurally symmetric to the [inbox-record](../../../memory/inbox/inbox-record/inbox-record.md): the inbox accepts messages from external parties; the outpost emits messages to external parties.
Together with [federation-bridge](../../../agent/federation/federation-bridge/federation-bridge.md) entities for cross-version translation, outposts and inboxes form the platform's federation surface.

Outposts compose with [channels](../../teaching/explanations/channel.md): an outpost may be subscribed to internal channels and forward channel events to remote scopes.
The outpost's routing predications determine which channel events go to which remote destinations, allowing fan-out across federation without per-event code.
