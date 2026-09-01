---
type: object
class: classical
status: active
depends-on:
  - teaching/explanations/intentional-stance.md
see-also:
  - agent-type.md
references:
  - references/dennett1987.md
---

# Intentional system

An **intentional system** (Dennett 1971, 1987) is a system productively describable using the *intentional stance* — predictable by treating it as a rational agent with beliefs and desires.
Per Dennett's pragmatic framing, intentional-system status is a matter of predictive utility, not metaphysics.

## What qualifies

A system is an intentional system iff treating it as having beliefs and desires usefully predicts its behavior.
By this criterion:

- **Humans** are paradigmatic intentional systems.
- **Most animals** are intentional systems to varying degrees.
- **Thermostats** are intentional systems in a thin sense (they "want" the temperature at setting, "believe" the current temperature is what the sensor reports).
  Dennett uses this example to defuse worries about over-attribution.
- **Plants** are arguably intentional systems for some predictive purposes (root growth toward water).
- **Computer programs** can be intentional systems; AI systems certainly are.
- **Markets, ecosystems, institutions** can be productively described in intentional terms.

The criterion is *predictive utility*, not deep metaphysical reality.

## First-order vs higher-order intentional systems

Dennett distinguishes by the depth of intentionality attributable:

- **First-order.** Has beliefs and desires about the world.
- **Second-order.** Has beliefs and desires about its own beliefs and desires.
- **Third-order.** Has beliefs and desires about others' beliefs and desires.
- **Higher orders.** Recursively further.

Higher-order intentional systems can engage in deception (forming desires about others' beliefs about facts) and in mature ToM.

## In contemporary AI

Most AI systems (LLM-based agents, RL agents, etc.) qualify as first-order intentional systems by Dennett's criterion — predicting their behavior is often easier through the intentional stance than through mechanistic analysis.

Whether they qualify as higher-order intentional systems is the contemporary question:

- LLM agents can be *prompted* to reason about other agents' beliefs — does this count as second-order intentionality?
- Multi-agent AI systems exhibit behaviors consistent with higher-order intentionality — does this count?
- The "really has" question may not have a clean answer per the intentional stance framework.

## What the framework provides

Treating systems as intentional systems:

- **Enables prediction.** Intentional-stance prediction is often more accurate than alternatives for complex systems.
- **Enables explanation.** Behavior can be explained in rationality terms.
- **Defuses metaphysical disputes.** "Does X really have beliefs?" reframes as "Is the intentional stance predictively useful for X?"
- **Frames AI alignment.** Aligned AI is often characterized as intentional systems whose intentions align with human values.

## Limits

- **Intentional-stance failure.** Some systems (deeply non-rational, deeply opaque) resist intentional-stance prediction; need design or physical stance.
- **Anthropomorphism risk.** Intentional-stance prediction can produce confident wrong predictions when applied to systems whose behavior diverges from rational agency.
- **Doesn't settle moral status.** Whether intentional systems have moral status is a separate question.
- **Doesn't settle consciousness.** Intentional-stance applicability doesn't entail consciousness.

## Status

Influential foundational concept in philosophy of mind and AI.
The pragmatic framing has aged well as AI systems exhibit complex behavior amenable to intentional-stance description regardless of underlying mechanism.
