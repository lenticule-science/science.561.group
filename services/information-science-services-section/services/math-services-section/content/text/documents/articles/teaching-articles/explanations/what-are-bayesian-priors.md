---

title: "What Are Bayesian Priors?"
description: "An explanation of Bayesian priors for readers who understand probability but have not encountered the Bayesian framework. What priors are, why you need one, how to choose one, and why the subjectivity is a feature."
date-created: 2026-03-31
requires:
  - probability
  - conditional-probability
teaches:
  - prior
  - posterior
  - likelihood
type: explanation

---

You already know what [probability](../../../../glossary/terms/probability.md) is: a number between 0 and 1 that represents how likely something is. You know what [conditional probability](../../../../glossary/terms/conditional-probability.md) is: the probability of one thing given that another thing is true. Bayesian priors are about what happens when you try to reason backward — from evidence to cause — and discover that you cannot do it without stating what you believed before you saw the evidence.

## The problem that creates priors

Suppose a medical test for a disease is 95% accurate: if you have the disease, the test is positive 95% of the time, and if you do not have the disease, the test is negative 95% of the time. You test positive. What is the probability that you have the disease?

The immediate temptation is to say 95%. This is wrong, and the reason it is wrong is what makes priors necessary.

The test tells you $P(\text{positive} \mid \text{disease}) = 0.95$ — the probability of the evidence given the hypothesis. But you want the reverse: $P(\text{disease} \mid \text{positive})$ — the probability of the hypothesis given the evidence. These are not the same number. Confusing them is called the base rate fallacy, and avoiding it is the entire point of Bayes' theorem.

Bayes' theorem says:

$$P(H \mid E) = \frac{P(E \mid H) \cdot P(H)}{P(E)}$$

$P(H)$ is the **[prior](../../../../glossary/terms/prior.md)**: the probability you assign to the hypothesis before seeing any evidence. $P(E \mid H)$ is the **[likelihood](../../../../glossary/terms/likelihood.md)**: how probable the evidence is if the hypothesis is true. $P(H \mid E)$ is the **[posterior](../../../../glossary/terms/posterior.md)**: your updated belief after seeing the evidence.

The formula cannot run without $P(H)$. You must say what you believed before the test, or you cannot compute what you should believe after it.

## Finishing the example

The disease affects 1 in 1,000 people. That is the prior: $P(\text{disease}) = 0.001$.

Now compute. Out of 100,000 people:
- 100 have the disease. Of these, 95 test positive (true positives).
- 99,900 do not have the disease. Of these, 5% test positive anyway: 4,995 false positives.

Total positive tests: $95 + 4{,}995 = 5{,}090$. Of those, 95 actually have the disease.

$$P(\text{disease} \mid \text{positive}) = \frac{95}{5{,}090} \approx 0.019$$

Less than 2%. The test is 95% accurate, but a positive result means less than 2% chance of disease. The prior — the rarity of the disease — dominates. Most positive results are false positives because the disease is so uncommon.

This is not a defect of the test. It is a mathematical fact about what happens when you apply a fixed-accuracy instrument to a rare event. The prior is doing real work: it tells you what the evidence is being weighed against.

## What a prior actually is

A prior is a [probability distribution](../../../../glossary/terms/distribution.md) over hypotheses. It represents the state of knowledge before evidence arrives.

For a single yes/no hypothesis (does the patient have the disease?), the prior is a single number: $P(H) = 0.001$. For a continuous parameter (what is the true average height of a population?), the prior is a full distribution — a curve over possible values, expressing which values you consider plausible and how plausible each one is.

The prior is not a guess. It is a commitment. When you write $P(H) = 0.001$, you are saying: given everything I know apart from this particular test result, I believe there is a 1-in-1,000 chance. If you have good epidemiological data, the prior is well-grounded. If you have less information, the prior is more uncertain — but it is still explicit, which means it can be examined, challenged, and revised.

## How to choose a prior

Three common strategies:

**Uninformative priors** express maximal ignorance. If a coin could have any bias from 0 to 1, an uninformative prior assigns equal probability to every value: a uniform distribution on $[0, 1]$. The idea is to let the data speak without the prior imposing any preference. Jeffreys' prior is a more sophisticated version that remains uninformative under reparameterization.

**Conjugate priors** are chosen for mathematical convenience. A prior is conjugate to a likelihood if the posterior belongs to the same family of distributions as the prior. A beta prior paired with a binomial likelihood produces a beta posterior. A normal prior paired with a normal likelihood produces a normal posterior. This makes the update computation tractable — you just update the parameters instead of computing an integral.

**Informative priors** encode genuine knowledge. If previous studies have measured a drug's effect size and found it to be around 0.3 with some uncertainty, you can build a prior centered on 0.3. This is how Bayesian inference accumulates knowledge across studies: yesterday's posterior becomes today's prior.

## What happens as evidence accumulates

The prior matters most when data is scarce. With one observation, the prior can dominate. With a hundred observations, the data starts to overwhelm the prior. With ten thousand observations, the prior is nearly irrelevant — different starting priors converge to the same posterior.

This convergence is not a coincidence. It is a theorem. Under mild regularity conditions, as the sample size grows, the posterior concentrates around the true parameter value regardless of the prior. The prior determines where you start; the evidence determines where you end up. Enough evidence washes out any prior.

This also reveals what it means for a prior to be "strong" or "weak." A strong prior (a narrow, concentrated distribution) says: I am fairly sure the answer is near this value, and it will take substantial evidence to move me. A weak prior (a broad, flat distribution) says: I have little idea, and even modest evidence will shift my belief significantly. Strength is not about correctness — it is about how much evidence is required to change your mind.

## The subjectivity objection

The most common objection to Bayesian reasoning is that the prior is subjective. Two people with different priors will reach different posteriors from the same evidence. This is true, and it is a feature, not a defect.

Different priors reflect genuinely different states of knowledge. A doctor who has seen a hundred cases of a disease this month has a different prior than a doctor who has never seen one. They should update differently from the same test result, because they know different things. The prior makes this difference explicit and traceable, rather than hiding it inside an unstated assumption.

Frequentist statistics avoids priors by asking a different question: not "what should I believe?" but "what would happen if I repeated this experiment many times?" This sidesteps the subjectivity, but at a cost — it cannot directly answer "given this evidence, how probable is the hypothesis?" without a prior. The two frameworks answer different questions. Bayesian reasoning answers the one that requires a prior.

## Sequential updating

A prior is not permanent. Today's posterior becomes tomorrow's prior when new evidence arrives. This sequential structure means Bayesian inference is iterative: observe, update, observe again, update again. The order of observations does not matter — processing evidence A then B gives the same posterior as processing B then A.

This makes the prior a snapshot: it captures what is known at a particular moment, and the updating rule moves it forward as knowledge grows. The entire Bayesian framework is a machine for turning prior knowledge plus new evidence into posterior knowledge, repeatedly.
