---
type: concept
class: classical
status: active
depends-on:
  - theory-of-mind.md
see-also:
  - ../objects/belief-state.md
  - ../morphisms/belief-attribution.md
references: []
---

# Mental state attribution

**Mental state attribution** is the act of inferring another agent's beliefs, desires, intentions, knowledge, emotions — its *mental states* — from observed behavior, context, and prior knowledge of the agent.
It is the operational core of [theory-of-mind](theory-of-mind.md).

## Standard mental-state vocabulary

Drawing from folk psychology and Bratman's BDI framework:

- **Beliefs.** What the agent takes to be the case.
- **Desires.** What the agent wants.
- **Intentions.** What the agent has committed to doing.
- **Knowledge.** Beliefs the agent has and that are true.
- **Emotions.** Affective states (anger, fear, joy) influencing decision and behavior.
- **Goals.** Higher-order desires structuring behavior over time.
- **Preferences.** Comparative desires over outcomes.

Different formalisms emphasize different subsets; together they form a working vocabulary for predicting and explaining behavior.

## Attribution as inference

Mental state attribution is *inference under uncertainty*:

- **Observation.** The agent does X in context C.
- **Inference.** Among mental states that would produce X in C, which is most plausible?
- **Update.** Use the attributed state to predict future behavior.

This inference is *underdetermined* — many mental-state configurations could produce the same behavior.
The [behavioral-equivalence-underdetermination](../theorems/behavioral-equivalence-underdetermination.md) result formalizes this.

## Computational models

Several formal frameworks model mental-state attribution:

- **Inverse planning** (Baker, Saxe, Tenenbaum 2009).
  Bayesian inference of goals from action sequences, treating the agent as a planner.
- **Bayesian theory of mind** (BToM).
  Generalizes inverse planning to richer mental-state inference.
- **Belief-Desire-Intention models.** Computational BDI systems infer and ascribe BDI states.
- **POMDP-based models.** Model others as POMDP solvers with inferred reward and observation functions.
- **Neural ToM models** (Rabinowitz et al. 2018).
  Neural networks trained to predict agent behavior develop implicit mental-state representations.

## Attribution biases

Real attribution is biased:

- **Fundamental attribution error.** Over-attributing behavior to dispositional factors (intentions, preferences) and under-attributing to situational factors.
- **Self-serving attribution.** Attributing one's own successes to internal causes, failures to external.
- **Anthropomorphism.** Attributing rich mental states to systems that don't have them (cars, weather, AI).
- **Mentalizing impairments.** Some conditions (autism spectrum) show systematic difficulty with mental-state attribution.

These biases shape how attributions are made in practice, including by AI systems trained on human behavior.

## In multi-agent AI

Mental state attribution appears when:

- **AI agents model other agents.** Multi-agent RL agents that model opponents' intentions; LLM agents inferring user goals.
- **AI assists humans.** Helpful assistants must attribute user mental states (goals, knowledge level, preferences) to assist effectively.
- **AI explains behavior.** Generating explanations of observed behavior involves attributing mental states.
- **AI deception and honesty.** Whether AI engages in honest or deceptive behavior depends on its attribution of users' beliefs.

The attribution capacity of contemporary AI is empirically partial; see [machine-theory-of-mind](machine-theory-of-mind.md).
