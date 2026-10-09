---
type: concept
class: contemporary
status: active
depends-on:
  - decision-theory.md
  - embedded-agency.md
see-also:
  - ../objects/logical-inductor.md
  - ../theorems/logical-induction-criterion.md
references:
  - references/garrabrant-logical-induction2016.md
title: Logical induction
description: Logical induction is Garrabrant's (2016) framework for calibrated, computable belief over the truth-values of logical sentences.
---

# Logical induction

**Logical induction** is Garrabrant's (2016) framework for calibrated, computable belief over the truth-values of logical sentences.
It addresses a gap in classical Bayesianism: how should an agent reason about mathematical claims it cannot yet prove?

## The problem

Standard Bayesian inference assigns probability 1 to all logical truths and probability 0 to all logical falsehoods.
This is *logically omniscient*: the agent knows the trillionth digit of $\pi$ as certainly as it knows $1 + 1 = 2$.
No real agent can satisfy this.
But naive attempts to relax the assumption — assign probability $p < 1$ to "the trillionth digit of $\pi$ is 7" — break Bayesian conditioning, since the proposition is logically equivalent to either a tautology or a contradiction.

For an [embedded-agency](embedded-agency.md) framework this is not optional: an agent embedded in physics must reason about its own source code, the future computations of other agents, and mathematical facts whose truth is determined but unknown.

## The Garrabrant criterion

Garrabrant proposes that a *logical inductor* is a sequence of probability distributions $\mathbb{P}_n$ over sentences in a fixed formal language, indexed by computation step $n$, such that **no efficiently-computable trader can exploit the inductor's beliefs for unbounded profit**.
Formally: any polynomial-time-computable trading strategy that buys and sells sentence-shares against the inductor's prices has bounded profit in the limit.

This is a *market* criterion borrowed from financial calibration: a market that is not exploitable is well-calibrated.

## What it gives you

A logical inductor satisfies a remarkably strong list of properties (Garrabrant et al. 2016, theorems 4.x):

- **Calibration**: long-run frequencies of resolved sentences match assigned probabilities.
- **Convergence**: probabilities of sentences converge as $n \to \infty$.
- **Self-trust**: the inductor's beliefs about its own future beliefs are coherent (it does not predict it will be very wrong).
- **Inductive generalization**: the inductor learns patterns across sentence schemata.
- **Limit consistency**: the limit beliefs are consistent with the underlying axiom system.

See [logical-induction-criterion](../../documents/articles/notes/undated/logical-induction-criterion.md).

## Cost

The inductor is *uniformly computable* but not efficient — the construction proceeds by enumerating polynomial-time traders, which is intractable in practice.
Logical induction is a proof of concept that the criterion is satisfiable, not an algorithm one deploys.

## Status

Logical induction is the most developed contemporary attempt to ground self-referential and logical uncertainty.
It is widely cited in the agent-foundations literature as a partial substrate for embedded-agency reasoning.
Open questions remain: whether the framework extends to richer object languages, whether efficient approximations exist, and whether the calibration properties suffice for downstream decision-theoretic applications.
See [is-logical-induction-the-right-account-of-self-knowledge](../../documents/articles/notes/undated/is-logical-induction-the-right-account-of-self-knowledge.md).
