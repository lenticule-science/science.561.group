---
type: concept
class: concurrency-primitive
depends-on: [predication-cell, federation-as-substrate-join, transport, predication-fiber-algebra]
see-also: [lock, async-future, channels-as-residuated-rendezvous]
---

# Channel

A *substrate-recorded message-passing primitive*: a channel is a typed, ordered conduit through which one substrate operation can send messages to another, with the receiver consuming messages in order. Channels are the substrate's primary mechanism for *coordinated communication* between concurrent operations without shared mutable state.

Structurally — per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md) — a channel is a fiber of the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) over a substrate-issued *channel predicate* $p_C$. The buffer state lives in the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_C}$; send and receive are the residuated $(\mathrm{L}_m, \mathrm{R}_m)$ adjoint pair on $A_{p_C}$; buffer policy is the modal grade $\Box_{R_C}$ on the rendezvous accessibility relation; closure is a void-cone collapse on $A_{p_C}$. The four operational outcomes — `delivered`, `blocked`, `refused`, `closed` — are the four cardinal values of the channel's verdict in $\mathbf{FOUR}$.

A channel has the structure:

- **Channel-id** — substrate identifier; equivalently, the channel-predicate $p_C$ that names the fiber.
- **Message-type** — the [type](type.md) of messages the channel admits. Refinement on the message-type composes with the channel's $\odot \dashv \Rightarrow$ adjoint pair per [refinements-as-paraconsistent-comprehension](../theorems/refinements-as-paraconsistent-comprehension.md); a refinement-failed message lands in the $\mathbf{f}$ (`refused`) cell.
- **Sender(s)** — substrate operations that can send to the channel. The senders' admissibility is the modal accessibility on $A_{p_C}$ per [capability-non-amplification](../theorems/capability-non-amplification.md).
- **Receiver(s)** — substrate operations that can receive from the channel; symmetric to senders.
- **Buffer policy** — `unbuffered` (synchronous rendezvous: $R_C(\tau, \tau') = \mathbf{t}$ only at $\tau' = \tau$), `bounded-buffer-N` (truncated grade at cardinality $N$), `unbounded-buffer` (trivial grade).
- **Direction** — `unidirectional` (one-way), `bidirectional` (both ways).
- **Closure semantics** — what happens when one end closes the channel; structurally, the void-cone collapse of Part 5 of [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md).

Per [self-representation](../../teaching/explanations/self-representation.md), channels are substrate content; per [witness](../../../objects/witness.md) and [witness-as-cell](../../../theorems/witness-as-cell.md), every send and receive event is itself a cell in the channel fiber.

Channels vs. CRDT vs. locks:

- **CRDT** (per [federation-convergence](../../../theorems/federation-convergence.md)): for state synchronized across replicas. No coordination required.
- **Channel**: for *flow* between operations. Coordination is the channel's send/receive semantics.
- **Lock**: for exclusive access to a shared resource. Coordination is the lock's mutex semantics.

Channels are how the substrate implements:

- **Producer-consumer patterns.** A producer operation sends to a channel; consumers receive and process.
- **Pipeline parallelism.** Stage 1 sends to channel-A; stage 2 receives from channel-A and sends to channel-B; etc.
- **Async function results.** A future is structurally a channel with one buffered message (the result).
- **Cross-process / cross-substrate communication.** When the channel's sender and receiver are on different substrates, the channel is realized via [transport](../../teaching/explanations/transport.md) (per [send-message](../../../morphisms/send-message.md) / [receive-message](../../../morphisms/receive-message.md)) carrying the channel's messages.

Per [transport-tolerance-of-federation](../../../theorems/transport-tolerance-of-federation.md) and Part 6's federation-consequence in [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), a cross-substrate channel is the lift of the same fiber $A_{p_C}$ across the federation envelope; the channel inherits [federation-convergence](../../../theorems/federation-convergence.md) by the fiber-tensor distributivity rather than by a separate transport-channel reconciliation discipline.
