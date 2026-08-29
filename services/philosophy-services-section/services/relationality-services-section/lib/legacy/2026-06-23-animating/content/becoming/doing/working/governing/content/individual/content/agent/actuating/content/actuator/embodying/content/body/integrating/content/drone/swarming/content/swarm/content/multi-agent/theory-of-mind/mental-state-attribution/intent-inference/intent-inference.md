---
type: morphism
class: classical
status: active
depends-on: []
see-also:
  - belief-attribution.md
  - teaching/explanations/mental-state-attribution.md
references: []
---

# Intent inference

**Intent inference** is the morphism that infers an agent's intentions from observed action sequences — *inverse planning*.
Where [belief-attribution](belief-attribution.md) infers what the agent believes, intent inference infers what the agent is *trying to do*.

## The setup

Given:

- An action sequence $a_1, a_2, \ldots, a_t$ taken by agent $A$ in context $c$.
- A model of how agents plan toward goals.

Infer:

- The most likely *goal* (or distribution over goals) $A$ is pursuing.

The forward direction: goal $g$ + planning produces action sequence $a_1, \ldots, a_t$.
The inverse: given sequence, compute most likely $g$.

## Inverse planning

The standard formalism (Baker, Saxe & Tenenbaum 2009):

- Model the agent as a near-optimal planner with goal $g$.
- Compute $P(\text{actions} \mid \text{goal})$ using the planner.
- Apply Bayes: $P(\text{goal} \mid \text{actions}) \propto P(\text{actions} \mid \text{goal}) \cdot P(\text{goal})$.

The result is a posterior distribution over goals explaining the observed actions.

Inverse planning has been operationalized in:

- **Inverse reinforcement learning (IRL).** Inferring reward functions from agent behavior.
- **Bayesian theory of mind (BToM).** Probabilistic goal inference from action sequences.
- **Goal-conditioned imitation learning.** Learning policies conditioned on inferred goals.

## What it adds beyond belief attribution

Intent inference foregrounds the *teleological* structure of behavior:

- **Goals organize actions** over time; inferring goals reveals structure beliefs alone don't.
- **Future behavior prediction** — knowing the goal predicts future actions, not just the current one.
- **Plan recognition** — identifying *which plan* the agent is executing among possible plans.
- **Subgoal structure** — recognizing sub-goals in hierarchical plans.

Intent inference is therefore a richer ToM operation than pure belief attribution.

## Difficulty sources

Intent inference is hard because:

- **Multiple goals fit.** Many goals could explain a given action sequence.
- **Suboptimal planning.** Real agents plan suboptimally; the planner model may not match.
- **Plan switching.** Agents may change goals or plans mid-sequence.
- **Hidden subgoals.** Agents may pursue subgoals not obvious from immediate context.
- **Strategic action.** Agents may take actions designed to be misread.

These compound to make intent inference inherently uncertain.

## In multi-agent AI

Intent inference appears when:

- **AI assistants infer user goals** from user inputs.
- **Multi-agent collaboration** requires modeling partner goals.
- **AI safety** requires inferring whether observed AI behavior reflects intended or unintended goals.
- **Interactive learning** uses intent inference to generalize from sparse demonstrations.

Contemporary approaches include LLM-based intent inference (prompted to infer user intent) and explicit inverse-planning methods for structured domains.

## Limits

- **Underdetermination.** Multiple goals may fit; intent inference is always partial.
- **Computational cost.** Bayesian goal inference is expensive for rich goal spaces.
- **Model dependence.** Intent inference depends on having a good planner model; mismatched planners produce wrong inferences.
- **Adversarial settings.** Strategic agents may produce action sequences designed to mislead intent inference.

## Status

Active research area in cognitive science (BToM), machine learning (IRL), and AI assistance.
Foundational to many ToM applications.
The empirical success of contemporary methods varies with domain structure; LLM-based intent inference works well in conversational settings but is brittle in adversarial ones.
