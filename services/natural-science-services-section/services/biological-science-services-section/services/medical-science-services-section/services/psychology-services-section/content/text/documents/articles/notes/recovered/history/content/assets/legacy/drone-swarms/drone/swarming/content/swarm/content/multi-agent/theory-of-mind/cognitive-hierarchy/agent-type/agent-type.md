---
type: object
class: classical
status: active
depends-on: []
see-also:
  - mental-model.md
  - teaching/explanations/cognitive-hierarchy.md
references: []
---

# Agent type

An **agent type** is a characterization of an agent's preferences, capabilities, beliefs, and dispositions sufficient to predict its behavior in a class of situations.
Types are the *parameters* multi-agent analysis varies over: different types behave differently; modeling another agent reduces to inferring its type.

## Type as parameter

In game theory's *Bayesian games* (Harsanyi 1967-68), each agent has a private type drawn from a known distribution.
The type encodes:

- The agent's *payoff function* (preferences over outcomes).
- The agent's *information* (private observations).
- The agent's *capabilities* (action space).
- Possibly the agent's *higher-order beliefs* (beliefs about others' types).

Equilibrium analysis proceeds with respect to the type distribution: each type best-responds given beliefs about others' types.

## Type vs trait vs strategy

Distinguish:

- **Type.** Underlying characteristic the agent has (private, often).
- **Strategy.** What the agent *does* — possibly varying with type.
- **Trait.** Observable disposition correlated with type.

Mental-state attribution often involves inferring type (unobserved) from observed behavior (which depends on type and situation).

## Type discovery

Real agents must discover others' types through:

- **Behavioral observation.** Inferring type from action history.
- **Direct communication.** Self-reports of preferences, capabilities (with credibility caveats).
- **Reputation.** Aggregated history from multiple observers.
- **Cheap talk and signaling.** Communication that conveys type information indirectly.

The reliability of type inference depends on the type space, behavioral repertoire, and signaling structure.

## Type classifications in multi-agent AI

Common typings:

- **By cooperativeness.** Cooperative, competitive, mixed-motive.
- **By rationality level.** Per [cognitive-hierarchy](teaching/explanations/cognitive-hierarchy.md): L0, L1, L2, etc.
- **By preference structure.** Risk-averse, risk- neutral, risk-seeking; selfish vs prosocial.
- **By belief/information.** What private information the agent has.
- **By learning style.** Reinforcement learner, Bayesian learner, fixed-strategy.

Different applications use different typings.

## In contemporary multi-agent AI

For LLM agents, "type" is complex:

- LLM agents have *prompted personalities* that can be changed at will — type is not stable across contexts.
- LLM agents may have *implicit types* derived from base model and training.
- Type *across vendors* varies (Claude vs GPT vs Gemini may behave differently as "agents").
- Type *within session* may drift as conversation progresses.

Classical type analysis applies imperfectly; new frameworks for LLM-agent typing are emerging.

## Type uncertainty

Real multi-agent interaction occurs under *type uncertainty*: agent A doesn't know agent B's type exactly.
This is the substance of Bayesian games.

Type uncertainty:

- Drives the need for mental-model construction.
- Creates information asymmetries strategically exploitable.
- Necessitates assumptions or priors over type distributions.
- Justifies investments in type-revealing communication (signaling, screening).

## Limits

- **Type taxonomies are partial.** No taxonomy captures all agent variation.
- **Type may not be well-defined.** Some agents (especially LLM agents) may not have stable types.
- **Self-reports are limited.** Agents may not know or may misrepresent their own types.
- **Type-behavior mapping is many-to-many.** Same type can produce different behaviors; same behavior can reflect different types.
