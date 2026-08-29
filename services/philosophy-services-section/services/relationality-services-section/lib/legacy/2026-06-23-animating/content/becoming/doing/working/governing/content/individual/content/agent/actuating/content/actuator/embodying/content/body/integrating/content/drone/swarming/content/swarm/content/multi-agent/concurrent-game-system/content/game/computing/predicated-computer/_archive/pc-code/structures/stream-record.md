---
type: definition
class: substrate-entity
realizes: [stream, window]
depends-on: [stream, window, type-record, time-and-event-ordinals]
see-also: [channel-record]
---

# Stream record

A **stream record** is the substrate-entity formal definition of a [stream](teaching/explanations/stream.md): the predication-graph entity declaring an unbounded ordered series of events.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`element-type`** — reference to the [type-record](theories/functional-runtime-platform/objects/type-record.md) of stream items.
- **`producers`** — references to substrate operations or external sources that publish.
- **`subscribers`** — references to subscribers and their per-subscriber position cursors.
- **`ordering-discipline`** — `producer-order`, `total-order`, `event-time`.
- **`retention-policy`** — `forever`, `last-N`, `last-duration`.
- **`current-cursor`** — substrate ordinal of the most-recent item.
- **`item-count`** — derived count.
- **`derived-windows`** — references to [window](teaching/explanations/window.md) records derived from this stream.
- **`closure-kind`** — `stream`.

## Invariants

- **Type-respecting.** Every published item conforms to element-type.
- **Order-preserving.** Per the cited ordering-discipline, items maintain their order on the subscriber side.
- **Retention-respecting.** Items past the retention-policy are retired; the substrate's audit chain retains the retirement events.

## Position in the substrate

Stream records are the substrate's *temporal-data registry*. Used for event logs at the application layer, sensor data, audit-of-substrate-events streamed to monitoring, real-time analytics.
