---
type: concept
class: temporal-data-discipline
depends-on: [predication-cell, time-and-event-ordinals, channel]
see-also: [window]
---

# Stream

A *substrate-recorded sequence of events ordered in time*: a stream is the substrate's representation of an unbounded ordered series — events arriving over time, processed in order or by time-windows, possibly aggregated, possibly transformed.

Streams differ from [lists](theories/interactive-application-platform/concepts/list.md):

- **Lists** are bounded ordered collections held in their entirety; operations like length-of-list make sense.
- **Streams** are unbounded; you can't ask "how long is the stream" — you ask "what's in the last $N$ items" or "what's in the last hour."

A stream has the structure:

- **Stream-id** — substrate identifier.
- **Element-type** — the [type](theories/functional-runtime-platform/concepts/type.md) of stream items.
- **Producer(s)** — substrate operations or external sources that publish to the stream.
- **Subscriber(s)** — substrate operations that consume from the stream.
- **Ordering discipline** — `producer-order` (per-producer FIFO), `total-order` (global ordering across producers), `event-time` (ordered by event-time-stamps even when arriving out of order).
- **Retention policy** — how long stream items are retained: `forever`, `last-N`, `last-duration`.

Per [self-representation](teaching/explanations/self-representation.md), streams are substrate content. Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), stream items have substrate-ordinal-bound timestamps.

Streams compose with [channel](theories/functional-runtime-platform/concepts/channel.md): a channel is a bounded buffer for one-to-one or one-to-few message passing; a stream is an unbounded log for many-to-many publish-subscribe. The substrate's [send-message](../morphisms/send-message.md) and [receive-message](../morphisms/receive-message.md) operate at the transport layer; streams operate at the substrate-content layer above.

Per [federation-convergence](../theorems/federation-convergence.md), streams across federated substrates converge: subscribers on different substrates see the same items in the same order (modulo per-substrate filtering).
