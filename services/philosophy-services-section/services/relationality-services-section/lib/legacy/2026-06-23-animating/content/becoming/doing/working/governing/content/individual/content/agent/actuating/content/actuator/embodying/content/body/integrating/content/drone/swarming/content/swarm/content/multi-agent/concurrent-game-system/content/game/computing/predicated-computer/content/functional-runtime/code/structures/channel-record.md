---
type: definition
class: substrate-entity
realizes: [channel]
depends-on: [channel, predication-cell, type-record, predication-fiber-algebra]
see-also: [lock-record, channels-as-residuated-rendezvous]
---

# Channel record

A **channel record** is the substrate-entity formal definition of a [channel](teaching/explanations/channel.md): the predication-graph entity declaring a typed message-passing conduit between substrate operations. Structurally — per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md) — the record names the channel's predicate $p_C$, fixes the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_C}$ that holds the buffer state, and declares which rendezvous-accessibility relation $R_C$ the substrate evaluates $\Box_{R_C}$ against (the buffer-policy field).

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`message-type`** — reference to the [type-record](type-record.md) of messages the channel admits.
- **`senders`** — references to substrate operations or contexts entitled to send.
- **`receivers`** — references to substrate operations or contexts entitled to receive.
- **`buffer-policy`** — `unbuffered`, `bounded-N`, `unbounded`.
- **`buffer-size`** — for bounded channels, the buffer size.
- **`current-buffer`** — references to the messages currently in the buffer.
- **`direction`** — `unidirectional`, `bidirectional`.
- **`closed`** — boolean: whether either end has closed the channel.
- **`closure-kind`** — `channel`.

## Invariants

- **Type-respecting.** Every message sent on the channel must conform to the cited message-type. Structurally, this is the same refinement-comprehension on $A_{p_C}$ that governs every other fiber per [refinements-as-paraconsistent-comprehension](../theorems/refinements-as-paraconsistent-comprehension.md); a non-conforming message lands in the $\mathbf{f}$ cell of the verdict, surfaced as `refusal-witness`.
- **Buffer-bounded.** For bounded channels, the current buffer cannot exceed the buffer size. Structurally, this is the truncation of the rendezvous grade $\Box_{R_C}$ at cardinality $N$ per Part 3 of [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md).
- **Closed-permanent.** Once closed, a channel cannot be reopened. Subsequent sends fail; pending receives drain the buffer and then fail. Structurally, this is the support-respecting property of the void cone $V_\infty$ on $A_{p_C}$ per Part 5 of [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), which forbids non-monotone descent — `reopen` is structurally inadmissible, not merely conventionally absent.

## Position in the platform

Channel records are the substrate's *message-passing registry*. Per [channel](teaching/explanations/channel.md), channels enable producer-consumer patterns, pipelines, and async function results without shared mutable state. Per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), a channel record is the substrate-entity declaration of one fiber of the runtime's predication fibration, alongside the type, refinement, effect, capability, and evaluation coordinates handled at the same fiber.
