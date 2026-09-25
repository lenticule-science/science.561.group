---
type: concept
class: foundational
status: active
depends-on:
  - reasoning.md
see-also:
  - ../morphisms/generalization.md
references:
  - references/russell-norvig-ai2020.md
title: Inductive reasoning
description: Inductive reasoning generalizes from observed instances to general rules.
---

# Inductive reasoning

**Inductive reasoning** generalizes from observed
instances to general rules. Truth-suggesting, not
truth-preserving: even with true premises, inductive
conclusions may be false.

## The structure

A typical inductive inference:

- Observations: $a_1, a_2, \ldots, a_n$ all have
  property $P$.
- Inference: All $a$ have property $P$.

Or more generally:

- Observations of pattern.
- Hypothesized rule that explains the observations.

The rule extends *beyond* the observations — that's
the inductive leap.

## Examples

- Every swan I've seen is white; therefore all swans
  are white. (Famously refuted by black swans.)
- Past sun rises predict future sun rises.
- Training-set patterns predict test-set behavior.
- Curve fitting from finite samples.

Each goes beyond what the data necessitates.

## Forms

- **Enumerative induction.** All observed instances
  have property $P$, conclude all instances do.
- **Statistical induction.** Generalize from
  statistical pattern.
- **Analogical induction.** Inference by analogy
  to similar cases.
- **Inductive logic programming.** Learn logic
  programs from examples.
- **Machine learning generally.** Most ML is
  statistical induction.

## The problem of induction

Hume's classical problem: induction has no
*deductive* justification. Why expect the future to
resemble the past? Any justification appeals to
inductive principles, leading to circularity.

Modern responses:
- **Bayesian.** Update beliefs probabilistically;
  induction as probabilistic inference.
- **Pragmatic.** Induction works empirically; that's
  enough.
- **Solomonoff.** Algorithmic induction with
  universal prior.
- **PAC learning.** Probabilistic guarantees on
  generalization given assumptions.

None *solves* the problem in Hume's sense; each
makes induction tractable in practice.

## Induction in ML

Machine learning is largely inductive:

- **Supervised learning.** Generalize from
  training examples.
- **Unsupervised learning.** Discover structure
  from data.
- **Reinforcement learning.** Generalize from
  experience to policy.

Modern ML inherits both the power and the
limitations of induction:
- Generalizes well within distribution.
- Brittle on distribution shift (per
  [robustness](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/robustness/_index.md)).
- Sample complexity and bias issues.

## PAC learning

Probably approximately correct (PAC) learning gives
formal foundations:

- Given enough samples, with high probability, learn
  a hypothesis with low error.
- Sample complexity bounds depend on hypothesis class
  capacity (VC dimension).
- Provides justified guarantees on inductive
  inference.

The most-developed formal theory of induction.

## Inductive bias

Any learner has *inductive bias* — preferences over
hypotheses extending beyond data.

- Without inductive bias, generalization is
  impossible (no-free-lunch).
- Bias can be explicit (regularization, priors) or
  implicit (architecture choice).
- Choice of bias profoundly shapes what's learned.

## Induction and LLMs

LLMs do induction at scale:

- Training: induce patterns from internet-scale
  text.
- In-context learning: induce patterns from
  prompt examples (per
  [in-context-learning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/learning/theories/in-context-learning/_index.md)).
- Inductive bias: from architecture, training data,
  fine-tuning.

LLMs are *largely* inductive systems even when they
appear to do other reasoning.

## Limits

- **No truth guarantee.** Inductive conclusions can
  be wrong.
- **Distribution shift.** Generalization to new
  distributions is fragile.
- **Counterexamples.** A single counterexample can
  refute an inductive rule.
- **Bias propagation.** Biased data → biased
  conclusions.

## In contemporary AI

- **All ML.** Inductive at core.
- **Foundation models.** Massive-scale induction.
- **Few-shot learning.** Induction from small
  examples.
- **Causal vs statistical induction.** Per
  [causal-reasoning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/causal-reasoning/_index.md),
  important distinction.

## Status

Foundational form of reasoning; ubiquitous in AI.
Theoretical foundations (PAC, Bayesian) mature.
Practical implementation via ML at unprecedented
scale.
