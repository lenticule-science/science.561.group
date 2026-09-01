---

title: "Independence"
aliases:
  - "independence"
  - "independent"
  - "independent events"
date-created: 2026-01-01
tags: []
---

Two [events](../objects/event.md) are independent if knowing that one occurred tells you nothing about whether the other occurred. You flip a fair coin twice: whether the first flip lands heads is independent of whether the second lands heads — the coin has no memory. You draw a card from a deck, replace it, shuffle, and draw again: the two draws are independent. But draw without replacing: now the draws are dependent, because the first draw changes what remains in the deck.

Formally, events $A$ and $B$ are independent if $P(A \cap B) = P(A) \cdot P(B)$. Equivalently, the [conditional probability](./conditional-probability.md) is trivial: $P(A \mid B) = P(A)$ and $P(B \mid A) = P(B)$. The probability of $A$ is the same whether or not you know $B$ happened.

This definition captures an intuitive idea, but it has subtleties that trap the unwary.

Independence is not the same as mutual exclusivity. In fact, mutually exclusive events — events that cannot both occur ($A \cap B = \emptyset$) — are strongly *dependent*. If you know one happened, you know for certain the other did not: $P(A \mid B) = 0 \neq P(A)$ (assuming both have positive [probability](./probability.md)). Rolling an even number and rolling an odd number are mutually exclusive and maximally dependent. Rolling an even number and rolling a number greater than 4 are neither mutually exclusive nor independent — they overlap on $\{6\}$, and knowing you rolled greater than 4 changes the probability of rolling even (from $1/2$ to $2/3$).

Independence is symmetric — if $A$ is independent of $B$, then $B$ is independent of $A$ — but not transitive. $A$ can be independent of $B$, and $B$ independent of $C$, without $A$ being independent of $C$.

For more than two events, there is a further subtlety: pairwise independence does not imply mutual independence. Three events $A$, $B$, $C$ are mutually independent only if the product rule holds for *every* subcollection: $P(A \cap B) = P(A) P(B)$, $P(A \cap C) = P(A) P(C)$, $P(B \cap C) = P(B) P(C)$, *and* $P(A \cap B \cap C) = P(A) P(B) P(C)$. Counterexamples exist where all pairwise products hold but the triple product fails.

Random variables $X$ and $Y$ are independent if every event definable through $X$ is independent of every event definable through $Y$. Formally, for all measurable sets $A$ and $B$, $P(X \in A \text{ and } Y \in B) = P(X \in A) \cdot P(Y \in B)$. Independence of random variables is the foundational assumption of classical statistics. It justifies using a [sample](../objects/sample.md) to draw conclusions about a [population](../objects/population.md): each observation is modeled as an independent draw from the same distribution. The law of large numbers (the sample mean converges to the population mean) and the central limit theorem (the sampling distribution of the mean is approximately normal) both require independence as a hypothesis.
