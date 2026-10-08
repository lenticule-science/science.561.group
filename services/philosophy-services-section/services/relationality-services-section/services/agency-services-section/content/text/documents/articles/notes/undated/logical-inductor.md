---
type: object
class: contemporary
status: active
depends-on:
  - teaching/explanations/logical-induction.md
see-also:
  - ../theorems/logical-induction-criterion.md
references:
  - references/garrabrant-logical-induction2016.md
title: Logical inductor
description: A logical inductor is a computable sequence of probability distributions
---

# Logical inductor

A **logical inductor** is a computable sequence of probability distributions

$$ \mathbb{P}_n : \mathrm{Sentences}(\mathcal{L}) \to [0, 1] $$

over the sentences of a formal language $\mathcal{L}$, indexed by computation step $n$, satisfying the *Garrabrant criterion*: no efficiently-computable trader can earn unbounded profit trading sentence-shares against the inductor's prices.

## What it is, concretely

At each step $n$, the inductor outputs a probability for every sentence of the language.
Sentences are *traded* like financial contracts: a contract on $\phi$ pays out $1$ at step $m$ if $\phi$ has been proved by step $m$, and pays out $0$ otherwise (the resolution is deferred indefinitely if $\phi$ is never proved).
A trader is a polynomial-time algorithm that buys and sells sentence-contracts at the inductor's prices.

The Garrabrant criterion: for every polynomial-time trader, the trader's net wealth across all rounds is bounded above (uniformly).

## Properties

A logical inductor satisfies a long list of desirable properties (Garrabrant et al. 2016, Section 4 and 5):

- **Calibration**: among sentences the inductor assigns probability near $p$, the long-run fraction proved tends to $p$.
- **Convergence**: $\lim_{n \to \infty} \mathbb{P}_n(\phi)$ exists for every sentence $\phi$.
- **Self-knowledge**: $\mathbb{P}_n(\phi) \approx \mathbb{P}_n(\mathbb{P}_n(\phi) \in I)$ whenever $I$ contains $\mathbb{P}_n(\phi)$.
- **Inductive generalization**: the inductor learns probabilistic patterns across sentence schemata (e.g. eventually assigns nontrivial probability to "$P(\pi_n)$ for typical $n$" given a sample of resolved $\pi_k$).

## Construction

Garrabrant et al. exhibit an explicit construction by enumeration of all polynomial-time traders, allocating successively smaller budgets to each, and adjusting prices to neutralize each trader's position.
The construction is uniformly computable (so it satisfies the criterion of "feasible in principle") but extraordinarily inefficient (so it is not deployable).

## Status

A logical inductor is the canonical formal object for self-referential and logical uncertainty in the agent-foundations literature.
It is *the* answer the program currently has to "how should an embedded agent represent uncertainty over logical sentences, including sentences about itself?"
Open questions: - whether efficient approximations exist; - whether the framework lifts to richer object languages; - whether decision-theoretic frameworks built on top of logical induction have desirable properties.
