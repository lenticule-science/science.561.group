---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/belief-state.md
see-also:
  - teaching/explanations/mental-state-attribution.md
  - perspective-taking.md
references: []
---

# Belief attribution

**Belief attribution** is the morphism that takes observations of an agent's behavior (and contextual information) and produces an inferred [belief-state](../objects/belief-state.md) for that agent.
It is the operational core of first-order theory-of-mind.

## The inference structure

Belief attribution is *inverse inference*:

- **Forward direction.** Beliefs produce action: an agent with belief $b$ in context $c$ acts $a$.
- **Inverse direction.** Given observed action $a$ in context $c$, infer the belief $b$ that produced it.

The inverse is *underdetermined*: many beliefs could produce the same action.
Attribution requires priors, context, and inferential commitments to pin down a plausible belief.

## Bayesian formulation

Bayesian belief attribution:

$$P(\text{belief} \mid \text{action}, \text{context}) \propto P(\text{action} \mid \text{belief}, \text{context}) \cdot P(\text{belief} \mid \text{context})$$

The likelihood term encodes a *behavioral model* of how beliefs translate to actions; the prior encodes expectations about plausible beliefs given context.

## Standard inferential moves

- **Rational-agent assumption.** Assume the agent acts rationally given its beliefs and preferences; beliefs producing the observed action under assumed preferences are likely.
- **Context grounding.** Use context to constrain plausible beliefs (what could the agent reasonably believe given what it observed?).
- **Default attribution.** Attribute typical beliefs for the agent's class unless evidence suggests otherwise.
- **Coherence.** Prefer attributions that fit a coherent overall mental model.

## Failure modes

- **Egocentrism.** Attribute one's own beliefs to the agent regardless of evidence.
- **Stereotyping.** Over-rely on class-default attributions, missing individual variation.
- **Overinference.** Attribute beliefs richer than evidence supports.
- **Underinference.** Fail to attribute beliefs evidence does support.
- **Behavioral blindness.** Fail to update attributions given new evidence.

These failure modes are present in human ToM and plausibly in machine ToM.

## In multi-agent AI

Belief attribution appears when:

- **Multi-agent RL.** Agents maintain implicit or explicit beliefs about opponents' beliefs and policies.
- **LLM agents reasoning about users.** Inferring user beliefs from user inputs.
- **AI debate.** Modeling opponent's beliefs to counter-argue.
- **AI explanation.** Inferring what the user does and doesn't believe to tailor explanations.

The empirical question of how reliably contemporary AI performs belief attribution is partial; LLMs can attribute beliefs fluently but with disputed robustness.

## Limits

- **Underdetermination.** Multiple belief states produce same behavior; attribution is always partial.
- **Computational cost.** Bayesian belief attribution is intractable for rich belief spaces.
- **Communication limitations.** Belief attribution often requires assumptions about what the agent observed.
- **Strategic agents.** Agents who manage their observable behavior to control attribution complicate the inference.
