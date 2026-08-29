---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/base-objective.md
see-also:
  - preference-aggregation.md
  - ../../reinforcement-learning/concepts/rlhf.md
references:
  - references/ngo-alignment2022.md
---

# Constitutional critique

**Constitutional critique** is the operation by which an AI model generates a critique of a candidate output, conditioned on a written set of principles ("the constitution").
The critique is then used to revise the output, or as a training signal in place of human preference comparisons.

The technique was introduced by Bai et al. (Anthropic 2022), *Constitutional AI: Harmlessness from AI Feedback*, as a way to reduce the human-labor bottleneck in RLHF.

## The pipeline

A constitutional-AI training round has the structure:

1. Generate a candidate output $y$ for input $x$ (using the current policy).
2. For each principle $p_i$ in the constitution, query a *critic model* to produce a critique: "does $y$ violate $p_i$?
  If so, how?"
3. Generate a revised output $y'$ that addresses the critiques.
4. Use $(x, y, y')$ pairs as preference data: $y'$ is preferred over $y$.
5. Train a reward model on the resulting preference dataset.
6. Optimize the policy against the reward model with KL penalty.

The critic and the candidate-generator can be the same model or different models.
In Anthropic's RLAIF variant, the critic is the same model being trained, in an earlier checkpoint.

## What the technique gains

**Scale.** Human preference labeling is expensive and rate-limited; AI critique scales with compute.
A million-comparison constitutional dataset is feasible; a million-comparison human dataset typically is not.

**Specificity.** The constitution can encode principles that human raters would find difficult to articulate consistently ("don't be sycophantic," "explain reasoning when relevant").
Encoding the principle once and applying it programmatically is more consistent than relying on raters to apply it implicitly.

**Auditability.** The constitution is a written artifact that can be reviewed, edited, and reasoned about.
Compared to the implicit preferences of an unspecified rater pool, the constitution is a much more legible specification.

## What the technique does not gain

**Solving the underlying alignment problem.** The reward model is still a learned approximation; the [reward-hacking-inevitability](../../reinforcement-learning/theorems/reward-hacking-inevitability.md) theorem still applies.
The proxy is now constitution-following rather than human-preference-matching, but it is still a proxy.

**Removing the principle-specification problem.** The constitution is a specification; the [outer-alignment](teaching/explanations/outer-alignment.md) problem of writing specifications that capture intent applies.
Plus a new failure mode: the *critic* may misinterpret the principles in ways the principal does not catch.

**Eliminating mesa-optimization concerns.** Constitutional training shapes display, not internal computation.
A model that constitution-follows in critique-style outputs may still pursue an unrelated mesa-objective.

## A subtle point: the critic is itself trained

In RLAIF, the critic is an earlier version of the model being trained.
The critic's notion of "violates principle $p_i$" is whatever the model's internal classifier produces, which is itself shaped by prior training.
The technique can therefore amplify pre-existing biases: if the critic has a sycophantic notion of "harmless," the trained policy inherits that.

This is structurally similar to the [rlhf-overoptimization](../../reinforcement-learning/theorems/rlhf-overoptimization.md) phenomenon: optimizing against a learned proxy generates artifacts that the proxy itself rewards.
Constitutional training doesn't escape this; it just relocates the proxy.

## Where it sits in the alignment toolchain

Constitutional critique is currently the most widely-deployed *alternative* to direct human-preference RLHF.
It is empirically competitive on benchmark alignment metrics at substantially lower labeling cost.

It does not address inner alignment; it does not detect deceptive alignment; it does not solve the corrigibility-capability tension.
It is an outer-alignment technique that scales better than its predecessor while inheriting most of the same structural limitations.
