---
type: theorem
class: contemporary
status: proved
depends-on:
  - teaching/explanations/logical-induction.md
  - ../objects/logical-inductor.md
see-also:
  - embedded-agent-impossibility.md
references:
  - references/garrabrant-logical-induction2016.md
title: Logical induction criterion
description: "There exists a uniformly computable sequence $\\{\\mathbb{P}n\\}$ of probability distributions over the sentences of a recursively axiomatizable theory $T$ (extending PA) satisfying the Garrabrant logical-induction criterion:"
---

# Logical induction criterion

## Statement

There exists a uniformly computable sequence $\{\mathbb{P}_n\}$ of probability distributions over the sentences of a recursively axiomatizable theory $T$ (extending PA) satisfying the *Garrabrant logical-induction criterion*:

> For every polynomial-time-computable trader $\tau$, the trader's net wealth from buying and selling sentence-shares against the prices $\mathbb{P}_n$ is bounded above (uniformly in $n$).

Any such sequence is a *logical inductor*.
Logical inductors satisfy a long list of desirable properties — including calibration, convergence, self-knowledge, inductive generalization, and limit-consistency — that classical Bayesianism over logical sentences cannot provide.

## Proof sketch

Garrabrant et al. (2016) construct an explicit logical inductor by *enumeration of polynomial-time traders and budget-allocation*.
Step by step:

1. Enumerate all polynomial-time traders $\tau_1, \tau_2, \dots$.
2. Allocate trader $\tau_k$ a starting budget of $2^{-k}$.
3. At each step $n$, set $\mathbb{P}_n$ so that no trader can make a profit larger than its allocated budget — this is a fixed-point computation over the trader's net positions given the current prices.

The construction is shown to be uniformly computable (terminating at each step) and to satisfy the criterion against every trader in the enumeration.

The properties (calibration, convergence, etc.) are then derived as theorems: each property has a corresponding *exploitability trader* which would profit unboundedly against an inductor that violated the property; satisfying the criterion thus forces the property.

## What the criterion captures

The market-criterion intuition is that *good calibration is characterized by un-exploitability*.
If the inductor's prices were systematically biased — say, assigning probability 0.5 to a sentence whose truth is overwhelmingly determined — a trader betting against the bias would profit unboundedly.
The criterion forbids exactly this.

This is the same intuition behind de Finetti's Dutch-book theorem for ordinary probability: a coherent probability is one against which no Dutch book can be made.
Garrabrant's contribution was to identify the right *trader class* and the right *resolution rule for sentence-shares* to make the criterion satisfiable for logical sentences.

## Why it matters

The theorem shows that the desiderata "calibrated, computable, self-knowing belief over logical sentences" are *jointly satisfiable*.
Before the result, it was unclear whether the combination was possible at all — strict Bayesianism rules it out.
Logical induction provides:

- **A formal model** of bounded-rationality reasoning over mathematical claims.
- **A partial substrate** for [embedded-agency](../../../../glossary/concepts/embedded-agency.md): beliefs about one's own future beliefs are coherent under the inductor's framework.
- **A bridge** between Bayesian and proof-theoretic accounts of mathematical knowledge.

## Limits

The construction is *infeasibly slow*.
The enumeration of polynomial-time traders is not bounded in any practically relevant sense; running a logical inductor for one step takes super-exponential time in the size of the language.

Furthermore, the inductor's properties are *limiting*: they hold in the limit $n \to \infty$ rather than at any fixed $n$.
Decision-theoretic applications that need bounded-step guarantees do not get them from this theorem.

The framework also takes the *language* and *theory* as fixed.
Extending logical induction to settings where the language expands over time (closer to how real reasoners learn) is open research.
