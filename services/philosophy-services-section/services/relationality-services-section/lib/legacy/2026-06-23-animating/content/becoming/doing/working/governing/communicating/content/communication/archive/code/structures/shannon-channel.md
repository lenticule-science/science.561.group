---
type: definition
class: formal-model
status: settled
depends-on:
  - teaching/explanations/channel.md
realizes:
  - teaching/explanations/channel.md
see-also:
  - teaching/explanations/register.md
  - ../../information/theories/information-theory/_index.md
---

# Shannon channel

The **Shannon channel** is the foundational formal model of a communication channel, due to Shannon (1948, *A Mathematical Theory of Communication*). It abstracts a channel as a probabilistic mapping from a finite input alphabet to a finite output alphabet, characterised by its channel capacity — the maximum mutual information between input and output, optimised over all input distributions.

## Definition

A **discrete memoryless channel** is a triple $(X, Y, p)$ where:

- $X$ is a finite input alphabet (the symbols the sender can transmit).
- $Y$ is a finite output alphabet (the symbols the receiver can receive).
- $p: X \to \mathcal{P}(Y)$ is a transition probability — for each input symbol $x \in X$, $p(\cdot \mid x)$ is a probability distribution over $Y$ describing how $x$ is corrupted in transit.

The channel is *memoryless* in that the corruption of each transmitted symbol is independent of every other.

The **channel capacity** is

$$C = \max_{p_X} I(X; Y)$$

where the maximum is over all input distributions $p_X$ on $X$ and $I(X; Y)$ is the mutual information $\sum_{x, y} p_X(x) p(y \mid x) \log \frac{p(y \mid x)}{\sum_{x'} p_X(x') p(y \mid x')}$. The capacity has units of bits per channel use (when $\log$ is base 2).

## What the model commits to

1. **Channels are probabilistic.** Real channels are noisy; the model treats noise as a probability distribution over outcomes for each input.
2. **Capacity is finite.** No channel admits arbitrary information rates; there is always a bound, though for noiseless channels of alphabet size $|X|$ the capacity is $\log_2 |X|$.
3. **Coding decouples source from channel.** Shannon's source–channel separation theorem (under suitable conditions) shows that one can first compress the source independently of the channel and then code the compressed source for transmission, achieving end-to-end optimality. This is the engineering foundation of every modern communication system.
4. **Reliable communication is possible up to capacity.** The noisy-channel coding theorem (Shannon 1948) shows that for any rate $R < C$ there exist codes achieving arbitrarily small error probability; for $R > C$ no code achieves vanishing error.

## Generalisations

- **Channels with memory** allow the corruption to depend on previous symbols.
- **Continuous channels** (e.g., the additive white Gaussian noise channel) replace finite alphabets with continuous distributions; the capacity formula generalises via differential entropy.
- **Multi-user channels** (broadcast, multiple-access, interference, relay) have richer capacity regions and remain active research.
- **Quantum channels** replace classical alphabets with quantum states and have their own capacity theory (Holevo, Schumacher).

## What the model is not

- **Not a model of meaning.** Shannon channels carry symbols; what the symbols *mean* is outside the theory (Shannon was explicit about this).
- **Not a model of pragmatics.** The Shannon-channel framing presupposes that the message is fixed before transmission; many communicative situations (the [humanities-side communication theory's accountable-closure](../../../humanities/theories/communication/concepts/accountable-closure.md) framing) violate this presupposition. Shannon's theory is the right model for some communicative problems and the wrong model for others; see [communication-is-not-shannon](../../../humanities/theories/communication/texts/communication-is-not-shannon.md).
- **Not a model of human communication directly.** Human channels (lectures, papers, conversations) can be analysed through Shannon-style information-theoretic lenses, but the analysis is by analogy and abstraction; it does not capture audience-design, common ground, register, or genre.

## Relation to upstream

Shannon, "A Mathematical Theory of Communication" (*Bell System Technical Journal*, 1948); Shannon & Weaver, *The Mathematical Theory of Communication* (University of Illinois Press, 1949); Cover & Thomas, *Elements of Information Theory* (Wiley, 2006) for the modern textbook treatment.
