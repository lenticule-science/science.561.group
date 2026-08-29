---
title: "Conditional Probability"
aliases:
  - "conditional probability"
  - "conditional probabilities"
date-created: 2026-01-01
tags: []
defines:
  - "Conditional Probability"
  - "conditional probabilities"
type: term
---

Conditional probability is the [probability](./probability.md) of one [event](./event.md) given that another event has already occurred or is known to be true. It answers questions like: what is the probability it will rain tomorrow, *given* that the barometric pressure is falling? What is the probability a patient has a disease, *given* that their test came back positive? The "given" clause changes the calculation by restricting attention to a subset of the possible outcomes.

The formal definition is straightforward: the conditional probability of event $A$ given event $B$ is $P(A \mid B) = P(A \cap B) / P(B)$, provided $P(B) > 0$. This formula says: look at the outcomes where both $A$ and $B$ occur, and measure their probability relative to $B$ alone. Conditioning on $B$ is equivalent to shrinking the [sample space](./sample-space.md) to $B$ and rescaling all probabilities so they sum to 1 within that restricted space.

A concrete example makes this clear. Suppose you draw one card from a standard deck. The probability of drawing an ace is $4/52 = 1/13$. But if someone tells you the card is a spade, the sample space shrinks from 52 cards to 13. There are still only 1 ace of spades among those 13, so $P(\text{ace} \mid \text{spade}) = 1/13$ — in this case, knowing the suit happens not to change anything. But if someone tells you the card is a face card (12 cards), then $P(\text{ace} \mid \text{face card}) = 0$ — aces are not face cards. The conditioning information can increase, decrease, or leave unchanged the probability of an event.

The most important consequence of conditional probability is Bayes' theorem: $P(A \mid B) = P(B \mid A) \cdot P(A) / P(B)$. This relates the probability of a hypothesis given evidence to the probability of evidence given the hypothesis. Thomas Bayes derived this result in *An Essay towards solving a Problem in the Doctrine of Chances* (published posthumously in 1763), and Pierre-Simon Laplace independently developed and generalized it in *Théorie analytique des probabilités* (1812).

Bayes' theorem is the engine of Bayesian inference. The [prior](./prior.md) $P(A)$ represents initial belief about hypothesis $A$. The [likelihood](./likelihood.md) $P(B \mid A)$ measures how well $A$ explains the observed evidence $B$. The [posterior](./posterior.md) $P(A \mid B)$ is the updated belief after seeing the evidence. The denominator $P(B)$ ensures the result is a valid probability. The theorem formalizes a natural process: you start with a belief, you observe something, and you update.

Two events are [independent](./independence.md) when conditioning changes nothing: $P(A \mid B) = P(A)$, equivalently $P(A \cap B) = P(A) \cdot P(B)$. Independence means that knowing $B$ occurred gives no information about $A$. When events are not independent, conditioning is what captures the dependency.

For sequences of events, conditional probabilities chain: $P(A \cap B \cap C) = P(A) \cdot P(B \mid A) \cdot P(C \mid A \cap B)$. This chain rule decomposes the joint probability of multiple events into a product of conditional probabilities, each conditioned on everything that came before. This decomposition is the foundation of probabilistic graphical models (Bayesian networks), Markov chains, and sequential decision-making under uncertainty.

## Additional material from the Google Drive library

The conditional probability of [event](./event.md) A given event B, written P(A | B), is the [probability](./probability.md) of A occurring given that B has occurred. It is defined as P(A | B) = P(A ∩ B) / P(B), provided P(B) > 0. Conditioning restricts the [sample space](./sample-space.md) to outcomes in B and rescales probabilities accordingly.

Conditional probability leads to Bayes' theorem: P(A | B) = P(B | A) · P(A) / P(B). This relates the probability of a hypothesis given evidence to the probability of evidence given the hypothesis, and is the foundation of Bayesian inference. The [prior](./prior.md) P(A) is updated by the [likelihood](./likelihood.md) P(B | A) to produce the [posterior](./posterior.md) P(A | B).

Two events are [independent](./independence.md) when conditioning changes nothing: P(A | B) = P(A), which is equivalent to P(A ∩ B) = P(A) · P(B). Conditional probability for more than two events gives rise to chains: P(A ∩ B ∩ C) = P(A) · P(B | A) · P(C | A ∩ B), a decomposition used in probabilistic graphical models and sequential reasoning.
