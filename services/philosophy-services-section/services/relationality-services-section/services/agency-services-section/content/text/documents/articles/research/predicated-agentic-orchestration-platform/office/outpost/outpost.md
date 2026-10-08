---
type: concept
class: structure
depends-on: [scope, federation]
see-also: [inbox, federation, application-sublocale]
title: Outpost
description: The substrate-level structure on the sending side of inter-scope (or inter-computer) messaging — a predication-graph store sub-region whose entities are outgoing messages awaiting transmission and the routing predications that determine…
---

# Outpost

The substrate-level structure on the *sending* side of inter-scope (or inter-computer) messaging — a [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) sub-region whose entities are outgoing messages awaiting transmission and the routing predications that determine where they go.
The outpost is the dual of the [inbox](inbox.md): outpost on the sender's side, inbox on the recipient's side, and a [federation](federation.md) protocol carrying messages from one to the other.

Three properties:

- **Scope-bounded.** An outpost is associated with a [scope](../../scope/scope.md) — the scope from which the outpost emits messages.
  A scope may host multiple outposts, each routing to a different recipient scope or [predicated computer](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md); the routing predications on each message determine which outpost handles it.
- **Recorded.** Every emission produces a [witness](../../teaching/explanations/witness.md): the message's canonical hash, the routing predications at the time, the recipient's identity, the resulting transmission status.
  The witness is appended to the [event log](../../../objects/event-log.md).
  An auditor replaying the log reconstructs the message stream byte-for-byte.
- **Substrate-recorded.** An outpost is itself a predication-graph entity, per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md).
  Its policy — what scopes it routes to, what authentication it requires, what rate-limiting it enforces — is predications.

The outpost is the platform's *export surface*: an external system observing a scope's behavior reads through the outpost's emissions, not through the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) directly.
This is what makes [federation](federation.md) a structural property of the platform rather than a glued-on adapter — federation is built from outposts and inboxes, both of which are substrate entities, both of which carry their routing and trust policies as predications.
