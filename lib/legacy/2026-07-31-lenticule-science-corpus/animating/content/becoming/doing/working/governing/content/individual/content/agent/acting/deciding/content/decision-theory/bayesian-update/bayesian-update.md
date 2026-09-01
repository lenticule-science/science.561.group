---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/prior-belief.md
see-also:
  - teaching/explanations/naturalized-induction.md
  - teaching/explanations/logical-induction.md
references:
  - references/savage1954.md
---

# Bayesian update

The **Bayesian update** is the operation that takes a prior belief $P$ and an observation $e$ to a posterior:

$$ P(\cdot \mid e) = \frac{P(e \mid \cdot)\, P(\cdot)}{P(e)}. $$

It is the canonical update rule of classical statistics and classical decision theory.

## Properties

- **Conditioning preserves coherence.** If $P$ is a probability measure and $P(e) > 0$, then $P(\cdot \mid e)$ is a probability measure.
- **Sequential updates compose.** Updating on $e_1$ then $e_2$ yields the same posterior as updating on the joint observation $(e_1, e_2)$.
- **Conservative on null events.** $P(\cdot \mid e)$ is undefined when $P(e) = 0$.
- **Logically omniscient.** All logically equivalent propositions update identically.

## Where it works

In the classical setting — a fixed external world, an exhaustive exclusive prior, well-defined likelihoods — Bayesian updating is the unique coherent rule (Cox's theorem) and the unique non-exploitable rule (de Finetti's Dutch-book argument).

## Where it fails

For [embedded-agency](teaching/explanations/embedded-agency.md), Bayesian updating fails in three ways:

1. **Logical uncertainty.** The agent cannot assign $P(\phi) < 1$ to logical truths $\phi$ without breaking conditioning.
  See [logical-induction](teaching/explanations/logical-induction.md) for the partial replacement.
2. **Self-modeling.** Updating on observations that include the agent's own behavior requires a prior that includes the agent — but a strict Bayesian prior over a hypothesis space cannot include itself as a hypothesis without incoherence.
  See [embedded-agent-impossibility](../theorems/embedded-agent-impossibility.md).
3. **Anthropic observations.** Updates on "the agent observes $e$" require an account of *which observer-moment* the agent currently is, which classical Bayesianism does not provide.

## What replaces it

The agent-foundations literature has not converged on a replacement.
Candidates include:

- **Logical induction** for logical uncertainty.
- **Updateless decision theory** that avoids updating in decision-theoretic settings.
- **Imprecise probability** (sets of priors) for cases where a precise prior is unavailable.

See [what-replaces-bayesian-updating-for-embedded-agents](questions/what-replaces-bayesian-updating-for-embedded-agents.md).
