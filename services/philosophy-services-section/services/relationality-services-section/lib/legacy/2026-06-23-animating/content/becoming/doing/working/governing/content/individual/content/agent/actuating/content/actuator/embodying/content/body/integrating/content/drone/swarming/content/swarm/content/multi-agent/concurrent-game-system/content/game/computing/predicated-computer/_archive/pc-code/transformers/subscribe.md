---
type: morphism
class: channel-operator
realizes: [channel]
depends-on: [channel]
see-also: [publish, traversal]
---

# Subscribe

The operator that registers a consumer to receive events from a [channel](teaching/explanations/channel.md). Subscribe is a consumer's primary action: the consumer's subscription becomes a substrate predication, and subsequent [publish](publish.md) operations on the channel notify the consumer per the substrate's discipline.

## Signature

`subscribe(channel, consumer, filter-shape?) → (subscription-id, witness)`

Inputs:

- **`channel`** — reference to the [channel](teaching/explanations/channel.md) being subscribed to.
- **`consumer`** — reference to the consuming entity: an agent, a closure rule, an external boundary recipient. The consumer must have appropriate authorization predications for the channel.
- **`filter-shape`** — optional reference to a [shape record](theories/agential-orchestration-platform/objects/shape-record.md) declaring which events the subscription receives. Without a filter, all events on the channel are received; with a filter, only events satisfying the filter shape.

Outputs:

- **`subscription-id`** — the substrate identifier of the new subscription entity.
- **`witness`** — records the subscription's creation: the channel, consumer, filter, the substrate state at registration.

## Operational semantics

Subscribe proceeds in four steps:

1. *Validate authorization.* The consumer's authorization is checked against the channel's read-policy predications. A consumer without read authorization is rejected; the rejection is witnessed.
2. *Validate filter shape.* If a filter is provided, the substrate validates that the filter shape's targeted predicates are within the channel's vocabulary. A filter referencing predicates the channel does not carry is rejected as ill-formed.
3. *Insert subscription predication.* A subscription entity is created; predications connect it to the channel, the consumer, the optional filter. The entity's existence is the substrate's record that this consumer receives this channel's events.
4. *Witness emit.* The subscription's creation produces a witness in the [event log](../objects/event-log.md).

## Engineering invariants

- **Subscription is substrate content.** A subscription entity is itself a substrate predication, queryable through [traversal](traversal.md). Audit can answer "who subscribes to this channel?" by traversing.
- **Filter is substrate content.** When present, the filter is a shape entity, also queryable. The substrate's audit can answer "what predications would this subscription have admitted?" by checking the filter against past channel events.
- **Authorization-checked at registration.** Authorization is checked once at subscribe; subsequent events are delivered without re-checking. If the consumer's authorization is later revoked, the subscription is invalidated by a separate substrate operation; events accumulated in the meantime are still delivered (the audit shows the history).
- **Witnessed.** Subscription creations produce witnesses; silent subscriptions are not admissible.

## Operations

The substrate's other operators on subscriptions:

- *Unsubscribe.* A consumer's subscription is retired by setting `retired: true` on the subscription entity. Future events are not delivered; past events remain in the audit trail.
- *Edit filter.* A subscription's filter shape can be edited by replacing the cited shape with a new one; the edit produces a new subscription version. The previous version remains for audit.

## Position in the substrate

Subscribe is the channel's receive-side primitive, paired with [publish](publish.md). Together they constitute the substrate's pub-sub mechanism, with the channel as the mediating entity, the subscription as the consumer's receive declaration, and the substrate's witness chain as the audit layer.
