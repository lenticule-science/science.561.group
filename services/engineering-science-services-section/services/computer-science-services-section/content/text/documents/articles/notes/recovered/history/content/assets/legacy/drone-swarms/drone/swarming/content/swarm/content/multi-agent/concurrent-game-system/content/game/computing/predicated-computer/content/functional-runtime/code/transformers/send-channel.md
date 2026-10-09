---
type: morphism
class: concurrency-operation
realizes: [channel]
depends-on: [channel-record, type-record, witness, left-multiplication-operator, twist-product-fusion, modal-necessity-operator]
see-also: [receive-channel, channels-as-residuated-rendezvous]
---

# Send channel

The substrate operation that *sends* a message on a [channel](teaching/explanations/channel.md). For unbuffered channels, send blocks until a receiver receives; for buffered channels, send succeeds immediately if buffer space is available.

Structurally — per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md) — `send-channel` is the [left multiplication operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/left-multiplication-operator.md) $\mathrm{L}_m(b) := m \odot b$ on the channel's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_C}$, where $m$ is the message cell and $b$ the prior buffer state. The verdict — `send-witness` ($\mathbf{t}$), `block-witness` ($\bot$), `refusal-witness` ($\mathbf{f}$), or the channel-closed surface ($\top$, projected to a refusal at the engineer surface) — is the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) value of $\Box_{R_C}\, \mathrm{deliver}$ at the send's substrate ordinal.

## Signature

`send-channel(channel-record-id, message) → (send-witness | block-witness | refusal-witness)`

Inputs:

- **`channel-record-id`** — reference to the channel.
- **`message`** — the message to send (must conform to the channel's message-type).

Outputs:

- **`send-witness`** — message accepted to the channel (delivered for unbuffered, queued for buffered).
- **`block-witness`** — sender is blocked waiting for receiver / buffer space.
- **`refusal-witness`** — channel is closed or message doesn't conform to the type.

## Operational semantics

1. Validate message type per [check-type](check-type.md).
2. If channel is closed, refuse.
3. If unbuffered: wait for a receiver; once receiver matches, deliver and emit send-witness.
4. If buffered with space: append to buffer, emit send-witness.
5. If buffered without space: block until space is available (or fail per the channel's policy).

Per [witness](../../../objects/witness.md), every send is recorded.

## Engineering invariants

- **Type-respecting.** Messages must conform to the channel's message-type.
- **Order-preserving.** Per the channel's ordering, sends from one sender preserve order on the receive side.
- **Witness-emitted.** Per [witness](../../../objects/witness.md), every send produces a witness.

## Position in the platform

Send-channel is the substrate's *message-passing send primitive*. Per [channel](teaching/explanations/channel.md), it composes with [receive-channel](receive-channel.md) for producer-consumer patterns. Per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), it is the left-multiplication half of the residuated adjunction on the channel fiber and inherits federation-portability, refinement composition, and capability gating from the standard fibration disciplines, not from channel-specific policy.
