---
title: "Causal reasoning"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
depends-on: []
see-also:
  - intervention/intervention.md
  - counterfactual/counterfactual.md
  - structural-causal-model-thinking/structural-causal-model-thinking.md
references:
  - pearl-causality2009/pearl-causality2009.md
  - pearl-bookofwhy2018/pearl-bookofwhy2018.md
discipline: >
  The formal study of causal relationships and how AI
  systems can represent, infer, and reason about them.
  The theory comprises Pearl's causal hierarchy
  (associational, interventional, counterfactual),
  structural causal models, do-calculus, causal
  discovery from observational and interventional data,
  and the emerging program of causal representation
  learning. Includes the deeply-disputed question of
  whether and how foundation models reason causally.
position: >
  The AI-side application of Pearl's causality program.
  Connects to agents for action-effect reasoning and to
  agent-foundations for decision-theoretic causal
  grounding. Adjacent to the broader programs of
  reasoning and knowledge representation in AI.
---


**Causal reasoning** is inference about *causes and
effects* — what produces what, what would happen under
intervention, what would have happened in counterfactual
scenarios. It is qualitatively distinct from purely
correlational reasoning, which only describes
*statistical association*.

The causal-reasoning theory addresses the gap between
*correlation* (what statistical learning provides) and
*causation* (what action-taking systems require). It
gives formal structure to:

**The causal hierarchy.** Pearl distinguishes three
rungs: associational ("what is"), interventional ("what
if I do"), counterfactual ("what would have been").
Each requires more structure than the last; pure
observational learning does not climb the ladder.

**Structural causal models.** Mathematical objects
encoding causal relationships: variables, structural
equations, intervention semantics. The substrate for
formal causal reasoning.

**Do-calculus.** The inference rules for reasoning
about interventions in causal graphs. Pearl proved
do-calculus complete for identifiability of
intervention distributions from observational data
under a causal model.

**Causal discovery.** Inferring causal structure from
data — observational, interventional, or mixed.
Generally hard; tractable under structural
assumptions.

**Causal representation learning.** Learning
representations that disentangle causal factors.
Active research connecting causality to deep learning.

**Foundation models and causality.** The disputed
question: do LLMs do causal reasoning, and if so, how?
A central live debate.

## The distinction

Two questions look similar but differ profoundly:

- "Patients who took drug X recovered more often."
  (Statistical / associational.)
- "Drug X causes recovery." (Causal.)

The first follows from observed data; the second
requires assumptions about *why* the association exists
(was X assigned at random? was there confounding?).
Pure observational data underdetermines causal claims.

## Why it matters for AI

ML systems trained on observational data learn
correlations, not causation. This produces failures:

- **Confounded predictions.** Models predict using
  spurious correlates that break under intervention.
- **Unstable transfer.** Models trained in one
  environment fail when intervened on (deployment,
  policy change).
- **Inability to plan.** Agents that can't reason
  about effects of their actions cannot plan.
- **Bias propagation.** Confounded data produces
  systems that perpetuate confounding.

Causal reasoning addresses these by giving formal
structure to *intervention* and *counterfactual*
thinking.

## Pearl's hierarchy

Pearl distinguishes three levels of causal questions:

1. **Associational.** $P(Y | X)$. "If I observe X,
   what is the distribution of Y?" Answerable from
   observational data.
2. **Interventional.** $P(Y | \mathrm{do}(X))$. "If I
   *force* X to a value, what is the distribution of
   Y?" Generally not answerable from observational
   data alone.
3. **Counterfactual.** $P(Y_x | X = x', Y = y')$. "I
   observed $X = x'$ and $Y = y'$; what would Y have
   been if X had been x?" Requires more structure than
   intervention.

The levels are strictly ordered: rung-$k$ questions
generally cannot be answered from rung-$(k-1)$ data
alone.

## Tools

The theory provides:

- **Causal graphs.** DAGs encoding causal structure.
- **Structural causal models.** Equations + noise
  encoding causal mechanisms.
- **Do-calculus.** Inference rules for intervention
  distributions.
- **Counterfactual semantics.** Three-step procedure
  (abduction, action, prediction).
- **Identifiability conditions.** When causal effects
  can be inferred from data.
- **Causal discovery algorithms.** Recovering structure
  from data.

## Two traditions

Two major traditions:

- **Pearl's structural account.** Causal graphs +
  do-calculus; emphasizes graphical inference.
- **Potential outcomes (Rubin/Neyman/Holland).**
  Counterfactual outcomes per unit; emphasizes
  experimental and quasi-experimental design.

The traditions are largely equivalent in scope but
differ in emphasis and notation. Pearl translates
between them.

## In contemporary AI

Causal reasoning is partially integrated with ML:

- **Causal inference at scale.** Tech-company A/B
  testing infrastructure routinely applies causal
  identification methods.
- **Causal RL.** Active research integrating causal
  models with reinforcement learning.
- **Causal representation learning.** Learning
  representations whose components are causal factors.
- **Causal explanation in interpretability.** Some
  interpretability work uses causal interventions on
  network internals.
- **LLMs and causality.** Disputed: do LLMs reason
  causally? See the can-llms-do-causal-reasoning
  question note.

## Limits

- **Untestable assumptions.** Causal models require
  assumptions about structure that data cannot
  validate.
- **Identifiability gaps.** Many causal effects are
  not identifiable from observational data.
- **Discovery hardness.** Causal discovery is
  generally hard at scale.
- **Foundation-model integration.** Whether LLMs do
  causal reasoning, and how to make them do better,
  is unsettled.

## Status

Mature theoretical foundation; partial integration with
ML. Pearl's framework is widely accepted; integration
with deep learning is active research. Foundational to
any AI system that must act on or reason about
interventions.
