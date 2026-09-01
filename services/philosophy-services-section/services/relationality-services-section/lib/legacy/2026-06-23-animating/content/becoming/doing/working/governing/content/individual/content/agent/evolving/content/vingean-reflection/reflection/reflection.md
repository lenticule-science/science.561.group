---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/embedded-agency.md
see-also:
  - teaching/explanations/reflective-stability.md
  - teaching/explanations/vingean-reflection.md
  - self-modification.md
references:
  - references/soares-fallenstein2015.md
---

# Reflection

**Reflection** is the agent's modeling of itself: its decision procedure, its beliefs, its computational structure, and its future behavior.
Where Bayesian updating maps prior + evidence to posterior, reflection maps the agent's self-model to a prediction about, or evaluation of, the agent's own future states.

## Three forms

Reflection appears in three forms in the agent-foundations literature:

- **Predictive reflection.** The agent predicts what it will do in a future situation.
  Useful for planning ("if I take this action now, will my future self regret it?").
- **Evaluative reflection.** The agent evaluates what it *should* do — what its current values endorse — possibly in hypothetical or counterfactual scenarios.
- **Modifying reflection.** The agent reasons about how its current decision procedure or values would change under proposed self-modifications.
  See [self-modification](self-modification.md).

## Why classical decision theory cannot do this

Classical decision theory has the agent treat the world as an external object.
The agent's own future actions are not part of the world the agent reasons about — they are *outputs*, not *states*.
Reflection requires treating the agent's future behavior as a state that the agent has beliefs about and evaluates.

## Reflective consistency

A *reflectively consistent* agent's predictions about its own future behavior agree with its actual future behavior.
A *reflectively stable* agent (see [reflective-stability](teaching/explanations/reflective-stability.md)) has, in addition, the property that it does not want to modify its own decision procedure on reflection.

The Loebian obstacle (see [reflective-stability-impossibility-loeb](../theorems/reflective-stability-impossibility-loeb.md)) shows that *strict* reflective consistency, in the form of provable self-trust, is impossible for sufficiently expressive agents.
Partial reflective consistency — calibrated probabilistic self-prediction — is possible and is provided by [logical-induction](teaching/explanations/logical-induction.md).

## In contemporary AI

Reflection appears operationally in:

- **Self-evaluation prompts** in LLM agents: "rate your own response," "find the error in your previous reasoning."
- **Self-correction loops**: chain-of-thought followed by a critique step.
- **Constitutional AI**: the model evaluates and revises its own outputs against a constitution.

These are *behavioral* reflection.
They do not provide the formal reflective consistency the agent-foundations literature seeks; they may approximate it.
