---
type: object
class: classical
status: active
depends-on:
  - decision-problem.md
see-also:
  - teaching/explanations/naturalized-induction.md
  - ../morphisms/bayesian-update.md
references:
  - references/savage1954.md
title: Prior belief
description: A prior belief is a probability distribution
---

# Prior belief

A **prior belief** is a probability distribution

$$ P : \Sigma \to [0, 1] $$

over a $\sigma$-algebra of states (or hypotheses), representing the agent's pre-evidence credences.
Together with a likelihood function $P(e \mid s)$ and Bayes' rule, the prior determines how evidence updates beliefs.

## In the Bayesian framework

In the standard Bayesian decision theory, the prior is one of two primitives (the other being the [utility-function](utility-function.md)).
The agent's act selection is

$$ a^* = \arg\max_a \int u(o(a, s))\, dP(s) $$

with the prior updated to a posterior on every observation:

$$ P(s \mid e) = \frac{P(e \mid s)\, P(s)}{P(e)}. $$

See [bayesian-update](bayesian-update.md).

## Where priors come from

Classical Bayesianism is silent on prior choice.
Three responses in the literature:

- **Subjectivist (Savage, de Finetti).** Priors are personal parameters; rationality is *consistency* (Bayesian updating) rather than agreement on priors.
- **Objectivist (Jaynes, Jeffreys).** Priors should be selected by symmetry, maximum entropy, or invariance principles.
- **Universal (Solomonoff).** The prior is the universal semimeasure, weighting hypotheses by Kolmogorov complexity.
  This is incomputable but provides a theoretical limit.

## Where priors break for embedded agents

The classical prior assumes the hypothesis space is *external* to the agent — a set of possible worlds the agent is not part of.
For an [embedded-agency](../../../../glossary/concepts/embedded-agency.md) the hypothesis space must include physical theories that *contain the agent*, which raises problems classical Bayesianism cannot state:

- How does the prior weight worlds where the agent has different source code?
- How does the prior update on observations when the observation process is itself part of the world?
- How does the prior represent uncertainty about its *own* computational structure?

These problems define [naturalized-induction](../../../../glossary/concepts/naturalized-induction.md) and motivate alternatives to strict Bayesianism such as [logical-induction](../../../../glossary/concepts/logical-induction.md).

## What the prior is not

A prior is not the same as an *initial condition*: the agent need not have actually started with this distribution.
Bayesian agents are characterized by the fact that they would *behave as if* their current beliefs were the result of conditioning some prior on their evidence.
The prior is a recovery from behavior, not a historical fact.
