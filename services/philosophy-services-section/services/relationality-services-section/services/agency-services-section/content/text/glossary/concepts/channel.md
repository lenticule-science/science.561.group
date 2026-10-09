---
type: concept
class: communicative-substrate
status: settled
depends-on:
  - ../_index.md
see-also:
  - ../objects/shannon-channel.md
  - register.md
  - audience.md
  - ../../../humanities/theories/communication/concepts/transport.md
title: Channel
description: A channel is the substrate over which a message is transmitted from a sender to a receiver.
---

# Channel

A **channel** is the substrate over which a message is transmitted from a sender to a receiver. The channel imposes structural constraints on what can be said: a finite alphabet, a maximum rate (capacity), a noise process that can corrupt symbols in transit, and a code that maps source-messages onto channel-signals. Different channels admit different messages; the choice of channel is part of the artifact's communicative design.

## What "channel" commits to

The channel-as-substrate commits to:

1. **An alphabet.** The finite set of distinguishable signals the channel transmits. For a markdown vault this is the byte-level Unicode alphabet plus the file-system path alphabet plus the relation-graph predicate alphabet.
2. **A capacity.** The maximum rate at which information can be reliably transmitted. Shannon's noisy-channel coding theorem (Shannon 1948) is the foundational result; for non-mathematical channels (a lecture, a paper, a piece of software documentation), the capacity is bounded by the audience's attention budget rather than by physics.
3. **A noise process.** The mechanism by which signals can be corrupted, lost, or misinterpreted in transit. For human channels: misreading, distraction, prior beliefs, register mismatch. For technical channels: bit errors, packet loss, encoding ambiguity.
4. **A code.** The mapping from source messages to channel signals. The choice of code (and its inverse, the decoder) is what the artifact commits to; mismatched encoding-decoding is one of the discipline's primary failure modes.

## Channel vs. medium vs. register

Three closely related anchors are kept distinct:

- **Channel** is the substrate (this concept) — *the thing the signal moves through*.
- **Medium** is the modality (text, image, audio, video) — *what kind of signal it is*. In multimodal artifacts a single channel may carry multiple media.
- **Register** ([register.md](register.md)) is the linguistic / discursive variety — *what kind of language is being used over the channel*.

The three are independent: the same medium (text) can be transmitted over different channels (paper, screen, terminal) in different registers (formal, casual, technical).

## Relation to upstream

Shannon (1948) for the foundational mathematical theory; Wiener (1948) for the cybernetic frame; McLuhan ("the medium is the message") for the post-Shannon position that the channel is itself a content-shaping force; the documentation-architecture lineage (DITA, single-source publishing) for the practical engineering of multi-channel content. The [shannon-channel](../terms/shannon-channel.md) object is this concept's first formal realization in the corpus.
