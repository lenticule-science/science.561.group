---
name: estimate-conditional-probability
description: Estimate $P(A \mid B)$ from counted outcomes — define the sample space, count co-occurrences, divide by the count of the conditioning event.
---

# Estimate Conditional Probability

Conditional probability $P(A \mid B)$ is the fraction of outcomes in which $B$ holds where $A$ also holds. From counts, this reduces to division — but the counting requires a defined sample space and an explicit conditioning event.

## When to use

You have observed counts and want to update a probability based on evidence. The estimate is descriptive (what fraction of $B$-outcomes were also $A$-outcomes), not Bayesian inference per se — though it is the empirical input Bayesian inference uses.

## How it works

1. **Define the sample space.** What is the universe of outcomes you're counting from?
2. **Define the evidence event.** What is $B$ — the event you're conditioning on?
3. **Count co-occurrences.** How many outcomes have *both* $A$ and $B$? Call this $n(A \cap B)$.
4. **Count the evidence.** How many outcomes have $B$ at all? Call this $n(B)$.
5. **Divide.** $\hat{P}(A \mid B) = n(A \cap B) / n(B)$.
6. **State assumptions.** Are the outcomes equally likely? If not, the count-ratio is not the right estimator — you need a weighted version. Note any selection effects in how the outcomes were collected.

## Reference

- `library/domains/humanities/domains/math/domains/probability/` — the probability domain.

## Caveats

- $n(B) = 0$ — conditional probability is undefined when the evidence never occurs.
- Small $n(B)$ — the estimate has high variance; report the count, not just the ratio.
- Selection bias — if the sample wasn't drawn uniformly from the sample space, the empirical fraction is not an estimate of $P(A \mid B)$ in the population.
