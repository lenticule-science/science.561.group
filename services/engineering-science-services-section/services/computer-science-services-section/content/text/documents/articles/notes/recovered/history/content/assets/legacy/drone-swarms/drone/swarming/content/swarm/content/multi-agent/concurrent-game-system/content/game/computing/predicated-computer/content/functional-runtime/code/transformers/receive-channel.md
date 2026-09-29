---
type: morphism
class: concurrency-operation
realizes: [channel]
depends-on: [channel-record, type-record, witness, right-residuation-operator, twist-product-right-residual, predication-fiber-residuation]
see-also: [send-channel, channels-as-residuated-rendezvous]
---

# Receive channel

The substrate operation that *receives* a message from a [channel](teaching/explanations/channel.md). For unbuffered channels, receive blocks until a sender sends; for buffered channels, receive succeeds immediately if a message is available in the buffer.

Structurally — per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md) — `receive-channel` is the [right residuation operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_m(b') := m \Rightarrow b'$ on the channel's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_C}$, adjoint under [predication-fiber-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-residuation.md) to the [send-channel](send-channel.md) operation's left-multiplication. Receiving extracts the unique cell that, fused with the message $m$, gives back the post-send buffer $b'$ — yielding the message to the receiver and returning the prior buffer of unconsumed messages.

## Signature

`receive-channel(channel-record-id) → (message, receive-witness) | (block-witness) | (close-witness)`

Inputs:

- **`channel-record-id`** — reference to the channel.

Outputs:

- **`message`** — the received message (conforms to the channel's message-type).
- **`receive-witness`** — records the receive.
- **`block-witness`** — receiver is blocked waiting for a sender / buffered message.
- **`close-witness`** — channel was closed; no more messages.

## Operational semantics

1. If channel is closed and buffer is empty, emit close-witness; the receiver does not receive.
2. If unbuffered: wait for a sender; once sender matches, deliver and emit receive-witness.
3. If buffered with a message available: take from buffer head, emit receive-witness.
4. If buffered and empty: block until a message arrives (or until channel is closed).

Per [witness](../../../objects/witness.md), every receive is recorded.

## Engineering invariants

- **Type-respecting.** Received messages conform to the channel's message-type.
- **Order-preserving.** Per the channel's ordering, messages from one sender arrive in send-order.
- **Witness-emitted.** Per [witness](../../../objects/witness.md), every receive produces a witness.

## Position in the platform

Receive-channel is the substrate's *message-passing receive primitive*. Per [channel](teaching/explanations/channel.md), it composes with [send-channel](send-channel.md) for producer-consumer patterns. Per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), it is the right-residuation half of the residuated adjunction on the channel fiber; the order-preservation invariant above is the substrate-side restriction of [event-causality-via-lorentzian-settling](../../../theorems/event-causality-via-lorentzian-settling.md) to per-sender channel-event cells, not a channel-local guarantee.
